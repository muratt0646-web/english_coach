/// GENEL ders sablonu — A1'den B2'ye butun gramer dersleri bunu kullanir.
///
/// Yeni ders eklemek YALNIZCA veri eklemektir: bu dosya, DersMotoru ve
/// SablonDersEkrani DEGISMEZ.
library;

/// Sartnamedeki 12 bolum. Sira SABITTIR; hicbir ders disina cikamaz.
enum DersAsamasi {
  giris,
  anlatim,
  gorselOrnek,
  adimAdim,
  miniKontrol,
  kontrolluAlistirma,
  serbestUretim,
  hataAnalizi,
  pekistirme,
  miniSinav,
  ozet,
  basari,
}

extension DersAsamasiAd on DersAsamasi {
  int get sira => index + 1;

  String get ad => switch (this) {
        DersAsamasi.giris => 'Giris',
        DersAsamasi.anlatim => 'Konu anlatimi',
        DersAsamasi.gorselOrnek => 'Gorsel ornekler',
        DersAsamasi.adimAdim => 'Adim adim ornekler',
        DersAsamasi.miniKontrol => 'Mini kontrol',
        DersAsamasi.kontrolluAlistirma => 'Kontrollu alistirmalar',
        DersAsamasi.serbestUretim => 'Serbest yazma',
        DersAsamasi.hataAnalizi => 'Hata analizi',
        DersAsamasi.pekistirme => 'Pekistirme',
        DersAsamasi.miniSinav => 'Mini sinav',
        DersAsamasi.ozet => 'Ders ozeti',
        DersAsamasi.basari => 'Basari ekrani',
      };
}

/// Tum alistirma turleri. Mini kontrol, alistirma, pekistirme ve
/// mini sinav AYNI tipi kullanir; kod tekrari olmaz.
enum SoruTuru {
  coktanSecmeli,
  dogruYanlis,
  boslukDoldurma,
  kelimeDizme,
  eslestirme,
  surukleBirak,
  serbestYazma,
}

extension SoruTuruAd on SoruTuru {
  String get ad => switch (this) {
        SoruTuru.coktanSecmeli => 'Coktan secmeli',
        SoruTuru.dogruYanlis => 'Dogru / Yanlis',
        SoruTuru.boslukDoldurma => 'Bosluk doldurma',
        SoruTuru.kelimeDizme => 'Kelime dizme',
        SoruTuru.eslestirme => 'Eslestirme',
        SoruTuru.surukleBirak => 'Surukle birak',
        SoruTuru.serbestYazma => 'Serbest yazma',
      };

  /// Secenekli mi, yoksa metin girisi mi?
  bool get secmeli =>
      this == SoruTuru.coktanSecmeli ||
      this == SoruTuru.dogruYanlis ||
      this == SoruTuru.eslestirme;
}

/// Konu anlatiminin tek blogu. [kod] mini kontrolde geri yonlendirme icin.
class AnlatimBlogu {
  final String kod;
  final String baslik;
  final String govde;
  final String? turkceKarsilastirma;

  const AnlatimBlogu({
    required this.kod,
    required this.baslik,
    required this.govde,
    this.turkceKarsilastirma,
  });
}

/// Adim adim olusan ornek: ['I', 'I am', 'I am happy.']
class AdimliOrnek {
  final List<String> adimlar;
  final String turkce;
  final String? not;

  const AdimliOrnek({
    required this.adimlar,
    required this.turkce,
    this.not,
  });
}

/// Dogru veya yanlis ornek cumle.
class OrnekCumle {
  final String ingilizce;
  final String turkce;
  final bool dogruMu;

  /// Yanlis orneklerde ZORUNLU: neden yanlis.
  final String? neden;
  final String? dogruBicim;

  /// Yanlis orneklerde hata turu (Tani Motoru kategorisiyle ayni ad uzayi).
  final String? hataTuru;

  /// Ornegin ait oldugu alt konu. Hem dogru hem yanlis orneklerde kullanilir.
  final String? altKonu;

  const OrnekCumle({
    required this.ingilizce,
    required this.turkce,
    required this.dogruMu,
    this.neden,
    this.dogruBicim,
    this.hataTuru,
    this.altKonu,
  });
}

/// Derse ozel tani kurali. Diagnosis Engine'e VERI olarak beslenir;
/// motor kodu degismez.
class DersTaniKurali {
  final String kod;

  /// Hangi alt konuya ait.
  final String altKonu;

  /// Yanlis bicim (normalize edilmis karsilastirma icin).
  final String yanlisDesen;

  /// Dogru bicim.
  final String dogruBicim;

  final String aciklama;

  const DersTaniKurali({
    required this.kod,
    required this.altKonu,
    required this.yanlisDesen,
    required this.dogruBicim,
    required this.aciklama,
  });
}

/// Tek soru tipi — dort asamada da kullanilir.
class SablonSoru {
  final String kod;
  final SoruTuru tur;
  final String soru;
  final List<String> secenekler;
  final List<String> kabuller;
  final String? ipucu;
  final String? aciklama;

  /// Mini kontrolde yanlis cevap verilirse geri donulecek anlatim blogu.
  final String? geriDonusKodu;

  /// Hangi alt konuya ait (zayif konu analizi icin).
  final String altKonu;

  const SablonSoru({
    required this.kod,
    required this.tur,
    required this.soru,
    required this.kabuller,
    required this.altKonu,
    this.secenekler = const <String>[],
    this.ipucu,
    this.aciklama,
    this.geriDonusKodu,
  });

  String get kanonik => kabuller.isEmpty ? '' : kabuller.first;
}

/// Serbest uretim gorevi: Turkce verilir, Ingilizce beklenir.
class SerbestGorev {
  final String kod;
  final String turkce;
  final List<String> kabuller;
  final String altKonu;
  final String? ipucu;

  const SerbestGorev({
    required this.kod,
    required this.turkce,
    required this.kabuller,
    required this.altKonu,
    this.ipucu,
  });
}

/// Ders ozetinde gosterilecek madde.
class OzetMaddesi {
  final String baslik;
  final String aciklama;
  final String ornek;

  const OzetMaddesi({
    required this.baslik,
    required this.aciklama,
    required this.ornek,
  });
}

/// Tam ders sablonu. Butun icerik BURADA; is mantigi YOK.
class DersSablonu {
  final String kod;
  final String baslik;
  final String seviye;
  final String konu;
  final int tahminiDk;

  final String girisMetni;
  final List<String> kazanimlar;

  final List<AnlatimBlogu> anlatim;
  final List<AdimliOrnek> gorselOrnekler;
  final List<AdimliOrnek> adimAdimOrnekler;
  final List<OrnekCumle> ornekler;
  final List<SablonSoru> miniKontrol;
  final List<SablonSoru> kontrolluAlistirmalar;
  final List<SerbestGorev> serbestUretim;
  final List<SablonSoru> pekistirme;
  final List<SablonSoru> miniSinav;
  final List<OzetMaddesi> ozet;

  /// Onerilen on kosul ders kodlari. KILIT DEGILDIR (PRODUCT_RULES K3/K7);
  /// yalnizca siralama onerisi tasir.
  final List<String> onKosullar;

  /// Derse ozel tani kurallari. Bos birakilabilir.
  final List<DersTaniKurali> taniKurallari;

  const DersSablonu({
    required this.kod,
    required this.baslik,
    required this.seviye,
    required this.konu,
    required this.tahminiDk,
    required this.girisMetni,
    required this.kazanimlar,
    required this.anlatim,
    required this.gorselOrnekler,
    required this.adimAdimOrnekler,
    required this.ornekler,
    required this.miniKontrol,
    required this.kontrolluAlistirmalar,
    required this.serbestUretim,
    required this.pekistirme,
    required this.miniSinav,
    required this.ozet,
    this.onKosullar = const <String>[],
    this.taniKurallari = const <DersTaniKurali>[],
  });

  List<OrnekCumle> get dogruOrnekler =>
      ornekler.where((OrnekCumle o) => o.dogruMu).toList();
  List<OrnekCumle> get yanlisOrnekler =>
      ornekler.where((OrnekCumle o) => !o.dogruMu).toList();
}
