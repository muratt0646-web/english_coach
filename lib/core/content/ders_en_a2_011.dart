/// EN-A2-011 — Sayilabilir / Sayilamaz Isimler ve some / any
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnA2011 {
  const DersEnA2011._();

  static const String kSayilabilir = 'Sayilabilir isimler';
  static const String kSayilamaz = 'Sayilamaz isimler';
  static const String kSome = 'some (olumlu)';
  static const String kAny = 'any (olumsuz ve soru)';
  static const String kOlcu = 'Olcu kaliplari';
  static const String kTeklif = 'Teklif ve ricada some';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A2-011',
    baslik: 'Sayilabilir / Sayilamaz · some / any',
    seviye: 'A2', konu: 'ISM', tahminiDk: 35,
    onKosullar: <String>['EN-A1-019', 'EN-A1-020'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'Turkce isimleri sayilabilir/sayilamaz diye AYIRMAZ. Her isim '
        'ayni davranir:\n\n'
        '  bir kitap · iki kitap · biraz kitap\n'
        '  bir su   · iki su    · biraz su\n\n'
        'Ingilizce ise her ismi bu soruya gore ayirir:\n\n'
        '  "Bunu SAYABILIR miyim?"\n\n'
        '  SAYILABILIR   -> a book · two books · many books\n'
        '  SAYILAMAZ     -> water · much water   (a water / waters YOK)\n\n'
        'Sayilamayanlar genellikle sivi, toz, madde veya soyut kavramlardir: '
        'water, bread, money, time, music, information.\n\n'
        'Bu ayrim bir sure sonra sezgisel hale gelir ama basta her yeni '
        'isimde sormak gerekir.\n\n'
        'Ikinci konu: some ve any. Turkcede "biraz / hic" ile karsilanir '
        'ama Ingilizcede secim CUMLE TURUNE baglidir.',
    kazanimlar: <String>[
      'Bir ismin sayilabilir olup olmadigini belirlemek',
      'Sayilamayan isimlerle a/an ve cogul kullanmamak',
      'some ve any arasindaki secimi yapmak',
      'Olcu kaliplarini kullanmak (a glass of water)',
      'Teklif ve ricada some kullanmak',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'W1', baslik: 'Tek soru: sayabilir miyim?',
        govde: 'Her isim icin sunu sorun: "Bir, iki, uc..." diye '
            'sayabilir miyim?\n\n'
            '  EVET -> sayilabilir\n'
            '     a book · two books · three cars · five people\n\n'
            '  HAYIR -> sayilamaz\n'
            '     water · bread · money · time · music\n\n'
            'Sayilamayanlarda:\n'
            '  · a/an KULLANILMAZ\n'
            '  · cogul YAPILMAZ\n'
            '  · fiil TEKIL gibi davranir\n\n'
            '  The water IS cold. (are DEGIL)',
        turkceKarsilastirma: 'iki su    ->  two glasses of water\n'
            'Turkce sayar   ->  Ingilizce kap kullanir'),
      AnlatimBlogu(kod: 'W2', baslik: 'Sik gecen sayilamayanlar',
        govde: 'Bunlar Turkce konusani sasirtir cunku Turkcede sayilabilir '
            'gibi kullanilir:\n\n'
            '  water · milk · tea · coffee · bread · rice · sugar\n'
            '  money · time · music · news · information · advice\n'
            '  work · homework · furniture · luggage\n\n'
            'DIKKAT: "news" sonunda -s var ama COGUL DEGILDIR:\n'
            '  The news IS good. (are DEGIL)\n\n'
            '  an advice -> YANLIS · a piece of advice -> DOGRU\n'
            '  informations -> YANLIS · information -> DOGRU',
        turkceKarsilastirma: 'bir tavsiye  ->  a piece of advice\n'
            'bilgiler     ->  information'),
      AnlatimBlogu(kod: 'W3', baslik: 'some: olumlu cumlede',
        govde: '"some" belirsiz bir miktar anlatir ve OLUMLU cumlelerde '
            'kullanilir:\n\n'
            '  I have some money.\n'
            '  There are some books on the table.\n'
            '  We need some water.\n\n'
            'Hem sayilabilir cogulla hem sayilamazla kullanilir:\n'
            '  some books (cogul) · some water (sayilamaz)\n\n'
            'Ama TEKIL sayilabilirle kullanilmaz:\n'
            '  some book -> YANLIS · a book -> DOGRU',
        turkceKarsilastirma: 'Biraz param var.  ->  I have some money.'),
      AnlatimBlogu(kod: 'W4', baslik: 'any: olumsuz ve soruda',
        govde: '"any" OLUMSUZ cumlelerde ve SORULARDA kullanilir:\n\n'
            '  I do not have any money.\n'
            '  There aren\u2019t any books here.\n'
            '  Do you have any questions?\n'
            '  Is there any water?\n\n'
            'DUSUNME KURALI:\n'
            '  Olumlu  -> some\n'
            '  Olumsuz -> any\n'
            '  Soru    -> any\n\n'
            'Not: "not any" yerine "no" da kullanilabilir:\n'
            '  I have no money. = I do not have any money.',
        turkceKarsilastirma: 'Hic param yok.  ->  I do not have any money.\n'
            'Sorun var mi?   ->  Do you have any questions?'),
      AnlatimBlogu(kod: 'W5', baslik: 'Sayilamayani nasil sayariz?',
        govde: 'Sayilamayan isimleri saymak icin bir KAP veya OLCU '
            'kullanilir:\n\n'
            '  a glass of water · two cups of coffee\n'
            '  a piece of bread · three slices of cake\n'
            '  a kilo of rice · a bottle of milk\n'
            '  a piece of advice · a piece of information\n\n'
            'Cogul yapilan KAPTIR, isim degil:\n'
            '  two glassES of water (waters DEGIL)\n\n'
            'Turkce de benzer yapar: "iki bardak su". Ama Turkcede '
            '"iki su" da denebilir; Ingilizcede denemez.',
        turkceKarsilastirma: 'iki bardak su  ->  two glasses of water\n'
            'bir dilim ekmek ->  a slice of bread'),
      AnlatimBlogu(kod: 'W6', baslik: 'Istisna: teklif ve ricada some',
        govde: 'Soruda genellikle "any" kullanilir ama TEKLIF ve RICA '
            'sorularinda "some" gelir:\n\n'
            '  Would you like some tea?     (teklif)\n'
            '  Can I have some water?       (rica)\n'
            '  Shall I get you some coffee? (teklif)\n\n'
            'Fark su: Bilgi soruyorsaniz "any", bir sey oneriyor veya '
            'istiyorsaniz "some".\n\n'
            '  Do you have any tea?    -> Cayin var mi? (bilgi)\n'
            '  Would you like some tea? -> Cay ister misin? (teklif)\n\n'
            'DUSUNME NOTU: "some" olumlu bir beklenti tasir; bu yuzden '
            'teklif ve ricada daha kibar durur.',
        turkceKarsilastirma: 'Cay ister misin?  ->  Would you like some tea?'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['book', 'a book', 'two books'],
        turkce: 'Sayilabilir.', not: 'a/an ve cogul olur.'),
      AdimliOrnek(adimlar: <String>['water', 'water', 'a glass of water'],
        turkce: 'Sayilamaz.', not: 'a water YOK; kap kullanilir.'),
      AdimliOrnek(adimlar: <String>['I have', 'I have some', 'I have some money.'],
        turkce: 'Biraz param var.', not: 'Olumlu -> some.'),
      AdimliOrnek(adimlar: <String>['I do not have', 'I do not have any', 'I do not have any money.'],
        turkce: 'Hic param yok.', not: 'Olumsuz -> any.'),
      AdimliOrnek(adimlar: <String>['Would you like', 'Would you like some', 'Would you like some tea?'],
        turkce: 'Cay ister misin?', not: 'Teklif -> some.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Iki su alabilir miyim?', 'water sayilamaz', 'kap kullan: glasses',
        'Can I have two glasses of water?'],
        turkce: 'Sayilamayani kapla say.', not: 'two waters YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Hic sorunuz var mi?', 'Soru cumlesi -> any', 'Do you have any',
        'Do you have any questions?'],
        turkce: 'Soru -> any.', not: 'some questions burada zayif kalir.'),
      AdimliOrnek(adimlar: <String>[
        'Sana bir tavsiye vereyim.', 'advice sayilamaz',
        'a piece of advice', 'Let me give you a piece of advice.'],
        turkce: 'Soyut isimler de sayilamaz.', not: 'an advice YANLIS.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I have two books.', turkce: 'Iki kitabim var.', dogruMu: true, altKonu: kSayilabilir),
      OrnekCumle(ingilizce: 'There are five cars outside.', turkce: 'Disarida bes araba var.', dogruMu: true, altKonu: kSayilabilir),
      OrnekCumle(ingilizce: 'She has a new phone.', turkce: 'Yeni bir telefonu var.', dogruMu: true, altKonu: kSayilabilir),
      OrnekCumle(ingilizce: 'Many people live here.', turkce: 'Burada cok insan yasar.', dogruMu: true, altKonu: kSayilabilir),
      OrnekCumle(ingilizce: 'I drink water every day.', turkce: 'Her gun su icerim.', dogruMu: true, altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'We need bread.', turkce: 'Ekmege ihtiyacimiz var.', dogruMu: true, altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'The water is cold.', turkce: 'Su soguk.', dogruMu: true, altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'The news is good.', turkce: 'Haber iyi.', dogruMu: true, altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'I need more information.', turkce: 'Daha fazla bilgiye ihtiyacim var.', dogruMu: true, altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'She listens to music.', turkce: 'Muzik dinler.', dogruMu: true, altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'We do not have much time.', turkce: 'Fazla zamanimiz yok.', dogruMu: true, altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'I have some money.', turkce: 'Biraz param var.', dogruMu: true, altKonu: kSome),
      OrnekCumle(ingilizce: 'There are some books on the table.', turkce: 'Masada birkac kitap var.', dogruMu: true, altKonu: kSome),
      OrnekCumle(ingilizce: 'We need some water.', turkce: 'Biraz suya ihtiyacimiz var.', dogruMu: true, altKonu: kSome),
      OrnekCumle(ingilizce: 'She bought some apples.', turkce: 'Biraz elma aldi.', dogruMu: true, altKonu: kSome),
      OrnekCumle(ingilizce: 'There is some bread in the kitchen.', turkce: 'Mutfakta biraz ekmek var.', dogruMu: true, altKonu: kSome),
      OrnekCumle(ingilizce: 'I do not have any money.', turkce: 'Hic param yok.', dogruMu: true, altKonu: kAny),
      OrnekCumle(ingilizce: "There aren't any books here.", turkce: 'Burada hic kitap yok.', dogruMu: true, altKonu: kAny),
      OrnekCumle(ingilizce: 'Do you have any questions?', turkce: 'Hic sorunuz var mi?', dogruMu: true, altKonu: kAny),
      OrnekCumle(ingilizce: 'Is there any water?', turkce: 'Hic su var mi?', dogruMu: true, altKonu: kAny),
      OrnekCumle(ingilizce: "We didn't buy any bread.", turkce: 'Hic ekmek almadik.', dogruMu: true, altKonu: kAny),
      OrnekCumle(ingilizce: 'I have no money.', turkce: 'Hic param yok.', dogruMu: true, altKonu: kAny),
      OrnekCumle(ingilizce: 'Can I have a glass of water?', turkce: 'Bir bardak su alabilir miyim?', dogruMu: true, altKonu: kOlcu),
      OrnekCumle(ingilizce: 'She drank two cups of coffee.', turkce: 'Iki fincan kahve icti.', dogruMu: true, altKonu: kOlcu),
      OrnekCumle(ingilizce: 'I ate a piece of bread.', turkce: 'Bir dilim ekmek yedim.', dogruMu: true, altKonu: kOlcu),
      OrnekCumle(ingilizce: 'We bought a kilo of rice.', turkce: 'Bir kilo pirinc aldik.', dogruMu: true, altKonu: kOlcu),
      OrnekCumle(ingilizce: 'Let me give you a piece of advice.', turkce: 'Sana bir tavsiye vereyim.', dogruMu: true, altKonu: kOlcu),
      OrnekCumle(ingilizce: 'Would you like some tea?', turkce: 'Cay ister misin?', dogruMu: true, altKonu: kTeklif),
      OrnekCumle(ingilizce: 'Can I have some water, please?', turkce: 'Biraz su alabilir miyim?', dogruMu: true, altKonu: kTeklif),
      OrnekCumle(ingilizce: 'Shall I get you some coffee?', turkce: 'Sana kahve getireyim mi?', dogruMu: true, altKonu: kTeklif),

      OrnekCumle(ingilizce: 'I drink a water every day.', turkce: 'Her gun su icerim.', dogruMu: false,
        neden: '"water" sayilamaz; a/an almaz.', dogruBicim: 'I drink water every day.',
        hataTuru: 'GRAMER_HATASI', altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'Can I have two waters?', turkce: 'Iki su alabilir miyim?', dogruMu: false,
        neden: 'Sayilamayan isim cogul yapilmaz; kap kullanilir.',
        dogruBicim: 'Can I have two glasses of water?', hataTuru: 'GRAMER_HATASI', altKonu: kOlcu),
      OrnekCumle(ingilizce: 'We need a bread.', turkce: 'Ekmege ihtiyacimiz var.', dogruMu: false,
        neden: '"bread" sayilamaz.', dogruBicim: 'We need bread.',
        hataTuru: 'GRAMER_HATASI', altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'The water are cold.', turkce: 'Su soguk.', dogruMu: false,
        neden: 'Sayilamayan isim TEKIL gibi davranir.', dogruBicim: 'The water is cold.',
        hataTuru: 'GRAMER_HATASI', altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'The news are good.', turkce: 'Haber iyi.', dogruMu: false,
        neden: '"news" sonunda -s var ama COGUL DEGILDIR.',
        dogruBicim: 'The news is good.', hataTuru: 'GRAMER_HATASI', altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'I need more informations.', turkce: 'Daha fazla bilgi lazim.', dogruMu: false,
        neden: '"information" sayilamaz; cogul yapilmaz.',
        dogruBicim: 'I need more information.', hataTuru: 'GRAMER_HATASI', altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'Let me give you an advice.', turkce: 'Sana bir tavsiye vereyim.', dogruMu: false,
        neden: '"advice" sayilamaz; "a piece of advice" denir.',
        dogruBicim: 'Let me give you a piece of advice.', hataTuru: 'GRAMER_HATASI', altKonu: kOlcu),
      OrnekCumle(ingilizce: 'I have many money.', turkce: 'Cok param var.', dogruMu: false,
        neden: '"many" sayilabilir cogulla kullanilir; "money" icin "much" '
            'gerekir.', dogruBicim: 'I have much money.',
        hataTuru: 'KELIME_SECIMI', altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'I do not have some money.', turkce: 'Hic param yok.', dogruMu: false,
        neden: 'Olumsuz cumlede "any" kullanilir.',
        dogruBicim: 'I do not have any money.', hataTuru: 'KELIME_SECIMI', altKonu: kAny),
      OrnekCumle(ingilizce: 'Do you have some questions?', turkce: 'Hic sorunuz var mi?', dogruMu: false,
        neden: 'Bilgi sorulan soruda "any" kullanilir.',
        dogruBicim: 'Do you have any questions?', hataTuru: 'KELIME_SECIMI', altKonu: kAny),
      OrnekCumle(ingilizce: "There aren't some books here.", turkce: 'Burada hic kitap yok.', dogruMu: false,
        neden: 'Olumsuzda "any".', dogruBicim: "There aren't any books here.",
        hataTuru: 'KELIME_SECIMI', altKonu: kAny),
      OrnekCumle(ingilizce: 'I have any money.', turkce: 'Biraz param var.', dogruMu: false,
        neden: 'Olumlu cumlede "some" kullanilir.', dogruBicim: 'I have some money.',
        hataTuru: 'KELIME_SECIMI', altKonu: kSome),
      OrnekCumle(ingilizce: 'There are any books on the table.', turkce: 'Masada birkac kitap var.', dogruMu: false,
        neden: 'Olumlu cumle -> some.', dogruBicim: 'There are some books on the table.',
        hataTuru: 'KELIME_SECIMI', altKonu: kSome),
      OrnekCumle(ingilizce: 'I have some book.', turkce: 'Birkac kitabim var.', dogruMu: false,
        neden: '"some" tekil sayilabilirle kullanilmaz; cogul gerekir.',
        dogruBicim: 'I have some books.', hataTuru: 'GRAMER_HATASI', altKonu: kSome),
      OrnekCumle(ingilizce: 'I do not have no money.', turkce: 'Hic param yok.', dogruMu: false,
        neden: 'Iki olumsuzluk birden olmaz: ya "not any" ya "no".',
        dogruBicim: 'I have no money.', hataTuru: 'FAZLA_KELIME', altKonu: kAny),
      OrnekCumle(ingilizce: 'She drank two cup of coffee.', turkce: 'Iki fincan kahve icti.', dogruMu: false,
        neden: 'Cogul yapilan KAPTIR: cups.', dogruBicim: 'She drank two cups of coffee.',
        hataTuru: 'GRAMER_HATASI', altKonu: kOlcu),
      OrnekCumle(ingilizce: 'I ate a piece bread.', turkce: 'Bir dilim ekmek yedim.', dogruMu: false,
        neden: '"of" eksik: a piece OF bread.', dogruBicim: 'I ate a piece of bread.',
        hataTuru: 'EKSIK_KELIME', altKonu: kOlcu),
      OrnekCumle(ingilizce: 'Would you like any tea?', turkce: 'Cay ister misin?', dogruMu: false,
        neden: 'Teklif sorusunda "some" kullanilir; daha kibardir.',
        dogruBicim: 'Would you like some tea?', hataTuru: 'KELIME_SECIMI', altKonu: kTeklif),
      OrnekCumle(ingilizce: 'Can I have any water, please?', turkce: 'Biraz su alabilir miyim?', dogruMu: false,
        neden: 'Ricada "some" kullanilir.', dogruBicim: 'Can I have some water, please?',
        hataTuru: 'KELIME_SECIMI', altKonu: kTeklif),
      OrnekCumle(ingilizce: 'She has many furnitures.', turkce: 'Cok mobilyasi var.', dogruMu: false,
        neden: '"furniture" sayilamaz; cogul yapilmaz.',
        dogruBicim: 'She has a lot of furniture.', hataTuru: 'GRAMER_HATASI', altKonu: kSayilamaz),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kSayilamaz,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I drink a water.', 'I drink water.', 'I drink waters.'],
        kabuller: <String>['I drink water.'], geriDonusKodu: 'W1'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kSome,
        soru: 'I have ___ money. (olumlu)',
        secenekler: <String>['any', 'some', 'a'], kabuller: <String>['some'],
        geriDonusKodu: 'W3'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kAny,
        soru: 'Do you have ___ questions?',
        secenekler: <String>['some', 'any', 'a'], kabuller: <String>['any'],
        geriDonusKodu: 'W4'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kOlcu,
        soru: '"Iki su" nasil soylenir?',
        secenekler: <String>['two waters', 'two glasses of water', 'two water'],
        kabuller: <String>['two glasses of water'], geriDonusKodu: 'W5'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kTeklif,
        soru: 'Would you like ___ tea? (teklif)',
        secenekler: <String>['any', 'some', 'a'], kabuller: <String>['some'],
        geriDonusKodu: 'W6'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kSome,
        soru: 'There are ___ books on the table.', kabuller: <String>['some']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kAny,
        soru: 'I do not have ___ money.', kabuller: <String>['any']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kAny,
        soru: 'Is there ___ water?', kabuller: <String>['any']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kSayilamaz,
        soru: 'The news ___ good.', kabuller: <String>['is']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kOlcu,
        soru: 'She drank two ___ of coffee. (cup)', kabuller: <String>['cups']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kSayilamaz,
        soru: 'Hangisi SAYILAMAZ?',
        secenekler: <String>['book', 'car', 'information'],
        kabuller: <String>['information']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kOlcu,
        soru: '"bir tavsiye" nasil soylenir?',
        secenekler: <String>['an advice', 'a piece of advice', 'one advice'],
        kabuller: <String>['a piece of advice']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kSome,
        soru: 'Dizin: money / some / I / have',
        kabuller: <String>['I have some money.', 'I have some money']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kAny,
        soru: 'Dizin: questions / you / any / Do / have',
        kabuller: <String>['Do you have any questions?', 'Do you have any questions']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kSayilamaz,
        soru: '"I need more informations." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kSome, turkce: 'Biraz param var.',
        kabuller: <String>['I have some money.']),
      SerbestGorev(kod: 'SU-2', altKonu: kAny, turkce: 'Hic sorunuz var mi?',
        kabuller: <String>['Do you have any questions?']),
      SerbestGorev(kod: 'SU-3', altKonu: kOlcu, turkce: 'Bir bardak su alabilir miyim?',
        kabuller: <String>['Can I have a glass of water?']),
      SerbestGorev(kod: 'SU-4', altKonu: kTeklif, turkce: 'Cay ister misin?',
        kabuller: <String>['Would you like some tea?']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kSome,
        soru: 'She bought ___ apples.', kabuller: <String>['some']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kAny,
        soru: "We didn't buy ___ bread.", kabuller: <String>['any']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kSayilamaz,
        soru: 'The water ___ cold.', kabuller: <String>['is']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.boslukDoldurma, altKonu: kOlcu,
        soru: 'I ate a piece ___ bread.', kabuller: <String>['of']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.coktanSecmeli, altKonu: kTeklif,
        soru: 'Can I have ___ water, please?',
        secenekler: <String>['any', 'some', 'a'], kabuller: <String>['some']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kSayilamaz,
        soru: '"The news are good." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kOlcu,
        soru: 'Dizin: water / of / glass / a / Can I have',
        kabuller: <String>['Can I have a glass of water?',
            'Can I have a glass of water']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kSome,
        soru: 'We need ___ water.', kabuller: <String>['some']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kSayilamaz,
        soru: 'Hangisi dogru?',
        secenekler: <String>['We need a bread.', 'We need bread.', 'We need breads.'],
        kabuller: <String>['We need bread.']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kSome,
        soru: 'There are ___ books on the table.',
        secenekler: <String>['any', 'some', 'a'], kabuller: <String>['some']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kAny,
        soru: "There aren't ___ books here.",
        secenekler: <String>['some', 'any', 'a'], kabuller: <String>['any']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kOlcu,
        soru: 'She drank two ___ of coffee.',
        secenekler: <String>['cup', 'cups', 'coffees'], kabuller: <String>['cups']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kTeklif,
        soru: 'Would you like ___ tea?',
        secenekler: <String>['any', 'some', 'a'], kabuller: <String>['some']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kAny,
        soru: 'Is there ___ water?', kabuller: <String>['any']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kSayilamaz,
        soru: 'The news ___ good.', kabuller: <String>['is']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kOlcu,
        soru: 'Let me give you a piece ___ advice.', kabuller: <String>['of']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kSayilamaz,
        soru: '"Can I have two waters?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kAny,
        soru: '"I do not have some money." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kSayilamaz,
        soru: '"Let me give you an advice." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kAny,
        soru: 'Dizin: money / any / I / have / not / do',
        kabuller: <String>['I do not have any money.', 'I do not have any money']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kSome,
        soru: 'Ingilizceye cevirin: Biraz suya ihtiyacimiz var.',
        kabuller: <String>['We need some water.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kOlcu,
        soru: 'Ingilizceye cevirin: Bir bardak su alabilir miyim?',
        kabuller: <String>['Can I have a glass of water?']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kAny,
        soru: 'Ingilizceye cevirin: Hic param yok.',
        kabuller: <String>['I do not have any money.', 'I have no money.',
            "I don't have any money."]),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Tek soru: sayabilir miyim?',
        aciklama: 'Evet -> a/an ve cogul olur · Hayir -> ikisi de olmaz.',
        ornek: 'two books · water (a water / waters DEGIL)'),
      OzetMaddesi(baslik: 'Sik gecen sayilamayanlar',
        aciklama: 'water, bread, money, time, music, news, information, advice.',
        ornek: 'The news IS good. (are DEGIL)'),
      OzetMaddesi(baslik: 'some / any secimi',
        aciklama: 'Olumlu -> some · Olumsuz ve soru -> any.',
        ornek: 'I have some money. · Do you have any money?'),
      OzetMaddesi(baslik: 'Sayilamayani kapla sayin',
        aciklama: 'Cogul yapilan KAPTIR, isim degil.',
        ornek: 'two glasses of water · a piece of bread'),
      OzetMaddesi(baslik: 'Istisna: teklif ve rica',
        aciklama: 'Bilgi soruyorsaniz any, bir sey oneriyorsaniz some.',
        ornek: 'Would you like some tea?'),
      OzetMaddesi(baslik: 'Iki olumsuzluk olmaz',
        aciklama: 'Ya "not any" ya "no" kullanilir.',
        ornek: 'I have no money. = I do not have any money.'),
    ],
  );
}
