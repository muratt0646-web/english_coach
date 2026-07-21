import '../core/db/app_database.dart';
import '../core/engine/tani_motoru.dart' show KabulCevabi, KabulTipi;
import '../core/model/dusunme.dart';
import '../core/model/models.dart';

/// content.db okumalari (ATTACH edilmis 'icerik' semasi uzerinden).
class IcerikRepo {
  final _db = AppDatabase.instance;

  Future<Konu?> konuGetir(String kod) async {
    final r = await _db.db.rawQuery(
        'SELECT * FROM icerik.konu WHERE kod = ? AND arsiv = 0', [kod]);
    if (r.isEmpty) return null;
    return Konu.fromRow(r.first);
  }

  Future<List<Konu>> tumKonular() async {
    final r = await _db.db.rawQuery(
        'SELECT * FROM icerik.konu WHERE arsiv = 0 ORDER BY kod');
    return r.map(Konu.fromRow).toList();
  }

  Future<List<DersAdim>> dersAdimlari(String konuKod) async {
    final r = await _db.db.rawQuery(
        'SELECT * FROM icerik.ders_adim WHERE konu_kod = ? ORDER BY adim_no',
        [konuKod]);
    return r.map(DersAdim.fromRow).toList();
  }

  /// Gorevleri, gorev_kabul tablosundaki TUM kabul edilebilir cevaplarla getirir.
  Future<List<Gorev>> gorevler(String konuKod) async {
    final gr = await _db.db.rawQuery(
        'SELECT * FROM icerik.gorev WHERE konu_kod = ? AND arsiv = 0 '
        'ORDER BY adim_no, kod',
        [konuKod]);

    final sonuc = <Gorev>[];
    for (final g in gr) {
      final kod = g['kod'] as String;
      final kr = await _db.db.rawQuery(
          'SELECT cevap, esdeger_mi, not_tr FROM icerik.gorev_kabul '
          'WHERE gorev_kod = ? ORDER BY sira',
          [kod]);
      final duzKabul = <String>[];
      final tipliKabul = <KabulCevabi>[];
      for (var i = 0; i < kr.length; i++) {
        final e = kr[i];
        final cevap = e['cevap'] as String;
        final esdeger = (e['esdeger_mi'] as num).toInt();
        final tip = i == 0
            ? KabulTipi.ana
            : KabulCevabi.tipCoz(esdeger);
        tipliKabul.add(KabulCevabi(cevap, tip, e['not_tr'] as String?));
        // anlam_farkli olanlar DOGRU kabul edilmez -> duz listeye girmez
        if (tip != KabulTipi.anlamFarkli) duzKabul.add(cevap);
      }
      sonuc.add(Gorev(
        kod: kod,
        konuKod: g['konu_kod'] as String,
        adimNo: (g['adim_no'] as num).toInt(),
        tip: g['tip'] as String,
        govde: g['govde'] as String,
        ipucu: g['ipucu'] as String?,
        zorluk: (g['zorluk'] as num).toInt(),
        hedefYapi: g['hedef_yapi'] as String?,
        kabulCevaplari: duzKabul,
        kabuller: tipliKabul,
      ));
    }
    return sonuc;
  }

  Future<List<Kelime>> kelimeler() async {
    final r = await _db.db.rawQuery(
        'SELECT * FROM icerik.kelime WHERE arsiv = 0 ORDER BY frekans_sirasi');
    final sonuc = <Kelime>[];
    for (final k in r) {
      final kod = k['kod'] as String;
      final a = await _db.db.rawQuery(
          'SELECT tr_anlam FROM icerik.kelime_anlam WHERE kelime_kod = ? '
          'ORDER BY sira',
          [kod]);
      sonuc.add(Kelime(
        kod: kod,
        yazilis: k['yazilis'] as String,
        ipa: k['ipa'] as String?,
        trOkunus: k['tr_okunus'] as String?,
        tur: k['tur'] as String,
        trAnlamlar: a.map((e) => e['tr_anlam'] as String).toList(),
      ));
    }
    return sonuc;
  }

  /// Tani Motoru v2 icin: yazilis -> Turkce anlam haritasi.
  /// SOZ-01 (kelime secimi) hatalarinda aciklama uretmekte kullanilir.
  Future<Map<String, String>> kelimeAnlamHaritasi() async {
    final r = await _db.db.rawQuery(
        'SELECT k.yazilis AS y, a.tr_anlam AS t '
        'FROM icerik.kelime k '
        'JOIN icerik.kelime_anlam a ON a.kelime_kod = k.kod AND a.sira = 0 '
        'WHERE k.arsiv = 0');
    return {for (final e in r) e['y'] as String: e['t'] as String};
  }

  /// v2: Bir konunun Ingilizce dusunme modelini yukler.
  /// Konu koduna ozel hicbir dal yoktur; her konu ayni sorgularla okunur.
  Future<DusunmeModeli?> dusunmeModeli(String konuKod) async {
    final m = await _db.db.rawQuery(
        'SELECT * FROM icerik.dusunme_modeli WHERE konu_kod = ?', [konuKod]);
    if (m.isEmpty) return null;

    final sr = await _db.db.rawQuery(
        'SELECT * FROM icerik.zihinsel_soru WHERE konu_kod = ? ORDER BY sira',
        [konuKod]);
    final orn = await _db.db.rawQuery(
        'SELECT * FROM icerik.dusunme_ornegi WHERE konu_kod = ? '
        'ORDER BY tip DESC, kod',
        [konuKod]);
    final bl = await _db.db.rawQuery(
        'SELECT * FROM icerik.anlam_blogu WHERE konu_kod = ? '
        'ORDER BY ornek_kod, sira',
        [konuKod]);
    final md = await _db.db.rawQuery(
        'SELECT * FROM icerik.mudahale_hatasi WHERE konu_kod = ? ORDER BY kod',
        [konuKod]);

    final bloklar = <String, List<AnlamBlogu>>{};
    for (final b in bl) {
      bloklar
          .putIfAbsent(b['ornek_kod'] as String, () => <AnlamBlogu>[])
          .add(AnlamBlogu.fromRow(b));
    }

    return DusunmeModeli(
      konuKod: konuKod,
      ad: m.first['ad'] as String,
      ozet: m.first['ozet'] as String,
      trSira: (m.first['tr_sira'] as String).split(','),
      enSira: (m.first['en_sira'] as String).split(','),
      sorular: sr.map(ZihinselSoru.fromRow).toList(),
      mudahaleler: md.map(MudahaleHatasi.fromRow).toList(),
      ornekler: orn.map((o) {
        final kod = o['kod'] as String;
        return DusunmeOrnegi(
          kod: kod,
          dogruMu: (o['tip'] as String) == 'dogru',
          trCumle: o['tr_cumle'] as String,
          enCumle: o['en_cumle'] as String,
          aciklama: o['aciklama'] as String?,
          bloklar: bloklar[kod] ?? const <AnlamBlogu>[],
        );
      }).toList(),
    );
  }
}
