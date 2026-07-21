import 'package:sqflite_common_ffi/sqflite_ffi.dart';

/// Bir dersteki kayitli ilerleme (§16).
class DersIlerlemeKaydi {
  final String dersKod;
  final String asama;
  final int maddeIndeksi;
  final String baslama;
  final String sonAcilis;
  final String? tamamlanma;
  final int dogruSayisi;
  final int yanlisSayisi;
  final int? sinavPuani;
  final String durum;

  const DersIlerlemeKaydi({
    required this.dersKod,
    required this.asama,
    required this.maddeIndeksi,
    required this.baslama,
    required this.sonAcilis,
    required this.dogruSayisi,
    required this.yanlisSayisi,
    required this.durum,
    this.tamamlanma,
    this.sinavPuani,
  });

  factory DersIlerlemeKaydi.bos(String kod) => DersIlerlemeKaydi(
        dersKod: kod, asama: 'giris', maddeIndeksi: 0,
        baslama: '', sonAcilis: '',
        dogruSayisi: 0, yanlisSayisi: 0, durum: 'baslanmadi',
      );

  factory DersIlerlemeKaydi.fromRow(Map<String, Object?> r) =>
      DersIlerlemeKaydi(
        dersKod: r['ders_kod'] as String,
        asama: r['asama'] as String,
        maddeIndeksi: (r['madde_indeksi'] as num).toInt(),
        baslama: r['baslama'] as String,
        sonAcilis: r['son_acilis'] as String,
        tamamlanma: r['tamamlanma'] as String?,
        dogruSayisi: (r['dogru_sayisi'] as num).toInt(),
        yanlisSayisi: (r['yanlis_sayisi'] as num).toInt(),
        sinavPuani: r['sinav_puani'] == null
            ? null
            : (r['sinav_puani'] as num).toInt(),
        durum: r['durum'] as String,
      );

  bool get baslanmis => durum != 'baslanmadi';
  bool get tamamlanmis => durum == 'tamamlandi';
}

/// Sablon derslerin ilerleme kaydi.
///
/// Veritabani DISARIDAN verilir; testler bellek ici veritabani kullanir.
class DersIlerlemeRepo {
  final Database db;
  const DersIlerlemeRepo(this.db);

  static String _simdi() => DateTime.now().toUtc().toIso8601String();

  Future<DersIlerlemeKaydi> getir(String dersKod) async {
    final List<Map<String, Object?>> r = await db.query('ders_ilerleme',
        where: 'ders_kod = ?', whereArgs: <Object?>[dersKod], limit: 1);
    if (r.isEmpty) return DersIlerlemeKaydi.bos(dersKod);
    return DersIlerlemeKaydi.fromRow(r.first);
  }

  /// Kaldigi bolumu kaydeder. Ders yoksa olusturur.
  Future<void> kaydet({
    required String dersKod,
    required String asama,
    required int maddeIndeksi,
    int? dogru,
    int? yanlis,
    String? simdi,
  }) async {
    final String t = simdi ?? _simdi();
    final DersIlerlemeKaydi m = await getir(dersKod);
    await db.insert(
      'ders_ilerleme',
      <String, Object?>{
        'ders_kod': dersKod,
        'asama': asama,
        'madde_indeksi': maddeIndeksi,
        'baslama': m.baslanmis ? m.baslama : t,
        'son_acilis': t,
        'tamamlanma': m.tamamlanma,
        'dogru_sayisi': dogru ?? m.dogruSayisi,
        'yanlis_sayisi': yanlis ?? m.yanlisSayisi,
        'sinav_puani': m.sinavPuani,
        'durum': m.tamamlanmis ? 'tamamlandi' : 'devam',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Dersi tamamlandi olarak isaretler ve sinav puanini yazar.
  Future<void> tamamla({
    required String dersKod,
    required int dogru,
    required int yanlis,
    required int sinavPuani,
    String? simdi,
  }) async {
    final String t = simdi ?? _simdi();
    final DersIlerlemeKaydi m = await getir(dersKod);
    await db.insert(
      'ders_ilerleme',
      <String, Object?>{
        'ders_kod': dersKod,
        'asama': 'basari',
        'madde_indeksi': 0,
        'baslama': m.baslanmis ? m.baslama : t,
        'son_acilis': t,
        'tamamlanma': t,
        'dogru_sayisi': dogru,
        'yanlis_sayisi': yanlis,
        'sinav_puani': sinavPuani,
        'durum': 'tamamlandi',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Alt konu basarisini gunceller (birikimli).
  Future<void> altKonuKaydet({
    required String dersKod,
    required Map<String, ({int dogru, int yanlis})> sayim,
  }) async {
    for (final MapEntry<String, ({int dogru, int yanlis})> e
        in sayim.entries) {
      await db.insert(
        'ders_altkonu_basari',
        <String, Object?>{
          'ders_kod': dersKod,
          'alt_konu': e.key,
          'dogru': e.value.dogru,
          'yanlis': e.value.yanlis,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<Map<String, ({int dogru, int yanlis})>> altKonuGetir(
      String dersKod) async {
    final List<Map<String, Object?>> r = await db.query(
        'ders_altkonu_basari',
        where: 'ders_kod = ?', whereArgs: <Object?>[dersKod]);
    return <String, ({int dogru, int yanlis})>{
      for (final Map<String, Object?> e in r)
        e['alt_konu'] as String: (
          dogru: (e['dogru'] as num).toInt(),
          yanlis: (e['yanlis'] as num).toInt(),
        )
    };
  }

  Future<Map<String, DersIlerlemeKaydi>> tumu() async {
    final List<Map<String, Object?>> r = await db.query('ders_ilerleme');
    return <String, DersIlerlemeKaydi>{
      for (final Map<String, Object?> e in r)
        e['ders_kod'] as String: DersIlerlemeKaydi.fromRow(e)
    };
  }
}
