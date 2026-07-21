/// EN-A1-023 — there is / there are
/// SADECE VERI.
library;

import '../model/ders_sablonu.dart';

class DersEnA1023 {
  const DersEnA1023._();

  static const String kTekil = 'there is (tekil)';
  static const String kCogul = 'there are (cogul)';
  static const String kSayilamaz = 'Sayilamayan isimler';
  static const String kOlumsuz = 'Olumsuz bicim';
  static const String kSoru = 'Soru ve kisa cevap';
  static const String kHave = 'have ile karistirmama';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A1-023',
    baslik: 'there is / there are — Bir sey VAR',
    seviye: 'A1', konu: 'YAP', tahminiDk: 35,
    onKosullar: <String>['EN-A1-020', 'EN-A1-021'],
    girisMetni:
        'Turkcede varlik bildirmek icin tek kelime yeter: VAR.\n\n'
        '"Masada bir kitap var." · "Masada uc kitap var."\n'
        'Iki cumlede de "var" degismedi.\n\n'
        'Ingilizcede bu is iki kelimeyle yapilir ve SAYIYA gore degisir:\n'
        '  there IS  -> tekil\n'
        '  there ARE -> cogul\n\n'
        'Ayrica "there" burada YER anlami tasimaz. "orada" demek degildir; '
        'cumlenin sahte oznesidir. Bu yuzden atlanamaz.\n\n'
        '"Is a book on the table." yanlistir; "There is a book..." dogrudur.',
    kazanimlar: <String>[
      'Sayiya gore is / are secebilmek',
      'Sayilamayan isimlerle "there is" kullanmak',
      'Olumsuz bicimi kurabilmek (there is not / there are no)',
      'Soru ve kisa cevap verebilmek',
      'have ile karistirmamak',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'H1', baslik: '"there" burada YER degil',
        govde: 'Gunluk dilde "there" = orada demektir: I live there.\n\n'
            'Ama "there is / there are" kalibinda BASKA bir gorev yapar: '
            'cumleye sahte bir ozne olur.\n\n'
            'Ingilizce cumle oznesiz olamaz (A1-003). Varlik bildirirken '
            'gercek ozne yoktur, bu yuzden "there" kelimesi ozne yerine '
            'gecer.\n\n'
            'Bu yuzden ATLANAMAZ. "Is a book on the table." eksiktir.',
        turkceKarsilastirma: 'Masada bir kitap var.\n'
            'There is a book on the table.\n'
            '"var"  ->  "there is"'),
      AnlatimBlogu(kod: 'H2', baslik: 'is mi are mi? ARKASINA bak',
        govde: 'Secim, "there"dan SONRA gelen isme gore yapilir:\n\n'
            'There IS a book.       -> tekil isim\n'
            'There ARE three books. -> cogul isim\n\n'
            'Turkcede "var" hic degismedigi icin bu ayrim unutulur.\n\n'
            'Liste sayarken ILK ogeye bakilir:\n'
            'There is a book and two pens. (ilk oge tekil -> is)',
        turkceKarsilastirma: 'Bir kitap var.  ->  There is a book.\n'
            'Uc kitap var.   ->  There are three books.'),
      AnlatimBlogu(kod: 'H3', baslik: 'Sayilamayan isimler',
        govde: 'Sayilamayan isimler (water, bread, money, time) cogul '
            'yapilmadigi icin her zaman "there is" alir:\n\n'
            'There is water in the glass.\n'
            'There is bread on the table.\n'
            'There is no time.\n\n'
            'Miktar belirtilirse yine ilk ogeye bakilir:\n'
            'There are two glasses of water. (glasses cogul -> are)',
        turkceKarsilastirma: 'Bardakta su var.  ->  There is water in the glass.'),
      AnlatimBlogu(kod: 'H4', baslik: 'Olumsuz: iki yol',
        govde: 'Iki bicim de dogrudur:\n\n'
            '1. not ile:  There is not a book. · There are not any books.\n'
            '2. no ile:   There is no book.    · There are no books.\n\n'
            '"no" kullanildiginda "a" veya "any" DUSER.\n'
            'There is no a book. -> YANLIS\n\n'
            'Kisa yazim: There isn\u2019t / There aren\u2019t',
        turkceKarsilastirma: 'Kitap yok.  ->  There is no book.\n'
            '            ->  There is not a book.'),
      AnlatimBlogu(kod: 'H5', baslik: 'Soru: sira ters doner',
        govde: 'To be kalibindaki gibi, is/are basa gecer:\n\n'
            'There is a book.  ->  Is there a book?\n'
            'There are books.  ->  Are there any books?\n\n'
            'Soruda cogunlukla "any" kullanilir.\n\n'
            'Kisa cevap:\n'
            'Yes, there is. / No, there is not.\n'
            'Yes, there are. / No, there are not.',
        turkceKarsilastirma: 'Kitap var mi?  ->  Is there a book?'),
      AnlatimBlogu(kod: 'H6', baslik: 'have ile karistirma',
        govde: 'Turkcede "var" hem sahiplik hem varlik bildirir:\n\n'
            '"Bir arabam var."   -> SAHIPLIK\n'
            '"Bahcede araba var." -> VARLIK\n\n'
            'Ingilizcede ikisi AYRIDIR:\n'
            'I have a car.              (sahiplik)\n'
            'There is a car in the garden. (varlik)\n\n'
            'Kural: Sahip belliyse have, yalnizca "bulunuyor" deniyorsa '
            'there is/are.',
        turkceKarsilastirma: 'Bir arabam var.   ->  I have a car.\n'
            'Bahcede araba var. ->  There is a car in the garden.'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['a book', 'There is a book', 'There is a book on the table.'],
        turkce: 'Masada bir kitap var.', not: 'Tekil -> is.'),
      AdimliOrnek(adimlar: <String>['three books', 'There are three books', 'There are three books on the table.'],
        turkce: 'Masada uc kitap var.', not: 'Cogul -> are.'),
      AdimliOrnek(adimlar: <String>['water', 'There is water', 'There is water in the glass.'],
        turkce: 'Bardakta su var.', not: 'Sayilamaz -> her zaman is.'),
      AdimliOrnek(adimlar: <String>['There are books.', 'Are there', 'Are there any books?'],
        turkce: 'Kitap var mi?', not: 'Soruda are basa gecer.'),
      AdimliOrnek(adimlar: <String>['There is a book.', 'There is no', 'There is no book.'],
        turkce: 'Kitap yok.', not: '"no" gelince "a" duser.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Odada iki pencere var.', 'iki pencere = cogul', 'There are',
        'There are two windows in the room.'],
        turkce: 'Cogul -> are.', not: 'There is two windows YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Bir arabam var.', 'Sahip belli -> have', 'I have',
        'I have a car.'],
        turkce: 'Sahiplik: there is DEGIL.', not: 'There is my car YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Bahcede cocuk var mi?', 'Soru -> Are there', 'cocuklar = cogul',
        'Are there any children in the garden?'],
        turkce: 'Soru + cogul.', not: 'Soruda "any" yaygindir.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'There is a book on the table.', turkce: 'Masada bir kitap var.', dogruMu: true, altKonu: kTekil),
      OrnekCumle(ingilizce: 'There is a shop near my house.', turkce: 'Evimin yaninda bir dukkan var.', dogruMu: true, altKonu: kTekil),
      OrnekCumle(ingilizce: 'There is a problem.', turkce: 'Bir sorun var.', dogruMu: true, altKonu: kTekil),
      OrnekCumle(ingilizce: 'There is a car in the garden.', turkce: 'Bahcede bir araba var.', dogruMu: true, altKonu: kTekil),
      OrnekCumle(ingilizce: 'There is a teacher in the classroom.', turkce: 'Sinifta bir ogretmen var.', dogruMu: true, altKonu: kTekil),
      OrnekCumle(ingilizce: 'There is one window here.', turkce: 'Burada bir pencere var.', dogruMu: true, altKonu: kTekil),
      OrnekCumle(ingilizce: 'There are three books on the table.', turkce: 'Masada uc kitap var.', dogruMu: true, altKonu: kCogul),
      OrnekCumle(ingilizce: 'There are two windows in the room.', turkce: 'Odada iki pencere var.', dogruMu: true, altKonu: kCogul),
      OrnekCumle(ingilizce: 'There are many people here.', turkce: 'Burada cok insan var.', dogruMu: true, altKonu: kCogul),
      OrnekCumle(ingilizce: 'There are five students in the class.', turkce: 'Sinifta bes ogrenci var.', dogruMu: true, altKonu: kCogul),
      OrnekCumle(ingilizce: 'There are some apples in the bag.', turkce: 'Cantada biraz elma var.', dogruMu: true, altKonu: kCogul),
      OrnekCumle(ingilizce: 'There are children in the garden.', turkce: 'Bahcede cocuklar var.', dogruMu: true, altKonu: kCogul),
      OrnekCumle(ingilizce: 'There is water in the glass.', turkce: 'Bardakta su var.', dogruMu: true, altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'There is bread on the table.', turkce: 'Masada ekmek var.', dogruMu: true, altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'There is no time.', turkce: 'Zaman yok.', dogruMu: true, altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'There is money in my bag.', turkce: 'Cantamda para var.', dogruMu: true, altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'There is not a book here.', turkce: 'Burada kitap yok.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'There is no book here.', turkce: 'Burada kitap yok.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'There are no students in the class.', turkce: 'Sinifta ogrenci yok.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'There are not any shops here.', turkce: 'Burada dukkan yok.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: "There isn't a problem.", turkce: 'Sorun yok.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: "There aren't any people here.", turkce: 'Burada kimse yok.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'Is there a book on the table?', turkce: 'Masada kitap var mi?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Are there any students here?', turkce: 'Burada ogrenci var mi?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Is there water in the glass?', turkce: 'Bardakta su var mi?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Yes, there is.', turkce: 'Evet, var.', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'No, there are not.', turkce: 'Hayir, yok.', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'I have a car.', turkce: 'Bir arabam var.', dogruMu: true, altKonu: kHave),
      OrnekCumle(ingilizce: 'She has two brothers.', turkce: 'Iki kardesi var.', dogruMu: true, altKonu: kHave),
      OrnekCumle(ingilizce: 'There is a car in the garden.', turkce: 'Bahcede araba var.', dogruMu: true, altKonu: kHave),

      OrnekCumle(ingilizce: 'There is three books on the table.', turkce: 'Masada uc kitap var.', dogruMu: false,
        neden: 'Isim cogul ise "there are" gerekir. Turkcede "var" '
            'degismedigi icin bu ayrim unutuluyor.',
        dogruBicim: 'There are three books on the table.',
        hataTuru: 'GRAMER_HATASI', altKonu: kCogul),
      OrnekCumle(ingilizce: 'There are a book here.', turkce: 'Burada bir kitap var.', dogruMu: false,
        neden: 'Tekil isim "there is" alir.', dogruBicim: 'There is a book here.',
        hataTuru: 'GRAMER_HATASI', altKonu: kTekil),
      OrnekCumle(ingilizce: 'There is two windows in the room.', turkce: 'Odada iki pencere var.', dogruMu: false,
        neden: 'Cogul isim -> are.', dogruBicim: 'There are two windows in the room.',
        hataTuru: 'GRAMER_HATASI', altKonu: kCogul),
      OrnekCumle(ingilizce: 'There is many people here.', turkce: 'Burada cok insan var.', dogruMu: false,
        neden: '"people" cogul bir isimdir -> are.',
        dogruBicim: 'There are many people here.', hataTuru: 'GRAMER_HATASI', altKonu: kCogul),
      OrnekCumle(ingilizce: 'Is a book on the table.', turkce: 'Masada bir kitap var.', dogruMu: false,
        neden: '"there" atlanamaz; cumlenin oznesi odur.',
        dogruBicim: 'There is a book on the table.', hataTuru: 'EKSIK_KELIME', altKonu: kTekil),
      OrnekCumle(ingilizce: 'Are three books here.', turkce: 'Burada uc kitap var.', dogruMu: false,
        neden: 'Ozne eksik: "There are" olmali.', dogruBicim: 'There are three books here.',
        hataTuru: 'EKSIK_KELIME', altKonu: kCogul),
      OrnekCumle(ingilizce: 'There are water in the glass.', turkce: 'Bardakta su var.', dogruMu: false,
        neden: '"water" sayilamayan bir isimdir; her zaman "there is" alir.',
        dogruBicim: 'There is water in the glass.', hataTuru: 'GRAMER_HATASI', altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'There are bread on the table.', turkce: 'Masada ekmek var.', dogruMu: false,
        neden: '"bread" sayilamaz -> is.', dogruBicim: 'There is bread on the table.',
        hataTuru: 'GRAMER_HATASI', altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'There are no time.', turkce: 'Zaman yok.', dogruMu: false,
        neden: '"time" sayilamaz -> is.', dogruBicim: 'There is no time.',
        hataTuru: 'GRAMER_HATASI', altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'There is no a book here.', turkce: 'Burada kitap yok.', dogruMu: false,
        neden: '"no" kullanildiginda "a" DUSER. Ikisi birlikte olmaz.',
        dogruBicim: 'There is no book here.', hataTuru: 'FAZLA_KELIME', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'There are no any students.', turkce: 'Ogrenci yok.', dogruMu: false,
        neden: '"no" ve "any" birlikte kullanilmaz. Biri secilir.',
        dogruBicim: 'There are no students.', hataTuru: 'FAZLA_KELIME', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'There not is a book here.', turkce: 'Burada kitap yok.', dogruMu: false,
        neden: '"not" is/are\u2019den SONRA gelir.', dogruBicim: 'There is not a book here.',
        hataTuru: 'KELIME_SIRASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'There is a book on the table?', turkce: 'Masada kitap var mi?', dogruMu: false,
        neden: 'Soruda sira degisir: "Is there ...?" Yalnizca soru isareti '
            'yetmez.', dogruBicim: 'Is there a book on the table?',
        hataTuru: 'KELIME_SIRASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'Is there any students here?', turkce: 'Burada ogrenci var mi?', dogruMu: false,
        neden: '"students" cogul -> "Are there".',
        dogruBicim: 'Are there any students here?', hataTuru: 'GRAMER_HATASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'Yes, there has.', turkce: 'Evet, var.', dogruMu: false,
        neden: 'Kisa cevapta kalibin fiili tekrarlanir: "there is".',
        dogruBicim: 'Yes, there is.', hataTuru: 'GRAMER_HATASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'There have a car in the garden.', turkce: 'Bahcede araba var.', dogruMu: false,
        neden: 'Varlik bildirirken "have" kullanilmaz.',
        dogruBicim: 'There is a car in the garden.', hataTuru: 'KELIME_SECIMI', altKonu: kHave),
      OrnekCumle(ingilizce: 'There is my a car.', turkce: 'Bir arabam var.', dogruMu: false,
        neden: 'Sahiplik bildirirken "have" kullanilir; "there is" degil.',
        dogruBicim: 'I have a car.', hataTuru: 'KELIME_SECIMI', altKonu: kHave),
      OrnekCumle(ingilizce: 'There is have two brothers.', turkce: 'Iki kardesi var.', dogruMu: false,
        neden: 'Iki kalip birlestirilemez. Sahiplik -> She has two brothers.',
        dogruBicim: 'She has two brothers.', hataTuru: 'GRAMER_HATASI', altKonu: kHave),
      OrnekCumle(ingilizce: 'There are a teacher in the classroom.', turkce: 'Sinifta bir ogretmen var.', dogruMu: false,
        neden: 'Tekil isim -> is.', dogruBicim: 'There is a teacher in the classroom.',
        hataTuru: 'GRAMER_HATASI', altKonu: kTekil),
      OrnekCumle(ingilizce: 'There is some apples in the bag.', turkce: 'Cantada biraz elma var.', dogruMu: false,
        neden: '"apples" cogul -> are.', dogruBicim: 'There are some apples in the bag.',
        hataTuru: 'GRAMER_HATASI', altKonu: kCogul),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kCogul,
        soru: 'There ___ three books on the table.',
        secenekler: <String>['is', 'are', 'have'], kabuller: <String>['are'],
        geriDonusKodu: 'H2', aciklama: 'Cogul isim -> are.'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kSayilamaz,
        soru: 'There ___ water in the glass.',
        secenekler: <String>['is', 'are', 'have'], kabuller: <String>['is'],
        geriDonusKodu: 'H3', aciklama: 'Sayilamaz -> is.'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kOlumsuz,
        soru: 'Hangisi dogru?',
        secenekler: <String>['There is no a book.', 'There is no book.', 'There no is book.'],
        kabuller: <String>['There is no book.'], geriDonusKodu: 'H4'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kSoru,
        soru: '"There are books." cumlesinin sorusu?',
        secenekler: <String>['There are books?', 'Are there any books?', 'Is there books?'],
        kabuller: <String>['Are there any books?'], geriDonusKodu: 'H5'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kHave,
        soru: '"Bir arabam var." nasil soylenir?',
        secenekler: <String>['There is my car.', 'I have a car.', 'There have a car.'],
        kabuller: <String>['I have a car.'], geriDonusKodu: 'H6'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kTekil,
        soru: 'There ___ a shop near my house.', kabuller: <String>['is']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kCogul,
        soru: 'There ___ five students in the class.', kabuller: <String>['are']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kSayilamaz,
        soru: 'There ___ bread on the table.', kabuller: <String>['is']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kSoru,
        soru: '___ there any people here?', kabuller: <String>['Are', 'are']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kSoru,
        soru: 'Is there a problem? — Yes, there ___.', kabuller: <String>['is']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kOlumsuz,
        soru: '"Sinifta ogrenci yok." hangisi?',
        secenekler: <String>['There are no students.', 'There is no students.', 'There have no students.'],
        kabuller: <String>['There are no students.']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kHave,
        soru: '"Iki kardesi var." hangisi?',
        secenekler: <String>['There are two brothers.', 'She has two brothers.', 'There is two brothers.'],
        kabuller: <String>['She has two brothers.']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kCogul,
        soru: 'Dizin: room / are / in / There / two windows / the',
        kabuller: <String>['There are two windows in the room.', 'There are two windows in the room']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kSoru,
        soru: 'Dizin: table / a book / Is / on / there / the',
        kabuller: <String>['Is there a book on the table?', 'Is there a book on the table']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kTekil,
        soru: '"Is a book on the table." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis'],
        aciklama: '"there" atlanamaz.'),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kCogul, turkce: 'Odada iki pencere var.',
        kabuller: <String>['There are two windows in the room.']),
      SerbestGorev(kod: 'SU-2', altKonu: kSayilamaz, turkce: 'Bardakta su var.',
        kabuller: <String>['There is water in the glass.']),
      SerbestGorev(kod: 'SU-3', altKonu: kSoru, turkce: 'Masada kitap var mi?',
        kabuller: <String>['Is there a book on the table?']),
      SerbestGorev(kod: 'SU-4', altKonu: kHave, turkce: 'Bir arabam var.',
        kabuller: <String>['I have a car.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kTekil,
        soru: 'There ___ a problem.', kabuller: <String>['is']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kCogul,
        soru: 'There ___ many people here.', kabuller: <String>['are']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kSayilamaz,
        soru: 'There ___ money in my bag.', kabuller: <String>['is']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.coktanSecmeli, altKonu: kOlumsuz,
        soru: 'Hangisi dogru?',
        secenekler: <String>['There are no any shops.', 'There are no shops.', 'There no shops.'],
        kabuller: <String>['There are no shops.']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.dogruYanlis, altKonu: kHave,
        soru: '"There have a car in the garden." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.kelimeDizme, altKonu: kOlumsuz,
        soru: 'Dizin: book / no / There / is',
        kabuller: <String>['There is no book.', 'There is no book']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.boslukDoldurma, altKonu: kSoru,
        soru: 'Are there any books? — No, there ___ not.', kabuller: <String>['are']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.eslestirme, altKonu: kSayilamaz,
        soru: '"time" ile hangisi kullanilir?',
        secenekler: <String>['there is', 'there are', 'there have'],
        kabuller: <String>['there is']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kTekil,
        soru: 'There ___ a car in the garden.',
        secenekler: <String>['is', 'are', 'have'], kabuller: <String>['is']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kCogul,
        soru: 'There ___ children in the garden.',
        secenekler: <String>['is', 'are', 'has'], kabuller: <String>['are']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kSayilamaz,
        soru: 'There ___ no time.', secenekler: <String>['is', 'are', 'have'],
        kabuller: <String>['is']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kSoru,
        soru: '___ there any students here?',
        secenekler: <String>['Is', 'Are', 'Do'], kabuller: <String>['Are']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kHave,
        soru: '"Iki kardesim var." hangisi?',
        secenekler: <String>['There are two brothers.', 'I have two brothers.', 'There is two brothers.'],
        kabuller: <String>['I have two brothers.']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kCogul,
        soru: 'There ___ some apples in the bag.', kabuller: <String>['are']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kSayilamaz,
        soru: 'There ___ bread on the table.', kabuller: <String>['is']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kSoru,
        soru: 'Is there a book? — Yes, there ___.', kabuller: <String>['is']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kOlumsuz,
        soru: '"There is no a book." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kTekil,
        soru: '"Is a book on the table." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kSayilamaz,
        soru: '"There are water in the glass." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kCogul,
        soru: 'Dizin: here / are / people / There / many',
        kabuller: <String>['There are many people here.', 'There are many people here']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kCogul,
        soru: 'Ingilizceye cevirin: Masada uc kitap var.',
        kabuller: <String>['There are three books on the table.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kSoru,
        soru: 'Ingilizceye cevirin: Burada ogrenci var mi?',
        kabuller: <String>['Are there any students here?', 'Are there students here?']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kOlumsuz,
        soru: 'Ingilizceye cevirin: Burada kitap yok.',
        kabuller: <String>['There is no book here.', 'There are no books here.']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: '"there" ozne gorevi gorur',
        aciklama: 'Yer anlami tasimaz, atlanamaz. Ingilizce cumle oznesiz olmaz.',
        ornek: 'Is a book... (X) -> There is a book...'),
      OzetMaddesi(baslik: 'is / are secimi',
        aciklama: 'Arkasindaki isme bakilir: tekil -> is, cogul -> are.',
        ornek: 'There is a book. · There are three books.'),
      OzetMaddesi(baslik: 'Sayilamayan isimler',
        aciklama: 'Cogul yapilmadigi icin her zaman "there is".',
        ornek: 'There is water. · There is no time.'),
      OzetMaddesi(baslik: 'Olumsuz: iki yol',
        aciklama: 'not ile veya no ile. "no" gelince a/any DUSER.',
        ornek: 'There is not a book. · There is no book.'),
      OzetMaddesi(baslik: 'Soru ve kisa cevap',
        aciklama: 'is/are basa gecer. Kisa cevapta kalip tekrarlanir.',
        ornek: 'Is there a book? — Yes, there is.'),
      OzetMaddesi(baslik: 'have ile karistirma',
        aciklama: 'Sahiplik -> have. Yalnizca bulunuyor -> there is/are.',
        ornek: 'I have a car. · There is a car in the garden.'),
    ],
  );
}
