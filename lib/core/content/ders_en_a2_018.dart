/// EN-A2-018 — Siklik Zarflari ve Zaman Ifadeleri
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnA2018 {
  const DersEnA2018._();

  static const String kOlcek = 'Siklik olcegi';
  static const String kFiilOnce = 'Ana fiilden ONCE';
  static const String kBeSonra = 'be fiilinden SONRA';
  static const String kYardimci = 'Yardimci fiil arasinda';
  static const String kSonda = 'Sonda gelen ifadeler';
  static const String kHowOften = 'How often sorusu';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A2-018',
    baslik: 'Siklik Zarflari ve Zaman Ifadeleri',
    seviye: 'A2', konu: 'YAP', tahminiDk: 35,
    onKosullar: <String>['EN-A1-010', 'EN-A2-006'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'Turkce zarf yerlestirmede ESNEKTIR:\n\n'
        '  Her zaman erken kalkarim.\n'
        '  Erken kalkarim her zaman.\n'
        '  Erken her zaman kalkarim.\n'
        '  Ucu de anlasilir.\n\n'
        'Ingilizce ise KATI bir sira izler. Siklik zarfinin yeri '
        'tesadufi degildir ve degistirilirse cumle bozulur.\n\n'
        'Uc kural vardir ve hepsi tek mantiga dayanir:\n\n'
        '  Siklik zarfi FIILE YAPISIR.\n\n'
        '  1. Ana fiil varsa: fiilden ONCE\n'
        '     I ALWAYS work.\n'
        '  2. to be varsa:    be\u2019den SONRA\n'
        '     He is ALWAYS late.\n'
        '  3. Yardimci fiil varsa: arasina\n'
        '     I have ALWAYS wanted this.\n\n'
        'DUSUNME KURALI: "Cumlede be var mi?" Varsa arkasina, yoksa '
        'onune koyun.\n\n'
        'Ayrica bir ayrim daha var: TEK KELIMELIK zarflar fiilin yaninda, '
        'COK KELIMELIK ifadeler cumlenin SONUNDA durur.',
    kazanimlar: <String>[
      'Siklik olcegini bilmek (always -> never)',
      'Zarfi ana fiilden once koymak',
      'to be varsa arkasina koymak',
      'Yardimci fiil arasina yerlestirmek',
      'Cok kelimeli ifadeleri sona koymak',
      'How often sorusunu kurmak',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'AD1', baslik: 'Siklik olcegi',
        govde: 'Zarflar bir olcek uzerinde sirlanir:\n\n'
            '  always     %100  her zaman\n'
            '  usually    %90   genellikle\n'
            '  often      %70   sik sik\n'
            '  sometimes  %50   bazen\n'
            '  rarely     %10   nadiren\n'
            '  never      %0    asla\n\n'
            'DIKKAT: "never" zaten OLUMSUZDUR. "not" ile birlikte '
            'kullanilmaz:\n\n'
            '  I don\u2019t never go.  -> YANLIS\n'
            '  I never go.         -> DOGRU\n\n'
            'Ayni sey "rarely" ve "hardly ever" icin de gecerlidir.',
        turkceKarsilastirma: 'Asla gitmem.  ->  I never go.\n'
            'Turkcede "-mem" eki var; Ingilizcede never yeterli.'),
      AnlatimBlogu(kod: 'AD2', baslik: 'Kural 1: ana fiilden ONCE',
        govde: 'Cumlede yalnizca ana fiil varsa, zarf onun ONUNE gelir:\n\n'
            '  I always work on Mondays.\n'
            '  She usually reads at night.\n'
            '  They never come late.\n'
            '  We sometimes go to the cinema.\n\n'
            'OZNE + ZARF + FIIL\n\n'
            'Yanlis yerler:\n'
            '  I work always...   -> YANLIS\n'
            '  Always I work...   -> vurgu icin olur ama A2\u2019de kacinin',
        turkceKarsilastirma: 'Pazartesileri hep calisirim.\n'
            'I always work on Mondays.'),
      AnlatimBlogu(kod: 'AD3', baslik: 'Kural 2: be fiilinden SONRA',
        govde: 'Cumlede am/is/are/was/were varsa, zarf ONUN ARKASINA '
            'gecer:\n\n'
            '  He is always late.\n'
            '  She was never happy there.\n'
            '  They are usually busy.\n\n'
            'OZNE + BE + ZARF + geri kalan\n\n'
            'Yanlis:\n'
            '  He always is late.  -> YANLIS\n\n'
            'NEDEN? "to be" cumlenin merkezidir; zarf ona yaslanir. Ana '
            'fiilde ise zarf fiilin onune yaslanir. Ikisi de fiile '
            'YAPISIR, yalnizca taraf degisir.',
        turkceKarsilastirma: 'O her zaman gec kalir.\n'
            'He is always late.'),
      AnlatimBlogu(kod: 'AD4', baslik: 'Kural 3: yardimci fiil arasinda',
        govde: 'Yardimci fiil varsa (have, will, can, do), zarf yardimci '
            'ile ana fiilin ARASINA girer:\n\n'
            '  I have always wanted this.\n'
            '  She will never forget it.\n'
            '  He can usually help.\n'
            '  I don\u2019t usually go out.\n\n'
            'YARDIMCI + ZARF + ANA FIIL\n\n'
            'Yanlis:\n'
            '  I always have wanted...  -> YANLIS\n'
            '  She never will forget... -> YANLIS\n\n'
            'Uc kural aslinda tek kuraldir: zarf, cumlenin ilk fiiliyle '
            'ikinci fiili arasina girer.',
        turkceKarsilastirma: 'Bunu her zaman istemistim.\n'
            'I have always wanted this.'),
      AnlatimBlogu(kod: 'AD5', baslik: 'Cok kelimeli ifadeler SONDA',
        govde: 'Tek kelimelik zarflar fiile yapisir. Ama COK KELIMELIK '
            'zaman ifadeleri cumlenin SONUNA gelir:\n\n'
            '  every day · every week · once a week\n'
            '  twice a month · three times a year\n'
            '  on Mondays · at weekends\n\n'
            '  I go to the gym every day.\n'
            '  She calls me twice a week.\n'
            '  We meet on Mondays.\n\n'
            'Yanlis:\n'
            '  I every day go to the gym.  -> YANLIS\n\n'
            'Vurgu icin basa alinabilir:\n'
            '  Every day I go to the gym.',
        turkceKarsilastirma: 'Her gun spor salonuna giderim.\n'
            'I go to the gym every day.'),
      AnlatimBlogu(kod: 'AD6', baslik: 'How often sorusu',
        govde: 'Siklik sorarken:\n\n'
            '  HOW OFTEN + do/does + ozne + fiil\n\n'
            '  How often do you go to the gym?\n'
            '  How often does she call you?\n\n'
            'Cevap iki bicimde olabilir:\n'
            '  Twice a week.        (cok kelimeli -> sonda dururdu)\n'
            '  I usually go.        (tek kelimelik -> fiilden once)\n\n'
            'DIKKAT: "How often" ile "How long" karistirilmamalidir:\n'
            '  How often -> KAC KEZ (siklik)\n'
            '  How long  -> NE KADAR SURE (uzunluk)',
        turkceKarsilastirma: 'Ne siklikta spor yaparsin?\n'
            'How often do you exercise?'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['work', 'always work', 'I always work on Mondays.'],
        turkce: 'Pazartesileri hep calisirim.', not: 'Ana fiilden ONCE.'),
      AdimliOrnek(adimlar: <String>['is late', 'is always late', 'He is always late.'],
        turkce: 'Her zaman gec kalir.', not: 'be fiilinden SONRA.'),
      AdimliOrnek(adimlar: <String>['have wanted', 'have always wanted', 'I have always wanted this.'],
        turkce: 'Bunu hep istemistim.', not: 'Yardimci fiil arasinda.'),
      AdimliOrnek(adimlar: <String>['I go to the gym', 'every day', 'I go to the gym every day.'],
        turkce: 'Her gun spora giderim.', not: 'Cok kelimeli -> SONDA.'),
      AdimliOrnek(adimlar: <String>['never', 'I never go.', "I don't never go. (X)"],
        turkce: 'Asla gitmem.', not: 'never zaten olumsuz.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Genellikle gece okur.', 'be var mi? HAYIR',
        'Ana fiilden once', 'She usually reads at night.'],
        turkce: 'Kural 1.', not: 'reads usually YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Onlar genellikle mesguldur.', 'be var mi? EVET (are)',
        'be\u2019den sonra', 'They are usually busy.'],
        turkce: 'Kural 2.', not: 'usually are YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Bunu asla unutmayacak.', 'Yardimci fiil: will',
        'will + never + forget', 'She will never forget it.'],
        turkce: 'Kural 3.', not: 'never will YANLIS.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I always work on Mondays.', turkce: 'Pazartesileri hep calisirim.', dogruMu: true, altKonu: kFiilOnce),
      OrnekCumle(ingilizce: 'She usually reads at night.', turkce: 'Genellikle gece okur.', dogruMu: true, altKonu: kFiilOnce),
      OrnekCumle(ingilizce: 'They never come late.', turkce: 'Asla gec kalmazlar.', dogruMu: true, altKonu: kFiilOnce),
      OrnekCumle(ingilizce: 'We sometimes go to the cinema.', turkce: 'Bazen sinemaya gideriz.', dogruMu: true, altKonu: kFiilOnce),
      OrnekCumle(ingilizce: 'He often forgets his keys.', turkce: 'Sik sik anahtarlarini unutur.', dogruMu: true, altKonu: kFiilOnce),
      OrnekCumle(ingilizce: 'I rarely watch television.', turkce: 'Nadiren televizyon izlerim.', dogruMu: true, altKonu: kFiilOnce),
      OrnekCumle(ingilizce: 'He is always late.', turkce: 'Her zaman gec kalir.', dogruMu: true, altKonu: kBeSonra),
      OrnekCumle(ingilizce: 'She was never happy there.', turkce: 'Orada asla mutlu olmadi.', dogruMu: true, altKonu: kBeSonra),
      OrnekCumle(ingilizce: 'They are usually busy.', turkce: 'Genellikle mesguldurler.', dogruMu: true, altKonu: kBeSonra),
      OrnekCumle(ingilizce: 'I am often tired in the evening.', turkce: 'Aksamlari sik sik yorgun olurum.', dogruMu: true, altKonu: kBeSonra),
      OrnekCumle(ingilizce: 'The shop is sometimes closed.', turkce: 'Dukkan bazen kapali olur.', dogruMu: true, altKonu: kBeSonra),
      OrnekCumle(ingilizce: 'I have always wanted this.', turkce: 'Bunu hep istemistim.', dogruMu: true, altKonu: kYardimci),
      OrnekCumle(ingilizce: 'She will never forget it.', turkce: 'Bunu asla unutmayacak.', dogruMu: true, altKonu: kYardimci),
      OrnekCumle(ingilizce: 'He can usually help.', turkce: 'Genellikle yardim edebilir.', dogruMu: true, altKonu: kYardimci),
      OrnekCumle(ingilizce: "I don't usually go out.", turkce: 'Genellikle disari cikmam.', dogruMu: true, altKonu: kYardimci),
      OrnekCumle(ingilizce: 'We have never been to Japan.', turkce: 'Hic Japonya\u2019ya gitmedik.', dogruMu: true, altKonu: kYardimci),
      OrnekCumle(ingilizce: 'I go to the gym every day.', turkce: 'Her gun spor salonuna giderim.', dogruMu: true, altKonu: kSonda),
      OrnekCumle(ingilizce: 'She calls me twice a week.', turkce: 'Haftada iki kez beni arar.', dogruMu: true, altKonu: kSonda),
      OrnekCumle(ingilizce: 'We meet on Mondays.', turkce: 'Pazartesileri bulusuruz.', dogruMu: true, altKonu: kSonda),
      OrnekCumle(ingilizce: 'They travel three times a year.', turkce: 'Yilda uc kez seyahat ederler.', dogruMu: true, altKonu: kSonda),
      OrnekCumle(ingilizce: 'I study English every evening.', turkce: 'Her aksam Ingilizce calisirim.', dogruMu: true, altKonu: kSonda),
      OrnekCumle(ingilizce: 'Every day I go to the gym.', turkce: 'Her gun spora giderim.', dogruMu: true, altKonu: kSonda),
      OrnekCumle(ingilizce: 'How often do you go to the gym?', turkce: 'Ne siklikta spora gidersin?', dogruMu: true, altKonu: kHowOften),
      OrnekCumle(ingilizce: 'How often does she call you?', turkce: 'Seni ne siklikta arar?', dogruMu: true, altKonu: kHowOften),
      OrnekCumle(ingilizce: 'Twice a week.', turkce: 'Haftada iki kez.', dogruMu: true, altKonu: kHowOften),
      OrnekCumle(ingilizce: 'How often do they travel?', turkce: 'Ne siklikta seyahat ederler?', dogruMu: true, altKonu: kHowOften),
      OrnekCumle(ingilizce: 'I never go there.', turkce: 'Oraya asla gitmem.', dogruMu: true, altKonu: kOlcek),
      OrnekCumle(ingilizce: 'She hardly ever calls.', turkce: 'Neredeyse hic aramaz.', dogruMu: true, altKonu: kOlcek),
      OrnekCumle(ingilizce: 'He always tells the truth.', turkce: 'Her zaman dogruyu soyler.', dogruMu: true, altKonu: kOlcek),
      OrnekCumle(ingilizce: 'We rarely eat out.', turkce: 'Nadiren disarida yeriz.', dogruMu: true, altKonu: kOlcek),

      OrnekCumle(ingilizce: 'I work always on Mondays.', turkce: 'Pazartesileri hep calisirim.', dogruMu: false,
        neden: 'Siklik zarfi ana fiilden ONCE gelir.',
        dogruBicim: 'I always work on Mondays.', hataTuru: 'KELIME_SIRASI', altKonu: kFiilOnce),
      OrnekCumle(ingilizce: 'She reads usually at night.', turkce: 'Genellikle gece okur.', dogruMu: false,
        neden: 'Zarf fiilden once gelmeli.', dogruBicim: 'She usually reads at night.',
        hataTuru: 'KELIME_SIRASI', altKonu: kFiilOnce),
      OrnekCumle(ingilizce: 'They come never late.', turkce: 'Asla gec kalmazlar.', dogruMu: false,
        neden: 'Zarf fiilden once: never come.', dogruBicim: 'They never come late.',
        hataTuru: 'KELIME_SIRASI', altKonu: kFiilOnce),
      OrnekCumle(ingilizce: 'He forgets often his keys.', turkce: 'Sik sik anahtarlarini unutur.', dogruMu: false,
        neden: 'Zarf fiil ile nesne arasina GIRMEZ.',
        dogruBicim: 'He often forgets his keys.', hataTuru: 'KELIME_SIRASI', altKonu: kFiilOnce),
      OrnekCumle(ingilizce: 'He always is late.', turkce: 'Her zaman gec kalir.', dogruMu: false,
        neden: 'Cumlede "is" var; zarf ondan SONRA gelir.',
        dogruBicim: 'He is always late.', hataTuru: 'KELIME_SIRASI', altKonu: kBeSonra),
      OrnekCumle(ingilizce: 'She never was happy there.', turkce: 'Orada asla mutlu olmadi.', dogruMu: false,
        neden: '"was" varken zarf ondan sonra gelir.',
        dogruBicim: 'She was never happy there.', hataTuru: 'KELIME_SIRASI', altKonu: kBeSonra),
      OrnekCumle(ingilizce: 'They usually are busy.', turkce: 'Genellikle mesguldurler.', dogruMu: false,
        neden: '"are" varken zarf arkasina gecer.',
        dogruBicim: 'They are usually busy.', hataTuru: 'KELIME_SIRASI', altKonu: kBeSonra),
      OrnekCumle(ingilizce: 'I often am tired in the evening.', turkce: 'Aksamlari sik sik yorgunum.', dogruMu: false,
        neden: '"am" varken zarf arkasina gelir.',
        dogruBicim: 'I am often tired in the evening.', hataTuru: 'KELIME_SIRASI', altKonu: kBeSonra),
      OrnekCumle(ingilizce: 'I always have wanted this.', turkce: 'Bunu hep istemistim.', dogruMu: false,
        neden: 'Zarf yardimci fiil ile ana fiilin ARASINA girer.',
        dogruBicim: 'I have always wanted this.', hataTuru: 'KELIME_SIRASI', altKonu: kYardimci),
      OrnekCumle(ingilizce: 'She never will forget it.', turkce: 'Bunu asla unutmayacak.', dogruMu: false,
        neden: 'will + never + forget sirasi olmali.',
        dogruBicim: 'She will never forget it.', hataTuru: 'KELIME_SIRASI', altKonu: kYardimci),
      OrnekCumle(ingilizce: 'He usually can help.', turkce: 'Genellikle yardim edebilir.', dogruMu: false,
        neden: 'Modal + zarf + fiil sirasi.', dogruBicim: 'He can usually help.',
        hataTuru: 'KELIME_SIRASI', altKonu: kYardimci),
      OrnekCumle(ingilizce: 'We never have been to Japan.', turkce: 'Hic Japonya\u2019ya gitmedik.', dogruMu: false,
        neden: 'have + never + been sirasi.', dogruBicim: 'We have never been to Japan.',
        hataTuru: 'KELIME_SIRASI', altKonu: kYardimci),
      OrnekCumle(ingilizce: 'I every day go to the gym.', turkce: 'Her gun spora giderim.', dogruMu: false,
        neden: 'Cok kelimeli zaman ifadesi cumlenin SONUNA gelir.',
        dogruBicim: 'I go to the gym every day.', hataTuru: 'KELIME_SIRASI', altKonu: kSonda),
      OrnekCumle(ingilizce: 'She twice a week calls me.', turkce: 'Haftada iki kez arar.', dogruMu: false,
        neden: 'Cok kelimeli ifade sonda durur.',
        dogruBicim: 'She calls me twice a week.', hataTuru: 'KELIME_SIRASI', altKonu: kSonda),
      OrnekCumle(ingilizce: 'We on Mondays meet.', turkce: 'Pazartesileri bulusuruz.', dogruMu: false,
        neden: 'Zaman ifadesi sona gelir.', dogruBicim: 'We meet on Mondays.',
        hataTuru: 'KELIME_SIRASI', altKonu: kSonda),
      OrnekCumle(ingilizce: "I don't never go there.", turkce: 'Oraya asla gitmem.', dogruMu: false,
        neden: '"never" zaten olumsuzdur; "not" ile birlikte kullanilmaz.',
        dogruBicim: 'I never go there.', hataTuru: 'FAZLA_KELIME', altKonu: kOlcek),
      OrnekCumle(ingilizce: "She doesn't hardly ever call.", turkce: 'Neredeyse hic aramaz.', dogruMu: false,
        neden: '"hardly ever" olumsuz anlam tasir; "not" gereksizdir.',
        dogruBicim: 'She hardly ever calls.', hataTuru: 'FAZLA_KELIME', altKonu: kOlcek),
      OrnekCumle(ingilizce: 'How often have you lived here?', turkce: 'Ne kadar suredir burada yasiyorsun?', dogruMu: false,
        neden: 'Sure soruluyorsa "How long" kullanilir; "How often" '
            'siklik sorar.', dogruBicim: 'How long have you lived here?',
        hataTuru: 'KELIME_SECIMI', altKonu: kHowOften),
      OrnekCumle(ingilizce: 'How often you go to the gym?', turkce: 'Ne siklikta spora gidersin?', dogruMu: false,
        neden: 'Soruda "do" gerekir: How often DO you go...',
        dogruBicim: 'How often do you go to the gym?', hataTuru: 'EKSIK_KELIME', altKonu: kHowOften),
      OrnekCumle(ingilizce: 'How often does she calls you?', turkce: 'Seni ne siklikta arar?', dogruMu: false,
        neden: '"does" varken ana fiil yalin kalir.',
        dogruBicim: 'How often does she call you?', hataTuru: 'GRAMER_HATASI', altKonu: kHowOften),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kFiilOnce,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I work always on Mondays.', 'I always work on Mondays.', 'Always I work on Mondays.'],
        kabuller: <String>['I always work on Mondays.'], geriDonusKodu: 'AD2'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kBeSonra,
        soru: 'Hangisi dogru?',
        secenekler: <String>['He always is late.', 'He is always late.', 'He is late always.'],
        kabuller: <String>['He is always late.'], geriDonusKodu: 'AD3'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kYardimci,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I always have wanted this.', 'I have always wanted this.', 'I have wanted always this.'],
        kabuller: <String>['I have always wanted this.'], geriDonusKodu: 'AD4'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kSonda,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I every day go to the gym.', 'I go to the gym every day.', 'I go every day to the gym.'],
        kabuller: <String>['I go to the gym every day.'], geriDonusKodu: 'AD5'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kOlcek,
        soru: 'Hangisi dogru?',
        secenekler: <String>["I don't never go.", 'I never go.', "I don't go never."],
        kabuller: <String>['I never go.'], geriDonusKodu: 'AD1'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.kelimeDizme, altKonu: kFiilOnce,
        soru: 'Dizin: night / reads / usually / at / She',
        kabuller: <String>['She usually reads at night.',
            'She usually reads at night']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.kelimeDizme, altKonu: kBeSonra,
        soru: 'Dizin: busy / are / usually / They',
        kabuller: <String>['They are usually busy.', 'They are usually busy']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.kelimeDizme, altKonu: kYardimci,
        soru: 'Dizin: it / never / forget / will / She',
        kabuller: <String>['She will never forget it.',
            'She will never forget it']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kHowOften,
        soru: 'How often ___ you go to the gym?', kabuller: <String>['do']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kHowOften,
        soru: 'How often does she ___ you? (call)', kabuller: <String>['call']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kOlcek,
        soru: '%50 sikligi hangi zarf anlatir?',
        secenekler: <String>['always', 'sometimes', 'never'],
        kabuller: <String>['sometimes']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kHowOften,
        soru: 'Sure sormak icin hangisi?',
        secenekler: <String>['How often', 'How long', 'How much'],
        kabuller: <String>['How long']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.surukleBirak, altKonu: kSonda,
        soru: 'Dizin: week / a / calls / twice / She / me',
        kabuller: <String>['She calls me twice a week.',
            'She calls me twice a week']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.dogruYanlis, altKonu: kBeSonra,
        soru: '"They usually are busy." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kOlcek,
        soru: '"I don\'t never go there." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kFiilOnce, turkce: 'Genellikle gece okur.',
        kabuller: <String>['She usually reads at night.',
            'He usually reads at night.']),
      SerbestGorev(kod: 'SU-2', altKonu: kBeSonra, turkce: 'O her zaman gec kalir.',
        kabuller: <String>['He is always late.', 'She is always late.']),
      SerbestGorev(kod: 'SU-3', altKonu: kSonda, turkce: 'Her gun spor salonuna giderim.',
        kabuller: <String>['I go to the gym every day.']),
      SerbestGorev(kod: 'SU-4', altKonu: kHowOften, turkce: 'Ne siklikta spora gidersin?',
        kabuller: <String>['How often do you go to the gym?']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.kelimeDizme, altKonu: kFiilOnce,
        soru: 'Dizin: cinema / to / go / sometimes / We / the',
        kabuller: <String>['We sometimes go to the cinema.',
            'We sometimes go to the cinema']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.kelimeDizme, altKonu: kBeSonra,
        soru: 'Dizin: there / happy / never / was / She',
        kabuller: <String>['She was never happy there.',
            'She was never happy there']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.kelimeDizme, altKonu: kYardimci,
        soru: 'Dizin: Japan / been / never / to / have / We',
        kabuller: <String>['We have never been to Japan.',
            'We have never been to Japan']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.coktanSecmeli, altKonu: kSonda,
        soru: 'Hangisi dogru?',
        secenekler: <String>['We on Mondays meet.', 'We meet on Mondays.', 'On Mondays we meet always.'],
        kabuller: <String>['We meet on Mondays.']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.dogruYanlis, altKonu: kFiilOnce,
        soru: '"He forgets often his keys." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kYardimci,
        soru: '"She never will forget it." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.boslukDoldurma, altKonu: kHowOften,
        soru: 'How often ___ she call you?', kabuller: <String>['does']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.eslestirme, altKonu: kOlcek,
        soru: '%0 sikligi hangi zarf anlatir?',
        secenekler: <String>['always', 'rarely', 'never'], kabuller: <String>['never']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kFiilOnce,
        soru: 'Hangisi dogru?',
        secenekler: <String>['They come never late.', 'They never come late.', 'They come late never.'],
        kabuller: <String>['They never come late.']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kBeSonra,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I often am tired.', 'I am often tired.', 'Often I am tired always.'],
        kabuller: <String>['I am often tired.']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kYardimci,
        soru: 'Hangisi dogru?',
        secenekler: <String>['He usually can help.', 'He can usually help.', 'He can help usually.'],
        kabuller: <String>['He can usually help.']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kSonda,
        soru: 'Hangisi dogru?',
        secenekler: <String>['She twice a week calls me.', 'She calls me twice a week.', 'She calls twice a week me.'],
        kabuller: <String>['She calls me twice a week.']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kOlcek,
        soru: 'Hangisi dogru?',
        secenekler: <String>["She doesn't hardly ever call.", 'She hardly ever calls.', "She doesn't call hardly ever."],
        kabuller: <String>['She hardly ever calls.']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kHowOften,
        soru: 'How often ___ they travel?', kabuller: <String>['do']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kHowOften,
        soru: 'How often does he ___ here? (come)', kabuller: <String>['come']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kOlcek,
        soru: 'I ___ go there. (asla)', kabuller: <String>['never']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kBeSonra,
        soru: '"He always is late." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kSonda,
        soru: '"I every day go to the gym." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kHowOften,
        soru: '"How often have you lived here?" sure sormak icin dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kYardimci,
        soru: 'Dizin: this / wanted / always / have / I',
        kabuller: <String>['I have always wanted this.',
            'I have always wanted this']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kFiilOnce,
        soru: 'Ingilizceye cevirin: Pazartesileri hep calisirim.',
        kabuller: <String>['I always work on Mondays.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kBeSonra,
        soru: 'Ingilizceye cevirin: Genellikle mesguldurler.',
        kabuller: <String>['They are usually busy.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kHowOften,
        soru: 'Ingilizceye cevirin: Seni ne siklikta arar?',
        kabuller: <String>['How often does she call you?',
            'How often does he call you?']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Siklik olcegi',
        aciklama: 'always %100 · usually %90 · often %70 · sometimes %50 · rarely %10 · never %0.',
        ornek: 'always > usually > often > sometimes > rarely > never'),
      OzetMaddesi(baslik: 'Kural 1: ana fiilden ONCE',
        aciklama: 'Ozne + zarf + fiil.',
        ornek: 'I always work. (work always DEGIL)'),
      OzetMaddesi(baslik: 'Kural 2: be fiilinden SONRA',
        aciklama: 'Cumlede am/is/are/was/were varsa zarf arkasina gecer.',
        ornek: 'He is always late. (always is DEGIL)'),
      OzetMaddesi(baslik: 'Kural 3: yardimci fiil ARASINDA',
        aciklama: 'Yardimci + zarf + ana fiil.',
        ornek: 'I have always wanted... · She will never forget...'),
      OzetMaddesi(baslik: 'Cok kelimeli ifadeler SONDA',
        aciklama: 'every day, twice a week, on Mondays — cumlenin sonuna.',
        ornek: 'I go to the gym every day.'),
      OzetMaddesi(baslik: 'never zaten olumsuz',
        aciklama: '"not" ile birlikte kullanilmaz. How often = siklik, How long = sure.',
        ornek: "I don't never go (X) -> I never go"),
    ],
  );
}
