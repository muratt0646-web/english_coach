/// EN-A2-008 — Gelecek: will (anlik karar, tahmin, soz)
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnA2008 {
  const DersEnA2008._();

  static const String kYapi = 'Yapi: will + yalin fiil';
  static const String kAnlikKarar = 'Anlik karar';
  static const String kTahmin = 'Tahmin ve inanc';
  static const String kSozTeklif = 'Soz verme ve teklif';
  static const String kOlumsuz = 'Olumsuz ve soru';
  static const String kSecim = 'will mi going to mu?';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A2-008',
    baslik: 'Gelecek — will',
    seviye: 'A2', konu: 'ZAM', tahminiDk: 40,
    onKosullar: <String>['EN-A2-007'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'Gecen derste ogrendiniz: "going to" ONCEDEN verilmis karari '
        'anlatir.\n\n'
        '"will" ise tam tersidir: karar SU ANDA, konusurken verilir.\n\n'
        '  Telefon caliyor.\n'
        '    I will answer it.        -> Su an karar verdim.\n'
        '    I am going to answer it. -> Tuhaf. Ne zaman planladiniz?\n\n'
        '  Bilet aldim.\n'
        '    I am going to travel.    -> Plan var.\n'
        '    I will travel.           -> Sanki simdi karar verdiniz.\n\n'
        'Yani ikisi de "gelecek" demez; BIRI PLANI, DIGERI ANI anlatir.\n\n'
        'Turkce bu ayrimi yapmadigi icin secim rastgele yapiliyor. '
        'Oysa Ingiliz kulagi farki hemen duyar.\n\n'
        'Bu dersin sorusu su:\n'
        '  "Karar cumleden ONCE mi vardi, yoksa SIMDI mi olustu?"',
    kazanimlar: <String>[
      'will + yalin fiil yapisini kurabilmek',
      'Anlik karari ifade edebilmek',
      'Tahmin ve inanc bildirmek (I think... will)',
      'Soz verme ve teklif yapabilmek',
      'will ile going to arasinda dogru secimi yapmak',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'T1', baslik: 'Yapi: will + YALIN fiil',
        govde: 'Yapi son derece sadedir:\n\n'
            '  OZNE + will + YALIN FIIL\n\n'
            '  I will go.  ·  She will come.  ·  They will help.\n\n'
            'DIKKAT: "will" ozneye gore HIC degismez. -s almaz.\n'
            '  He wills go.  -> YANLIS\n'
            '  He will goes. -> YANLIS\n'
            '  He will go.   -> DOGRU\n\n'
            'Kisaltma: I\u2019ll · she\u2019ll · they\u2019ll\n\n'
            'DUSUNME NOTU: "will" bir yardimci fiildir; zaman bilgisini '
            'ustlenir, ana fiil yalin kalir. Bu, "did"le ayni ilkedir '
            '(A2-004).',
        turkceKarsilastirma: 'Gidecegim.  ->  I will go.\n'
            'Tek ek       ->  iki kelime'),
      AnlatimBlogu(kod: 'T2', baslik: 'Anlik karar',
        govde: 'En tipik kullanim: konusma sirasinda verilen karar.\n\n'
            '  Telefon caliyor. -> I\u2019ll answer it.\n'
            '  Cok agir. -> I\u2019ll help you.\n'
            '  Susadim. -> I\u2019ll get some water.\n\n'
            'Bu cumlelerin hepsinde karar CUMLEYI KURARKEN olustu. '
            'Onceden plan yoktu.\n\n'
            'Bu yuzden "going to" burada tuhaf durur: "I am going to '
            'answer it" demek, telefonun calacagini onceden bildiginizi '
            'ima eder.',
        turkceKarsilastirma: 'Ben acarim.  ->  I\u2019ll answer it.\n'
            'Turkcede genis zaman kullanilir, Ingilizcede will.'),
      AnlatimBlogu(kod: 'T3', baslik: 'Tahmin ve inanc',
        govde: 'Kanit olmadan, yalnizca dusunceye dayanan tahminlerde:\n\n'
            '  I think it will rain tomorrow.\n'
            '  She will probably be late.\n'
            '  I am sure you will pass the exam.\n\n'
            'Sik kullanilan kaliplar:\n'
            '  I think · I hope · I am sure · probably · maybe\n\n'
            'FARK: Kanit GORUNUYORSA going to kullanilir (A2-007):\n'
            '  Look at those clouds! It is going to rain.  (kanit var)\n'
            '  I think it will rain tomorrow.              (kanit yok)',
        turkceKarsilastirma: 'Bence yarin yagmur yagar.\n'
            'I think it will rain tomorrow.'),
      AnlatimBlogu(kod: 'T4', baslik: 'Soz verme, teklif, rica',
        govde: '"will" sosyal islevler de tasir:\n\n'
            '  SOZ VERME:  I will call you tomorrow. I promise.\n'
            '  TEKLIF:     I\u2019ll carry your bag.\n'
            '  KARARLILIK: I will not give up.\n'
            '  RICA:       Will you help me?\n\n'
            'Bu kullanimlarda "going to" YERINE GECMEZ. "I am going to '
            'carry your bag" teklif degil, bilgi verme olur.\n\n'
            'DUSUNME NOTU: will burada gelecegi degil, KONUSANIN '
            'IRADESINI anlatir.',
        turkceKarsilastirma: 'Cantani tasiyayim.  ->  I\u2019ll carry your bag.\n'
            'Bana yardim eder misin? ->  Will you help me?'),
      AnlatimBlogu(kod: 'T5', baslik: 'Olumsuz ve soru',
        govde: 'Olumsuz: will + not + yalin fiil\n\n'
            '  I will not go.  ·  She will not come.\n'
            '  Kisaltma: won\u2019t  (will not -> won\u2019t)\n\n'
            'Soru: will basa gecer\n\n'
            '  Will you come?  ·  Will she help?\n\n'
            'Kisa cevap: Yes, I will. / No, I won\u2019t.\n\n'
            'DIKKAT: do/does/did GIRMEZ.\n'
            '  Do you will come? -> YANLIS\n'
            '  Will you come?    -> DOGRU',
        turkceKarsilastirma: 'Gelmeyecegim.  ->  I won\u2019t come.\n'
            'Gelecek misin? ->  Will you come?'),
      AnlatimBlogu(kod: 'T6', baslik: 'Karar tablosu: will mi going to mu?',
        govde: 'Iki soruyla secim yapin:\n\n'
            '  1. Karar ne zaman verildi?\n'
            '     Onceden -> going to   ·   Simdi -> will\n\n'
            '  2. Tahmin neye dayaniyor?\n'
            '     Gorunur kanit -> going to   ·   Fikir -> will\n\n'
            'Ornekler:\n'
            '  A: Yarin ne yapacaksin?\n'
            '  B: I am going to visit my family.  (plan var)\n\n'
            '  A: Cantam cok agir.\n'
            '  B: I\u2019ll help you.               (su an karar)\n\n'
            'Ikisi de gelecegi anlatir; SECIM anlam katar.',
        turkceKarsilastirma: 'Ailemi ziyaret edecegim. (plan) -> going to\n'
            'Yardim edeyim. (anlik)          -> will'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['go', 'will go', 'I will go tomorrow.'],
        turkce: 'Yarin gidecegim.', not: 'will + yalin fiil.'),
      AdimliOrnek(adimlar: <String>['Telefon caliyor.', 'I will', "I'll answer it."],
        turkce: 'Ben acarim.', not: 'Anlik karar.'),
      AdimliOrnek(adimlar: <String>['I think', 'I think it will', 'I think it will rain.'],
        turkce: 'Bence yagmur yagar.', not: 'Kanitsiz tahmin.'),
      AdimliOrnek(adimlar: <String>['I will go.', 'I will not go.', "I won't go."],
        turkce: 'Gitmeyecegim.', not: 'will not -> won\u2019t.'),
      AdimliOrnek(adimlar: <String>['You will come.', 'Will you', 'Will you come?'],
        turkce: 'Gelecek misin?', not: 'will basa gecer.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Cantan agir mi? Tasiyayim.', 'Karar SIMDI olustu -> will',
        "I'll carry it.", "Is your bag heavy? I'll carry it."],
        turkce: 'Teklif -> will.', not: 'going to burada tuhaf durur.'),
      AdimliOrnek(adimlar: <String>[
        'Yarin ailemi ziyaret edecegim.', 'Plan var mi? Evet -> going to',
        'I am going to', 'I am going to visit my family tomorrow.'],
        turkce: 'Onceden plan -> going to.', not: 'will burada zayif kalir.'),
      AdimliOrnek(adimlar: <String>[
        'Bak su bulutlara!', 'Kanit var -> going to', 'It is going to rain.',
        'Look! It is going to rain.'],
        turkce: 'Kanit varsa going to.', not: 'Kanit yoksa: I think it will rain.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I will go tomorrow.', turkce: 'Yarin gidecegim.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'She will come later.', turkce: 'Sonra gelecek.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'They will help us.', turkce: 'Bize yardim edecekler.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'He will be here soon.', turkce: 'Yakinda burada olacak.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: "I'll see you tomorrow.", turkce: 'Yarin gorusuruz.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: "We'll find a solution.", turkce: 'Bir cozum bulacagiz.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: "The phone is ringing. I'll answer it.", turkce: 'Telefon caliyor. Ben acarim.', dogruMu: true, altKonu: kAnlikKarar),
      OrnekCumle(ingilizce: "That bag is heavy. I'll help you.", turkce: 'O canta agir. Yardim edeyim.', dogruMu: true, altKonu: kAnlikKarar),
      OrnekCumle(ingilizce: "I'm thirsty. I'll get some water.", turkce: 'Susadim. Su alayim.', dogruMu: true, altKonu: kAnlikKarar),
      OrnekCumle(ingilizce: "It's cold. I'll close the window.", turkce: 'Hava soguk. Pencereyi kapatayim.', dogruMu: true, altKonu: kAnlikKarar),
      OrnekCumle(ingilizce: 'I think it will rain tomorrow.', turkce: 'Bence yarin yagmur yagar.', dogruMu: true, altKonu: kTahmin),
      OrnekCumle(ingilizce: 'She will probably be late.', turkce: 'Muhtemelen gec kalacak.', dogruMu: true, altKonu: kTahmin),
      OrnekCumle(ingilizce: 'I am sure you will pass the exam.', turkce: 'Eminim sinavi geceksin.', dogruMu: true, altKonu: kTahmin),
      OrnekCumle(ingilizce: 'I hope you will like it.', turkce: 'Umarim begenirsin.', dogruMu: true, altKonu: kTahmin),
      OrnekCumle(ingilizce: 'Maybe he will call us.', turkce: 'Belki bizi arar.', dogruMu: true, altKonu: kTahmin),
      OrnekCumle(ingilizce: 'I will call you tomorrow. I promise.', turkce: 'Yarin seni arayacagim. Soz.', dogruMu: true, altKonu: kSozTeklif),
      OrnekCumle(ingilizce: "I'll carry your bag.", turkce: 'Cantani tasiyayim.', dogruMu: true, altKonu: kSozTeklif),
      OrnekCumle(ingilizce: 'I will not give up.', turkce: 'Pes etmeyecegim.', dogruMu: true, altKonu: kSozTeklif),
      OrnekCumle(ingilizce: 'Will you help me?', turkce: 'Bana yardim eder misin?', dogruMu: true, altKonu: kSozTeklif),
      OrnekCumle(ingilizce: 'Will you open the door, please?', turkce: 'Kapiyi acar misin lutfen?', dogruMu: true, altKonu: kSozTeklif),
      OrnekCumle(ingilizce: 'I will not go there.', turkce: 'Oraya gitmeyecegim.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: "She won't come tonight.", turkce: 'Bu gece gelmeyecek.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: "They won't understand.", turkce: 'Anlamayacaklar.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'Will you come to the party?', turkce: 'Partiye gelecek misin?', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'Yes, I will.', turkce: 'Evet, gelecegim.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: "No, I won't.", turkce: 'Hayir, gelmeyecegim.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'I am going to visit my family tomorrow.', turkce: 'Yarin ailemi ziyaret edecegim.', dogruMu: true, altKonu: kSecim),
      OrnekCumle(ingilizce: 'Look at those clouds! It is going to rain.', turkce: 'Bak su bulutlara! Yagmur yagacak.', dogruMu: true, altKonu: kSecim),
      OrnekCumle(ingilizce: "A: The phone is ringing. B: I'll get it.", turkce: 'Telefon caliyor. Ben bakarim.', dogruMu: true, altKonu: kSecim),
      OrnekCumle(ingilizce: 'I have tickets. I am going to travel next week.', turkce: 'Biletlerim var. Gelecek hafta seyahat edecegim.', dogruMu: true, altKonu: kSecim),

      OrnekCumle(ingilizce: 'He wills come tomorrow.', turkce: 'Yarin gelecek.', dogruMu: false,
        neden: '"will" ozneye gore DEGISMEZ; -s almaz.',
        dogruBicim: 'He will come tomorrow.', hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'She will comes later.', turkce: 'Sonra gelecek.', dogruMu: false,
        neden: '"will"den sonra fiil YALIN kalir.', dogruBicim: 'She will come later.',
        hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'They will helping us.', turkce: 'Bize yardim edecekler.', dogruMu: false,
        neden: 'Fiil yalin kalir; -ing almaz.', dogruBicim: 'They will help us.',
        hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'I will to go tomorrow.', turkce: 'Yarin gidecegim.', dogruMu: false,
        neden: '"will"den sonra "to" GELMEZ.', dogruBicim: 'I will go tomorrow.',
        hataTuru: 'FAZLA_KELIME', altKonu: kYapi),
      OrnekCumle(ingilizce: 'I will went there.', turkce: 'Oraya gidecegim.', dogruMu: false,
        neden: 'Gecmis bicim kullanilmaz; fiil yalin olmali.',
        dogruBicim: 'I will go there.', hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'I not will go.', turkce: 'Gitmeyecegim.', dogruMu: false,
        neden: '"not" will\u2019den SONRA gelir.', dogruBicim: 'I will not go.',
        hataTuru: 'KELIME_SIRASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'I do not will go.', turkce: 'Gitmeyecegim.', dogruMu: false,
        neden: '"will" zaten yardimci fiildir; do/does GIRMEZ.',
        dogruBicim: 'I will not go.', hataTuru: 'GRAMER_HATASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: "She willn't come.", turkce: 'Gelmeyecek.', dogruMu: false,
        neden: '"will not" kisaltmasi "won\u2019t"tur; "willn\u2019t" diye '
            'bir kelime yoktur.', dogruBicim: "She won't come.",
        hataTuru: 'YAZIM_HATASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'Do you will come?', turkce: 'Gelecek misin?', dogruMu: false,
        neden: 'Soruda "will" basa gecer; do kullanilmaz.',
        dogruBicim: 'Will you come?', hataTuru: 'GRAMER_HATASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'You will come?', turkce: 'Gelecek misin?', dogruMu: false,
        neden: 'Soruda SIRA degisir; yalnizca soru isareti yetmez.',
        dogruBicim: 'Will you come?', hataTuru: 'KELIME_SIRASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'Yes, I do. (Will you come?)', turkce: 'Evet, gelecegim.', dogruMu: false,
        neden: 'will sorusuna will ile cevap verilir.', dogruBicim: 'Yes, I will.',
        hataTuru: 'KELIME_SECIMI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'The phone is ringing. I am going to answer it.', turkce: 'Telefon caliyor. Ben acarim.', dogruMu: false,
        neden: 'Karar SU AN verildi; will gerekir. "going to" onceden plan '
            'yapildigini ima eder.', dogruBicim: "The phone is ringing. I'll answer it.",
        hataTuru: 'ANLAM_FARKI', altKonu: kAnlikKarar),
      OrnekCumle(ingilizce: 'That bag is heavy. I am going to help you.', turkce: 'O canta agir. Yardim edeyim.', dogruMu: false,
        neden: 'Teklif anlik karardir; will kullanilir.',
        dogruBicim: "That bag is heavy. I'll help you.", hataTuru: 'ANLAM_FARKI', altKonu: kAnlikKarar),
      OrnekCumle(ingilizce: 'Look at those clouds! It will rain.', turkce: 'Bak su bulutlara! Yagmur yagacak.', dogruMu: false,
        neden: 'Gorunur kanit var; going to gerekir. "will" kanitsiz '
            'tahminde kullanilir.', dogruBicim: 'Look at those clouds! It is going to rain.',
        hataTuru: 'ANLAM_FARKI', altKonu: kSecim),
      OrnekCumle(ingilizce: 'I have tickets. I will travel next week.', turkce: 'Biletlerim var. Gelecek hafta seyahat edecegim.', dogruMu: false,
        neden: 'Plan onceden yapilmis (bilet var); going to gerekir.',
        dogruBicim: 'I have tickets. I am going to travel next week.',
        hataTuru: 'ANLAM_FARKI', altKonu: kSecim),
      OrnekCumle(ingilizce: 'I am going to carry your bag. (teklif)', turkce: 'Cantani tasiyayim.', dogruMu: false,
        neden: 'Teklifte will kullanilir; going to bilgi verme olur.',
        dogruBicim: "I'll carry your bag.", hataTuru: 'ANLAM_FARKI', altKonu: kSozTeklif),
      OrnekCumle(ingilizce: 'Are you going to help me? (rica)', turkce: 'Bana yardim eder misin?', dogruMu: false,
        neden: 'Rica ederken "Will you...?" kullanilir.',
        dogruBicim: 'Will you help me?', hataTuru: 'ANLAM_FARKI', altKonu: kSozTeklif),
      OrnekCumle(ingilizce: 'I think it is going to rain tomorrow. (kanit yok)', turkce: 'Bence yarin yagmur yagar.', dogruMu: false,
        neden: 'Yalnizca fikir belirtiliyor, kanit yok; will gerekir.',
        dogruBicim: 'I think it will rain tomorrow.', hataTuru: 'ANLAM_FARKI', altKonu: kTahmin),
      OrnekCumle(ingilizce: 'She will probably being late.', turkce: 'Muhtemelen gec kalacak.', dogruMu: false,
        neden: '"will"den sonra yalin fiil gelir: be.',
        dogruBicim: 'She will probably be late.', hataTuru: 'GRAMER_HATASI', altKonu: kTahmin),
      OrnekCumle(ingilizce: 'I will not to give up.', turkce: 'Pes etmeyecegim.', dogruMu: false,
        neden: '"to" gereksiz.', dogruBicim: 'I will not give up.',
        hataTuru: 'FAZLA_KELIME', altKonu: kSozTeklif),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kYapi,
        soru: 'Hangisi dogru?',
        secenekler: <String>['He wills come.', 'He will come.', 'He will comes.'],
        kabuller: <String>['He will come.'], geriDonusKodu: 'T1'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kAnlikKarar,
        soru: 'Telefon caliyor. Hangisi dogal?',
        secenekler: <String>["I'll answer it.", 'I am going to answer it.', 'I answer it.'],
        kabuller: <String>["I'll answer it."], geriDonusKodu: 'T2'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kTahmin,
        soru: 'Kanit yok, yalnizca fikir. Hangisi?',
        secenekler: <String>['I think it is going to rain.', 'I think it will rain.', 'I think it rains.'],
        kabuller: <String>['I think it will rain.'], geriDonusKodu: 'T3'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kOlumsuz,
        soru: '"will not" kisaltmasi?',
        secenekler: <String>["willn't", "won't", "wouldn't"],
        kabuller: <String>["won't"], geriDonusKodu: 'T5'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kSecim,
        soru: 'Biletlerim var. Gelecek hafta gidiyorum. Hangisi?',
        secenekler: <String>['I will travel next week.', 'I am going to travel next week.', 'I travel next week.'],
        kabuller: <String>['I am going to travel next week.'], geriDonusKodu: 'T6'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kYapi,
        soru: 'She will ___ later. (come)', kabuller: <String>['come']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kOlumsuz,
        soru: 'I will ___ go there.', kabuller: <String>['not']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kOlumsuz,
        soru: '___ you come to the party?', kabuller: <String>['Will', 'will']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kTahmin,
        soru: 'I think it ___ rain tomorrow.', kabuller: <String>['will']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kOlumsuz,
        soru: 'Will you come? — Yes, I ___.', kabuller: <String>['will']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kSozTeklif,
        soru: '"Cantani tasiyayim." hangisi?',
        secenekler: <String>['I am going to carry your bag.', "I'll carry your bag.", 'I carry your bag.'],
        kabuller: <String>["I'll carry your bag."]),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kSecim,
        soru: 'Gorunur kanit varsa hangisi?',
        secenekler: <String>['will', 'going to', 'ikisi de olur'],
        kabuller: <String>['going to']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kYapi,
        soru: 'Dizin: tomorrow / will / I / go',
        kabuller: <String>['I will go tomorrow.', 'I will go tomorrow']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kSozTeklif,
        soru: 'Dizin: me / help / you / Will',
        kabuller: <String>['Will you help me?', 'Will you help me']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kOlumsuz,
        soru: '"Do you will come?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kAnlikKarar, turkce: 'Telefon caliyor. Ben acarim.',
        kabuller: <String>["The phone is ringing. I'll answer it.",
            'The phone is ringing. I will answer it.']),
      SerbestGorev(kod: 'SU-2', altKonu: kTahmin, turkce: 'Bence yarin yagmur yagar.',
        kabuller: <String>['I think it will rain tomorrow.']),
      SerbestGorev(kod: 'SU-3', altKonu: kSozTeklif, turkce: 'Bana yardim eder misin?',
        kabuller: <String>['Will you help me?']),
      SerbestGorev(kod: 'SU-4', altKonu: kOlumsuz, turkce: 'Oraya gitmeyecegim.',
        kabuller: <String>['I will not go there.', "I won't go there."]),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kYapi,
        soru: 'They will ___ us. (help)', kabuller: <String>['help']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kTahmin,
        soru: 'She will probably ___ late. (be)', kabuller: <String>['be']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.coktanSecmeli, altKonu: kAnlikKarar,
        soru: 'Hava soguk. Hangisi dogal?',
        secenekler: <String>["I'll close the window.", 'I am going to close the window.', 'I close the window.'],
        kabuller: <String>["I'll close the window."]),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.coktanSecmeli, altKonu: kSecim,
        soru: 'Bak su bulutlara! Hangisi?',
        secenekler: <String>['It will rain.', 'It is going to rain.', 'It rains.'],
        kabuller: <String>['It is going to rain.']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.dogruYanlis, altKonu: kYapi,
        soru: '"I will to go." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kOlumsuz,
        soru: '"She willn\'t come." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kOlumsuz,
        soru: 'Dizin: come / She / tonight / not / will',
        kabuller: <String>['She will not come tonight.', 'She will not come tonight']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kSozTeklif,
        soru: 'I ___ not give up.', kabuller: <String>['will']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kYapi,
        soru: 'He ___ be here soon.',
        secenekler: <String>['wills', 'will', 'will be'], kabuller: <String>['will']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kYapi,
        soru: 'She will ___ later.',
        secenekler: <String>['comes', 'come', 'coming'], kabuller: <String>['come']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kAnlikKarar,
        soru: 'Susadim. Hangisi dogal?',
        secenekler: <String>["I'll get some water.", 'I am going to get some water.', 'I get some water.'],
        kabuller: <String>["I'll get some water."]),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kSecim,
        soru: 'Biletlerim var. Hangisi?',
        secenekler: <String>['I will travel.', 'I am going to travel.', 'I travel.'],
        kabuller: <String>['I am going to travel.']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kOlumsuz,
        soru: 'Hangisi dogru?',
        secenekler: <String>['Do you will come?', 'Will you come?', 'You will come?'],
        kabuller: <String>['Will you come?']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kTahmin,
        soru: 'I am sure you ___ pass the exam.', kabuller: <String>['will']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kOlumsuz,
        soru: "She ___ come tonight. (will not, kisa)", kabuller: <String>["won't"]),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kSozTeklif,
        soru: '___ you open the door, please?', kabuller: <String>['Will', 'will']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kYapi,
        soru: '"He wills come." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kSecim,
        soru: '"Look at those clouds! It will rain." en dogal secim mi?',
        secenekler: <String>['Evet', 'Hayir'], kabuller: <String>['Hayir']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kOlumsuz,
        soru: '"I do not will go." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kTahmin,
        soru: 'Dizin: rain / think / will / I / it / tomorrow',
        kabuller: <String>['I think it will rain tomorrow.',
            'I think it will rain tomorrow']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kAnlikKarar,
        soru: 'Ingilizceye cevirin: Yardim edeyim.',
        kabuller: <String>["I'll help you.", 'I will help you.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kOlumsuz,
        soru: 'Ingilizceye cevirin: Gelmeyecegim.',
        kabuller: <String>['I will not come.', "I won't come."]),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kSozTeklif,
        soru: 'Ingilizceye cevirin: Bana yardim eder misin?',
        kabuller: <String>['Will you help me?']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Yapi: will + YALIN fiil',
        aciklama: 'will ozneye gore degismez, "to" almaz, fiil yalin kalir.',
        ornek: 'He will go. (wills / will goes / will to go DEGIL)'),
      OzetMaddesi(baslik: 'Anlik karar',
        aciklama: 'Karar konusurken olustu. going to burada tuhaf durur.',
        ornek: "The phone is ringing. I'll answer it."),
      OzetMaddesi(baslik: 'Kanitsiz tahmin',
        aciklama: 'I think · I hope · probably · maybe ile.',
        ornek: 'I think it will rain tomorrow.'),
      OzetMaddesi(baslik: 'Soz, teklif, rica',
        aciklama: 'will burada gelecegi degil KONUSANIN IRADESINI anlatir.',
        ornek: "I'll carry your bag. · Will you help me?"),
      OzetMaddesi(baslik: 'Olumsuz ve soru',
        aciklama: 'will not -> won\u2019t. Soruda will basa gecer. do/does GIRMEZ.',
        ornek: "I won't go. · Will you come? — Yes, I will."),
      OzetMaddesi(baslik: 'Karar tablosu',
        aciklama: 'Onceden plan / gorunur kanit -> going to · Anlik karar / fikir -> will.',
        ornek: 'I am going to travel. (bilet var) · I\u2019ll help you. (anlik)'),
    ],
  );
}
