/// EN-A2-014 — can / could: Yetenek, Izin, Rica
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnA2014 {
  const DersEnA2014._();

  static const String kYalinFiil = 'Fiil YALIN kalir';
  static const String kYetenek = 'Yetenek (can)';
  static const String kIzin = 'Izin isteme';
  static const String kGecmisYetenek = 'could (gecmis yetenek)';
  static const String kKibar = 'could (kibar rica)';
  static const String kAbleTo = 'be able to';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A2-014',
    baslik: 'can / could — Yetenek ve Izin',
    seviye: 'A2', konu: 'YAP', tahminiDk: 35,
    onKosullar: <String>['EN-A1-010', 'EN-A2-001'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'Turkce yetenegi fiilin ICINE gomer:\n\n'
        '  yuz-EBIL-irim · gel-EBIL-ir misin · yap-AMA-m\n'
        '  Tek kelime, hem yetenek hem zaman hem kisi.\n\n'
        'Ingilizce ayri bir kelime kullanir: CAN.\n\n'
        '  I can swim.  ·  Can you come?  ·  I cannot do it.\n\n'
        'Ve bu kelimenin uc ozelligi vardir:\n\n'
        '  1. Kisiye gore HIC degismez:  he can (he cans DEGIL)\n'
        '  2. Ardindan YALIN fiil gelir:  can go (can goes DEGIL)\n'
        '  3. "to" almaz:                 can swim (can to swim DEGIL)\n\n'
        'Bu uc ozellik butun modal fiillerde aynidir; will\u2019de de '
        'gormustunuz (A2-008).\n\n'
        'DUSUNME NOTU: "can" bir yardimci fiildir. Yetenek bilgisini '
        'o tasir, ana fiil yalnizca anlami tasir. Yine "bir kelime bir is".',
    kazanimlar: <String>[
      'can + yalin fiil yapisini kurabilmek',
      'Yetenek ve izin anlamlarini ayirt etmek',
      'Olumsuz ve soru bicimlerini kurmak',
      'could ile gecmis yetenegi anlatmak',
      'could ile kibar rica yapmak',
      'be able to ile can arasindaki farki bilmek',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'Z1', baslik: 'Uc degismez kural',
        govde: '"can" bir MODAL fiildir. Butun modallerde ayni uc kural '
            'gecerlidir:\n\n'
            '  1. Kisiye gore DEGISMEZ\n'
            '     I can · you can · he can · they can\n'
            '     "he cans" diye bir sey YOK\n\n'
            '  2. Ardindan YALIN fiil gelir\n'
            '     can go · can swim · can be\n'
            '     "can goes" veya "can going" YANLIS\n\n'
            '  3. "to" ALMAZ\n'
            '     can swim (can TO swim DEGIL)\n\n'
            'Bu kurallari will\u2019de de gormustunuz. Modaller ailesi ayni '
            'davranir; birini ogrenince digerleri kolaylasir.',
        turkceKarsilastirma: 'Yuzebilirim.  ->  I can swim.\n'
            'Ek "-ebil"    ->  ayri kelime "can"'),
      AnlatimBlogu(kod: 'Z2', baslik: 'Yetenek: yapabilmek',
        govde: 'En temel kullanim: bir seyi yapabilme becerisi.\n\n'
            '  I can swim.\n'
            '  She can speak three languages.\n'
            '  He can play the guitar.\n\n'
            'Olumsuz: cannot veya can\u2019t\n'
            '  I cannot swim.  ·  I can\u2019t swim.\n\n'
            'DIKKAT: "cannot" BITISIK yazilir. "can not" yaygin degildir.\n\n'
            'Soru: can basa gecer\n'
            '  Can you swim?  -> Yes, I can. / No, I can\u2019t.',
        turkceKarsilastirma: 'Yuzemem.  ->  I cannot swim.\n'
            'Yuzebilir misin? ->  Can you swim?'),
      AnlatimBlogu(kod: 'Z3', baslik: 'Izin: yapabilir miyim?',
        govde: 'Ikinci kullanim: izin istemek veya vermek.\n\n'
            '  Can I use your phone?     (izin isteme)\n'
            '  You can go now.           (izin verme)\n'
            '  Students can\u2019t use phones here. (yasak)\n\n'
            'Ayni kelime iki anlam tasir; hangisi oldugu BAGLAMDAN '
            'anlasilir:\n\n'
            '  Can you swim?     -> Yuzebilir misin? (yetenek)\n'
            '  Can I swim here?  -> Burada yuzebilir miyim? (izin)\n\n'
            'Turkcede de ayni durum vardir: "-ebil" eki her ikisini de '
            'anlatir.',
        turkceKarsilastirma: 'Telefonunu kullanabilir miyim?\n'
            'Can I use your phone?'),
      AnlatimBlogu(kod: 'Z4', baslik: 'could: gecmiste yetenek',
        govde: '"could" can\u2019in gecmis bicimidir:\n\n'
            '  When I was young, I could run fast.\n'
            '  She could speak English at the age of five.\n\n'
            'Olumsuz: could not / couldn\u2019t\n'
            '  I couldn\u2019t find my keys.\n\n'
            'Soru: Could you swim when you were a child?\n\n'
            'DIKKAT: "could" GENEL yetenek anlatir. TEK BIR OLAY icin '
            '"was able to" kullanilir:\n\n'
            '  I could swim.            (genel yetenek)\n'
            '  I was able to open it.   (o an basardim)',
        turkceKarsilastirma: 'Kucukken hizli kosabilirdim.\n'
            'When I was young, I could run fast.'),
      AnlatimBlogu(kod: 'Z5', baslik: 'could: KIBAR rica',
        govde: '"could" gecmis anlami tasimadan, yalnizca KIBARLIK icin '
            'de kullanilir:\n\n'
            '  Can you help me?    -> Yardim eder misin? (dogrudan)\n'
            '  Could you help me?  -> Yardim edebilir misiniz? (kibar)\n\n'
            '  Could I ask a question?\n'
            '  Could you open the window, please?\n\n'
            'Burada gecmis YOKTUR; yalnizca ton yumusar.\n\n'
            'DUSUNME NOTU: Ingilizcede kibarlik cogu zaman "uzaklastirma" '
            'ile saglanir. Gecmis bicim kullanmak istegi biraz uzaga '
            'iter, bu da daha kibar durur.',
        turkceKarsilastirma: 'Yardim edebilir misiniz?\n'
            'Could you help me?'),
      AnlatimBlogu(kod: 'Z6', baslik: 'be able to: can\u2019in yedegi',
        govde: '"can" yalnizca simdiki ve gecmiste vardir. Baska zamanlarda '
            '"be able to" kullanilir:\n\n'
            '  Gelecek:  I will be able to help.  (can kullanilamaz)\n'
            '  Perfect:  I have been able to...\n\n'
            'Simdiki zamanda ikisi de olur ama "can" daha yaygindir:\n'
            '  I can swim. = I am able to swim.\n\n'
            'DIKKAT: "will can" diye bir sey YOKTUR. Iki modal yan yana '
            'gelmez.\n'
            '  I will can help.      -> YANLIS\n'
            '  I will be able to help. -> DOGRU',
        turkceKarsilastirma: 'Yardim edebilecegim.\n'
            'I will be able to help.'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['swim', 'can swim', 'I can swim.'],
        turkce: 'Yuzebilirim.', not: 'can + yalin fiil.'),
      AdimliOrnek(adimlar: <String>['I can', 'you can', 'he can', 'they can'],
        turkce: 'Kisiye gore degismez.', not: 'he cans YOK.'),
      AdimliOrnek(adimlar: <String>['I can swim.', 'I cannot swim.', "I can't swim."],
        turkce: 'Yuzemem.', not: 'cannot BITISIK yazilir.'),
      AdimliOrnek(adimlar: <String>['Can you help me?', 'Could you help me?'],
        turkce: 'dogrudan / kibar', not: 'could burada gecmis DEGIL.'),
      AdimliOrnek(adimlar: <String>['can', 'will can', 'will be able to'],
        turkce: 'Gelecekte can kullanilmaz.', not: 'Iki modal yan yana gelmez.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'O uc dil konusabilir.', 'Ozne: She', 'can (degismez)',
        'yalin fiil: speak', 'She can speak three languages.'],
        turkce: 'Modal kurulumu.', not: 'She cans speaks YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Kucukken hizli kosabilirdim.', 'Gecmis yetenek -> could',
        'I could run', 'When I was young, I could run fast.'],
        turkce: 'Gecmis yetenek.', not: 'could + yalin fiil.'),
      AdimliOrnek(adimlar: <String>[
        'Yarin yardim edebilecegim.', 'Gelecek -> can KULLANILAMAZ',
        'will be able to', 'I will be able to help tomorrow.'],
        turkce: 'Gelecekte yedek yapi.', not: 'will can YANLIS.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I can swim.', turkce: 'Yuzebilirim.', dogruMu: true, altKonu: kYetenek),
      OrnekCumle(ingilizce: 'She can speak three languages.', turkce: 'Uc dil konusabilir.', dogruMu: true, altKonu: kYetenek),
      OrnekCumle(ingilizce: 'He can play the guitar.', turkce: 'Gitar calabilir.', dogruMu: true, altKonu: kYetenek),
      OrnekCumle(ingilizce: 'They can drive.', turkce: 'Araba kullanabilirler.', dogruMu: true, altKonu: kYetenek),
      OrnekCumle(ingilizce: 'I cannot swim.', turkce: 'Yuzemem.', dogruMu: true, altKonu: kYetenek),
      OrnekCumle(ingilizce: "She can't cook.", turkce: 'Yemek yapamaz.', dogruMu: true, altKonu: kYetenek),
      OrnekCumle(ingilizce: 'Can you swim?', turkce: 'Yuzebilir misin?', dogruMu: true, altKonu: kYetenek),
      OrnekCumle(ingilizce: 'Yes, I can.', turkce: 'Evet, yuzebilirim.', dogruMu: true, altKonu: kYetenek),
      OrnekCumle(ingilizce: "No, I can't.", turkce: 'Hayir, yuzemem.', dogruMu: true, altKonu: kYetenek),
      OrnekCumle(ingilizce: 'Can I use your phone?', turkce: 'Telefonunu kullanabilir miyim?', dogruMu: true, altKonu: kIzin),
      OrnekCumle(ingilizce: 'You can go now.', turkce: 'Simdi gidebilirsin.', dogruMu: true, altKonu: kIzin),
      OrnekCumle(ingilizce: "Students can't use phones here.", turkce: 'Ogrenciler burada telefon kullanamaz.', dogruMu: true, altKonu: kIzin),
      OrnekCumle(ingilizce: 'Can I sit here?', turkce: 'Buraya oturabilir miyim?', dogruMu: true, altKonu: kIzin),
      OrnekCumle(ingilizce: 'You can take my book.', turkce: 'Kitabimi alabilirsin.', dogruMu: true, altKonu: kIzin),
      OrnekCumle(ingilizce: 'When I was young, I could run fast.', turkce: 'Kucukken hizli kosabilirdim.', dogruMu: true, altKonu: kGecmisYetenek),
      OrnekCumle(ingilizce: 'She could speak English at five.', turkce: 'Bes yasinda Ingilizce konusabiliyordu.', dogruMu: true, altKonu: kGecmisYetenek),
      OrnekCumle(ingilizce: "I couldn't find my keys.", turkce: 'Anahtarlarimi bulamadim.', dogruMu: true, altKonu: kGecmisYetenek),
      OrnekCumle(ingilizce: 'Could you swim when you were a child?', turkce: 'Cocukken yuzebiliyor muydun?', dogruMu: true, altKonu: kGecmisYetenek),
      OrnekCumle(ingilizce: 'He could not come yesterday.', turkce: 'Dun gelemedi.', dogruMu: true, altKonu: kGecmisYetenek),
      OrnekCumle(ingilizce: 'Could you help me?', turkce: 'Yardim edebilir misiniz?', dogruMu: true, altKonu: kKibar),
      OrnekCumle(ingilizce: 'Could I ask a question?', turkce: 'Bir soru sorabilir miyim?', dogruMu: true, altKonu: kKibar),
      OrnekCumle(ingilizce: 'Could you open the window, please?', turkce: 'Pencereyi acabilir misiniz lutfen?', dogruMu: true, altKonu: kKibar),
      OrnekCumle(ingilizce: 'Could you speak more slowly?', turkce: 'Daha yavas konusabilir misiniz?', dogruMu: true, altKonu: kKibar),
      OrnekCumle(ingilizce: 'I will be able to help tomorrow.', turkce: 'Yarin yardim edebilecegim.', dogruMu: true, altKonu: kAbleTo),
      OrnekCumle(ingilizce: 'She was able to open the door.', turkce: 'Kapiyi acmayi basardi.', dogruMu: true, altKonu: kAbleTo),
      OrnekCumle(ingilizce: 'I am able to swim.', turkce: 'Yuzebiliyorum.', dogruMu: true, altKonu: kAbleTo),
      OrnekCumle(ingilizce: "They won't be able to come.", turkce: 'Gelemeyecekler.', dogruMu: true, altKonu: kAbleTo),
      OrnekCumle(ingilizce: 'He can go home.', turkce: 'Eve gidebilir.', dogruMu: true, altKonu: kYalinFiil),
      OrnekCumle(ingilizce: 'We can be there at five.', turkce: 'Beste orada olabiliriz.', dogruMu: true, altKonu: kYalinFiil),
      OrnekCumle(ingilizce: 'She can read very fast.', turkce: 'Cok hizli okuyabilir.', dogruMu: true, altKonu: kYalinFiil),

      OrnekCumle(ingilizce: 'He cans swim.', turkce: 'Yuzebilir.', dogruMu: false,
        neden: '"can" kisiye gore DEGISMEZ; hicbir zaman -s almaz.',
        dogruBicim: 'He can swim.', hataTuru: 'GRAMER_HATASI', altKonu: kYalinFiil),
      OrnekCumle(ingilizce: 'She can speaks three languages.', turkce: 'Uc dil konusabilir.', dogruMu: false,
        neden: '"can"den sonra fiil YALIN kalir.',
        dogruBicim: 'She can speak three languages.', hataTuru: 'GRAMER_HATASI', altKonu: kYalinFiil),
      OrnekCumle(ingilizce: 'I can to swim.', turkce: 'Yuzebilirim.', dogruMu: false,
        neden: 'Modal fiillerden sonra "to" GELMEZ.',
        dogruBicim: 'I can swim.', hataTuru: 'FAZLA_KELIME', altKonu: kYalinFiil),
      OrnekCumle(ingilizce: 'They can driving.', turkce: 'Araba kullanabilirler.', dogruMu: false,
        neden: 'Fiil yalin kalir; -ing almaz.', dogruBicim: 'They can drive.',
        hataTuru: 'GRAMER_HATASI', altKonu: kYalinFiil),
      OrnekCumle(ingilizce: 'He can went home.', turkce: 'Eve gidebilir.', dogruMu: false,
        neden: 'Gecmis bicim kullanilmaz; yalin fiil gerekir.',
        dogruBicim: 'He can go home.', hataTuru: 'GRAMER_HATASI', altKonu: kYalinFiil),
      OrnekCumle(ingilizce: 'I do not can swim.', turkce: 'Yuzemem.', dogruMu: false,
        neden: '"can" zaten yardimci fiildir; do/does GIRMEZ.',
        dogruBicim: 'I cannot swim.', hataTuru: 'GRAMER_HATASI', altKonu: kYetenek),
      OrnekCumle(ingilizce: 'Do you can swim?', turkce: 'Yuzebilir misin?', dogruMu: false,
        neden: 'Soruda "can" basa gecer; do kullanilmaz.',
        dogruBicim: 'Can you swim?', hataTuru: 'GRAMER_HATASI', altKonu: kYetenek),
      OrnekCumle(ingilizce: 'You can swim?', turkce: 'Yuzebilir misin?', dogruMu: false,
        neden: 'Soruda SIRA degisir; yalnizca soru isareti yetmez.',
        dogruBicim: 'Can you swim?', hataTuru: 'KELIME_SIRASI', altKonu: kYetenek),
      OrnekCumle(ingilizce: 'Yes, I do. (Can you swim?)', turkce: 'Evet, yuzebilirim.', dogruMu: false,
        neden: '"can" sorusuna "can" ile cevap verilir.', dogruBicim: 'Yes, I can.',
        hataTuru: 'KELIME_SECIMI', altKonu: kYetenek),
      OrnekCumle(ingilizce: 'I can not swim. (kisaltma)', turkce: 'Yuzemem.', dogruMu: false,
        neden: 'Olumsuz bicim BITISIK yazilir: cannot veya can\u2019t.',
        dogruBicim: 'I cannot swim.', hataTuru: 'YAZIM_HATASI', altKonu: kYetenek),
      OrnekCumle(ingilizce: 'She cant cook.', turkce: 'Yemek yapamaz.', dogruMu: false,
        neden: 'Kisaltmada kesme isareti zorunludur: can\u2019t.',
        dogruBicim: "She can't cook.", hataTuru: 'YAZIM_HATASI', altKonu: kYetenek),
      OrnekCumle(ingilizce: 'Can I to use your phone?', turkce: 'Telefonunu kullanabilir miyim?', dogruMu: false,
        neden: '"to" gereksiz.', dogruBicim: 'Can I use your phone?',
        hataTuru: 'FAZLA_KELIME', altKonu: kIzin),
      OrnekCumle(ingilizce: 'You can to go now.', turkce: 'Simdi gidebilirsin.', dogruMu: false,
        neden: 'Modal + yalin fiil.', dogruBicim: 'You can go now.',
        hataTuru: 'FAZLA_KELIME', altKonu: kIzin),
      OrnekCumle(ingilizce: 'When I was young, I could ran fast.', turkce: 'Kucukken hizli kosabilirdim.', dogruMu: false,
        neden: '"could"dan sonra da fiil YALIN kalir.',
        dogruBicim: 'When I was young, I could run fast.', hataTuru: 'GRAMER_HATASI', altKonu: kGecmisYetenek),
      OrnekCumle(ingilizce: "I couldn't found my keys.", turkce: 'Anahtarlarimi bulamadim.', dogruMu: false,
        neden: 'Fiil yalin: find.', dogruBicim: "I couldn't find my keys.",
        hataTuru: 'GRAMER_HATASI', altKonu: kGecmisYetenek),
      OrnekCumle(ingilizce: 'Did you could swim as a child?', turkce: 'Cocukken yuzebiliyor muydun?', dogruMu: false,
        neden: 'Modal sorusunda "did" kullanilmaz.',
        dogruBicim: 'Could you swim as a child?', hataTuru: 'GRAMER_HATASI', altKonu: kGecmisYetenek),
      OrnekCumle(ingilizce: 'I will can help tomorrow.', turkce: 'Yarin yardim edebilecegim.', dogruMu: false,
        neden: 'Iki modal yan yana GELMEZ. Gelecekte "be able to" kullanilir.',
        dogruBicim: 'I will be able to help tomorrow.', hataTuru: 'GRAMER_HATASI', altKonu: kAbleTo),
      OrnekCumle(ingilizce: "They won't can come.", turkce: 'Gelemeyecekler.', dogruMu: false,
        neden: 'will + can olmaz.', dogruBicim: "They won't be able to come.",
        hataTuru: 'GRAMER_HATASI', altKonu: kAbleTo),
      OrnekCumle(ingilizce: 'She was can open the door.', turkce: 'Kapiyi acabildi.', dogruMu: false,
        neden: '"was" ile "can" birlestirilemez; "was able to" kullanilir.',
        dogruBicim: 'She was able to open the door.', hataTuru: 'GRAMER_HATASI', altKonu: kAbleTo),
      OrnekCumle(ingilizce: 'I am able swim.', turkce: 'Yuzebiliyorum.', dogruMu: false,
        neden: '"able" ile fiil arasinda "to" gerekir.',
        dogruBicim: 'I am able to swim.', hataTuru: 'EKSIK_KELIME', altKonu: kAbleTo),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kYalinFiil,
        soru: 'Hangisi dogru?',
        secenekler: <String>['He cans swim.', 'He can swim.', 'He can swims.'],
        kabuller: <String>['He can swim.'], geriDonusKodu: 'Z1'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kYalinFiil,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I can to swim.', 'I can swim.', 'I can swimming.'],
        kabuller: <String>['I can swim.'], geriDonusKodu: 'Z1',
        aciklama: 'Modal + yalin fiil, "to" yok.'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kYetenek,
        soru: 'Hangisi dogru?',
        secenekler: <String>['Do you can swim?', 'Can you swim?', 'You can swim?'],
        kabuller: <String>['Can you swim?'], geriDonusKodu: 'Z2'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kKibar,
        soru: 'En kibar bicim hangisi?',
        secenekler: <String>['Help me.', 'Can you help me?', 'Could you help me?'],
        kabuller: <String>['Could you help me?'], geriDonusKodu: 'Z5'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kAbleTo,
        soru: '"Yarin yardim edebilecegim." hangisi?',
        secenekler: <String>['I will can help.', 'I will be able to help.', 'I can will help.'],
        kabuller: <String>['I will be able to help.'], geriDonusKodu: 'Z6'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kYalinFiil,
        soru: 'She can ___ the guitar. (play)', kabuller: <String>['play']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kGecmisYetenek,
        soru: 'I could not ___ my keys. (find)', kabuller: <String>['find']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kYetenek,
        soru: '___ you swim?', kabuller: <String>['Can', 'can']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kYetenek,
        soru: 'Can you swim? — Yes, I ___.', kabuller: <String>['can']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kAbleTo,
        soru: 'I am able ___ swim.', kabuller: <String>['to']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kIzin,
        soru: '"Buraya oturabilir miyim?" hangisi?',
        secenekler: <String>['Can I sit here?', 'Do I can sit here?', 'I can sit here?'],
        kabuller: <String>['Can I sit here?']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kAbleTo,
        soru: 'Gelecekte yetenek nasil anlatilir?',
        secenekler: <String>['will can', 'will be able to', 'can will'],
        kabuller: <String>['will be able to']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kYetenek,
        soru: 'Dizin: swim / can / I',
        kabuller: <String>['I can swim.', 'I can swim']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kKibar,
        soru: 'Dizin: me / you / help / Could',
        kabuller: <String>['Could you help me?', 'Could you help me']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kAbleTo,
        soru: '"I will can help." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kYetenek, turkce: 'Uc dil konusabilir.',
        kabuller: <String>['She can speak three languages.',
            'He can speak three languages.']),
      SerbestGorev(kod: 'SU-2', altKonu: kIzin, turkce: 'Telefonunu kullanabilir miyim?',
        kabuller: <String>['Can I use your phone?']),
      SerbestGorev(kod: 'SU-3', altKonu: kKibar, turkce: 'Yardim edebilir misiniz?',
        kabuller: <String>['Could you help me?']),
      SerbestGorev(kod: 'SU-4', altKonu: kAbleTo, turkce: 'Yarin yardim edebilecegim.',
        kabuller: <String>['I will be able to help tomorrow.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kYalinFiil,
        soru: 'He can ___ home. (go)', kabuller: <String>['go']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kGecmisYetenek,
        soru: 'When I was young, I could ___ fast. (run)',
        kabuller: <String>['run']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kAbleTo,
        soru: 'She was able ___ open the door.', kabuller: <String>['to']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.coktanSecmeli, altKonu: kYetenek,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I do not can swim.', 'I cannot swim.', 'I not can swim.'],
        kabuller: <String>['I cannot swim.']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.dogruYanlis, altKonu: kYalinFiil,
        soru: '"She can speaks English." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kGecmisYetenek,
        soru: '"Did you could swim?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kIzin,
        soru: 'Dizin: phone / your / use / Can / I',
        kabuller: <String>['Can I use your phone?', 'Can I use your phone']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kYetenek,
        soru: "She ___ cook. (olumsuz, kisa)", kabuller: <String>["can't"]),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kYalinFiil,
        soru: 'He ___ swim.',
        secenekler: <String>['cans', 'can', 'can to'], kabuller: <String>['can']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kYalinFiil,
        soru: 'She can ___ three languages.',
        secenekler: <String>['speaks', 'speak', 'speaking'],
        kabuller: <String>['speak']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kYetenek,
        soru: 'Hangisi dogru?',
        secenekler: <String>['Do you can swim?', 'Can you swim?', 'You can swim?'],
        kabuller: <String>['Can you swim?']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kGecmisYetenek,
        soru: 'When I was young, I ___ run fast.',
        secenekler: <String>['can', 'could', 'was can'], kabuller: <String>['could']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kAbleTo,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I will can help.', 'I will be able to help.', "I won't can help."],
        kabuller: <String>['I will be able to help.']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kYalinFiil,
        soru: 'We can ___ there at five. (be)', kabuller: <String>['be']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kKibar,
        soru: '___ you open the window, please? (kibar)',
        kabuller: <String>['Could', 'could']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kAbleTo,
        soru: "They won't be ___ to come.", kabuller: <String>['able']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kYalinFiil,
        soru: '"I can to swim." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kYetenek,
        soru: '"I do not can swim." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kAbleTo,
        soru: '"They won\'t can come." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kGecmisYetenek,
        soru: 'Dizin: keys / find / my / I / not / could',
        kabuller: <String>['I could not find my keys.', 'I could not find my keys']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kYetenek,
        soru: 'Ingilizceye cevirin: Yuzebilir misin?',
        kabuller: <String>['Can you swim?']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kKibar,
        soru: 'Ingilizceye cevirin: Yardim edebilir misiniz?',
        kabuller: <String>['Could you help me?']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kAbleTo,
        soru: 'Ingilizceye cevirin: Yarin yardim edebilecegim.',
        kabuller: <String>['I will be able to help tomorrow.']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Uc degismez kural',
        aciklama: 'Kisiye gore degismez · yalin fiil alir · "to" almaz.',
        ornek: 'he can go (cans / can goes / can to go DEGIL)'),
      OzetMaddesi(baslik: 'Yetenek',
        aciklama: 'Olumsuz "cannot" BITISIK yazilir. Kisaltma: can\u2019t.',
        ornek: 'I can swim. · I cannot swim.'),
      OzetMaddesi(baslik: 'Izin',
        aciklama: 'Ayni kelime izin de anlatir; baglamdan anlasilir.',
        ornek: 'Can I use your phone? · You can go now.'),
      OzetMaddesi(baslik: 'could: gecmis yetenek',
        aciklama: 'Genel yetenek -> could · Tek olayda basari -> was able to.',
        ornek: 'I could swim. · I was able to open it.'),
      OzetMaddesi(baslik: 'could: KIBAR rica',
        aciklama: 'Burada gecmis YOK; yalnizca ton yumusar.',
        ornek: 'Could you help me? (Can you...\u2019dan kibar)'),
      OzetMaddesi(baslik: 'be able to: yedek yapi',
        aciklama: 'Iki modal yan yana gelmez; gelecekte bu yapi kullanilir.',
        ornek: 'will can (X) -> will be able to'),
    ],
  );
}
