import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'migrations.dart';
import 'seed_content.dart';

/// Iki dosya ilkesi (LOCAL_DATABASE_SCHEMA.md sec.1):
///   content.db  - salt okunur icerik
///   user.db     - okuma/yazma kullanici verisi
/// Sorgular ATTACH ile birlestirilir.
class AppDatabase {
  AppDatabase._();
  static final AppDatabase instance = AppDatabase._();

  Database? _db;
  late String userDbYolu;
  late String contentDbYolu;
  String sqliteSurumu = '?';

  /// Bu acilista icerik yeniden olusturuldu mu? (tanilama icin)
  bool icerikYenilendi = false;
  String? oncekiIcerikSurumu;

  Database get db {
    final d = _db;
    if (d == null) {
      throw StateError('AppDatabase.ac() cagrilmadi');
    }
    return d;
  }

  Future<void> ac() async {
    if (_db != null) return;

    // Masaustu (Windows/Linux/macOS) icin FFI surucusu
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    final dizin = await getApplicationSupportDirectory();
    await Directory(dizin.path).create(recursive: true);
    userDbYolu = p.join(dizin.path, 'user.db');
    contentDbYolu = p.join(dizin.path, 'content.db');

    // --- content.db: yoksa olustur ve ornek icerigi doldur ---
    final contentDb = await databaseFactory.openDatabase(contentDbYolu);
    // v2 tablolari her acilista IF NOT EXISTS ile guvence altina alinir.
    await Migrations.uygulaContentV2(contentDb);
    await Migrations.uygulaContentV3(contentDb);

    // --- Icerik surumu kontrolu ---
    // content.db yalnizca dosya yokken doldurulursa, icerik guncellendiginde
    // eski kayitlar kalir (Faz 1B-1'den beri R-1 riski). Cozum: surum
    // karsilastirmasi. YALNIZCA content.db yeniden olusturulur;
    // user.db'ye ASLA dokunulmaz.
    final mevcutSurum = await _icerikSurumu(contentDb);
    if (mevcutSurum != SeedContent.icerikSurumu) {
      await Migrations.icerikSifirla(contentDb);
      await Migrations.uygulaContent(contentDb);
      await Migrations.uygulaContentV2(contentDb);
      await Migrations.uygulaContentV3(contentDb);
      await SeedContent.doldur(contentDb);
      icerikYenilendi = true;
      oncekiIcerikSurumu = mevcutSurum;
    }
    await contentDb.close();

    // --- user.db: ac, goc uygula ---
    final userDb = await databaseFactory.openDatabase(userDbYolu);
    await userDb.execute('PRAGMA journal_mode = WAL');
    await userDb.execute('PRAGMA foreign_keys = ON');

    final mevcut = await _mevcutSemaSurumu(userDb);
    await Migrations.uygulaUser(userDb, mevcut);

    // --- content.db'yi ATTACH et ---
    await userDb.execute("ATTACH DATABASE ? AS icerik", [contentDbYolu]);

    final v = await userDb.rawQuery('SELECT sqlite_version() AS v');
    sqliteSurumu = v.first['v'] as String;

    _db = userDb;
  }

  /// content.db icindeki kayitli icerik surumu. Tablo yoksa null.
  Future<String?> _icerikSurumu(Database db) async {
    final t = await db.rawQuery(
        "SELECT name FROM sqlite_master WHERE type='table' "
        "AND name='icerik_surum'");
    if (t.isEmpty) return null;
    final r = await db.rawQuery(
        'SELECT surum FROM icerik_surum ORDER BY rowid DESC LIMIT 1');
    if (r.isEmpty) return null;
    return r.first['surum'] as String?;
  }

  Future<int> _mevcutSemaSurumu(Database db) async {
    final r = await db.rawQuery(
        "SELECT name FROM sqlite_master WHERE type='table' AND name='sema_gocu'");
    if (r.isEmpty) return 0;
    final s = await db.rawQuery('SELECT MAX(surum) AS s FROM sema_gocu');
    final v = s.first['s'];
    return v == null ? 0 : (v as num).toInt();
  }

  /// Oturum kapanisinda WAL sismesini onler (SP-02 B-02)
  Future<void> kapat() async {
    final d = _db;
    if (d == null) return;
    try {
      await d.execute('PRAGMA wal_checkpoint(TRUNCATE)');
    } catch (_) {
      // checkpoint basarisiz olsa bile kapatmayi engelleme
    }
    await d.close();
    _db = null;
  }
}
