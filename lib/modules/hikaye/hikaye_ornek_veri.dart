/// Hikayeler ISKELET verisi.
/// Faz 2D kapsaminda hikaye havuzu yazilmaz; ekranin calistigini
/// gostermek icin tek bir baslangic hikayesi tasinir.
library;

class HikayeSorusu {
  final String soru;
  final List<String> secenekler;
  final int dogruIndeks;

  const HikayeSorusu({
    required this.soru,
    required this.secenekler,
    required this.dogruIndeks,
  });
}

class Hikaye {
  final String kod;
  final String baslik;
  final String seviye;
  final List<String> paragraflarEn;
  final List<String> paragraflarTr;

  /// Metinde vurgulanacak ogrenilecek kelimeler.
  final Map<String, String> hedefKelimeler;

  final List<HikayeSorusu> sorular;

  const Hikaye({
    required this.kod,
    required this.baslik,
    required this.seviye,
    required this.paragraflarEn,
    required this.paragraflarTr,
    required this.hedefKelimeler,
    required this.sorular,
  });
}

class HikayeOrnekVeri {
  static const Hikaye baslangic = Hikaye(
    kod: 'H-0001',
    baslik: 'A Normal Morning',
    seviye: 'A1',
    paragraflarEn: <String>[
      'Ali wakes up early. It is a quiet morning. '
          'He opens the window and looks outside.',
      'He drinks coffee and reads the newspaper. '
          'Then he begins his work.',
      'At noon he buys bread from a small shop. '
          'The bread is cheap and fresh.',
      'In the evening he remembers a important thing: '
          'tomorrow is his sister\u2019s birthday.',
    ],
    paragraflarTr: <String>[
      'Ali erken kalkar. Sessiz bir sabahtir. '
          'Pencereyi acar ve disariya bakar.',
      'Kahve icer ve gazete okur. Sonra isine baslar.',
      'Ogleyin kucuk bir dukkandan ekmek alir. '
          'Ekmek ucuz ve tazedir.',
      'Aksam onemli bir seyi hatirlar: '
          'yarin kiz kardesinin dogum gunu.',
    ],
    hedefKelimeler: <String, String>{
      'morning': 'sabah',
      'quiet': 'sessiz',
      'opens': 'acar',
      'drinks': 'icer',
      'reads': 'okur',
      'begins': 'baslar',
      'buys': 'satin alir',
      'cheap': 'ucuz',
      'remembers': 'hatirlar',
      'important': 'onemli',
    },
    sorular: <HikayeSorusu>[
      HikayeSorusu(
        soru: 'What does Ali drink in the morning?',
        secenekler: <String>['Tea', 'Coffee', 'Water'],
        dogruIndeks: 1,
      ),
      HikayeSorusu(
        soru: 'Where does he buy bread?',
        secenekler: <String>[
          'From a small shop',
          'From his sister',
          'He does not buy bread',
        ],
        dogruIndeks: 0,
      ),
      HikayeSorusu(
        soru: 'What does he remember in the evening?',
        secenekler: <String>[
          'His work',
          'The newspaper',
          "His sister's birthday",
        ],
        dogruIndeks: 2,
      ),
    ],
  );
}
