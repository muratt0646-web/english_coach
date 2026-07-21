/// Faz 1B-1 veri modelleri. Kaynak: LOCAL_DATABASE_SCHEMA.md
library;

import '../engine/tani_motoru.dart' show KabulCevabi;

class Konu {
  final String kod;
  final String seviye;
  final String alan;
  final String adTr;
  final String ogretimAmaci;
  final int tahminiSureDk;

  const Konu({
    required this.kod,
    required this.seviye,
    required this.alan,
    required this.adTr,
    required this.ogretimAmaci,
    required this.tahminiSureDk,
  });

  factory Konu.fromRow(Map<String, Object?> r) => Konu(
        kod: r['kod'] as String,
        seviye: r['seviye'] as String,
        alan: r['alan'] as String,
        adTr: r['ad_tr'] as String,
        ogretimAmaci: r['ogretim_amaci'] as String,
        tahminiSureDk: (r['tahmini_sure_dk'] as num).toInt(),
      );
}

class DersAdim {
  final String konuKod;
  final int adimNo;
  final String tip;
  final String govdeMd;

  const DersAdim({
    required this.konuKod,
    required this.adimNo,
    required this.tip,
    required this.govdeMd,
  });

  factory DersAdim.fromRow(Map<String, Object?> r) => DersAdim(
        konuKod: r['konu_kod'] as String,
        adimNo: (r['adim_no'] as num).toInt(),
        tip: r['tip'] as String,
        govdeMd: r['govde_md'] as String,
      );
}

/// Gorev tipleri (PHASE_1B_VERTICAL_SLICE_SCOPE.md sec.4)
class GorevTipi {
  static const bosluk = 'G-BD';
  static const siralama = 'G-SR';
  static const cevirTrEn = 'G-CT';
}

class Gorev {
  final String kod;
  final String konuKod;
  final int adimNo;
  final String tip;
  final String govde;
  final String? ipucu;
  final int zorluk;
  final String? hedefYapi;

  /// gorev_kabul tablosundan gelen kabul edilebilir cevaplar (duz metin).
  /// Ilk eleman (sira=0) kanonik cevaptir.
  final List<String> kabulCevaplari;

  /// v3: tipli kabul kumesi (ana / alternatif / anlam_farkli).
  /// Sema degismedi; tip gorev_kabul.esdeger_mi sutunundan cozulur.
  final List<KabulCevabi> kabuller;

  const Gorev({
    required this.kod,
    required this.konuKod,
    required this.adimNo,
    required this.tip,
    required this.govde,
    required this.zorluk,
    required this.kabulCevaplari,
    this.kabuller = const <KabulCevabi>[],
    this.ipucu,
    this.hedefYapi,
  });

  String get kanonikCevap =>
      kabulCevaplari.isNotEmpty ? kabulCevaplari.first : '';
}

class Kelime {
  final String kod;
  final String yazilis;
  final String? ipa;
  final String? trOkunus;
  final String tur;
  final List<String> trAnlamlar;

  const Kelime({
    required this.kod,
    required this.yazilis,
    required this.tur,
    required this.trAnlamlar,
    this.ipa,
    this.trOkunus,
  });
}

/// D-5: gramer ustaligi ile dinleme durumu AYRI tutulur.
class KonuIlerleme {
  final String konuKod;
  final String durum;
  final String ilerlemeDurumu;
  final double gramerUstaligi;
  final String dinlemeDurumu;
  final int kanitSayisi;
  final int uretimKanitiVarMi;

  const KonuIlerleme({
    required this.konuKod,
    required this.durum,
    required this.ilerlemeDurumu,
    required this.gramerUstaligi,
    required this.dinlemeDurumu,
    required this.kanitSayisi,
    required this.uretimKanitiVarMi,
  });

  factory KonuIlerleme.fromRow(Map<String, Object?> r) => KonuIlerleme(
        konuKod: r['konu_kod'] as String,
        durum: r['durum'] as String,
        ilerlemeDurumu: r['ilerleme_durumu'] as String,
        gramerUstaligi: (r['gramer_ustaligi'] as num).toDouble(),
        dinlemeDurumu: r['dinleme_durumu'] as String,
        kanitSayisi: (r['kanit_sayisi'] as num).toInt(),
        uretimKanitiVarMi: (r['uretim_kaniti_var_mi'] as num).toInt(),
      );
}
