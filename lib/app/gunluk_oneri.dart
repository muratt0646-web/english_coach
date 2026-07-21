/// Gunluk oneri (PRODUCT_RULES K11) — SADE surum.
///
/// Tam RecommendationEngine Faz 3A isidir. Bu surum yalnizca elde olan
/// veriden birkac oneri uretir ve SOGUK BASLANGICTA bos kalmaz.
///
/// K3/K7: her madde ONERIDIR; hicbiri zorunlu degildir.
library;

class OneriMaddesi {
  final String modulKod;
  final String baslik;
  final String gerekce;
  final int tahminiDk;

  const OneriMaddesi({
    required this.modulKod,
    required this.baslik,
    required this.gerekce,
    required this.tahminiDk,
  });
}

class GunlukOneri {
  const GunlukOneri._();

  /// [gramerUstaligi] 0..1, [tamamlananGorev] toplam dogru gorev sayisi.
  /// Veri yoksa varsayilanlar kullanilir; liste ASLA bos donmez.
  static List<OneriMaddesi> uret({
    double gramerUstaligi = 0.0,
    int tamamlananGorev = 0,
  }) {
    final List<OneriMaddesi> liste = <OneriMaddesi>[];

    if (gramerUstaligi <= 0.0) {
      liste.add(const OneriMaddesi(
        modulKod: 'gramer',
        baslik: 'Temel Cumle Sirasi (SVO)',
        gerekce: 'Henuz hic ders calismadin; ilk konu burasi',
        tahminiDk: 20,
      ));
    } else if (gramerUstaligi < 1.0) {
      liste.add(OneriMaddesi(
        modulKod: 'gramer',
        baslik: 'SVO dersine devam et',
        gerekce: 'Ustalik %${(gramerUstaligi * 100).round()} — '
            'tamamlamana az kaldi',
        tahminiDk: 15,
      ));
    } else {
      liste.add(const OneriMaddesi(
        modulKod: 'tekrar',
        baslik: 'Dunku konulari tekrar et',
        gerekce: 'SVO dersini tamamladin; kaliciligi tekrar saglar',
        tahminiDk: 8,
      ));
    }

    liste.add(const OneriMaddesi(
      modulKod: 'kelime',
      baslik: 'Gunun kelimeleri',
      gerekce: 'Her gun az sayida kelime, gunde bir kez cok kelimeden iyidir',
      tahminiDk: 10,
    ));

    liste.add(const OneriMaddesi(
      modulKod: 'hikaye',
      baslik: 'A Normal Morning',
      gerekce: 'Ogrendigin kelimeleri baglamda gormek kaliciligi artirir',
      tahminiDk: 12,
    ));

    if (tamamlananGorev >= 3) {
      liste.add(const OneriMaddesi(
        modulKod: 'konusma',
        baslik: '5 dakika konusma',
        gerekce: 'Yazdiklarini sesli tekrar etmek uretimi guclendirir',
        tahminiDk: 5,
      ));
    }

    return liste;
  }
}
