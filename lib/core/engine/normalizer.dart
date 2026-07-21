/// Cevap normalizasyonu.
/// PHASE_1B_VERTICAL_SLICE_SCOPE.md sec.4.1 kabul kumesi ilkesi.
///
/// Anlam degistirmeyen farklar silinir; anlam tasiyan farklar KORUNUR.
class Normalizer {
  static const Map<String, String> _kisaltmalar = {
    "i'm": 'i am',
    "you're": 'you are',
    "he's": 'he is',
    "she's": 'she is',
    "it's": 'it is',
    "we're": 'we are',
    "they're": 'they are',
    "don't": 'do not',
    "doesn't": 'does not',
    "isn't": 'is not',
    "aren't": 'are not',
    "can't": 'can not',
  };

  /// Turkce harflerin ASCII karsiliklari.
  ///
  /// GEREKCE: Icerik ASCII ile yazildi (cay, ogrenci). Kullanici klavyeden
  /// 'cay' yerine 'cay' veya 'çay' yazabilir; ikisi de DOGRU sayilmali.
  /// Ayrica Dart'in toLowerCase() metodu Turkce 'I' -> 'i' donusumunu
  /// dogru yapmaz (nokta birlesimi uretir).
  static const Map<String, String> _turkceHarfler = <String, String>{
    'ç': 'c', 'Ç': 'c', 'ğ': 'g', 'Ğ': 'g', 'ı': 'i', 'I': 'i',
    'İ': 'i', 'ö': 'o', 'Ö': 'o', 'ş': 's', 'Ş': 's', 'ü': 'u',
    'Ü': 'u', 'â': 'a', 'Â': 'a', 'î': 'i', 'Î': 'i', 'û': 'u',
    'Û': 'u',
  };

  /// Turkce harfleri ASCII'ye katlar. Ingilizce metni DEGISTIRMEZ.
  static String turkceKatla(String girdi) {
    final StringBuffer b = StringBuffer();
    for (final int rune in girdi.runes) {
      final String c = String.fromCharCode(rune);
      b.write(_turkceHarfler[c] ?? c);
    }
    return b.toString();
  }

  static String normalize(String girdi) {
    // Turkce katlama toLowerCase'ten ONCE: 'I' ve 'İ' dogru islenir.
    var s = turkceKatla(girdi).toLowerCase().trim();
    s = s.replaceAll('\u2019', "'").replaceAll('\u2018', "'");
    _kisaltmalar.forEach((k, v) {
      s = s.replaceAll(k, v);
    });
    s = s.replaceAll(RegExp(r'[.!?,;:]'), ' ');
    s = s.replaceAll(RegExp(r'\s+'), ' ').trim();
    return s;
  }

  static List<String> tokenize(String girdi) {
    final n = normalize(girdi);
    if (n.isEmpty) return const <String>[];
    return n.split(' ');
  }

  /// Jeton duzeyinde Levenshtein mesafesi.
  static int tokenMesafe(List<String> a, List<String> b) {
    final m = a.length, n = b.length;
    if (m == 0) return n;
    if (n == 0) return m;

    var onceki = List<int>.generate(n + 1, (i) => i);
    for (var i = 1; i <= m; i++) {
      final simdi = List<int>.filled(n + 1, 0);
      simdi[0] = i;
      for (var j = 1; j <= n; j++) {
        final maliyet = a[i - 1] == b[j - 1] ? 0 : 1;
        var en = simdi[j - 1] + 1;
        if (onceki[j] + 1 < en) en = onceki[j] + 1;
        if (onceki[j - 1] + maliyet < en) en = onceki[j - 1] + maliyet;
        simdi[j] = en;
      }
      onceki = simdi;
    }
    return onceki[n];
  }

  /// Iki jeton listesi ayni cokluga mi sahip (siradan bagimsiz)?
  static bool ayniCokluk(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    final x = List<String>.from(a)..sort();
    final y = List<String>.from(b)..sort();
    for (var i = 0; i < x.length; i++) {
      if (x[i] != y[i]) return false;
    }
    return true;
  }
}
