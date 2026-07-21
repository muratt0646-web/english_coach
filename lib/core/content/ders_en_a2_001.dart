/// EN-A2-001 — Past Simple: was / were
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnA2001 {
  const DersEnA2001._();

  static const String kWas = 'was (I / he / she / it)';
  static const String kWere = 'were (you / we / they)';
  static const String kOlumsuz = 'Olumsuz (was not / were not)';
  static const String kSoru = 'Soru ve kisa cevap';
  static const String kZaman = 'Zaman ifadeleri';
  static const String kSimdiGecmis = 'Simdiki ile karsilastirma';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A2-001',
    baslik: 'Past Simple — was / were',
    seviye: 'A2', konu: 'ZAM', tahminiDk: 35,
    onKosullar: <String>['EN-A1-002', 'EN-A1-004'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'Turkce tek bir kelimeye cok is yukler:\n\n'
        '  "yorgundum"  =  yorgun + gecmis + BEN\n'
        '   tek kelime, uc bilgi\n\n'
        'Ingilizce her isi AYRI kelimeye verir:\n\n'
        '  "I was tired"  =  BEN + gecmis-olmak + yorgun\n'
        '   uc kelime, uc bilgi\n\n'
        'Bu, Ingilizcenin temel mantigidir: BIR KELIME BIR IS.\n\n'
        'Bu yuzden Ingilizce cumle kurarken once isleri ayirin:\n'
        'Kim? Ne zaman? Ne durumda?\n\n'
        'Bu derste "olmak" fiilinin gecmis bicimini ogreneceksin. '
        'Ilginc bir ayrinti var: Ingilizce gecmis zamanda artik kisiye '
        'gore degismez — TEK ISTISNA disinda. O istisna tam olarak bu '
        'derstir.',
    kazanimlar: <String>[
      'Turkcedeki tek kelimeyi Ingilizcede uc parcaya ayirabilmek',
      'was ve were arasindaki secimi yapabilmek',
      'Olumsuz ve soru bicimlerini kurabilmek',
      'Zaman ifadelerini cumlede dogru yere koymak',
      'Simdiki ile gecmis bicimi karsilastirabilmek',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'L1', baslik: 'Bir kelime bir is',
        govde: 'Turkce eklemeli bir dildir: bilgileri tek kelimeye yigar.\n\n'
            '  yorgun-DU-M   -> durum + zaman + kisi\n\n'
            'Ingilizce ayirir. Her bilgi kendi kelimesinde durur:\n\n'
            '  I    was    tired\n'
            '  kisi zaman  durum\n\n'
            'DUSUNME ALISKANLIGI: Turkce cumleyi cevirirken once '
            'PARCALARINA ayirin.\n\n'
            '"Evdeydiler" -> Kim: onlar · Ne zaman: gecmis · Nerede: evde\n'
            '            -> They + were + at home',
        turkceKarsilastirma: 'Yorgundum.   ->  I was tired.\n'
            'Evdeydiler.  ->  They were at home.'),
      AnlatimBlogu(kod: 'L2', baslik: 'was mi were mi?',
        govde: 'Secim ozneye gore yapilir:\n\n'
            '  I / he / she / it     ->  WAS\n'
            '  you / we / they       ->  WERE\n\n'
            'Tekil isim was, cogul isim were alir:\n'
            '  The book WAS old. · The books WERE old.\n\n'
            'NEDEN boyle? Cunku "am/is" birlesip "was" olmus, "are" ise '
            '"were" olmus. Yani A1\u2019deki bolunme gecmise tasinmis, '
            'sadece sadelesmis.\n\n'
            '  am -> was      is -> was      are -> were',
        turkceKarsilastirma: 'O yorgundu.     ->  He was tired.\n'
            'Onlar yorgundu. ->  They were tired.'),
      AnlatimBlogu(kod: 'L3', baslik: 'Ingilizcenin sadelesme egilimi',
        govde: 'Ilginc bir gozlem: Ingilizce gecmis zamanda kisiye gore '
            'DEGISMEZ.\n\n'
            '  I worked · you worked · he worked · they worked\n'
            '  Hepsi ayni.\n\n'
            'Simdiki zamanda tek bir kalinti vardir: he/she/it -s.\n'
            'Gecmiste ise TEK bir kalinti vardir: was / were.\n\n'
            'Yani dil zamanla sadelesiyor ve "to be" en eski fiil oldugu '
            'icin eski bicimlerini korumus.\n\n'
            'PRATIK SONUC: Gecmis zamanda yalnizca to be\u2019yi dusunun; '
            'diger fiillerde kisi hic onemli degil.',
        turkceKarsilastirma: 'Turkcede 6 kisi eki vardir.\n'
            'Ingilizce gecmiste yalnizca 2 bicim: was / were.'),
      AnlatimBlogu(kod: 'L4', baslik: 'Olumsuz: not yine ortada',
        govde: 'Kural A1\u2019dekiyle AYNI: "not" to be\u2019den hemen sonra.\n\n'
            '  I was not tired.\n'
            '  They were not at home.\n\n'
            'Kisaltmalar: wasn\u2019t · weren\u2019t\n\n'
            'Turkcede olumsuzluk yine sona gelir ("yorgun degildim"), '
            'Ingilizcede ortaya girer. Bu fark A1\u2019de ogrendiginiz '
            'kalibin aynisi — yeni bir sey yok, yalnizca zaman degisti.',
        turkceKarsilastirma: 'Yorgun degildim.  ->  I was not tired.\n'
            '"degil" sonda      ->  "not" ortada'),
      AnlatimBlogu(kod: 'L5', baslik: 'Soru: sira yine ters',
        govde: 'Yine A1 kalibi: to be basa gecer.\n\n'
            '  You were at home.  ->  Were you at home?\n'
            '  She was tired.     ->  Was she tired?\n\n'
            'Kisa cevap:\n'
            '  Yes, I was. / No, I was not.\n'
            '  Yes, they were. / No, they were not.\n\n'
            'Soru kelimesiyle:\n'
            '  Where were you? · Why was he late?\n\n'
            'DUSUNME NOTU: Ingilizcede soru sormak icin kelime EKLENMEZ, '
            'SIRA degistirilir. Turkce tam tersi yapar: sira sabit kalir, '
            'ek gelir ("mi").',
        turkceKarsilastirma: 'Evde miydin?  ->  Were you at home?\n'
            'Ek "mi"        ->  SIRA degisimi'),
      AnlatimBlogu(kod: 'L6', baslik: 'Zaman ifadeleri nereye gelir?',
        govde: 'Gecmis zaman ifadeleri genellikle cumlenin SONUNA gelir:\n\n'
            '  yesterday · last week · last year · two days ago\n'
            '  in 2020 · at that time\n\n'
            '  I was at home yesterday.\n'
            '  They were here last week.\n\n'
            'Vurgu icin basa da alinabilir:\n'
            '  Yesterday I was at home.\n\n'
            'Ama ORTAYA girmez: "I was yesterday at home." yanlistir.\n\n'
            'DUSUNME NOTU: Ingilizce cumlenin merkezi OZNE + FIIL\u2019dir. '
            'Zaman ve yer bilgileri cevreye dizilir, araya girmez.',
        turkceKarsilastirma: 'Dun evdeydim.  ->  I was at home yesterday.\n'
            'Turkcede zaman basta, Ingilizcede genellikle sonda.'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['yorgundum', 'I + was + tired', 'I was tired.'],
        turkce: 'Tek kelime uc parcaya ayrildi.', not: 'Bir kelime bir is.'),
      AdimliOrnek(adimlar: <String>['They', 'They were', 'They were at home.'],
        turkce: 'Onlar evdeydi.', not: 'Cogul ozne -> were.'),
      AdimliOrnek(adimlar: <String>['She was tired.', 'She was not', 'She was not tired.'],
        turkce: 'O yorgun degildi.', not: '"not" was\u2019dan sonra.'),
      AdimliOrnek(adimlar: <String>['You were at home.', 'Were you', 'Were you at home?'],
        turkce: 'Evde miydin?', not: 'Soruda sira ters doner.'),
      AdimliOrnek(adimlar: <String>['I was at home', 'yesterday', 'I was at home yesterday.'],
        turkce: 'Dun evdeydim.', not: 'Zaman ifadesi sona geldi.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Dun hastaydim.', 'Kim? -> I', 'Ne zaman? -> gecmis -> was',
        'Ne durumda? -> ill', 'I was ill yesterday.'],
        turkce: 'Parcalara ayirma alistirmasi.',
        not: 'Once isleri ayir, sonra diz.'),
      AdimliOrnek(adimlar: <String>[
        'Cocuklar okulda degildi.', 'Kim? -> The children (cogul)',
        'were + not', 'The children were not at school.'],
        turkce: 'Cogul ozne + olumsuz.', not: 'was not YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Neredeydin?', 'Soru kelimesi: Where', 'Ozne you -> were',
        'Where were you?'],
        turkce: 'Soru kelimesi + be + ozne.', not: 'Where you were YANLIS.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I was tired yesterday.', turkce: 'Dun yorgundum.', dogruMu: true, altKonu: kWas),
      OrnekCumle(ingilizce: 'I was at home last night.', turkce: 'Dun gece evdeydim.', dogruMu: true, altKonu: kWas),
      OrnekCumle(ingilizce: 'He was a teacher.', turkce: 'O ogretmendi.', dogruMu: true, altKonu: kWas),
      OrnekCumle(ingilizce: 'She was very kind.', turkce: 'O cok kibardi.', dogruMu: true, altKonu: kWas),
      OrnekCumle(ingilizce: 'It was cold last week.', turkce: 'Gecen hafta soguktu.', dogruMu: true, altKonu: kWas),
      OrnekCumle(ingilizce: 'The book was interesting.', turkce: 'Kitap ilginctdi.', dogruMu: true, altKonu: kWas),
      OrnekCumle(ingilizce: 'My father was at work.', turkce: 'Babam isteydi.', dogruMu: true, altKonu: kWas),
      OrnekCumle(ingilizce: 'You were right.', turkce: 'Haklıydın.', dogruMu: true, altKonu: kWere),
      OrnekCumle(ingilizce: 'We were at school.', turkce: 'Okuldaydik.', dogruMu: true, altKonu: kWere),
      OrnekCumle(ingilizce: 'They were students.', turkce: 'Onlar ogrenciydi.', dogruMu: true, altKonu: kWere),
      OrnekCumle(ingilizce: 'The books were old.', turkce: 'Kitaplar eskiydi.', dogruMu: true, altKonu: kWere),
      OrnekCumle(ingilizce: 'The children were happy.', turkce: 'Cocuklar mutluydu.', dogruMu: true, altKonu: kWere),
      OrnekCumle(ingilizce: 'We were friends.', turkce: 'Arkadastik.', dogruMu: true, altKonu: kWere),
      OrnekCumle(ingilizce: 'I was not tired.', turkce: 'Yorgun degildim.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'He was not at home.', turkce: 'O evde degildi.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'They were not students.', turkce: 'Onlar ogrenci degildi.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: "It wasn't easy.", turkce: 'Kolay degildi.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: "We weren't late.", turkce: 'Gec kalmadik.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'The shop was not open.', turkce: 'Dukkan acik degildi.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'Was she tired?', turkce: 'Yorgun muydu?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Were you at home?', turkce: 'Evde miydin?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Were they students?', turkce: 'Onlar ogrenci miydi?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Yes, I was.', turkce: 'Evet, oyleydim.', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'No, they were not.', turkce: 'Hayir, degillerdi.', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Where were you last night?', turkce: 'Dun gece neredeydin?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'I was at home yesterday.', turkce: 'Dun evdeydim.', dogruMu: true, altKonu: kZaman),
      OrnekCumle(ingilizce: 'They were here last week.', turkce: 'Gecen hafta buradaydilar.', dogruMu: true, altKonu: kZaman),
      OrnekCumle(ingilizce: 'She was in Ankara two days ago.', turkce: 'Iki gun once Ankara\u2019daydi.', dogruMu: true, altKonu: kZaman),
      OrnekCumle(ingilizce: 'Yesterday I was very busy.', turkce: 'Dun cok mesguldum.', dogruMu: true, altKonu: kZaman),
      OrnekCumle(ingilizce: 'He is a teacher now, but he was a student in 2020.', turkce: 'Simdi ogretmen ama 2020\u2019de ogrenciydi.', dogruMu: true, altKonu: kSimdiGecmis),

      OrnekCumle(ingilizce: 'I tired yesterday.', turkce: 'Dun yorgundum.', dogruMu: false,
        neden: 'Turkcede "yorgundum" tek kelimede zamani tasir. Ingilizcede '
            'zaman AYRI bir kelimede durur: "was".',
        dogruBicim: 'I was tired yesterday.', hataTuru: 'EKSIK_KELIME', altKonu: kWas),
      OrnekCumle(ingilizce: 'He teacher.', turkce: 'O ogretmendi.', dogruMu: false,
        neden: 'To be eksik. Gecmiste de ozne ile yuklem arasinda fiil gerekir.',
        dogruBicim: 'He was a teacher.', hataTuru: 'EKSIK_KELIME', altKonu: kWas),
      OrnekCumle(ingilizce: 'I were tired.', turkce: 'Yorgundum.', dogruMu: false,
        neden: '"I" oznesi "was" alir. "were" cogul ozneler icindir.',
        dogruBicim: 'I was tired.', hataTuru: 'GRAMER_HATASI', altKonu: kWas),
      OrnekCumle(ingilizce: 'He were at home.', turkce: 'O evdeydi.', dogruMu: false,
        neden: 'Tekil ozne -> was.', dogruBicim: 'He was at home.',
        hataTuru: 'GRAMER_HATASI', altKonu: kWas),
      OrnekCumle(ingilizce: 'They was students.', turkce: 'Onlar ogrenciydi.', dogruMu: false,
        neden: 'Cogul ozne -> were.', dogruBicim: 'They were students.',
        hataTuru: 'GRAMER_HATASI', altKonu: kWere),
      OrnekCumle(ingilizce: 'We was at school.', turkce: 'Okuldaydik.', dogruMu: false,
        neden: '"we" cogul -> were.', dogruBicim: 'We were at school.',
        hataTuru: 'GRAMER_HATASI', altKonu: kWere),
      OrnekCumle(ingilizce: 'You was right.', turkce: 'Haklıydın.', dogruMu: false,
        neden: '"you" tek kisi olsa bile "were" alir — A1\u2019deki '
            '"are" kuralinin aynisi.', dogruBicim: 'You were right.',
        hataTuru: 'GRAMER_HATASI', altKonu: kWere),
      OrnekCumle(ingilizce: 'The books was old.', turkce: 'Kitaplar eskiydi.', dogruMu: false,
        neden: 'Cogul isim -> were.', dogruBicim: 'The books were old.',
        hataTuru: 'GRAMER_HATASI', altKonu: kWere),
      OrnekCumle(ingilizce: 'I not was tired.', turkce: 'Yorgun degildim.', dogruMu: false,
        neden: '"not" was\u2019dan SONRA gelir.', dogruBicim: 'I was not tired.',
        hataTuru: 'KELIME_SIRASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'He was at home not.', turkce: 'O evde degildi.', dogruMu: false,
        neden: 'Turkcede "degil" sonda, Ingilizcede "not" ORTADA.',
        dogruBicim: 'He was not at home.', hataTuru: 'KELIME_SIRASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'They did not were students.', turkce: 'Onlar ogrenci degildi.', dogruMu: false,
        neden: 'To be varken "did" GIRMEZ; to be kendi olumsuzunu yapar.',
        dogruBicim: 'They were not students.', hataTuru: 'GRAMER_HATASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: "I wasn't not tired.", turkce: 'Yorgun degildim.', dogruMu: false,
        neden: 'Kisaltma zaten "not" iceriyor; iki kez yazilmaz.',
        dogruBicim: "I wasn't tired.", hataTuru: 'FAZLA_KELIME', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'She was tired?', turkce: 'Yorgun muydu?', dogruMu: false,
        neden: 'Soruda SIRA degisir; yalnizca soru isareti yetmez.',
        dogruBicim: 'Was she tired?', hataTuru: 'KELIME_SIRASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'Did you were at home?', turkce: 'Evde miydin?', dogruMu: false,
        neden: 'To be sorusunda "did" kullanilmaz; to be basa gecer.',
        dogruBicim: 'Were you at home?', hataTuru: 'GRAMER_HATASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'Was they students?', turkce: 'Onlar ogrenci miydi?', dogruMu: false,
        neden: 'Soruda da uyum korunur: they -> were.',
        dogruBicim: 'Were they students?', hataTuru: 'GRAMER_HATASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'Where you were last night?', turkce: 'Dun gece neredeydin?', dogruMu: false,
        neden: 'Soru kelimesinden sonra to be gelir: Where WERE you?',
        dogruBicim: 'Where were you last night?', hataTuru: 'KELIME_SIRASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'Yes, I did.', turkce: 'Evet, oyleydim. (Were you tired?)', dogruMu: false,
        neden: 'To be sorusuna to be ile cevap verilir.',
        dogruBicim: 'Yes, I was.', hataTuru: 'KELIME_SECIMI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'I was yesterday at home.', turkce: 'Dun evdeydim.', dogruMu: false,
        neden: 'Zaman ifadesi ozne ile yuklem arasina GIRMEZ; sona veya '
            'basa gelir.', dogruBicim: 'I was at home yesterday.',
        hataTuru: 'KELIME_SIRASI', altKonu: kZaman),
      OrnekCumle(ingilizce: 'They were last week here.', turkce: 'Gecen hafta buradaydilar.', dogruMu: false,
        neden: 'Yer ifadesi zamandan once gelir: here last week.',
        dogruBicim: 'They were here last week.', hataTuru: 'KELIME_SIRASI', altKonu: kZaman),
      OrnekCumle(ingilizce: 'He was a student now.', turkce: 'Simdi ogrenci.', dogruMu: false,
        neden: '"now" simdiki zamandir; gecmis bicimle kullanilmaz.',
        dogruBicim: 'He is a student now.', hataTuru: 'ANLAM_FARKI', altKonu: kSimdiGecmis),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kWas,
        soru: 'Turkcedeki "yorgundum" kac parcaya ayrilir?',
        secenekler: <String>['Bir: tired', 'Iki: I tired', 'Uc: I was tired'],
        kabuller: <String>['Uc: I was tired'], geriDonusKodu: 'L1',
        aciklama: 'Bir kelime bir is.'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kWere,
        soru: 'They ___ students.', secenekler: <String>['was', 'were', 'did'],
        kabuller: <String>['were'], geriDonusKodu: 'L2'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kOlumsuz,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I not was tired.', 'I was not tired.', 'I did not was tired.'],
        kabuller: <String>['I was not tired.'], geriDonusKodu: 'L4'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kSoru,
        soru: '"You were at home." cumlesinin sorusu?',
        secenekler: <String>['You were at home?', 'Were you at home?', 'Did you were at home?'],
        kabuller: <String>['Were you at home?'], geriDonusKodu: 'L5'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kZaman,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I was yesterday at home.', 'I was at home yesterday.', 'I yesterday was at home.'],
        kabuller: <String>['I was at home yesterday.'], geriDonusKodu: 'L6'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kWas,
        soru: 'She ___ very kind.', kabuller: <String>['was']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kWere,
        soru: 'The children ___ happy.', kabuller: <String>['were']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kWere,
        soru: 'You ___ right.', kabuller: <String>['were']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kOlumsuz,
        soru: 'It ___ not easy.', kabuller: <String>['was']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kSoru,
        soru: '___ they students?', kabuller: <String>['Were', 'were']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kWas,
        soru: '"is" fiilinin gecmis bicimi?',
        secenekler: <String>['was', 'were', 'did'], kabuller: <String>['was']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kOlumsuz,
        soru: '"were not" kisaltmasi?',
        secenekler: <String>["wasn't", "weren't", "didn't"], kabuller: <String>["weren't"]),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kZaman,
        soru: 'Dizin: yesterday / at home / I / was',
        kabuller: <String>['I was at home yesterday.', 'I was at home yesterday']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kSoru,
        soru: 'Dizin: you / were / Where',
        kabuller: <String>['Where were you?', 'Where were you']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kSoru,
        soru: '"Did you were at home?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kWas, turkce: 'Dun yorgundum.',
        kabuller: <String>['I was tired yesterday.', 'Yesterday I was tired.']),
      SerbestGorev(kod: 'SU-2', altKonu: kWere, turkce: 'Onlar ogrenciydi.',
        kabuller: <String>['They were students.']),
      SerbestGorev(kod: 'SU-3', altKonu: kOlumsuz, turkce: 'O evde degildi.',
        kabuller: <String>['He was not at home.', 'She was not at home.',
            "He wasn't at home.", "She wasn't at home."]),
      SerbestGorev(kod: 'SU-4', altKonu: kSoru, turkce: 'Dun gece neredeydin?',
        kabuller: <String>['Where were you last night?']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kWas,
        soru: 'My father ___ at work.', kabuller: <String>['was']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kWere,
        soru: 'The books ___ old.', kabuller: <String>['were']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kOlumsuz,
        soru: 'We ___ not late.', kabuller: <String>['were']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.boslukDoldurma, altKonu: kSoru,
        soru: 'Was she tired? — Yes, she ___.', kabuller: <String>['was']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.coktanSecmeli, altKonu: kSimdiGecmis,
        soru: 'Hangisi dogru?',
        secenekler: <String>['He was a student now.', 'He is a student now.', 'He were a student now.'],
        kabuller: <String>['He is a student now.']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kOlumsuz,
        soru: '"They did not were students." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kWere,
        soru: 'Dizin: happy / children / The / were',
        kabuller: <String>['The children were happy.', 'The children were happy']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kZaman,
        soru: 'She was in Ankara two days ___.', kabuller: <String>['ago']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kWas,
        soru: 'It ___ cold last week.', secenekler: <String>['was', 'were', 'did'],
        kabuller: <String>['was']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kWere,
        soru: 'We ___ at school.', secenekler: <String>['was', 'were', 'did'],
        kabuller: <String>['were']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kWere,
        soru: 'You ___ right.', secenekler: <String>['was', 'were', 'is'],
        kabuller: <String>['were']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kSoru,
        soru: '___ she tired?', secenekler: <String>['Was', 'Were', 'Did'],
        kabuller: <String>['Was']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kOlumsuz,
        soru: 'Hangisi dogru?',
        secenekler: <String>["It wasn't easy.", "It didn't easy.", "It not was easy."],
        kabuller: <String>["It wasn't easy."]),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kWas,
        soru: 'The book ___ interesting.', kabuller: <String>['was']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kWere,
        soru: 'They ___ here last week.', kabuller: <String>['were']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kSoru,
        soru: 'Were they students? — No, they ___ not.', kabuller: <String>['were']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kWas,
        soru: '"I were tired." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kSoru,
        soru: '"Did you were at home?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kZaman,
        soru: '"I was yesterday at home." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kOlumsuz,
        soru: 'Dizin: not / home / He / at / was',
        kabuller: <String>['He was not at home.', 'He was not at home']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kWas,
        soru: 'Ingilizceye cevirin: Dun yorgundum.',
        kabuller: <String>['I was tired yesterday.', 'Yesterday I was tired.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kWere,
        soru: 'Ingilizceye cevirin: Cocuklar mutluydu.',
        kabuller: <String>['The children were happy.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kSoru,
        soru: 'Ingilizceye cevirin: Evde miydin?',
        kabuller: <String>['Were you at home?']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Bir kelime bir is',
        aciklama: 'Turkce tek kelimeye yigar, Ingilizce ayirir. Once parcalara ayirin.',
        ornek: 'yorgundum = I + was + tired'),
      OzetMaddesi(baslik: 'was / were secimi',
        aciklama: 'I/he/she/it -> was · you/we/they -> were. am+is birlesti, are ayri kaldi.',
        ornek: 'He was tired. · They were tired.'),
      OzetMaddesi(baslik: 'Gecmiste kisi eki YOK',
        aciklama: 'Diger fiiller gecmiste hic degismez. was/were tek istisnadir.',
        ornek: 'I worked · he worked · they worked'),
      OzetMaddesi(baslik: 'Olumsuz',
        aciklama: '"not" to be\u2019den hemen sonra. did GIRMEZ.',
        ornek: "I was not tired. · They weren't here."),
      OzetMaddesi(baslik: 'Soru',
        aciklama: 'To be basa gecer, kelime eklenmez. did kullanilmaz.',
        ornek: 'Were you at home? — Yes, I was.'),
      OzetMaddesi(baslik: 'Zaman ifadesi nereye',
        aciklama: 'Sona veya basa; ozne ile fiil arasina GIRMEZ.',
        ornek: 'I was at home yesterday.'),
    ],
  );
}
