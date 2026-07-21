import '../model/ders_sablonu.dart';
import 'normalizer.dart';

/// Bir sorunun cevaplanma kaydi.
class CevapKaydi {
  final String soruKodu;
  final String altKonu;
  final bool dogruMu;
  final String kullaniciCevabi;
  const CevapKaydi({
    required this.soruKodu,
    required this.altKonu,
    required this.dogruMu,
    required this.kullaniciCevabi,
  });
}

/// Ders sonu basari ozeti.
class DersSonucu {
  final int dogru;
  final int yanlis;
  final double basariYuzdesi;
  final Duration sure;

  /// En cok hata yapilan alt konu. Hata yoksa null.
  final String? enCokHataliKonu;

  /// En basarili alt konu. Kayit yoksa null.
  final String? enGucluKonu;

  /// Dersin tamamlanma zamani.
  final DateTime tamamlanmaTarihi;

  /// Tekrar onerilen alt konular (yanlis > dogru olanlar).
  final List<String> onerilenTekrarlar;

  const DersSonucu({
    required this.dogru,
    required this.yanlis,
    required this.basariYuzdesi,
    required this.sure,
    required this.onerilenTekrarlar,
    required this.tamamlanmaTarihi,
    this.enCokHataliKonu,
    this.enGucluKonu,
  });

  /// Mini sinav puani (100 uzerinden).
  int get sinavPuani => (basariYuzdesi * 100).round();

  /// Mini sinav esigi: %80.
  bool get sinavGecti => basariYuzdesi >= 0.80;
}

/// GENEL ders motoru.
///
/// Hicbir derse ozel dal icermez. 12 asamali akisi yurutur, cevaplari
/// biriktirir, zayif konulari cikarir ve pekistirmeyi agirliklandirir.
class DersMotoru {
  final DersSablonu ders;
  final List<CevapKaydi> _kayitlar = <CevapKaydi>[];
  final DateTime baslangic;

  DersMotoru(this.ders, {DateTime? simdi})
      : baslangic = simdi ?? DateTime.now();

  List<CevapKaydi> get kayitlar => List<CevapKaydi>.unmodifiable(_kayitlar);

  /// Asama sirasi SABITTIR. Icerik bos olsa bile sira degismez.
  static const List<DersAsamasi> asamaSirasi = DersAsamasi.values;

  static DersAsamasi? sonraki(DersAsamasi a) {
    final int i = asamaSirasi.indexOf(a);
    if (i < 0 || i >= asamaSirasi.length - 1) return null;
    return asamaSirasi[i + 1];
  }

  static DersAsamasi? onceki(DersAsamasi a) {
    final int i = asamaSirasi.indexOf(a);
    if (i <= 0) return null;
    return asamaSirasi[i - 1];
  }

  /// Bir asamanin icerigi var mi?
  bool asamaDoluMu(DersAsamasi a) => switch (a) {
        DersAsamasi.giris => ders.girisMetni.isNotEmpty,
        DersAsamasi.anlatim => ders.anlatim.isNotEmpty,
        DersAsamasi.gorselOrnek => ders.gorselOrnekler.isNotEmpty,
        DersAsamasi.adimAdim => ders.adimAdimOrnekler.isNotEmpty,
        DersAsamasi.miniKontrol => ders.miniKontrol.isNotEmpty,
        DersAsamasi.kontrolluAlistirma =>
          ders.kontrolluAlistirmalar.isNotEmpty,
        DersAsamasi.serbestUretim => ders.serbestUretim.isNotEmpty,
        DersAsamasi.hataAnalizi => true,
        DersAsamasi.pekistirme => ders.pekistirme.isNotEmpty,
        DersAsamasi.miniSinav => ders.miniSinav.isNotEmpty,
        DersAsamasi.ozet => ders.ozet.isNotEmpty,
        DersAsamasi.basari => true,
      };

  /// Cevabi degerlendirir ve kaydeder.
  bool cevapla(SablonSoru s, String cevap) {
    final bool d = dogruMu(s.kabuller, cevap);
    _kayitlar.add(CevapKaydi(
      soruKodu: s.kod, altKonu: s.altKonu,
      dogruMu: d, kullaniciCevabi: cevap,
    ));
    return d;
  }

  bool serbestCevapla(SerbestGorev g, String cevap) {
    final bool d = dogruMu(g.kabuller, cevap);
    _kayitlar.add(CevapKaydi(
      soruKodu: g.kod, altKonu: g.altKonu,
      dogruMu: d, kullaniciCevabi: cevap,
    ));
    return d;
  }

  /// Turkcede tek "o" vardir; Ingilizcede he/she ayrimi bulunur.
  /// Kabul kumesindeki her cumlenin diger cinsiyetli bicimi de kabul edilir.
  static List<String> cinsiyetVaryantlari(List<String> kabuller) {
    final List<String> hepsi = <String>[];
    for (final String k in kabuller) {
      hepsi.add(k);
      if (k.startsWith('He ')) {
        hepsi.add('She ${k.substring(3)}');
      } else if (k.startsWith('She ')) {
        hepsi.add('He ${k.substring(4)}');
      }
    }
    return hepsi;
  }

  /// Kabul kumesiyle karsilastirma. Normalizer kullanir.
  /// he/she varyantlari otomatik kabul edilir.
  static bool dogruMu(List<String> kabuller, String cevap) {
    final String v = Normalizer.normalize(cevap);
    if (v.isEmpty) return false;
    for (final String k in cinsiyetVaryantlari(kabuller)) {
      if (Normalizer.normalize(k) == v) return true;
    }
    return false;
  }

  /// Alt konu basina (dogru, yanlis) sayimi.
  Map<String, ({int dogru, int yanlis})> konuSayimi() {
    final Map<String, ({int dogru, int yanlis})> m =
        <String, ({int dogru, int yanlis})>{};
    for (final CevapKaydi k in _kayitlar) {
      final ({int dogru, int yanlis}) o =
          m[k.altKonu] ?? (dogru: 0, yanlis: 0);
      m[k.altKonu] = k.dogruMu
          ? (dogru: o.dogru + 1, yanlis: o.yanlis)
          : (dogru: o.dogru, yanlis: o.yanlis + 1);
    }
    return m;
  }

  /// Zayif konular: en cok yanlis yapilandan baslayarak.
  List<String> zayifKonular() {
    final Map<String, ({int dogru, int yanlis})> m = konuSayimi();
    final List<String> l = m.keys
        .where((String k) => m[k]!.yanlis > 0)
        .toList()
      ..sort((String a, String b) => m[b]!.yanlis.compareTo(m[a]!.yanlis));
    return l;
  }

  /// Pekistirme sorularini AGIRLIKLANDIRIR: zayif konular one alinir
  /// ve iki kez tekrarlanir.
  List<SablonSoru> agirlikliPekistirme() {
    final List<String> zayif = zayifKonular();
    if (zayif.isEmpty) return ders.pekistirme;

    final List<SablonSoru> once = <SablonSoru>[];
    final List<SablonSoru> sonra = <SablonSoru>[];
    for (final SablonSoru s in ders.pekistirme) {
      if (zayif.contains(s.altKonu)) {
        once.add(s);
      } else {
        sonra.add(s);
      }
    }
    // Zayif konu sorulari IKI kez gelir: bir kez basta, bir kez sonda.
    // Araya diger sorular girdigi icin AYNI soru art arda GELMEZ.
    final List<SablonSoru> sonuc = <SablonSoru>[...once, ...sonra, ...once];
    return _ardArdaAyikla(sonuc);
  }

  /// Ayni soru kodunun art arda gelmesini engeller.
  static List<SablonSoru> _ardArdaAyikla(List<SablonSoru> l) {
    if (l.length < 2) return l;
    final List<SablonSoru> c = List<SablonSoru>.from(l);
    for (int i = 1; i < c.length; i++) {
      if (c[i].kod != c[i - 1].kod) continue;
      // takas edilecek farkli bir soru ara
      int j = i + 1;
      while (j < c.length && c[j].kod == c[i].kod) {
        j++;
      }
      if (j < c.length) {
        final SablonSoru g = c[i];
        c[i] = c[j];
        c[j] = g;
      }
    }
    return c;
  }

  /// Yalnizca mini sinav kayitlarindan sonuc uretir.
  DersSonucu sonuc({DateTime? simdi, Set<String>? soruKodlari}) {
    final List<CevapKaydi> secili = soruKodlari == null
        ? _kayitlar
        : _kayitlar
            .where((CevapKaydi k) => soruKodlari.contains(k.soruKodu))
            .toList();

    final int d = secili.where((CevapKaydi k) => k.dogruMu).length;
    final int y = secili.length - d;
    final Map<String, int> hata = <String, int>{};
    for (final CevapKaydi k in secili) {
      if (!k.dogruMu) hata[k.altKonu] = (hata[k.altKonu] ?? 0) + 1;
    }
    String? enCok;
    int enFazla = 0;
    hata.forEach((String konu, int adet) {
      if (adet > enFazla) {
        enFazla = adet;
        enCok = konu;
      }
    });

    final Map<String, ({int dogru, int yanlis})> sayim = <String, ({int dogru, int yanlis})>{};
    for (final CevapKaydi k in secili) {
      final ({int dogru, int yanlis}) o = sayim[k.altKonu] ?? (dogru: 0, yanlis: 0);
      sayim[k.altKonu] = k.dogruMu
          ? (dogru: o.dogru + 1, yanlis: o.yanlis)
          : (dogru: o.dogru, yanlis: o.yanlis + 1);
    }
    final List<String> oneri = sayim.keys
        .where((String k) => sayim[k]!.yanlis >= sayim[k]!.dogru &&
            sayim[k]!.yanlis > 0)
        .toList();

    // en GUCLU konu: oransal basarisi en yuksek olan
    String? enGuclu;
    double enIyi = -1;
    sayim.forEach((String konu, ({int dogru, int yanlis}) o) {
      final int t = o.dogru + o.yanlis;
      if (t == 0) return;
      final double oran = o.dogru / t;
      if (oran > enIyi) {
        enIyi = oran;
        enGuclu = konu;
      }
    });

    final DateTime simdiki = simdi ?? DateTime.now();
    return DersSonucu(
      dogru: d,
      yanlis: y,
      basariYuzdesi: secili.isEmpty ? 0 : d / secili.length,
      sure: simdiki.difference(baslangic),
      enCokHataliKonu: enCok,
      enGucluKonu: enGuclu,
      tamamlanmaTarihi: simdiki,
      onerilenTekrarlar: oneri,
    );
  }

  /// Mini kontrolde yanlis cevap verilirse hangi anlatim blogua donulur?
  String? geriDonusBlogu(SablonSoru s) => s.geriDonusKodu;

  int anlatimBlokIndeksi(String kod) =>
      ders.anlatim.indexWhere((AnlatimBlogu b) => b.kod == kod);
}
