import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../core/model/paket_kelime.dart';

/// Ogrenilen kelimenin kalici kaydi (user.db / ogrenilen_kelime).
class OgrenilenKelime {
  final String kelimeId;
  final String ingilizce;
  final String okunus;
  final String turkceAnlam;
  final int paketId;
  final String ogrenilmeTarihi;
  final String? sonTekrarTarihi;
  final String sonrakiTekrarTarihi;
  final int tekrarSayisi;
  final int dogruSayisi;
  final int yanlisSayisi;
  final String durum;

  const OgrenilenKelime({
    required this.kelimeId,
    required this.ingilizce,
    required this.okunus,
    required this.turkceAnlam,
    required this.paketId,
    required this.ogrenilmeTarihi,
    required this.sonrakiTekrarTarihi,
    required this.tekrarSayisi,
    required this.dogruSayisi,
    required this.yanlisSayisi,
    required this.durum,
    this.sonTekrarTarihi,
  });

  factory OgrenilenKelime.fromRow(Map<String, Object?> r) => OgrenilenKelime(
        kelimeId: r['kelime_id'] as String,
        ingilizce: r['ingilizce'] as String,
        okunus: r['okunus'] as String,
        turkceAnlam: r['turkce_anlam'] as String,
        paketId: (r['paket_id'] as num).toInt(),
        ogrenilmeTarihi: r['ogrenilme_tarihi'] as String,
        sonTekrarTarihi: r['son_tekrar_tarihi'] as String?,
        sonrakiTekrarTarihi: r['sonraki_tekrar_tarihi'] as String,
        tekrarSayisi: (r['tekrar_sayisi'] as num).toInt(),
        dogruSayisi: (r['dogru_sayisi'] as num).toInt(),
        yanlisSayisi: (r['yanlis_sayisi'] as num).toInt(),
        durum: r['durum'] as String,
      );
}

/// Siralama secenekleri (Ogrendigim Kelimeler ekrani).
enum KelimeSiralama { alfabetik, tariheGore, pakete }

/// Ogrenilen kelimelerin kalici kaydi ve temel tekrar plani.
///
/// Veritabani DISARIDAN verilir; boylece testler bellek ici veritabani
/// kullanabilir ve gercek kullanici verisine dokunmaz.
class KelimeRepo {
  final Database db;
  const KelimeRepo(this.db);

  /// Faz 2E sartnamesi: 1, 3, 7, 14, 30 gun.
  static const List<int> tekrarAraliklari = <int>[1, 3, 7, 14, 30];

  static String _gun(DateTime d) =>
      d.toUtc().toIso8601String().substring(0, 10);

  static String sonrakiTarih(int tekrarSayisi, {DateTime? simdi}) {
    final DateTime taban = simdi ?? DateTime.now();
    final int i = tekrarSayisi < 0
        ? 0
        : (tekrarSayisi >= tekrarAraliklari.length
            ? tekrarAraliklari.length - 1
            : tekrarSayisi);
    return _gun(taban.add(Duration(days: tekrarAraliklari[i])));
  }

  /// "Ogrendim" isareti. AYNI KELIME IKINCI KEZ EKLENMEZ.
  /// Doner: gercekten yeni kayit olustuysa true.
  Future<bool> ogrendimIsaretle(PaketKelime k,
      {required int paketId, DateTime? simdi}) async {
    final List<Map<String, Object?>> var_ = await db.query(
      'ogrenilen_kelime',
      where: 'kelime_id = ?',
      whereArgs: <Object?>[k.kod],
      limit: 1,
    );
    if (var_.isNotEmpty) return false;

    final DateTime t = simdi ?? DateTime.now();
    await db.insert('ogrenilen_kelime', <String, Object?>{
      'kelime_id': k.kod,
      'ingilizce': k.yazilis,
      'okunus': k.okunus,
      'turkce_anlam': k.trAnlam,
      'paket_id': paketId,
      'ogrenilme_tarihi': t.toUtc().toIso8601String(),
      'son_tekrar_tarihi': null,
      'sonraki_tekrar_tarihi': sonrakiTarih(0, simdi: t),
      'tekrar_sayisi': 0,
      'dogru_sayisi': 0,
      'yanlis_sayisi': 0,
      'durum': 'ogrenildi',
    });
    return true;
  }

  Future<bool> ogrenildiMi(String kelimeId) async {
    final List<Map<String, Object?>> r = await db.query(
      'ogrenilen_kelime',
      where: 'kelime_id = ?',
      whereArgs: <Object?>[kelimeId],
      limit: 1,
    );
    return r.isNotEmpty;
  }

  /// Ogrenilmis TUM kelime kodlari.
  ///
  /// NEDEN: paket numarasi degisebilir (seviye filtresi, yeniden
  /// numaralandirma). Kod bazli sayim bundan etkilenmez.
  Future<Set<String>> tumOgrenilenKodlar() async {
    final List<Map<String, Object?>> r =
        await db.rawQuery('SELECT kelime_id FROM ogrenilen_kelime');
    return r.map((Map<String, Object?> m) => m['kelime_id'] as String).toSet();
  }

  Future<int> paketOgrenilenSayisi(int paketId) async {
    final List<Map<String, Object?>> r = await db.rawQuery(
      'SELECT COUNT(*) AS n FROM ogrenilen_kelime WHERE paket_id = ?',
      <Object?>[paketId],
    );
    return (r.first['n'] as num).toInt();
  }

  /// PEKISTIRME KAPISI: paketteki 20 kelimenin TAMAMI ogrenilmeden acilmaz.
  Future<bool> pekistirmeAcikMi(int paketId) async =>
      await paketOgrenilenSayisi(paketId) >= kPaketBoyu;

  /// Etkinlik cevabini kaydeder ve tekrar planini gunceller.
  Future<void> cevapKaydet({
    required String kelimeId,
    required bool dogruMu,
    required int paketId,
    required String etkinlikKodu,
    DateTime? simdi,
  }) async {
    final DateTime t = simdi ?? DateTime.now();
    await db.insert('pekistirme_sonucu', <String, Object?>{
      'paket_id': paketId,
      'etkinlik_kodu': etkinlikKodu,
      'kelime_id': kelimeId,
      'dogru_mu': dogruMu ? 1 : 0,
      'tarih': t.toUtc().toIso8601String(),
    });

    final List<Map<String, Object?>> r = await db.query(
      'ogrenilen_kelime',
      where: 'kelime_id = ?',
      whereArgs: <Object?>[kelimeId],
      limit: 1,
    );
    if (r.isEmpty) return;
    final OgrenilenKelime k = OgrenilenKelime.fromRow(r.first);

    // Yanlis cevap -> tekrar sayaci sifirlanir, kelime ERKEN geri gelir.
    final int yeniTekrar = dogruMu ? k.tekrarSayisi + 1 : 0;
    await db.update(
      'ogrenilen_kelime',
      <String, Object?>{
        'dogru_sayisi': k.dogruSayisi + (dogruMu ? 1 : 0),
        'yanlis_sayisi': k.yanlisSayisi + (dogruMu ? 0 : 1),
        'tekrar_sayisi': yeniTekrar,
        'son_tekrar_tarihi': t.toUtc().toIso8601String(),
        'sonraki_tekrar_tarihi': sonrakiTarih(yeniTekrar, simdi: t),
        'durum': dogruMu
            ? (yeniTekrar >= tekrarAraliklari.length ? 'kalici' : 'ogrenildi')
            : 'tekrar_gerekli',
      },
      where: 'kelime_id = ?',
      whereArgs: <Object?>[kelimeId],
    );
  }

  Future<List<OgrenilenKelime>> ogrenilenler({
    String arama = '',
    KelimeSiralama siralama = KelimeSiralama.alfabetik,
    bool sadeceTekrarGerekenler = false,
    int? paketId,
    DateTime? simdi,
  }) async {
    final List<String> kosullar = <String>[];
    final List<Object?> args = <Object?>[];

    if (arama.trim().isNotEmpty) {
      kosullar.add('(LOWER(ingilizce) LIKE ? OR LOWER(turkce_anlam) LIKE ?)');
      final String a = '%${arama.trim().toLowerCase()}%';
      args.add(a);
      args.add(a);
    }
    if (paketId != null) {
      kosullar.add('paket_id = ?');
      args.add(paketId);
    }
    if (sadeceTekrarGerekenler) {
      kosullar.add('sonraki_tekrar_tarihi <= ?');
      args.add(_gun(simdi ?? DateTime.now()));
    }

    final String siralamaSql = switch (siralama) {
      KelimeSiralama.alfabetik => 'LOWER(ingilizce) ASC',
      KelimeSiralama.tariheGore => 'ogrenilme_tarihi DESC',
      KelimeSiralama.pakete => 'paket_id ASC, LOWER(ingilizce) ASC',
    };

    final List<Map<String, Object?>> r = await db.query(
      'ogrenilen_kelime',
      where: kosullar.isEmpty ? null : kosullar.join(' AND '),
      whereArgs: args.isEmpty ? null : args,
      orderBy: siralamaSql,
    );
    return r.map(OgrenilenKelime.fromRow).toList();
  }

  Future<int> toplamOgrenilen() async {
    final List<Map<String, Object?>> r =
        await db.rawQuery('SELECT COUNT(*) AS n FROM ogrenilen_kelime');
    return (r.first['n'] as num).toInt();
  }

  /// Bir etkinlikte zorlanilan kelimeler (en az bir yanlis).
  Future<List<String>> zorlanilanKelimeler(int paketId,
      {String? etkinlikKodu}) async {
    final List<Map<String, Object?>> r = await db.rawQuery(
      'SELECT DISTINCT kelime_id FROM pekistirme_sonucu '
      'WHERE paket_id = ? AND dogru_mu = 0'
      '${etkinlikKodu == null ? '' : ' AND etkinlik_kodu = ?'}',
      etkinlikKodu == null
          ? <Object?>[paketId]
          : <Object?>[paketId, etkinlikKodu],
    );
    return r.map((Map<String, Object?> e) => e['kelime_id'] as String).toList();
  }
}
