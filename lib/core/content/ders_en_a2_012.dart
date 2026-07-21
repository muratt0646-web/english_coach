/// EN-A2-012 — much / many / a lot of · few / little
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnA2012 {
  const DersEnA2012._();

  static const String kMany = 'many (sayilabilir)';
  static const String kMuch = 'much (sayilamaz)';
  static const String kALotOf = 'a lot of (ikisi de)';
  static const String kHowMany = 'How much / How many';
  static const String kFewLittle = 'few / little (az)';
  static const String kTooMuch = 'too much / too many';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A2-012',
    baslik: 'much / many / a lot of · few / little',
    seviye: 'A2', konu: 'ISM', tahminiDk: 35,
    onKosullar: <String>['EN-A2-011'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'Turkcede miktar tek kelimeyle anlatilir: "cok".\n\n'
        '  cok kitap · cok su · cok zaman · cok insan\n'
        '  Ismin turu hic onemli degil.\n\n'
        'Ingilizce ise gecen derste ogrendiginiz ayrimi burada KULLANIR:\n\n'
        '  SAYILABILIR -> many books · many people\n'
        '  SAYILAMAZ   -> much water · much time\n\n'
        'Yani "sayabilir miyim?" sorusu sadece a/an icin degil, MIKTAR '
        'kelimeleri icin de gecerlidir. Gecen ders bu dersin altyapisidir.\n\n'
        'Bir kolaylik var: "a lot of" HER IKISIYLE de kullanilir.\n\n'
        '  a lot of books · a lot of water\n\n'
        'Emin degilseniz "a lot of" guvenli secimdir. Ama much/many\u2019yi '
        'de tanimaniz gerekir cunku olumsuz ve sorularda cok gecerler.',
    kazanimlar: <String>[
      'Sayilabilirlige gore much veya many secebilmek',
      '"a lot of" yapisini her iki turde kullanmak',
      'How much / How many sorularini kurmak',
      'few ve little ile azligi anlatmak',
      'too much / too many ile fazlaligi anlatmak',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'X1', baslik: 'Ayni soru, yeni kelimeler',
        govde: 'Gecen dersteki soruyu tekrar sorun: "Sayabilir miyim?"\n\n'
            '  EVET -> MANY\n'
            '     many books · many people · many cars · many questions\n\n'
            '  HAYIR -> MUCH\n'
            '     much water · much time · much money · much information\n\n'
            'Turkcede ikisi de "cok"tur; Ingilizcede secim ZORUNLUDUR.\n\n'
            '  many water -> YANLIS\n'
            '  much books -> YANLIS\n\n'
            'DUSUNME ALISKANLIGI: Miktar kelimesi yazmadan once ismin '
            'turunu belirleyin.',
        turkceKarsilastirma: 'cok kitap  ->  many books\n'
            'cok su     ->  much water'),
      AnlatimBlogu(kod: 'X2', baslik: 'a lot of: guvenli secim',
        govde: '"a lot of" ve "lots of" HER IKI turle de calisir:\n\n'
            '  a lot of books  (sayilabilir)\n'
            '  a lot of water  (sayilamaz)\n\n'
            'Bu yuzden gunluk konusmada en cok kullanilan bicimdir.\n\n'
            'KULLANIM FARKI:\n'
            '  Olumlu cumlede -> genellikle "a lot of"\n'
            '     I have a lot of books.\n'
            '  Olumsuz ve soruda -> genellikle much/many\n'
            '     I do not have many books.\n'
            '     Do you have much time?\n\n'
            'Bu bir kural degil, kullanim egilimidir. Hepsi dilbilgisel '
            'olarak dogrudur.',
        turkceKarsilastirma: 'Cok kitabim var.  ->  I have a lot of books.'),
      AnlatimBlogu(kod: 'X3', baslik: 'How much / How many',
        govde: 'Miktar sorarken de ayni ayrim gecerlidir:\n\n'
            '  HOW MANY + cogul isim\n'
            '     How many books do you have?\n'
            '     How many people are there?\n\n'
            '  HOW MUCH + sayilamaz isim\n'
            '     How much water do you need?\n'
            '     How much time do we have?\n\n'
            'AYRICA: "How much" fiyat sormakta da kullanilir:\n'
            '     How much is it?  (Ne kadar?)\n\n'
            'Turkcede ikisi de "kac / ne kadar" ile karsilanir.',
        turkceKarsilastirma: 'Kac kitabin var?  ->  How many books...\n'
            'Ne kadar zaman?   ->  How much time...'),
      AnlatimBlogu(kod: 'X4', baslik: 'few / little: AZ',
        govde: 'Azligi anlatirken de ayni ayrim vardir:\n\n'
            '  SAYILABILIR -> few\n'
            '     few books · few people\n\n'
            '  SAYILAMAZ   -> little\n'
            '     little water · little time\n\n'
            'DIKKAT: "a" varsa anlam DEGISIR:\n\n'
            '  few friends     -> az arkadas (olumsuz: neredeyse yok)\n'
            '  A few friends   -> birkac arkadas (olumlu: var)\n\n'
            '  little time     -> az zaman (yetersiz)\n'
            '  A little time   -> biraz zaman (var)\n\n'
            'Yani "a" eklemek olumsuz tondan olumluya gecirir.',
        turkceKarsilastirma: 'Birkac arkadasim var.  ->  I have a few friends.\n'
            'Az arkadasim var.      ->  I have few friends.'),
      AnlatimBlogu(kod: 'X5', baslik: 'too much / too many: FAZLA',
        govde: '"too" eklenince "gereginden fazla" anlami gelir '
            '(A1-022\u2019deki too kurali):\n\n'
            '  too many people  -> fazla insan (kalabalik)\n'
            '  too much sugar   -> fazla seker\n\n'
            'Fark:\n'
            '  a lot of sugar  -> cok seker (notr, iyi de olabilir)\n'
            '  too much sugar  -> fazla seker (OLUMSUZ)\n\n'
            'Ayrica "too much" tek basina da kullanilir:\n'
            '  You work too much.  (Fazla calisiyorsun.)',
        turkceKarsilastirma: 'Fazla seker.  ->  too much sugar\n'
            'Cok seker.    ->  a lot of sugar'),
      AnlatimBlogu(kod: 'X6', baslik: 'Ozet karar tablosu',
        govde: 'Miktar kelimesini secerken iki soru sorun:\n\n'
            '  1. Isim sayilabilir mi?\n'
            '  2. Cumle olumlu mu, olumsuz/soru mu?\n\n'
            '                SAYILABILIR      SAYILAMAZ\n'
            '  Cok           many / a lot of  much / a lot of\n'
            '  Az            few              little\n'
            '  Biraz         a few            a little\n'
            '  Fazla         too many         too much\n'
            '  Ne kadar      how many         how much\n\n'
            'Sol sutun cogul isim, sag sutun tekil isim ister:\n'
            '  many bookS · much waterR\u0130 degil much water',
        turkceKarsilastirma: 'Turkce tek kelime kullanir: cok / az / biraz.\n'
            'Ingilizce ikiye ayirir.'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['books', 'many books', 'I have many books.'],
        turkce: 'Cok kitabim var.', not: 'Sayilabilir -> many.'),
      AdimliOrnek(adimlar: <String>['water', 'much water', 'We do not have much water.'],
        turkce: 'Fazla suyumuz yok.', not: 'Sayilamaz -> much.'),
      AdimliOrnek(adimlar: <String>['a lot of books', 'a lot of water'],
        turkce: 'Ikisi de dogru.', not: 'a lot of guvenli secim.'),
      AdimliOrnek(adimlar: <String>['few friends', 'a few friends'],
        turkce: 'az / birkac', not: '"a" tonu degistirir.'),
      AdimliOrnek(adimlar: <String>['sugar', 'too much sugar', 'This has too much sugar.'],
        turkce: 'Fazla seker var.', not: 'too -> olumsuz ton.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Cok zamanim yok.', 'time sayilamaz -> much',
        'olumsuz cumle', 'I do not have much time.'],
        turkce: 'Once ismin turu.', not: 'many time YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Kac kitabin var?', 'books sayilabilir -> how many',
        'How many books', 'How many books do you have?'],
        turkce: 'Soru da ayni ayrimi izler.', not: 'How much books YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Birkac arkadasim var.', 'friends sayilabilir -> few',
        '"a" ekle -> olumlu ton', 'I have a few friends.'],
        turkce: '"a" olumlu ton verir.', not: 'few friends = neredeyse yok.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I have many books.', turkce: 'Cok kitabim var.', dogruMu: true, altKonu: kMany),
      OrnekCumle(ingilizce: 'Many people live here.', turkce: 'Burada cok insan yasar.', dogruMu: true, altKonu: kMany),
      OrnekCumle(ingilizce: 'She does not have many friends.', turkce: 'Cok arkadasi yok.', dogruMu: true, altKonu: kMany),
      OrnekCumle(ingilizce: 'Do you have many questions?', turkce: 'Cok sorun var mi?', dogruMu: true, altKonu: kMany),
      OrnekCumle(ingilizce: 'There are many cars outside.', turkce: 'Disarida cok araba var.', dogruMu: true, altKonu: kMany),
      OrnekCumle(ingilizce: 'We do not have much time.', turkce: 'Fazla zamanimiz yok.', dogruMu: true, altKonu: kMuch),
      OrnekCumle(ingilizce: 'There is not much water.', turkce: 'Fazla su yok.', dogruMu: true, altKonu: kMuch),
      OrnekCumle(ingilizce: 'Do you need much money?', turkce: 'Cok paraya ihtiyacin var mi?', dogruMu: true, altKonu: kMuch),
      OrnekCumle(ingilizce: 'He does not eat much bread.', turkce: 'Fazla ekmek yemez.', dogruMu: true, altKonu: kMuch),
      OrnekCumle(ingilizce: 'She has much experience.', turkce: 'Cok deneyimi var.', dogruMu: true, altKonu: kMuch),
      OrnekCumle(ingilizce: 'I have a lot of books.', turkce: 'Cok kitabim var.', dogruMu: true, altKonu: kALotOf),
      OrnekCumle(ingilizce: 'We drink a lot of water.', turkce: 'Cok su iceriz.', dogruMu: true, altKonu: kALotOf),
      OrnekCumle(ingilizce: 'There are lots of people here.', turkce: 'Burada cok insan var.', dogruMu: true, altKonu: kALotOf),
      OrnekCumle(ingilizce: 'She spends a lot of money.', turkce: 'Cok para harcar.', dogruMu: true, altKonu: kALotOf),
      OrnekCumle(ingilizce: 'They have a lot of furniture.', turkce: 'Cok mobilyalari var.', dogruMu: true, altKonu: kALotOf),
      OrnekCumle(ingilizce: 'How many books do you have?', turkce: 'Kac kitabin var?', dogruMu: true, altKonu: kHowMany),
      OrnekCumle(ingilizce: 'How much water do you need?', turkce: 'Ne kadar suya ihtiyacin var?', dogruMu: true, altKonu: kHowMany),
      OrnekCumle(ingilizce: 'How many people are there?', turkce: 'Kac kisi var?', dogruMu: true, altKonu: kHowMany),
      OrnekCumle(ingilizce: 'How much time do we have?', turkce: 'Ne kadar zamanimiz var?', dogruMu: true, altKonu: kHowMany),
      OrnekCumle(ingilizce: 'How much is it?', turkce: 'Ne kadar? (fiyat)', dogruMu: true, altKonu: kHowMany),
      OrnekCumle(ingilizce: 'I have a few friends here.', turkce: 'Burada birkac arkadasim var.', dogruMu: true, altKonu: kFewLittle),
      OrnekCumle(ingilizce: 'She has few friends.', turkce: 'Az arkadasi var.', dogruMu: true, altKonu: kFewLittle),
      OrnekCumle(ingilizce: 'We have a little time.', turkce: 'Biraz zamanimiz var.', dogruMu: true, altKonu: kFewLittle),
      OrnekCumle(ingilizce: 'There is little water in the bottle.', turkce: 'Sisede az su var.', dogruMu: true, altKonu: kFewLittle),
      OrnekCumle(ingilizce: 'Give me a little sugar, please.', turkce: 'Biraz seker ver lutfen.', dogruMu: true, altKonu: kFewLittle),
      OrnekCumle(ingilizce: 'There are too many people here.', turkce: 'Burada fazla insan var.', dogruMu: true, altKonu: kTooMuch),
      OrnekCumle(ingilizce: 'This tea has too much sugar.', turkce: 'Bu cayda fazla seker var.', dogruMu: true, altKonu: kTooMuch),
      OrnekCumle(ingilizce: 'You work too much.', turkce: 'Fazla calisiyorsun.', dogruMu: true, altKonu: kTooMuch),
      OrnekCumle(ingilizce: 'I made too many mistakes.', turkce: 'Fazla hata yaptim.', dogruMu: true, altKonu: kTooMuch),
      OrnekCumle(ingilizce: 'There is too much noise.', turkce: 'Fazla gurultu var.', dogruMu: true, altKonu: kTooMuch),

      OrnekCumle(ingilizce: 'I have much books.', turkce: 'Cok kitabim var.', dogruMu: false,
        neden: '"books" sayilabilir; "many" gerekir.', dogruBicim: 'I have many books.',
        hataTuru: 'KELIME_SECIMI', altKonu: kMany),
      OrnekCumle(ingilizce: 'Much people live here.', turkce: 'Burada cok insan yasar.', dogruMu: false,
        neden: '"people" sayilabilir cogul; "many" gerekir.',
        dogruBicim: 'Many people live here.', hataTuru: 'KELIME_SECIMI', altKonu: kMany),
      OrnekCumle(ingilizce: 'We do not have many time.', turkce: 'Fazla zamanimiz yok.', dogruMu: false,
        neden: '"time" sayilamaz; "much" gerekir.',
        dogruBicim: 'We do not have much time.', hataTuru: 'KELIME_SECIMI', altKonu: kMuch),
      OrnekCumle(ingilizce: 'There is not many water.', turkce: 'Fazla su yok.', dogruMu: false,
        neden: '"water" sayilamaz -> much.', dogruBicim: 'There is not much water.',
        hataTuru: 'KELIME_SECIMI', altKonu: kMuch),
      OrnekCumle(ingilizce: 'Do you need many money?', turkce: 'Cok paraya ihtiyacin var mi?', dogruMu: false,
        neden: '"money" sayilamaz -> much.', dogruBicim: 'Do you need much money?',
        hataTuru: 'KELIME_SECIMI', altKonu: kMuch),
      OrnekCumle(ingilizce: 'I have many book.', turkce: 'Cok kitabim var.', dogruMu: false,
        neden: '"many" cogul isim ister: books.', dogruBicim: 'I have many books.',
        hataTuru: 'GRAMER_HATASI', altKonu: kMany),
      OrnekCumle(ingilizce: 'I have a lot of book.', turkce: 'Cok kitabim var.', dogruMu: false,
        neden: 'Sayilabilir isim cogul olur.', dogruBicim: 'I have a lot of books.',
        hataTuru: 'GRAMER_HATASI', altKonu: kALotOf),
      OrnekCumle(ingilizce: 'We drink a lot of waters.', turkce: 'Cok su iceriz.', dogruMu: false,
        neden: '"water" sayilamaz; cogul yapilmaz.', dogruBicim: 'We drink a lot of water.',
        hataTuru: 'GRAMER_HATASI', altKonu: kALotOf),
      OrnekCumle(ingilizce: 'I have a lot books.', turkce: 'Cok kitabim var.', dogruMu: false,
        neden: '"of" eksik: a lot OF books.', dogruBicim: 'I have a lot of books.',
        hataTuru: 'EKSIK_KELIME', altKonu: kALotOf),
      OrnekCumle(ingilizce: 'How much books do you have?', turkce: 'Kac kitabin var?', dogruMu: false,
        neden: 'Sayilabilir -> How many.', dogruBicim: 'How many books do you have?',
        hataTuru: 'KELIME_SECIMI', altKonu: kHowMany),
      OrnekCumle(ingilizce: 'How many water do you need?', turkce: 'Ne kadar su lazim?', dogruMu: false,
        neden: 'Sayilamaz -> How much.', dogruBicim: 'How much water do you need?',
        hataTuru: 'KELIME_SECIMI', altKonu: kHowMany),
      OrnekCumle(ingilizce: 'How many time do we have?', turkce: 'Ne kadar zamanimiz var?', dogruMu: false,
        neden: '"time" sayilamaz -> How much.', dogruBicim: 'How much time do we have?',
        hataTuru: 'KELIME_SECIMI', altKonu: kHowMany),
      OrnekCumle(ingilizce: 'How many books do you have? (tekil: book)', turkce: 'Kac kitabin var?', dogruMu: false,
        neden: '"How many" cogul isim ister; tekil kullanilmaz.',
        dogruBicim: 'How many books do you have?', hataTuru: 'GRAMER_HATASI', altKonu: kHowMany),
      OrnekCumle(ingilizce: 'I have a few water.', turkce: 'Biraz suyum var.', dogruMu: false,
        neden: '"water" sayilamaz; "a little" gerekir.',
        dogruBicim: 'I have a little water.', hataTuru: 'KELIME_SECIMI', altKonu: kFewLittle),
      OrnekCumle(ingilizce: 'We have a little friends.', turkce: 'Birkac arkadasimiz var.', dogruMu: false,
        neden: '"friends" sayilabilir; "a few" gerekir.',
        dogruBicim: 'We have a few friends.', hataTuru: 'KELIME_SECIMI', altKonu: kFewLittle),
      OrnekCumle(ingilizce: 'There is few water in the bottle.', turkce: 'Sisede az su var.', dogruMu: false,
        neden: 'Sayilamaz isimle "little" kullanilir.',
        dogruBicim: 'There is little water in the bottle.', hataTuru: 'KELIME_SECIMI', altKonu: kFewLittle),
      OrnekCumle(ingilizce: 'There are too much people here.', turkce: 'Burada fazla insan var.', dogruMu: false,
        neden: '"people" sayilabilir -> too many.',
        dogruBicim: 'There are too many people here.', hataTuru: 'KELIME_SECIMI', altKonu: kTooMuch),
      OrnekCumle(ingilizce: 'This tea has too many sugar.', turkce: 'Bu cayda fazla seker var.', dogruMu: false,
        neden: '"sugar" sayilamaz -> too much.', dogruBicim: 'This tea has too much sugar.',
        hataTuru: 'KELIME_SECIMI', altKonu: kTooMuch),
      OrnekCumle(ingilizce: 'I made too much mistakes.', turkce: 'Fazla hata yaptim.', dogruMu: false,
        neden: '"mistakes" sayilabilir -> too many.',
        dogruBicim: 'I made too many mistakes.', hataTuru: 'KELIME_SECIMI', altKonu: kTooMuch),
      OrnekCumle(ingilizce: 'You work too many.', turkce: 'Fazla calisiyorsun.', dogruMu: false,
        neden: 'Fiil ile "too much" kullanilir.', dogruBicim: 'You work too much.',
        hataTuru: 'KELIME_SECIMI', altKonu: kTooMuch),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kMany,
        soru: 'I have ___ books.',
        secenekler: <String>['much', 'many', 'a little'],
        kabuller: <String>['many'], geriDonusKodu: 'X1'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kMuch,
        soru: 'We do not have ___ time.',
        secenekler: <String>['many', 'much', 'a few'],
        kabuller: <String>['much'], geriDonusKodu: 'X1'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kHowMany,
        soru: '___ water do you need?',
        secenekler: <String>['How many', 'How much', 'How few'],
        kabuller: <String>['How much'], geriDonusKodu: 'X3'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kFewLittle,
        soru: '"Birkac arkadasim var." hangisi?',
        secenekler: <String>['I have a little friends.', 'I have a few friends.', 'I have much friends.'],
        kabuller: <String>['I have a few friends.'], geriDonusKodu: 'X4'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kTooMuch,
        soru: 'There are ___ people here. (fazla)',
        secenekler: <String>['too much', 'too many', 'a little'],
        kabuller: <String>['too many'], geriDonusKodu: 'X5'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kMany,
        soru: '___ people live here.', kabuller: <String>['Many', 'many']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kMuch,
        soru: 'There is not ___ water.', kabuller: <String>['much']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kALotOf,
        soru: 'I have a lot ___ books.', kabuller: <String>['of']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kHowMany,
        soru: '___ books do you have?', kabuller: <String>['How many']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kFewLittle,
        soru: 'We have a ___ time. (biraz)', kabuller: <String>['little']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kMuch,
        soru: '"money" ile hangisi kullanilir?',
        secenekler: <String>['many', 'much', 'a few'], kabuller: <String>['much']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kFewLittle,
        soru: '"few friends" ne anlatir?',
        secenekler: <String>['Birkac arkadas var', 'Neredeyse hic arkadas yok', 'Cok arkadas var'],
        kabuller: <String>['Neredeyse hic arkadas yok']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kMany,
        soru: 'Dizin: books / many / I / have',
        kabuller: <String>['I have many books.', 'I have many books']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kHowMany,
        soru: 'Dizin: do / water / much / need / How / you',
        kabuller: <String>['How much water do you need?',
            'How much water do you need']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kMany,
        soru: '"I have much books." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kMany, turkce: 'Cok kitabim var.',
        kabuller: <String>['I have many books.', 'I have a lot of books.']),
      SerbestGorev(kod: 'SU-2', altKonu: kMuch, turkce: 'Fazla zamanimiz yok.',
        kabuller: <String>['We do not have much time.',
            "We don't have much time."]),
      SerbestGorev(kod: 'SU-3', altKonu: kHowMany, turkce: 'Kac kitabin var?',
        kabuller: <String>['How many books do you have?']),
      SerbestGorev(kod: 'SU-4', altKonu: kTooMuch, turkce: 'Burada fazla insan var.',
        kabuller: <String>['There are too many people here.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kMany,
        soru: 'Do you have ___ questions?', kabuller: <String>['many']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kMuch,
        soru: 'He does not eat ___ bread.', kabuller: <String>['much']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kHowMany,
        soru: '___ time do we have?', kabuller: <String>['How much']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.boslukDoldurma, altKonu: kTooMuch,
        soru: 'This tea has ___ sugar. (fazla)', kabuller: <String>['too much']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.coktanSecmeli, altKonu: kFewLittle,
        soru: 'There is ___ water in the bottle. (az)',
        secenekler: <String>['few', 'little', 'many'], kabuller: <String>['little']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kALotOf,
        soru: '"We drink a lot of waters." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kTooMuch,
        soru: 'Dizin: mistakes / too / made / many / I',
        kabuller: <String>['I made too many mistakes.', 'I made too many mistakes']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kALotOf,
        soru: 'She spends a lot of ___. (money)', kabuller: <String>['money']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kMany,
        soru: 'There are ___ cars outside.',
        secenekler: <String>['much', 'many', 'a little'], kabuller: <String>['many']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kMuch,
        soru: 'Do you need ___ money?',
        secenekler: <String>['many', 'much', 'a few'], kabuller: <String>['much']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kHowMany,
        soru: '___ people are there?',
        secenekler: <String>['How much', 'How many', 'How little'],
        kabuller: <String>['How many']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kFewLittle,
        soru: 'We have a ___ time. (biraz)',
        secenekler: <String>['few', 'little', 'many'], kabuller: <String>['little']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kTooMuch,
        soru: 'This tea has ___ sugar.',
        secenekler: <String>['too many', 'too much', 'a few'],
        kabuller: <String>['too much']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kALotOf,
        soru: 'I have a lot ___ books.', kabuller: <String>['of']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kMuch,
        soru: 'There is not ___ water.', kabuller: <String>['much']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kFewLittle,
        soru: 'I have a ___ friends here. (birkac)', kabuller: <String>['few']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kHowMany,
        soru: '"How much books do you have?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kTooMuch,
        soru: '"There are too much people here." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kMuch,
        soru: '"We do not have many time." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kHowMany,
        soru: 'Dizin: have / books / How / you / do / many',
        kabuller: <String>['How many books do you have?',
            'How many books do you have']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kMany,
        soru: 'Ingilizceye cevirin: Burada cok insan yasar.',
        kabuller: <String>['Many people live here.',
            'A lot of people live here.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kMuch,
        soru: 'Ingilizceye cevirin: Fazla zamanimiz yok.',
        kabuller: <String>['We do not have much time.',
            "We don't have much time."]),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kHowMany,
        soru: 'Ingilizceye cevirin: Ne kadar suya ihtiyacin var?',
        kabuller: <String>['How much water do you need?']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Ayni soru, yeni kelimeler',
        aciklama: 'Sayabilir miyim? Evet -> many · Hayir -> much.',
        ornek: 'many books · much water'),
      OzetMaddesi(baslik: 'a lot of: guvenli secim',
        aciklama: 'Her iki turle calisir. Olumluda daha yaygin.',
        ornek: 'a lot of books · a lot of water'),
      OzetMaddesi(baslik: 'How much / How many',
        aciklama: 'Ayni ayrim soruda da gecerli. "How much" fiyat da sorar.',
        ornek: 'How many books? · How much water? · How much is it?'),
      OzetMaddesi(baslik: 'few / little: AZ',
        aciklama: 'Sayilabilir -> few · Sayilamaz -> little.',
        ornek: 'few friends · little time'),
      OzetMaddesi(baslik: '"a" tonu degistirir',
        aciklama: '"a few / a little" olumlu (var) · "few / little" olumsuz (yetersiz).',
        ornek: 'a few friends (birkac) · few friends (neredeyse yok)'),
      OzetMaddesi(baslik: 'too much / too many: FAZLA',
        aciklama: '"too" olumsuz ton verir; "a lot of" notrdur.',
        ornek: 'too much sugar (fazla) · a lot of sugar (cok)'),
    ],
  );
}
