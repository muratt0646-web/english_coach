/// EN-A1-021 — Isaret Sifatlari: this / that / these / those
/// SADECE VERI.
library;

import '../model/ders_sablonu.dart';

class DersEnA1021 {
  const DersEnA1021._();

  static const String kThis = 'this (yakin tekil)';
  static const String kThat = 'that (uzak tekil)';
  static const String kThese = 'these (yakin cogul)';
  static const String kThose = 'those (uzak cogul)';
  static const String kUyum = 'Isim ile uyum';
  static const String kZamir = 'Tek basina kullanim';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A1-021',
    baslik: 'Isaret Sifatlari — this / that / these / those',
    seviye: 'A1', konu: 'ISM', tahminiDk: 30,
    onKosullar: <String>['EN-A1-020'],
    girisMetni:
        'Turkcede iki kelime yeter: BU ve SU/O. Cogul olunca da degismezler: '
        '"bu kitap", "bu kitaplar".\n\n'
        'Ingilizcede DORT kelime vardir, cunku hem UZAKLIK hem SAYI '
        'isaretlenir:\n\n'
        '        YAKIN      UZAK\n'
        'TEKIL   this       that\n'
        'COGUL   these      those\n\n'
        'Yani "bu kitaplar" derken "this books" diyemezsiniz — cogul '
        'oldugu icin "these books" olmalidir.\n\n'
        'Bu ders dort kelimeyi ezberletmez; hangisinin NEDEN secildigini '
        'iki soruyla gosterir: Yakin mi? Tekil mi?',
    kazanimlar: <String>[
      'Yakinlik ve sayiya gore dogru isareti secebilmek',
      'this/that ile tekil, these/those ile cogul isim kullanmak',
      'Isim olmadan tek basina kullanabilmek (This is my book.)',
      'Turkcedeki tek bicimin yaniltmasindan kacinmak',
      'is / are ile uyumu kurabilmek',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'G1', baslik: 'Iki soru, dort cevap',
        govde: 'Secim yaparken sirayla iki soru sorun:\n\n'
            '1. Yakin mi, uzak mi?\n'
            '2. Tekil mi, cogul mu?\n\n'
            '        YAKIN      UZAK\n'
            'TEKIL   this       that\n'
            'COGUL   these      those\n\n'
            'Turkcede yalnizca birinci soru sorulur; ikincisi Ingilizceye '
            'ozgudur ve unutulan yer tam burasidir.',
        turkceKarsilastirma: 'Bu kitap    ->  this book\n'
            'Bu kitaplar ->  these books  (this books DEGIL)'),
      AnlatimBlogu(kod: 'G2', baslik: 'this — yakin ve tekil',
        govde: 'Elinizde tuttugunuz, yaninizda duran, az once soz ettiginiz '
            'TEK bir sey icin.\n\n'
            'This book is new.\n'
            'This is my friend.\n'
            'This morning I woke up early.\n\n'
            'Zaman ifadelerinde de "yakin" anlam tasir: this week, this year.',
        turkceKarsilastirma: 'Bu kitap yeni.  ->  This book is new.'),
      AnlatimBlogu(kod: 'G3', baslik: 'that — uzak ve tekil',
        govde: 'Uzaktaki, gorunen ama erisilmeyen TEK bir sey icin.\n\n'
            'That car is expensive.\n'
            'That is my house.\n\n'
            'Gecmis zaman ifadelerinde de kullanilir: that day, that year.\n\n'
            'Turkcede hem "su" hem "o" bu isi gorur; Ingilizcede tek '
            'kelimedir.',
        turkceKarsilastirma: 'Su araba pahali.  ->  That car is expensive.'),
      AnlatimBlogu(kod: 'G4', baslik: 'these ve those — cogul',
        govde: 'Isim cogul ise isaret de cogul olur:\n\n'
            'these books · these children · these people\n'
            'those cars · those women · those days\n\n'
            'Isim ile isaret AYNI sayida olmak zorundadir. "this books" '
            'veya "these book" olmaz.\n\n'
            'Duzensiz cogullar da bu kurala uyar: these children (this '
            'children DEGIL).',
        turkceKarsilastirma: 'Bu kitaplar  ->  these books\n'
            'Su arabalar  ->  those cars'),
      AnlatimBlogu(kod: 'G5', baslik: 'is mi are mi?',
        govde: 'Isaret sifatinin sayisi to be fiilini de belirler:\n\n'
            'This book IS new.      -> tekil\n'
            'These books ARE new.   -> cogul\n'
            'That car IS expensive.\n'
            'Those cars ARE expensive.\n\n'
            'Yani bir hata zincirleme olur: "these book is" ucunde birden '
            'yanlistir.',
        turkceKarsilastirma: 'Bu kitaplar yeni.  ->  These books are new.'),
      AnlatimBlogu(kod: 'G6', baslik: 'Isim olmadan tek basina',
        govde: 'Dort kelime isim olmadan da kullanilir; o zaman "bu sey", '
            '"sunlar" anlamina gelir:\n\n'
            'This is my book.       (Bu benim kitabim.)\n'
            'That is her car.\n'
            'These are my friends.\n'
            'Those are old houses.\n\n'
            'Dikkat: "This is books." yanlistir. Tekil isaret + cogul isim '
            'olmaz.\n\n'
            'Kisi tanitirken de kullanilir: This is Ali.',
        turkceKarsilastirma: 'Bu benim kitabim.  ->  This is my book.\n'
            'Bunlar arkadaslarim. ->  These are my friends.'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['book', 'this book', 'This book is new.'],
        turkce: 'Bu kitap yeni.', not: 'Yakin + tekil -> this.'),
      AdimliOrnek(adimlar: <String>['books', 'these books', 'These books are new.'],
        turkce: 'Bu kitaplar yeni.', not: 'Cogul -> these VE are.'),
      AdimliOrnek(adimlar: <String>['car', 'that car', 'That car is expensive.'],
        turkce: 'Su araba pahali.', not: 'Uzak + tekil -> that.'),
      AdimliOrnek(adimlar: <String>['cars', 'those cars', 'Those cars are expensive.'],
        turkce: 'Su arabalar pahali.', not: 'Uzak + cogul -> those.'),
      AdimliOrnek(adimlar: <String>['This', 'This is', 'This is my friend.'],
        turkce: 'Bu benim arkadasim.', not: 'Isim olmadan tek basina.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Bu kitaplar benim.', 'Yakin mi? Evet', 'Cogul mu? Evet -> these',
        'These books are mine.'],
        turkce: 'Iki soru, tek cevap.', not: 'this books YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Su cocuklar mutlu.', 'Uzak + cogul -> those', 'children = cogul',
        'Those children are happy.'],
        turkce: 'Duzensiz cogul da kurala uyar.', not: 'that children YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Bunlar arkadaslarim.', 'Isim yok -> tek basina', 'cogul -> These are',
        'These are my friends.'],
        turkce: 'Isimsiz kullanim.', not: 'This is my friends YANLIS.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'This book is new.', turkce: 'Bu kitap yeni.', dogruMu: true, altKonu: kThis),
      OrnekCumle(ingilizce: 'This car is fast.', turkce: 'Bu araba hizli.', dogruMu: true, altKonu: kThis),
      OrnekCumle(ingilizce: 'This is my friend.', turkce: 'Bu benim arkadasim.', dogruMu: true, altKonu: kZamir),
      OrnekCumle(ingilizce: 'This morning is quiet.', turkce: 'Bu sabah sessiz.', dogruMu: true, altKonu: kThis),
      OrnekCumle(ingilizce: 'This is Ali.', turkce: 'Bu Ali.', dogruMu: true, altKonu: kZamir),
      OrnekCumle(ingilizce: 'This week is busy.', turkce: 'Bu hafta yogun.', dogruMu: true, altKonu: kThis),
      OrnekCumle(ingilizce: 'That car is expensive.', turkce: 'Su araba pahali.', dogruMu: true, altKonu: kThat),
      OrnekCumle(ingilizce: 'That house is old.', turkce: 'Su ev eski.', dogruMu: true, altKonu: kThat),
      OrnekCumle(ingilizce: 'That is her book.', turkce: 'Su onun kitabi.', dogruMu: true, altKonu: kZamir),
      OrnekCumle(ingilizce: 'That man is a doctor.', turkce: 'Su adam doktor.', dogruMu: true, altKonu: kThat),
      OrnekCumle(ingilizce: 'That was a good day.', turkce: 'Guzel bir gundu.', dogruMu: true, altKonu: kThat),
      OrnekCumle(ingilizce: 'These books are new.', turkce: 'Bu kitaplar yeni.', dogruMu: true, altKonu: kThese),
      OrnekCumle(ingilizce: 'These children are happy.', turkce: 'Bu cocuklar mutlu.', dogruMu: true, altKonu: kThese),
      OrnekCumle(ingilizce: 'These are my friends.', turkce: 'Bunlar arkadaslarim.', dogruMu: true, altKonu: kZamir),
      OrnekCumle(ingilizce: 'These apples are fresh.', turkce: 'Bu elmalar taze.', dogruMu: true, altKonu: kThese),
      OrnekCumle(ingilizce: 'These days are long.', turkce: 'Bu gunler uzun.', dogruMu: true, altKonu: kThese),
      OrnekCumle(ingilizce: 'These people work here.', turkce: 'Bu insanlar burada calisir.', dogruMu: true, altKonu: kThese),
      OrnekCumle(ingilizce: 'Those cars are expensive.', turkce: 'Su arabalar pahali.', dogruMu: true, altKonu: kThose),
      OrnekCumle(ingilizce: 'Those women are teachers.', turkce: 'Su kadinlar ogretmen.', dogruMu: true, altKonu: kThose),
      OrnekCumle(ingilizce: 'Those are old houses.', turkce: 'Sunlar eski evler.', dogruMu: true, altKonu: kZamir),
      OrnekCumle(ingilizce: 'Those boxes are heavy.', turkce: 'Su kutular agir.', dogruMu: true, altKonu: kThose),
      OrnekCumle(ingilizce: 'Those days were difficult.', turkce: 'O gunler zordu.', dogruMu: true, altKonu: kThose),
      OrnekCumle(ingilizce: 'This is my book.', turkce: 'Bu benim kitabim.', dogruMu: true, altKonu: kZamir),
      OrnekCumle(ingilizce: 'Is this your bag?', turkce: 'Bu senin cantan mi?', dogruMu: true, altKonu: kZamir),
      OrnekCumle(ingilizce: 'Are these your keys?', turkce: 'Bunlar senin anahtarlarin mi?', dogruMu: true, altKonu: kZamir),
      OrnekCumle(ingilizce: 'This shop is open.', turkce: 'Bu dukkan acik.', dogruMu: true, altKonu: kUyum),
      OrnekCumle(ingilizce: 'These shops are open.', turkce: 'Bu dukkanlar acik.', dogruMu: true, altKonu: kUyum),
      OrnekCumle(ingilizce: 'That student is late.', turkce: 'Su ogrenci gec kaldi.', dogruMu: true, altKonu: kUyum),
      OrnekCumle(ingilizce: 'Those students are late.', turkce: 'Su ogrenciler gec kaldi.', dogruMu: true, altKonu: kUyum),
      OrnekCumle(ingilizce: 'I like this city.', turkce: 'Bu sehri severim.', dogruMu: true, altKonu: kThis),

      OrnekCumle(ingilizce: 'This books are new.', turkce: 'Bu kitaplar yeni.', dogruMu: false,
        neden: 'Isim cogul ise isaret de cogul olmali. Turkcede "bu" '
            'degismedigi icin unutuluyor.', dogruBicim: 'These books are new.',
        hataTuru: 'GRAMER_HATASI', altKonu: kUyum),
      OrnekCumle(ingilizce: 'These book is new.', turkce: 'Bu kitap yeni.', dogruMu: false,
        neden: '"these" cogul isaretidir; tekil isimle kullanilmaz.',
        dogruBicim: 'This book is new.', hataTuru: 'GRAMER_HATASI', altKonu: kUyum),
      OrnekCumle(ingilizce: 'That cars are expensive.', turkce: 'Su arabalar pahali.', dogruMu: false,
        neden: 'Cogul isim "those" ister.', dogruBicim: 'Those cars are expensive.',
        hataTuru: 'GRAMER_HATASI', altKonu: kUyum),
      OrnekCumle(ingilizce: 'Those car is expensive.', turkce: 'Su araba pahali.', dogruMu: false,
        neden: '"those" cogul isaretidir; tekil isimle olmaz.',
        dogruBicim: 'That car is expensive.', hataTuru: 'GRAMER_HATASI', altKonu: kUyum),
      OrnekCumle(ingilizce: 'This children are happy.', turkce: 'Bu cocuklar mutlu.', dogruMu: false,
        neden: '"children" duzensiz de olsa COGULDUR; "these" gerekir.',
        dogruBicim: 'These children are happy.', hataTuru: 'GRAMER_HATASI', altKonu: kThese),
      OrnekCumle(ingilizce: 'That women are teachers.', turkce: 'Su kadinlar ogretmen.', dogruMu: false,
        neden: '"women" cogul; "those" gerekir.', dogruBicim: 'Those women are teachers.',
        hataTuru: 'GRAMER_HATASI', altKonu: kThose),
      OrnekCumle(ingilizce: 'These books is new.', turkce: 'Bu kitaplar yeni.', dogruMu: false,
        neden: 'Cogul ozne "are" alir. Isaret cogul olunca fiil de cogul olur.',
        dogruBicim: 'These books are new.', hataTuru: 'GRAMER_HATASI', altKonu: kUyum),
      OrnekCumle(ingilizce: 'This book are new.', turkce: 'Bu kitap yeni.', dogruMu: false,
        neden: 'Tekil ozne "is" alir.', dogruBicim: 'This book is new.',
        hataTuru: 'GRAMER_HATASI', altKonu: kUyum),
      OrnekCumle(ingilizce: 'Those cars is expensive.', turkce: 'Su arabalar pahali.', dogruMu: false,
        neden: 'Cogul ozne "are" alir.', dogruBicim: 'Those cars are expensive.',
        hataTuru: 'GRAMER_HATASI', altKonu: kUyum),
      OrnekCumle(ingilizce: 'This is my friends.', turkce: 'Bunlar arkadaslarim.', dogruMu: false,
        neden: 'Tekil isaret + cogul isim olmaz. Cogulda "These are" kullanilir.',
        dogruBicim: 'These are my friends.', hataTuru: 'GRAMER_HATASI', altKonu: kZamir),
      OrnekCumle(ingilizce: 'These is my book.', turkce: 'Bu benim kitabim.', dogruMu: false,
        neden: 'Tekil icin "This is" kullanilir.', dogruBicim: 'This is my book.',
        hataTuru: 'GRAMER_HATASI', altKonu: kZamir),
      OrnekCumle(ingilizce: 'Those is old houses.', turkce: 'Sunlar eski evler.', dogruMu: false,
        neden: '"those" cogul; fiil "are" olmali.', dogruBicim: 'Those are old houses.',
        hataTuru: 'GRAMER_HATASI', altKonu: kZamir),
      OrnekCumle(ingilizce: 'This are my friend.', turkce: 'Bu benim arkadasim.', dogruMu: false,
        neden: 'Tekil isaret "is" alir.', dogruBicim: 'This is my friend.',
        hataTuru: 'GRAMER_HATASI', altKonu: kZamir),
      OrnekCumle(ingilizce: 'Is these your keys?', turkce: 'Bunlar senin anahtarlarin mi?', dogruMu: false,
        neden: 'Soruda da uyum korunur: cogul -> Are these.',
        dogruBicim: 'Are these your keys?', hataTuru: 'GRAMER_HATASI', altKonu: kZamir),
      OrnekCumle(ingilizce: 'Are this your bag?', turkce: 'Bu senin cantan mi?', dogruMu: false,
        neden: 'Tekil -> Is this.', dogruBicim: 'Is this your bag?',
        hataTuru: 'GRAMER_HATASI', altKonu: kZamir),
      OrnekCumle(ingilizce: 'This apples are fresh.', turkce: 'Bu elmalar taze.', dogruMu: false,
        neden: 'Cogul isim -> these.', dogruBicim: 'These apples are fresh.',
        hataTuru: 'GRAMER_HATASI', altKonu: kThese),
      OrnekCumle(ingilizce: 'These people works here.', turkce: 'Bu insanlar burada calisir.', dogruMu: false,
        neden: '"people" cogul bir isimdir; fiil -s almaz.',
        dogruBicim: 'These people work here.', hataTuru: 'GRAMER_HATASI', altKonu: kUyum),
      OrnekCumle(ingilizce: 'Those boxs are heavy.', turkce: 'Su kutular agir.', dogruMu: false,
        neden: '-x ile biten isim "-es" alir: boxes.', dogruBicim: 'Those boxes are heavy.',
        hataTuru: 'YAZIM_HATASI', altKonu: kThose),
      OrnekCumle(ingilizce: 'I like these city.', turkce: 'Bu sehri severim.', dogruMu: false,
        neden: 'Tekil isim -> this.', dogruBicim: 'I like this city.',
        hataTuru: 'GRAMER_HATASI', altKonu: kUyum),
      OrnekCumle(ingilizce: 'That student are late.', turkce: 'Su ogrenci gec kaldi.', dogruMu: false,
        neden: 'Tekil ozne "is" alir.', dogruBicim: 'That student is late.',
        hataTuru: 'GRAMER_HATASI', altKonu: kUyum),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kUyum,
        soru: '___ books are new. (yakin)',
        secenekler: <String>['This', 'These', 'That'],
        kabuller: <String>['These'], geriDonusKodu: 'G4',
        aciklama: 'Cogul isim -> these.'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kThis,
        soru: '___ book is new. (yakin)',
        secenekler: <String>['This', 'These', 'Those'],
        kabuller: <String>['This'], geriDonusKodu: 'G2'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kThose,
        soru: '___ cars are expensive. (uzak)',
        secenekler: <String>['That', 'This', 'Those'],
        kabuller: <String>['Those'], geriDonusKodu: 'G4'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kUyum,
        soru: 'These books ___ new.', secenekler: <String>['is', 'are', 'am'],
        kabuller: <String>['are'], geriDonusKodu: 'G5',
        aciklama: 'Cogul -> are.'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kZamir,
        soru: 'Hangisi dogru?',
        secenekler: <String>['This is my friends.', 'These are my friends.', 'These is my friends.'],
        kabuller: <String>['These are my friends.'], geriDonusKodu: 'G6'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kThis,
        soru: '___ car is fast. (yakin, tekil)', kabuller: <String>['This', 'this']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kThat,
        soru: '___ house is old. (uzak, tekil)', kabuller: <String>['That', 'that']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kThese,
        soru: '___ apples are fresh. (yakin, cogul)', kabuller: <String>['These', 'these']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kThose,
        soru: '___ women are teachers. (uzak, cogul)', kabuller: <String>['Those', 'those']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kUyum,
        soru: 'Those cars ___ expensive.', kabuller: <String>['are']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kThese,
        soru: '"children" ile hangisi kullanilir? (yakin)',
        secenekler: <String>['this', 'these', 'that'], kabuller: <String>['these']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kZamir,
        soru: '"Bunlar arkadaslarim." nasil baslar?',
        secenekler: <String>['This is', 'These are', 'These is'],
        kabuller: <String>['These are']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kThese,
        soru: 'Dizin: new / These / are / books',
        kabuller: <String>['These books are new.', 'These books are new']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kZamir,
        soru: 'Dizin: my / This / book / is',
        kabuller: <String>['This is my book.', 'This is my book']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kUyum,
        soru: '"This books are new." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kThese, turkce: 'Bu kitaplar yeni.',
        kabuller: <String>['These books are new.']),
      SerbestGorev(kod: 'SU-2', altKonu: kThat, turkce: 'Su ev eski.',
        kabuller: <String>['That house is old.']),
      SerbestGorev(kod: 'SU-3', altKonu: kZamir, turkce: 'Bu benim kitabim.',
        kabuller: <String>['This is my book.']),
      SerbestGorev(kod: 'SU-4', altKonu: kThose, turkce: 'Su arabalar pahali.',
        kabuller: <String>['Those cars are expensive.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kThese,
        soru: '___ days are long. (yakin, cogul)', kabuller: <String>['These', 'these']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kThis,
        soru: '___ shop is open. (yakin, tekil)', kabuller: <String>['This', 'this']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kUyum,
        soru: 'This book ___ new.', kabuller: <String>['is']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.boslukDoldurma, altKonu: kUyum,
        soru: 'Those students ___ late.', kabuller: <String>['are']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.coktanSecmeli, altKonu: kZamir,
        soru: 'Hangisi dogru?',
        secenekler: <String>['Are this your bag?', 'Is this your bag?', 'Is these your bag?'],
        kabuller: <String>['Is this your bag?']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kThese,
        soru: '"This children are happy." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kThose,
        soru: 'Dizin: heavy / boxes / Those / are',
        kabuller: <String>['Those boxes are heavy.', 'Those boxes are heavy']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.eslestirme, altKonu: kThat,
        soru: 'Uzak ve TEKIL bir sey icin hangisi?',
        secenekler: <String>['this', 'that', 'those'], kabuller: <String>['that']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kThis,
        soru: '___ morning is quiet.', secenekler: <String>['This', 'These', 'Those'],
        kabuller: <String>['This']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kThat,
        soru: '___ man is a doctor. (uzak)', secenekler: <String>['This', 'That', 'Those'],
        kabuller: <String>['That']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kThese,
        soru: '___ people work here. (yakin)', secenekler: <String>['This', 'These', 'That'],
        kabuller: <String>['These']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kThose,
        soru: '___ boxes are heavy. (uzak)', secenekler: <String>['That', 'This', 'Those'],
        kabuller: <String>['Those']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kUyum,
        soru: 'These shops ___ open.', secenekler: <String>['is', 'are', 'be'],
        kabuller: <String>['are']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kUyum,
        soru: 'That student ___ late.', kabuller: <String>['is']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kThese,
        soru: '___ apples are fresh. (yakin, cogul)', kabuller: <String>['These', 'these']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kZamir,
        soru: '___ are my friends. (yakin, cogul)', kabuller: <String>['These', 'these']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kUyum,
        soru: '"These book is new." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kZamir,
        soru: '"This is my friends." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kThose,
        soru: '"That women are teachers." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kThese,
        soru: 'Dizin: happy / children / These / are',
        kabuller: <String>['These children are happy.', 'These children are happy']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kThese,
        soru: 'Ingilizceye cevirin: Bu kitaplar yeni.',
        kabuller: <String>['These books are new.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kThat,
        soru: 'Ingilizceye cevirin: Su araba pahali.',
        kabuller: <String>['That car is expensive.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kZamir,
        soru: 'Ingilizceye cevirin: Bu benim kitabim.',
        kabuller: <String>['This is my book.']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Iki soru sorun',
        aciklama: 'Yakin mi uzak mi? Tekil mi cogul mu? Cevap dortten biridir.',
        ornek: 'this · that · these · those'),
      OzetMaddesi(baslik: 'this / that — tekil',
        aciklama: 'this yakin, that uzak. Tekil isimle kullanilir.',
        ornek: 'This book · That car'),
      OzetMaddesi(baslik: 'these / those — cogul',
        aciklama: 'these yakin, those uzak. Cogul isimle kullanilir.',
        ornek: 'These books · Those cars'),
      OzetMaddesi(baslik: 'Isim ile uyum ZORUNLU',
        aciklama: 'Turkcede "bu" degismez; Ingilizcede degisir.',
        ornek: 'this books (X) -> these books'),
      OzetMaddesi(baslik: 'is / are uyumu',
        aciklama: 'Isaret tekilse is, cogulsa are gelir.',
        ornek: 'This book is new. · These books are new.'),
      OzetMaddesi(baslik: 'Isim olmadan kullanim',
        aciklama: 'Tek basina "bu sey / bunlar" anlami tasir.',
        ornek: 'This is my book. · These are my friends.'),
    ],
  );
}
