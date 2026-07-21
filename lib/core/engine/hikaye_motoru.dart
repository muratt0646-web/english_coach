import '../model/hikaye.dart';
import 'normalizer.dart';

/// Hikaye modulunun saf mantigi: kelime siniflandirma, ilerleme,
/// istatistik ve ozet degerlendirme.
///
/// Veritabani ve arayuz bilmez; testleri bagimsiz kosar.
class HikayeMotoru {
  const HikayeMotoru._();

  /// Vurgulanmayacak dilbilgisi kelimeleri.
  static const Set<String> fonksiyonKelimeleri = <String>{
    'a', 'an', 'the', 'i', 'you', 'he', 'she', 'it', 'we', 'they',
    'me', 'him', 'her', 'us', 'them', 'my', 'your', 'his', 'its',
    'our', 'their', 'am', 'is', 'are', 'was', 'were', 'be', 'been',
    'do', 'does', 'did', 'have', 'has', 'had', 'will', 'would',
    'can', 'could', 'may', 'might', 'must', 'shall', 'should',
    'in', 'on', 'at', 'to', 'from', 'for', 'with', 'of', 'about',
    'into', 'over', 'under', 'after', 'before', 'and', 'but', 'or',
    'so', 'because', 'if', 'when', 'while', 'not', 'no', 'never',
    'very', 'too', 'also', 'there', 'here', 'this', 'that', 'these',
    'those', 'some', 'any', 'all', 'every', 'each', 'many', 'much',
    'more', 'most', 'as', 'than', 'then', 'now', 'up', 'down', 'out',
  };

  /// Bir jetonu sadelestirir: kucuk harf, noktalama yok.
  static String sadelestir(String jeton) =>
      jeton.toLowerCase().replaceAll(RegExp(r"[^a-z']"), '');

  /// Bir kelimenin muhtemel kokunu bulur (basit tekillestirme).
  /// 'books' -> 'book', 'watches' -> 'watch', 'studies' -> 'study'
  static String kokBul(String kelime) {
    if (kelime.length <= 3) return kelime;
    if (kelime.endsWith('ies')) {
      return '${kelime.substring(0, kelime.length - 3)}y';
    }
    if (kelime.endsWith('es') && kelime.length > 4) {
      final String govde = kelime.substring(0, kelime.length - 2);
      if (govde.endsWith('sh') || govde.endsWith('ch') ||
          govde.endsWith('s') || govde.endsWith('x')) {
        return govde;
      }
    }
    if (kelime.endsWith('s') && !kelime.endsWith('ss')) {
      return kelime.substring(0, kelime.length - 1);
    }
    return kelime;
  }

  /// Bir kelimenin okuyucuya gore durumu.
  ///
  /// [bilinenler] kullanicinin ogrendigi kelimeler (kucuk harf).
  /// [sozluk] hikaye sozlugunde tanimli kelimeler (kucuk harf).
  static KelimeDurumu kelimeDurumu(
    String sade, {
    required Set<String> bilinenler,
    required Set<String> sozluk,
  }) {
    if (sade.isEmpty) return KelimeDurumu.notr;
    if (fonksiyonKelimeleri.contains(sade)) return KelimeDurumu.notr;

    final String kok = kokBul(sade);
    if (bilinenler.contains(sade) || bilinenler.contains(kok)) {
      return KelimeDurumu.bilinen;
    }
    if (sozluk.contains(sade) || sozluk.contains(kok)) {
      return KelimeDurumu.bilinmeyen;
    }
    return KelimeDurumu.notr;
  }

  /// Paragrafi jetonlara ayirir ve her jetonu siniflandirir.
  /// Bosluklar ve noktalama korunur; metin bozulmaz.
  static List<MetinJetonu> jetonla(
    String paragraf, {
    required Set<String> bilinenler,
    required Set<String> sozluk,
  }) {
    final List<MetinJetonu> sonuc = <MetinJetonu>[];
    for (final String parca in paragraf.split(' ')) {
      if (parca.isEmpty) continue;
      final String sade = sadelestir(parca);
      sonuc.add(MetinJetonu(
        parca,
        sade,
        kelimeDurumu(sade, bilinenler: bilinenler, sozluk: sozluk),
      ));
    }
    return sonuc;
  }

  /// Bir hikayedeki bilinen / bilinmeyen kelime sayilari (BENZERSIZ).
  static ({int bilinen, int bilinmeyen}) kelimeSayimi(
    Hikaye h, {
    required Set<String> bilinenler,
    required Set<String> sozluk,
  }) {
    final Set<String> b = <String>{};
    final Set<String> y = <String>{};
    for (final HikayeParagraf p in h.paragraflar) {
      for (final MetinJetonu j in jetonla(p.metinEn,
          bilinenler: bilinenler, sozluk: sozluk)) {
        // BENZERSIZLIK KOK uzerinden olmali: 'morning' ve 'mornings'
        // ayni kelimedir, iki kez sayilmaz.
        if (j.durum == KelimeDurumu.bilinen) {
          b.add(kokBul(j.sade));
        } else if (j.durum == KelimeDurumu.bilinmeyen) {
          y.add(kokBul(j.sade));
        }
      }
    }
    return (bilinen: b.length, bilinmeyen: y.length);
  }

  /// Okuma yuzdesi. [sonParagraf] 0 tabanli okunan paragraf sayisidir.
  static double okumaYuzdesi(int okunan, int toplam) {
    if (toplam <= 0) return 0;
    final double o = okunan / toplam;
    return o < 0 ? 0 : (o > 1 ? 1 : o);
  }

  /// Bir sorunun cevabini degerlendirir.
  static bool cevapDogruMu(HikayeSorusu s, String cevap) {
    final String v = Normalizer.normalize(cevap);
    if (v.isEmpty) return false;
    for (final String k in s.kabulEdilenler) {
      if (Normalizer.normalize(k) == v) return true;
    }
    return false;
  }

  static double basariYuzdesi(int dogru, int yanlis) {
    final int toplam = dogru + yanlis;
    if (toplam == 0) return 0;
    return dogru / toplam;
  }

  /// Tahmini okuma suresi (dakika). A1 icin ~90 kelime/dk.
  static int tahminiSure(int kelimeSayisi, {int dakikadaKelime = 90}) {
    final int dk = (kelimeSayisi / dakikadaKelime).ceil();
    return dk < 1 ? 1 : dk;
  }
}

/// Kullanicinin yazdigi ozetin degerlendirmesi.
class OzetSonucu {
  final int cumleSayisi;
  final int kelimeSayisi;

  /// Yakalanan anahtar kavramlar.
  final List<String> bulunanKavramlar;
  final List<String> eksikKavramlar;

  /// Uzunluk uygun mu (2-3 cumle bekleniyor).
  final bool uzunlukUygun;

  /// Anlam kapsamasi 0..1
  final double kapsama;

  final List<String> notlar;

  const OzetSonucu({
    required this.cumleSayisi,
    required this.kelimeSayisi,
    required this.bulunanKavramlar,
    required this.eksikKavramlar,
    required this.uzunlukUygun,
    required this.kapsama,
    required this.notlar,
  });

  bool get yeterli => uzunlukUygun && kapsama >= 0.5;
}

/// Ozet degerlendirici.
///
/// NOT: Bu bir anlam cozumleyici DEGILDIR. Anahtar kavram kapsamasi ve
/// uzunluk olcer; dilbilgisi geri bildirimi Tani Motoru'na birakilir.
/// Sinirini acikca bildirir.
class OzetDegerlendirici {
  const OzetDegerlendirici._();

  static OzetSonucu degerlendir(String ozet, Hikaye h) {
    final String n = Normalizer.normalize(ozet);
    final List<String> cumleler = ozet
        .split(RegExp(r'[.!?]+'))
        .map((String s) => s.trim())
        .where((String s) => s.isNotEmpty)
        .toList();
    final List<String> kelimeler =
        n.split(' ').where((String s) => s.isNotEmpty).toList();

    final List<String> bulunan = <String>[];
    final List<String> eksik = <String>[];
    for (final String k in h.anahtarKavramlar) {
      final String kk = Normalizer.normalize(k);
      final String kok = HikayeMotoru.kokBul(kk);
      if (n.contains(kk) || n.contains(kok)) {
        bulunan.add(k);
      } else {
        eksik.add(k);
      }
    }

    final double kapsama = h.anahtarKavramlar.isEmpty
        ? 1.0
        : bulunan.length / h.anahtarKavramlar.length;
    final bool uzunluk = cumleler.length >= 2 && cumleler.length <= 4;

    final List<String> notlar = <String>[];
    if (cumleler.length < 2) {
      notlar.add('Ozet cok kisa. En az 2 cumle yazin.');
    } else if (cumleler.length > 4) {
      notlar.add('Ozet uzun. 2-3 cumle yeterlidir.');
    }
    if (kapsama < 0.5) {
      notlar.add('Hikayenin ana ogeleri eksik kalmis.');
    }
    if (kelimeler.length < 8) {
      notlar.add('Daha fazla ayrinti ekleyin.');
    }

    return OzetSonucu(
      cumleSayisi: cumleler.length,
      kelimeSayisi: kelimeler.length,
      bulunanKavramlar: bulunan,
      eksikKavramlar: eksik,
      uzunlukUygun: uzunluk,
      kapsama: kapsama,
      notlar: notlar,
    );
  }
}
