/// EN-A1-001 icin Ingilizce dusunme katmani — YALNIZCA VERI.
///
/// Bu dosyada hicbir is mantigi yoktur. Yeni bir konu eklemek icin
/// bunun gibi bir veri dosyasi yazmak yeterlidir; DusunmeMotoru ve
/// ders ekrani DEGISMEZ.
class DusunmeEnA1001 {
  static const konuKod = 'EN-A1-001';
  static const ad = 'Ingilizce dusunme sirasi';
  static const ozet =
      'Turkce cumleyi kelime kelime cevirme. Once ANLAM BLOKLARINA ayir, '
      'sonra Ingilizce siraya yerlestir.';

  /// Rol kodlarinin TURKCE cumledeki tipik sirasi.
  static const trSira = [
    'NE_ZAMAN', 'KIM', 'NEREDE', 'NEYI', 'NASIL', 'NE_YAPIYOR'
  ];

  /// Rol kodlarinin INGILIZCE cumledeki sirasi. Motorun dizim kurali budur.
  static const enSira = [
    'KIM', 'NE_YAPIYOR', 'NEYI', 'NASIL', 'NEREDE', 'NE_ZAMAN'
  ];

  /// [sira, rol_kodu, soru_tr, ipucu, zorunlu(1/0)]
  static const List<List<String>> sorular = [
    ['1', 'KIM', 'Kim?', 'Eylemi yapan kisi veya sey', '1'],
    ['2', 'NE_YAPIYOR', 'Ne yapiyor?',
     'Fiil. Ingilizcede ozneden HEMEN SONRA yazilir', '1'],
    ['3', 'NEYI', 'Neyi / kimi?', 'Eylemden etkilenen sey', '0'],
    ['4', 'NEREDE', 'Nerede?', 'Yer bildiren blok', '0'],
    ['5', 'NE_ZAMAN', 'Ne zaman?',
     'Zaman bildiren blok. Ingilizcede genellikle SONA gider', '0'],
    ['6', 'NASIL', 'Nasil?', 'Bicim bildiren blok', '0'],
  ];

  /// [kod, tip(dogru/yanlis), tr_cumle, en_cumle, aciklama]
  static const List<List<String>> ornekler = [
    ['O1', 'dogru', 'Ben her sabah evde kahve icerim.',
     'I drink coffee at home every morning.',
     'Once bloklara ayrildi, sonra Ingilizce siraya dizildi. '
     'Zaman bloku sona gitti.'],
    ['O2', 'dogru', 'O kitap okur.', 'She reads books.',
     'Uc blok yeterli: Kim? + Ne yapiyor? + Neyi?'],
    ['O3', 'dogru', 'Biz aksamlari futbol oynariz.',
     'We play football in the evening.',
     'Zaman bloku yine sona gitti; fiil ikinci sirada kaldi.'],
    ['Y1', 'yanlis', 'Ben her sabah evde kahve icerim.',
     'Every morning at home I coffee drink.',
     'Turkce sira aynen tasindi: zaman basa alindi, fiil sona atildi.'],
    ['Y2', 'yanlis', 'O kitap okur.', 'She books reads.',
     'Kelime kelime cevrildi; blok sirasi Turkce kaldi.'],
    ['Y3', 'yanlis', 'Biz aksamlari futbol oynariz.',
     'We in the evening football play.',
     'Zaman bloku ortada kaldi, fiil sona atildi. Iki hata birden.'],
  ];

  /// ornek_kod -> [sira, rol_kodu, blok_tr, blok_en]
  static const Map<String, List<List<String>>> bloklar = {
    'O1': [
      ['1', 'KIM', 'Ben', 'I'],
      ['2', 'NE_YAPIYOR', 'icerim', 'drink'],
      ['3', 'NEYI', 'kahve', 'coffee'],
      ['4', 'NEREDE', 'evde', 'at home'],
      ['5', 'NE_ZAMAN', 'her sabah', 'every morning'],
    ],
    'O2': [
      ['1', 'KIM', 'O', 'She'],
      ['2', 'NE_YAPIYOR', 'okur', 'reads'],
      ['3', 'NEYI', 'kitap', 'books'],
    ],
    'O3': [
      ['1', 'KIM', 'Biz', 'We'],
      ['2', 'NE_YAPIYOR', 'oynariz', 'play'],
      ['3', 'NEYI', 'futbol', 'football'],
      ['4', 'NE_ZAMAN', 'aksamlari', 'in the evening'],
    ],
    'Y1': [
      ['1', 'NE_ZAMAN', 'her sabah', 'every morning'],
      ['2', 'NEREDE', 'evde', 'at home'],
      ['3', 'KIM', 'Ben', 'I'],
      ['4', 'NEYI', 'kahve', 'coffee'],
      ['5', 'NE_YAPIYOR', 'icerim', 'drink'],
    ],
    'Y2': [
      ['1', 'KIM', 'O', 'She'],
      ['2', 'NEYI', 'kitap', 'books'],
      ['3', 'NE_YAPIYOR', 'okur', 'reads'],
    ],
    'Y3': [
      ['1', 'KIM', 'Biz', 'We'],
      ['2', 'NE_ZAMAN', 'aksamlari', 'in the evening'],
      ['3', 'NEYI', 'futbol', 'football'],
      ['4', 'NE_YAPIYOR', 'oynariz', 'play'],
    ],
  };

  /// [kod, baslik, aciklama, yanlis, dogru]
  static const List<List<String>> mudahaleler = [
    ['M1', 'Fiili sona atma',
     'Turkce cumlede fiil sondadir. Bu refleks Ingilizceye tasininca '
     'cumle anlasilmaz hale gelir. Fiili ozneden hemen sonra yazin.',
     'I coffee drink.', 'I drink coffee.'],
    ['M2', 'Zaman ifadesini basa alma',
     'Turkcede "her sabah" cumlenin basina gelir. Ingilizcede zaman '
     'bloku genellikle SONA gider.',
     'Every morning I coffee drink.', 'I drink coffee every morning.'],
    ['M3', 'Kelime kelime cevirme',
     'Her Turkce kelimeye bir Ingilizce kelime aramayin. Once cumleyi '
     'anlam bloklarina ayirin, sonra bloklari Ingilizce siraya dizin.',
     'Ben-I her-every sabah-morning kahve-coffee icerim-drink',
     '[Ben][icerim][kahve][her sabah] -> I drink coffee every morning.'],
    ['M4', 'Ozneyi dusurme',
     'Turkcede "Kahve icerim" demek yeterlidir; ozne fiilden anlasilir. '
     'Ingilizcede ozne blogu ATLANAMAZ.',
     'Drink coffee every morning.', 'I drink coffee every morning.'],
  ];
}
