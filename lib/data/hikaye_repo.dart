import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../core/model/hikaye.dart';

/// Kutuphane filtresi.
class HikayeFiltre {
  final String arama;
  final String? seviye;
  final String? konu;

  /// Tahmini sure ust siniri (dakika). null = sinirsiz.
  final int? enFazlaDk;

  final bool sadeceTamamlananlar;
  final bool sadeceDevamEdenler;
  final bool sadeceFavoriler;

  const HikayeFiltre({
    this.arama = '',
    this.seviye,
    this.konu,
    this.enFazlaDk,
    this.sadeceTamamlananlar = false,
    this.sadeceDevamEdenler = false,
    this.sadeceFavoriler = false,
  });
}

/// Kutuphanede gosterilen ozet satir.
///
/// Ekranlar alanlara DUZ erisir (o.baslik). Yonlendirici getirici'ler
/// hem duz hem ic ice kullanimi destekler; TEK surum vardir.
class HikayeOzet {
  final Hikaye hikaye;
  final HikayeIlerleme ilerleme;
  const HikayeOzet(this.hikaye, this.ilerleme);

  String get kod => hikaye.kod;
  String get baslik => hikaye.baslik;
  String get seviye => hikaye.seviye;
  String get konuEtiketi => hikaye.konuEtiketi;
  int get kelimeSayisi => hikaye.kelimeSayisi;
  int get tahminiDk => hikaye.tahminiDk;
  String get ozetTr => hikaye.ozetTr;
  List<HikayeParagraf> get paragraflar => hikaye.paragraflar;
  List<HikayeSorusu> get sorular => hikaye.sorular;
}

/// Hikaye modulunun veri erisimi.
///
/// Icerik content.db'de (ATTACH ile 'icerik'), kullanici verisi user.db'de.
/// Veritabani DISARIDAN verilir; testler bellek ici veritabani kullanir.
class HikayeRepo {
  final Database db;

  /// Testlerde ATTACH kullanilmadigi icin on ek bos birakilabilir.
  final String icerikOnEki;

  const HikayeRepo(this.db, {this.icerikOnEki = 'icerik.'});

  String _t(String tablo) => '$icerikOnEki$tablo';

  static String _simdi() => DateTime.now().toUtc().toIso8601String();
  static String _gun(DateTime d) =>
      d.toUtc().toIso8601String().substring(0, 10);

  // ---------------------------------------------------------- icerik
  Future<List<Hikaye>> tumHikayeler() async {
    final List<Map<String, Object?>> r = await db.rawQuery(
        'SELECT * FROM ${_t('stories')} WHERE arsiv = 0 ORDER BY kod');
    final List<Hikaye> sonuc = <Hikaye>[];
    for (final Map<String, Object?> h in r) {
      sonuc.add(await _hikayeYap(h));
    }
    return sonuc;
  }

  Future<Hikaye?> hikayeGetir(String kod) async {
    final List<Map<String, Object?>> r = await db.rawQuery(
        'SELECT * FROM ${_t('stories')} WHERE kod = ?', <Object?>[kod]);
    if (r.isEmpty) return null;
    return _hikayeYap(r.first);
  }

  Future<Hikaye> _hikayeYap(Map<String, Object?> h) async {
    final String kod = h['kod'] as String;
    final List<Map<String, Object?>> pr = await db.rawQuery(
        'SELECT * FROM ${_t('story_paragraph')} WHERE hikaye_kod = ? '
        'ORDER BY sira',
        <Object?>[kod]);
    final List<Map<String, Object?>> sr = await db.rawQuery(
        'SELECT * FROM ${_t('story_questions')} WHERE hikaye_kod = ? '
        'ORDER BY sira',
        <Object?>[kod]);

    return Hikaye(
      kod: kod,
      baslik: h['baslik'] as String,
      seviye: h['seviye'] as String,
      konuEtiketi: h['konu_etiketi'] as String,
      kelimeSayisi: (h['kelime_sayisi'] as num).toInt(),
      tahminiDk: (h['tahmini_dk'] as num).toInt(),
      ozetTr: h['ozet_tr'] as String,
      anahtarKavramlar: _ayir(h['anahtar_kavramlar'] as String),
      paragraflar: pr
          .map((Map<String, Object?> e) => HikayeParagraf(
                sira: (e['sira'] as num).toInt(),
                metinEn: e['metin_en'] as String,
                metinTr: e['metin_tr'] as String,
              ))
          .toList(),
      sorular: sr
          .map((Map<String, Object?> e) => HikayeSorusu(
                sira: (e['sira'] as num).toInt(),
                tip: SoruTipiAd.koddan(e['tip'] as String),
                soru: e['soru'] as String,
                secenekler: _ayir(e['secenekler'] as String),
                kabulEdilenler: _ayir(e['kabul'] as String),
                aciklama: e['aciklama'] as String?,
              ))
          .toList(),
    );
  }

  /// Cok degerli alanlar '|' ile saklanir.
  static List<String> _ayir(String s) => s.isEmpty
      ? const <String>[]
      : s.split('|').map((String e) => e.trim()).toList();

  static String birlestir(List<String> l) => l.join('|');

  Future<Map<String, SozlukGirdisi>> sozluk() async {
    final List<Map<String, Object?>> r =
        await db.rawQuery('SELECT * FROM ${_t('hikaye_sozluk')}');
    return <String, SozlukGirdisi>{
      for (final Map<String, Object?> e in r)
        (e['kelime'] as String).toLowerCase(): SozlukGirdisi(
          kelime: e['kelime'] as String,
          okunus: e['okunus'] as String,
          trAnlam: e['tr_anlam'] as String,
          ornekCumle: e['ornek_cumle'] as String,
        )
    };
  }

  /// Kullanicinin ogrendigi kelimeler (Kelime Akademisi'nden).
  /// Tablo yoksa bos kume doner; hikaye modulu yine calisir.
  Future<Set<String>> bilinenKelimeler() async {
    try {
      final List<Map<String, Object?>> r =
          await db.rawQuery('SELECT ingilizce FROM ogrenilen_kelime');
      return r
          .map((Map<String, Object?> e) =>
              (e['ingilizce'] as String).toLowerCase())
          .toSet();
    } catch (_) {
      return <String>{};
    }
  }

  // ---------------------------------------------------------- ilerleme
  Future<HikayeIlerleme> ilerlemeGetir(String kod) async {
    final List<Map<String, Object?>> r = await db.query('story_progress',
        where: 'hikaye_kod = ?', whereArgs: <Object?>[kod], limit: 1);
    if (r.isEmpty) return HikayeIlerleme.bos(kod);
    return HikayeIlerleme.fromRow(r.first);
  }

  Future<Map<String, HikayeIlerleme>> tumIlerlemeler() async {
    final List<Map<String, Object?>> r = await db.query('story_progress');
    return <String, HikayeIlerleme>{
      for (final Map<String, Object?> e in r)
        e['hikaye_kod'] as String: HikayeIlerleme.fromRow(e)
    };
  }

  /// Okunan paragrafi kaydeder. [okunanParagraf] 1 tabanlidir.
  Future<void> ilerlemeKaydet({
    required String kod,
    required int okunanParagraf,
    required int toplamParagraf,
    int ekSureMs = 0,
  }) async {
    final HikayeIlerleme mevcut = await ilerlemeGetir(kod);
    final double yuzde = toplamParagraf <= 0
        ? 0
        : (okunanParagraf / toplamParagraf).clamp(0.0, 1.0);
    final String durum = yuzde >= 1.0 ? 'tamamlandi' : 'devam';

    await db.insert(
      'story_progress',
      <String, Object?>{
        'hikaye_kod': kod,
        'son_paragraf': okunanParagraf,
        'okuma_yuzdesi': yuzde,
        'durum': durum,
        'favori': mevcut.favori ? 1 : 0,
        'baslama_tarihi': mevcut.baslamaTarihi ?? _simdi(),
        'son_okuma_tarihi': _simdi(),
        'toplam_sure_ms': mevcut.toplamSureMs + ekSureMs,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> favoriDegistir(String hikayeKod) async {
    final HikayeIlerleme m = await ilerlemeGetir(hikayeKod);
    await db.insert(
      'story_progress',
      <String, Object?>{
        'hikaye_kod': hikayeKod,
        'son_paragraf': m.sonParagraf,
        'okuma_yuzdesi': m.okumaYuzdesi,
        'durum': m.durum,
        'favori': m.favori ? 0 : 1,
        'baslama_tarihi': m.baslamaTarihi,
        'son_okuma_tarihi': m.sonOkumaTarihi,
        'toplam_sure_ms': m.toplamSureMs,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // ---------------------------------------------------------- bilinmeyen
  /// Bilinmeyen kelimeyi kaydeder. AYNI kelime ayni hikayede iki kez eklenmez.
  Future<bool> bilinmeyenKelimeEkle({
    required String hikayeKod,
    required String kelime,
    String? okunus,
    String? trAnlam,
    bool ogrenmeyeEklendi = false,
  }) async {
    final List<Map<String, Object?>> var_ = await db.query(
      'story_unknown_words',
      where: 'hikaye_kod = ? AND kelime = ?',
      whereArgs: <Object?>[hikayeKod, kelime.toLowerCase()],
      limit: 1,
    );
    if (var_.isNotEmpty) return false;
    await db.insert('story_unknown_words', <String, Object?>{
      'hikaye_kod': hikayeKod,
      'kelime': kelime.toLowerCase(),
      'okunus': okunus,
      'tr_anlam': trAnlam,
      'eklenme_tarihi': _simdi(),
      'ogrenmeye_eklendi': ogrenmeyeEklendi ? 1 : 0,
    });
    return true;
  }

  Future<List<String>> bilinmeyenKelimeler(String hikayeKod) async {
    final List<Map<String, Object?>> r = await db.query('story_unknown_words',
        where: 'hikaye_kod = ?', whereArgs: <Object?>[hikayeKod]);
    return r
        .map((Map<String, Object?> e) => e['kelime'] as String)
        .toList();
  }

  // ---------------------------------------------------------- istatistik
  Future<void> istatistikKaydet(HikayeIstatistik i) async {
    await db.insert('story_statistics', <String, Object?>{
      'hikaye_kod': i.hikayeKod,
      'tarih': i.tarih,
      'okuma_suresi_ms': i.okumaSuresiMs,
      'yeni_kelime': i.yeniKelime,
      'bilinen_kelime': i.bilinenKelime,
      'dogru': i.dogru,
      'yanlis': i.yanlis,
      'basari_yuzdesi': i.basariYuzdesi,
    });
  }

  Future<List<HikayeIstatistik>> istatistikler(String hikayeKod) async {
    final List<Map<String, Object?>> r = await db.query('story_statistics',
        where: 'hikaye_kod = ?',
        whereArgs: <Object?>[hikayeKod],
        orderBy: 'id DESC');
    return r.map(HikayeIstatistik.fromRow).toList();
  }

  // ---------------------------------------------------------- kutuphane
  Future<List<HikayeOzet>> kutuphane({
    HikayeFiltre filtre = const HikayeFiltre(),
  }) async {
    final HikayeFiltre f = filtre;
    final List<Hikaye> hepsi = await tumHikayeler();
    final Map<String, HikayeIlerleme> ilerlemeler = await tumIlerlemeler();
    final String arama = f.arama.trim().toLowerCase();

    final List<HikayeOzet> sonuc = <HikayeOzet>[];
    for (final Hikaye h in hepsi) {
      final HikayeIlerleme il =
          ilerlemeler[h.kod] ?? HikayeIlerleme.bos(h.kod);

      if (arama.isNotEmpty &&
          !h.baslik.toLowerCase().contains(arama) &&
          !h.konuEtiketi.toLowerCase().contains(arama) &&
          !h.ozetTr.toLowerCase().contains(arama)) {
        continue;
      }
      if (f.seviye != null && h.seviye != f.seviye) continue;
      if (f.konu != null && h.konuEtiketi != f.konu) continue;
      if (f.enFazlaDk != null && h.tahminiDk > f.enFazlaDk!) continue;
      if (f.sadeceTamamlananlar && il.durum != 'tamamlandi') continue;
      if (f.sadeceDevamEdenler && il.durum != 'devam') continue;
      if (f.sadeceFavoriler && !il.favori) continue;

      sonuc.add(HikayeOzet(h, il));
    }
    return sonuc;
  }

  Future<List<String>> konuEtiketleri() async {
    final List<Map<String, Object?>> r = await db.rawQuery(
        'SELECT DISTINCT konu_etiketi FROM ${_t('stories')} '
        'WHERE arsiv = 0 ORDER BY konu_etiketi');
    return r
        .map((Map<String, Object?> e) => e['konu_etiketi'] as String)
        .toList();
  }

  static String bugun() => _gun(DateTime.now());
}
