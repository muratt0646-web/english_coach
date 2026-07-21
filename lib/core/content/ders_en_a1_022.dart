/// EN-A1-022 — Sifatlar ve Sifat Sirasi
/// SADECE VERI.
library;

import '../model/ders_sablonu.dart';

class DersEnA1022 {
  const DersEnA1022._();

  static const String kIsimdenOnce = 'Isimden once';
  static const String kBeIle = 'be ile kullanim';
  static const String kCogulOlmaz = 'Sifat cogul olmaz';
  static const String kSira = 'Sifat sirasi';
  static const String kVeryToo = 'very / too';
  static const String kIngEd = '-ing / -ed sifatlar';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A1-022',
    baslik: 'Sifatlar ve Sifat Sirasi',
    seviye: 'A1', konu: 'ISM', tahminiDk: 35,
    onKosullar: <String>['EN-A1-002', 'EN-A1-020'],
    girisMetni:
        'Iyi haber: Turkce ve Ingilizce sifati AYNI yere koyar — isimden '
        'once. "kirmizi araba" = "a red car".\n\n'
        'Ama uc fark var:\n\n'
        '1. Sifat COGUL OLMAZ: "kirmizi arabalar" -> "red cars" '
        '(reds cars DEGIL)\n'
        '2. Sifat yuklem olunca to be ZORUNLU: "O guzel" -> "She IS '
        'beautiful"\n'
        '3. Birden fazla sifat varsa SIRA kuralli: "buyuk eski ev" -> '
        '"a big old house"\n\n'
        'Bu ders sifat listesi ezberletmez; bu uc farki gosterir.',
    kazanimlar: <String>[
      'Sifati isimden once dogru yerlestirmek',
      'Sifati asla cogul yapmamak',
      'Yuklem konumunda to be kullanmak',
      'Birden fazla sifatta dogru sirayi kurmak',
      'very / too farkini bilmek',
      'boring ile bored ayrimini yapmak',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'I1', baslik: 'Sifat isimden ONCE gelir',
        govde: 'Bu konuda Turkce ile Ingilizce ayni davranir:\n\n'
            'kirmizi araba  ->  a red car\n'
            'yeni kitap     ->  a new book\n'
            'buyuk ev       ->  a big house\n\n'
            'Artikel en basa gecer: a red car (red a car DEGIL).\n\n'
            'Sifat isimden SONRA gelmez: "a car red" yanlistir.',
        turkceKarsilastirma: 'kirmizi araba  ->  a red car\n'
            'Sira AYNI'),
      AnlatimBlogu(kod: 'I2', baslik: 'Sifat COGUL OLMAZ',
        govde: 'Turkcede de sifat cogul almaz: "kirmizi arabalar" deriz, '
            '"kirmizilar arabalar" demeyiz.\n\n'
            'Ingilizcede de ayni: yalnizca ISIM cogul olur.\n\n'
            'red cars · new books · big houses\n\n'
            'reds cars · news books -> YANLIS\n\n'
            'Sifat hicbir zaman -s almaz. Istisna yoktur.',
        turkceKarsilastirma: 'kirmizi arabalar  ->  red cars\n'
            'Sifat degismez     ->  sifat degismez'),
      AnlatimBlogu(kod: 'I3', baslik: 'Yuklem konumunda to be ZORUNLU',
        govde: 'Sifat isimden once degil de CUMLENIN YUKLEMI ise, arada '
            'to be bulunmalidir:\n\n'
            'The car is red.      (Araba kirmizi.)\n'
            'She is beautiful.    (O guzel.)\n'
            'These books are new. (Bu kitaplar yeni.)\n\n'
            'Turkcede "O guzel" yeterlidir; Ingilizcede "She beautiful" '
            'eksik kalir.\n\n'
            'Bu, A1-002\u2019deki to be kuralinin sifatlara uygulanmasidir.',
        turkceKarsilastirma: 'Araba kirmizi.  ->  The car is red.\n'
            'Ek yok           ->  "is" ZORUNLU'),
      AnlatimBlogu(kod: 'I4', baslik: 'Birden fazla sifat: sira',
        govde: 'Iki veya daha fazla sifat varsa Ingilizcede belirli bir '
            'sira vardir. A1 duzeyinde su kadari yeter:\n\n'
            'GORUS -> BOYUT -> YAS -> RENK -> ISIM\n\n'
            'a nice big old red car\n'
            'gorus boyut yas renk\n\n'
            'Pratik kural: Kisisel yorum (nice, beautiful) en basta, '
            'renk isme en yakin.\n\n'
            'a big old house · a beautiful new car',
        turkceKarsilastirma: 'buyuk eski ev  ->  a big old house\n'
            'Turkcede de benzer sira vardir.'),
      AnlatimBlogu(kod: 'I5', baslik: 'very ve too farki',
        govde: 'Ikisi de sifati guclendirdir ama anlamlari FARKLIDIR:\n\n'
            'very = cok (olumlu ya da notr)\n'
            'too  = fazla, gereginden cok (OLUMSUZ)\n\n'
            'This coffee is very hot.  -> Cok sicak. (guzel olabilir)\n'
            'This coffee is too hot.   -> Fazla sicak. (icemem)\n\n'
            'Ikisi de sifattan ONCE gelir: very big, too small.\n'
            '"big very" yanlistir.',
        turkceKarsilastirma: 'Cok sicak.   ->  very hot\n'
            'Fazla sicak. ->  too hot'),
      AnlatimBlogu(kod: 'I6', baslik: '-ing mi -ed mi?',
        govde: 'Bazi sifatlarin iki bicimi vardir ve karistirilir:\n\n'
            '-ing  -> SEYIN ozelligi     (The film is boring.)\n'
            '-ed   -> KISININ duygusu    (I am bored.)\n\n'
            'interesting / interested · tired / tiring\n\n'
            '"I am boring" derseniz "Ben sikici biriyim" demis olursunuz!\n\n'
            'Kural: Sey -> -ing, kisi -> -ed.',
        turkceKarsilastirma: 'Film sikici.  ->  The film is boring.\n'
            'Sikildim.     ->  I am bored.'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['car', 'red car', 'a red car'],
        turkce: 'kirmizi bir araba', not: 'Sifat isimden once, artikel en basta.'),
      AdimliOrnek(adimlar: <String>['cars', 'red cars', 'The red cars are new.'],
        turkce: 'Kirmizi arabalar yeni.', not: 'Sifat cogul OLMAZ.'),
      AdimliOrnek(adimlar: <String>['The car', 'The car is', 'The car is red.'],
        turkce: 'Araba kirmizi.', not: 'Yuklem konumunda "is" zorunlu.'),
      AdimliOrnek(adimlar: <String>['house', 'old house', 'big old house', 'a big old house'],
        turkce: 'buyuk eski bir ev', not: 'Boyut -> yas -> isim.'),
      AdimliOrnek(adimlar: <String>['The film', 'The film is', 'The film is boring.'],
        turkce: 'Film sikici.', not: 'Sey -> -ing.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'O guzel.', 'Ozne: She', 'Sifat yuklem -> is gerek',
        'She is beautiful.'],
        turkce: 'Yuklem konumunda to be.', not: 'She beautiful YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Kirmizi arabalar pahali.', 'sifat: red (degismez)',
        'isim: cars (cogul)', 'Red cars are expensive.'],
        turkce: 'Yalnizca isim cogul olur.', not: 'reds cars YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Sikildim.', 'Kisi -> -ed', 'I am bored.', 'I am bored.'],
        turkce: 'Kisinin duygusu.', not: 'I am boring = "sikiciyim".'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I have a red car.', turkce: 'Kirmizi bir arabam var.', dogruMu: true, altKonu: kIsimdenOnce),
      OrnekCumle(ingilizce: 'She reads a new book.', turkce: 'Yeni bir kitap okur.', dogruMu: true, altKonu: kIsimdenOnce),
      OrnekCumle(ingilizce: 'They live in a big house.', turkce: 'Buyuk bir evde yasarlar.', dogruMu: true, altKonu: kIsimdenOnce),
      OrnekCumle(ingilizce: 'It is a quiet street.', turkce: 'Sessiz bir sokak.', dogruMu: true, altKonu: kIsimdenOnce),
      OrnekCumle(ingilizce: 'He is a good teacher.', turkce: 'O iyi bir ogretmen.', dogruMu: true, altKonu: kIsimdenOnce),
      OrnekCumle(ingilizce: 'Red cars are expensive.', turkce: 'Kirmizi arabalar pahali.', dogruMu: true, altKonu: kCogulOlmaz),
      OrnekCumle(ingilizce: 'These new books are mine.', turkce: 'Bu yeni kitaplar benim.', dogruMu: true, altKonu: kCogulOlmaz),
      OrnekCumle(ingilizce: 'Big houses are expensive.', turkce: 'Buyuk evler pahali.', dogruMu: true, altKonu: kCogulOlmaz),
      OrnekCumle(ingilizce: 'I like old films.', turkce: 'Eski filmleri severim.', dogruMu: true, altKonu: kCogulOlmaz),
      OrnekCumle(ingilizce: 'The car is red.', turkce: 'Araba kirmizi.', dogruMu: true, altKonu: kBeIle),
      OrnekCumle(ingilizce: 'She is beautiful.', turkce: 'O guzel.', dogruMu: true, altKonu: kBeIle),
      OrnekCumle(ingilizce: 'These books are new.', turkce: 'Bu kitaplar yeni.', dogruMu: true, altKonu: kBeIle),
      OrnekCumle(ingilizce: 'The room is quiet.', turkce: 'Oda sessiz.', dogruMu: true, altKonu: kBeIle),
      OrnekCumle(ingilizce: 'My father is tired.', turkce: 'Babam yorgun.', dogruMu: true, altKonu: kBeIle),
      OrnekCumle(ingilizce: 'The children are happy.', turkce: 'Cocuklar mutlu.', dogruMu: true, altKonu: kBeIle),
      OrnekCumle(ingilizce: 'It is a big old house.', turkce: 'Buyuk eski bir ev.', dogruMu: true, altKonu: kSira),
      OrnekCumle(ingilizce: 'She has a beautiful new car.', turkce: 'Guzel yeni bir arabasi var.', dogruMu: true, altKonu: kSira),
      OrnekCumle(ingilizce: 'They live in a small old city.', turkce: 'Kucuk eski bir sehirde yasarlar.', dogruMu: true, altKonu: kSira),
      OrnekCumle(ingilizce: 'I want a nice big house.', turkce: 'Guzel buyuk bir ev isterim.', dogruMu: true, altKonu: kSira),
      OrnekCumle(ingilizce: 'It is an old red car.', turkce: 'Eski kirmizi bir araba.', dogruMu: true, altKonu: kSira),
      OrnekCumle(ingilizce: 'This coffee is very hot.', turkce: 'Bu kahve cok sicak.', dogruMu: true, altKonu: kVeryToo),
      OrnekCumle(ingilizce: 'The book is very interesting.', turkce: 'Kitap cok ilginc.', dogruMu: true, altKonu: kVeryToo),
      OrnekCumle(ingilizce: 'This bag is too heavy.', turkce: 'Bu canta fazla agir.', dogruMu: true, altKonu: kVeryToo),
      OrnekCumle(ingilizce: 'The room is too small.', turkce: 'Oda fazla kucuk.', dogruMu: true, altKonu: kVeryToo),
      OrnekCumle(ingilizce: 'She is very kind.', turkce: 'O cok kibar.', dogruMu: true, altKonu: kVeryToo),
      OrnekCumle(ingilizce: 'The film is boring.', turkce: 'Film sikici.', dogruMu: true, altKonu: kIngEd),
      OrnekCumle(ingilizce: 'I am bored.', turkce: 'Sikildim.', dogruMu: true, altKonu: kIngEd),
      OrnekCumle(ingilizce: 'The book is interesting.', turkce: 'Kitap ilginc.', dogruMu: true, altKonu: kIngEd),
      OrnekCumle(ingilizce: 'I am interested in music.', turkce: 'Muzige ilgi duyarim.', dogruMu: true, altKonu: kIngEd),
      OrnekCumle(ingilizce: 'The work is tiring.', turkce: 'Is yorucu.', dogruMu: true, altKonu: kIngEd),

      OrnekCumle(ingilizce: 'I have a car red.', turkce: 'Kirmizi bir arabam var.', dogruMu: false,
        neden: 'Sifat isimden ONCE gelir. Turkcede de "araba kirmizi bir" '
            'denmez.', dogruBicim: 'I have a red car.',
        hataTuru: 'KELIME_SIRASI', altKonu: kIsimdenOnce),
      OrnekCumle(ingilizce: 'She reads a book new.', turkce: 'Yeni bir kitap okur.', dogruMu: false,
        neden: 'Sifat isimden once gelmeli.', dogruBicim: 'She reads a new book.',
        hataTuru: 'KELIME_SIRASI', altKonu: kIsimdenOnce),
      OrnekCumle(ingilizce: 'I have red a car.', turkce: 'Kirmizi bir arabam var.', dogruMu: false,
        neden: 'Artikel en basa gelir: a red car.', dogruBicim: 'I have a red car.',
        hataTuru: 'KELIME_SIRASI', altKonu: kIsimdenOnce),
      OrnekCumle(ingilizce: 'Reds cars are expensive.', turkce: 'Kirmizi arabalar pahali.', dogruMu: false,
        neden: 'Sifat asla cogul olmaz; yalnizca isim cogul olur.',
        dogruBicim: 'Red cars are expensive.', hataTuru: 'GRAMER_HATASI', altKonu: kCogulOlmaz),
      OrnekCumle(ingilizce: 'These news books are mine.', turkce: 'Bu yeni kitaplar benim.', dogruMu: false,
        neden: '"new" sifattir, -s almaz.', dogruBicim: 'These new books are mine.',
        hataTuru: 'GRAMER_HATASI', altKonu: kCogulOlmaz),
      OrnekCumle(ingilizce: 'Bigs houses are expensive.', turkce: 'Buyuk evler pahali.', dogruMu: false,
        neden: 'Sifat degismez: big houses.', dogruBicim: 'Big houses are expensive.',
        hataTuru: 'GRAMER_HATASI', altKonu: kCogulOlmaz),
      OrnekCumle(ingilizce: 'I like olds films.', turkce: 'Eski filmleri severim.', dogruMu: false,
        neden: 'Sifat cogul yapilmaz.', dogruBicim: 'I like old films.',
        hataTuru: 'GRAMER_HATASI', altKonu: kCogulOlmaz),
      OrnekCumle(ingilizce: 'The car red.', turkce: 'Araba kirmizi.', dogruMu: false,
        neden: 'Sifat yuklem konumundaysa to be ZORUNLUDUR. Turkcedeki '
            '"Araba kirmizi" yapisi yaniltiyor.', dogruBicim: 'The car is red.',
        hataTuru: 'GRAMER_HATASI', altKonu: kBeIle),
      OrnekCumle(ingilizce: 'She beautiful.', turkce: 'O guzel.', dogruMu: false,
        neden: 'To be eksik: She IS beautiful.', dogruBicim: 'She is beautiful.',
        hataTuru: 'GRAMER_HATASI', altKonu: kBeIle),
      OrnekCumle(ingilizce: 'These books new.', turkce: 'Bu kitaplar yeni.', dogruMu: false,
        neden: 'Cogul ozne + sifat -> "are" gerekir.',
        dogruBicim: 'These books are new.', hataTuru: 'GRAMER_HATASI', altKonu: kBeIle),
      OrnekCumle(ingilizce: 'My father tired.', turkce: 'Babam yorgun.', dogruMu: false,
        neden: 'Tekil ozne + sifat -> "is" gerekir.',
        dogruBicim: 'My father is tired.', hataTuru: 'GRAMER_HATASI', altKonu: kBeIle),
      OrnekCumle(ingilizce: 'It is an old big house.', turkce: 'Buyuk eski bir ev.', dogruMu: false,
        neden: 'Sira yanlis: BOYUT yastan once gelir -> big old.',
        dogruBicim: 'It is a big old house.', hataTuru: 'KELIME_SIRASI', altKonu: kSira),
      OrnekCumle(ingilizce: 'She has a new beautiful car.', turkce: 'Guzel yeni bir arabasi var.', dogruMu: false,
        neden: 'Gorus bildiren sifat (beautiful) once gelir.',
        dogruBicim: 'She has a beautiful new car.', hataTuru: 'KELIME_SIRASI', altKonu: kSira),
      OrnekCumle(ingilizce: 'It is a red old car.', turkce: 'Eski kirmizi bir araba.', dogruMu: false,
        neden: 'Renk isme EN YAKIN gelir; yas ondan once.',
        dogruBicim: 'It is an old red car.', hataTuru: 'KELIME_SIRASI', altKonu: kSira),
      OrnekCumle(ingilizce: 'This coffee is hot very.', turkce: 'Bu kahve cok sicak.', dogruMu: false,
        neden: '"very" sifattan ONCE gelir.', dogruBicim: 'This coffee is very hot.',
        hataTuru: 'KELIME_SIRASI', altKonu: kVeryToo),
      OrnekCumle(ingilizce: 'The room is small too.', turkce: 'Oda fazla kucuk.', dogruMu: false,
        neden: '"too" sifattan once gelir. Sonda gelirse "de, dahi" '
            'anlami verir.', dogruBicim: 'The room is too small.',
        hataTuru: 'ANLAM_FARKI', altKonu: kVeryToo),
      OrnekCumle(ingilizce: 'This bag is very heavy, I cannot carry it.', turkce: 'Bu canta fazla agir, tasiyamam.', dogruMu: false,
        neden: 'Tasiyamiyorsaniz "fazla" demek istiyorsunuz -> too. '
            '"very" yalnizca guclendirme yapar.',
        dogruBicim: 'This bag is too heavy, I cannot carry it.',
        hataTuru: 'KELIME_SECIMI', altKonu: kVeryToo),
      OrnekCumle(ingilizce: 'I am boring.', turkce: 'Sikildim.', dogruMu: false,
        neden: '"boring" seyin ozelligidir. Bu cumle "Ben sikici biriyim" '
            'demektir. Kisinin duygusu icin -ed kullanilir.',
        dogruBicim: 'I am bored.', hataTuru: 'ANLAM_FARKI', altKonu: kIngEd),
      OrnekCumle(ingilizce: 'The film is bored.', turkce: 'Film sikici.', dogruMu: false,
        neden: 'Film bir sey; -ing alir.', dogruBicim: 'The film is boring.',
        hataTuru: 'ANLAM_FARKI', altKonu: kIngEd),
      OrnekCumle(ingilizce: 'I am interesting in music.', turkce: 'Muzige ilgi duyarim.', dogruMu: false,
        neden: 'Kisi -> -ed: interested.', dogruBicim: 'I am interested in music.',
        hataTuru: 'ANLAM_FARKI', altKonu: kIngEd),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kIsimdenOnce,
        soru: 'Hangisi dogru?',
        secenekler: <String>['a car red', 'a red car', 'red a car'],
        kabuller: <String>['a red car'], geriDonusKodu: 'I1'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kCogulOlmaz,
        soru: 'Hangisi dogru?',
        secenekler: <String>['reds cars', 'red cars', 'red car'],
        kabuller: <String>['red cars'], geriDonusKodu: 'I2',
        aciklama: 'Sifat cogul olmaz.'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kBeIle,
        soru: '"Araba kirmizi." hangisi?',
        secenekler: <String>['The car red.', 'The car is red.', 'The red car.'],
        kabuller: <String>['The car is red.'], geriDonusKodu: 'I3'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kSira,
        soru: 'Hangisi dogru sirada?',
        secenekler: <String>['an old big house', 'a big old house', 'a house big old'],
        kabuller: <String>['a big old house'], geriDonusKodu: 'I4'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kIngEd,
        soru: '"Sikildim." hangisi?',
        secenekler: <String>['I am boring.', 'I am bored.', 'I bored.'],
        kabuller: <String>['I am bored.'], geriDonusKodu: 'I6'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kBeIle,
        soru: 'The room ___ quiet.', kabuller: <String>['is']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kBeIle,
        soru: 'The children ___ happy.', kabuller: <String>['are']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kVeryToo,
        soru: 'This coffee is ___ hot. (cok, guzel)', kabuller: <String>['very']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kVeryToo,
        soru: 'This bag is ___ heavy. I cannot carry it.', kabuller: <String>['too']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kIngEd,
        soru: 'The film is ___. (boring / bored)', kabuller: <String>['boring']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kCogulOlmaz,
        soru: '"eski filmler" hangisi?',
        secenekler: <String>['olds films', 'old films', 'old film'],
        kabuller: <String>['old films']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kSira,
        soru: '"guzel yeni araba" hangisi?',
        secenekler: <String>['a new beautiful car', 'a beautiful new car', 'a car beautiful new'],
        kabuller: <String>['a beautiful new car']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kBeIle,
        soru: 'Dizin: beautiful / She / is',
        kabuller: <String>['She is beautiful.', 'She is beautiful']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kSira,
        soru: 'Dizin: house / a / old / big / is / It',
        kabuller: <String>['It is a big old house.', 'It is a big old house']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kBeIle,
        soru: '"She beautiful." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kBeIle, turkce: 'Oda sessiz.',
        kabuller: <String>['The room is quiet.']),
      SerbestGorev(kod: 'SU-2', altKonu: kCogulOlmaz, turkce: 'Kirmizi arabalar pahali.',
        kabuller: <String>['Red cars are expensive.']),
      SerbestGorev(kod: 'SU-3', altKonu: kSira, turkce: 'Buyuk eski bir ev.',
        kabuller: <String>['It is a big old house.', 'A big old house.']),
      SerbestGorev(kod: 'SU-4', altKonu: kIngEd, turkce: 'Film sikici.',
        kabuller: <String>['The film is boring.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kBeIle,
        soru: 'My father ___ tired.', kabuller: <String>['is']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kIngEd,
        soru: 'I am ___ in music. (interesting / interested)',
        kabuller: <String>['interested']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.coktanSecmeli, altKonu: kCogulOlmaz,
        soru: 'Hangisi dogru?',
        secenekler: <String>['Bigs houses', 'Big houses', 'Big housies'],
        kabuller: <String>['Big houses']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.coktanSecmeli, altKonu: kSira,
        soru: 'Hangisi dogru sirada?',
        secenekler: <String>['a red old car', 'an old red car', 'a car old red'],
        kabuller: <String>['an old red car']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.dogruYanlis, altKonu: kVeryToo,
        soru: '"This coffee is hot very." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.kelimeDizme, altKonu: kIsimdenOnce,
        soru: 'Dizin: car / a / have / red / I',
        kabuller: <String>['I have a red car.', 'I have a red car']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.boslukDoldurma, altKonu: kVeryToo,
        soru: 'The room is ___ small. Nobody can sleep here.',
        kabuller: <String>['too']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.dogruYanlis, altKonu: kIngEd,
        soru: '"I am boring." ile "Sikildim." ayni mi?',
        secenekler: <String>['Evet', 'Hayir'], kabuller: <String>['Hayir']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kIsimdenOnce,
        soru: 'Hangisi dogru?',
        secenekler: <String>['a book new', 'a new book', 'new a book'],
        kabuller: <String>['a new book']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kCogulOlmaz,
        soru: 'Hangisi dogru?',
        secenekler: <String>['news books', 'new books', 'new bookes'],
        kabuller: <String>['new books']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kSira,
        soru: 'Hangisi dogru sirada?',
        secenekler: <String>['a small old city', 'an old small city', 'a city small old'],
        kabuller: <String>['a small old city']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kVeryToo,
        soru: 'Kahveyi icemiyorum. It is ___ hot.',
        secenekler: <String>['very', 'too', 'much'], kabuller: <String>['too']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kIngEd,
        soru: 'The work is ___. (yorucu)',
        secenekler: <String>['tired', 'tiring', 'tire'], kabuller: <String>['tiring']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kBeIle,
        soru: 'These books ___ new.', kabuller: <String>['are']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kBeIle,
        soru: 'The car ___ red.', kabuller: <String>['is']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kVeryToo,
        soru: 'She is ___ kind. Everybody likes her.', kabuller: <String>['very']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kCogulOlmaz,
        soru: '"Reds cars are expensive." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kBeIle,
        soru: '"The car red." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kIngEd,
        soru: '"The film is bored." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kSira,
        soru: 'Dizin: car / a / new / beautiful / has / She',
        kabuller: <String>['She has a beautiful new car.', 'She has a beautiful new car']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kBeIle,
        soru: 'Ingilizceye cevirin: O guzel.',
        kabuller: <String>['She is beautiful.', 'He is beautiful.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kCogulOlmaz,
        soru: 'Ingilizceye cevirin: Buyuk evler pahali.',
        kabuller: <String>['Big houses are expensive.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kIngEd,
        soru: 'Ingilizceye cevirin: Sikildim.',
        kabuller: <String>['I am bored.']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Sifat isimden once',
        aciklama: 'Turkce ile ayni. Artikel en basa gecer.',
        ornek: 'a red car (a car red DEGIL)'),
      OzetMaddesi(baslik: 'Sifat COGUL OLMAZ',
        aciklama: 'Yalnizca isim cogul olur. Istisna yoktur.',
        ornek: 'red cars (reds cars DEGIL)'),
      OzetMaddesi(baslik: 'Yuklem konumunda to be ZORUNLU',
        aciklama: 'Turkcede "Araba kirmizi" yeterli, Ingilizcede degil.',
        ornek: 'The car is red. · She is beautiful.'),
      OzetMaddesi(baslik: 'Sifat sirasi',
        aciklama: 'GORUS -> BOYUT -> YAS -> RENK -> ISIM.',
        ornek: 'a nice big old red car'),
      OzetMaddesi(baslik: 'very / too',
        aciklama: 'very = cok (notr) · too = fazla (olumsuz). Ikisi de sifattan once.',
        ornek: 'very hot (guzel) · too hot (icemem)'),
      OzetMaddesi(baslik: '-ing / -ed sifatlar',
        aciklama: 'Sey -> -ing · Kisi -> -ed.',
        ornek: 'The film is boring. · I am bored.'),
    ],
  );
}
