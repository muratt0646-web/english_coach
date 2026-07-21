/// EN-A2-007 — Gelecek: going to (plan ve kanit)
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnA2007 {
  const DersEnA2007._();

  static const String kYapi = 'Yapi: be + going to';
  static const String kPlan = 'Onceden yapilmis plan';
  static const String kKanit = 'Gorunur kanit';
  static const String kOlumsuz = 'Olumsuz';
  static const String kSoru = 'Soru ve kisa cevap';
  static const String kGitmek = 'go fiili ile karistirmama';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A2-007',
    baslik: 'Gelecek — going to',
    seviye: 'A2', konu: 'ZAM', tahminiDk: 35,
    onKosullar: <String>['EN-A2-005'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'Turkcede gelecek tek ekle kurulur: "-acak / -ecek".\n\n'
        '  "Yarin Ankara\u2019ya gidecegim."\n'
        '  Bu cumle NIYETI de TAHMINI de anlatabilir; ayrim yoktur.\n\n'
        'Ingilizce gelecegi NIYETE gore ayirir:\n\n'
        '  going to  ->  ONCEDEN karar verilmis; plan var\n'
        '  will      ->  SU ANDA karar verildi (sonraki ders)\n\n'
        'Yani Ingilizcede "ne zaman karar verdiniz?" sorusu dilbilgisine '
        'girer. Turkcede girmez.\n\n'
        'Ornek fark:\n'
        '  Telefon caliyor. -> I will answer it.   (su an karar verdim)\n'
        '  Bilet aldim.     -> I am going to travel. (onceden planladim)\n\n'
        'Bu ders "going to" tarafini kurar. Karar sorusu su:\n\n'
        '  "Bu karari SIMDI mi verdim, yoksa ONCEDEN mi?"',
    kazanimlar: <String>[
      'be + going to + yalin fiil yapisini kurabilmek',
      'Onceden yapilmis plani anlatabilmek',
      'Gorunur kanittan tahmin yurutebilmek',
      'Olumsuz ve soru bicimlerini kurmak',
      '"going to go" kullanimini dogru anlamak',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'S1', baslik: 'Yapi: be + going to + yalin fiil',
        govde: 'Uc parca vardir:\n\n'
            '  OZNE + am/is/are + going to + YALIN FIIL\n\n'
            '  I am going to travel.\n'
            '  She is going to study.\n'
            '  They are going to move.\n\n'
            'DIKKAT: Fiil YALIN kalir. -ing veya -s almaz.\n'
            '  She is going to studies.  -> YANLIS\n'
            '  She is going to studying. -> YANLIS\n\n'
            'DUSUNME NOTU: "be" kim ve ne zaman oldugunu, "going to" '
            'niyeti, yalin fiil eylemi tasir. Yine "bir kelime bir is".',
        turkceKarsilastirma: 'Seyahat edecegim.  ->  I am going to travel.\n'
            'Tek ek "-ecek"     ->  uc parca'),
      AnlatimBlogu(kod: 'S2', baslik: 'Onceden yapilmis plan',
        govde: '"going to" kullaninca dinleyen sunu anlar: bu karar '
            'CUMLEDEN ONCE verildi.\n\n'
            '  I am going to buy a car.     (Karar verdim, arastiriyorum.)\n'
            '  We are going to move house.  (Plan hazir.)\n'
            '  She is going to start a course next month.\n\n'
            'Genellikle bir hazirlik vardir: bilet alinmis, para birikmis, '
            'randevu ayarlanmis.\n\n'
            'DUSUNME SORUSU: Bu karari ne zaman verdim? Onceden mi?\n'
            'Evetse -> going to.',
        turkceKarsilastirma: 'Araba alacagim. (karar verdim)\n'
            'I am going to buy a car.'),
      AnlatimBlogu(kod: 'S3', baslik: 'Gorunur kanit: tahmin',
        govde: 'Ikinci kullanim: SU ANDA gordugunuz bir kanittan yola '
            'cikarak tahmin yurutmek.\n\n'
            '  Look at those clouds! It is going to rain.\n'
            '  (Bulutlari goruyorum -> yagacak.)\n\n'
            '  He is driving too fast. He is going to have an accident.\n'
            '  She is very pale. She is going to faint.\n\n'
            'Buradaki mantik: kanit ORTADA, sonuc kacinilmaz gorunuyor.\n\n'
            'Eger kanit yoksa, yalnizca fikir belirtiyorsaniz "will" '
            'kullanilir (sonraki ders):\n'
            '  I think it will rain tomorrow. (kanit yok, tahmin)',
        turkceKarsilastirma: 'Bak su bulutlara! Yagmur yagacak.\n'
            'Look at those clouds! It is going to rain.'),
      AnlatimBlogu(kod: 'S4', baslik: 'Olumsuz ve soru',
        govde: 'Yine A1-004\u2019teki to be kurallari. Yeni bir sey yok.\n\n'
            'Olumsuz: not, be\u2019den hemen sonra\n'
            '  I am not going to travel.\n'
            '  She is not going to come.\n'
            '  They aren\u2019t going to move.\n\n'
            'Soru: be basa gecer\n'
            '  Are you going to travel?\n'
            '  Is she going to study?\n\n'
            'Kisa cevap: Yes, I am. / No, she is not.\n\n'
            'DIKKAT: do/does/will GIRMEZ. Cumlede zaten be vardir.',
        turkceKarsilastirma: 'Gitmeyecegim.    ->  I am not going to go.\n'
            'Gidecek misin?   ->  Are you going to go?'),
      AnlatimBlogu(kod: 'S5', baslik: 'going to go tuhaf degil',
        govde: 'Ogrenciler "going to go" gorunce tereddut eder. Ama '
            'dogrudur:\n\n'
            '  I am going to go to Ankara. (Ankara\u2019ya gidecegim.)\n\n'
            'Cunku birinci "going" gelecek isaretidir, ikinci "go" ise '
            'ana fiildir. Ayni kelime iki farkli isi yapiyor.\n\n'
            'Gunluk dilde kisaltilabilir:\n'
            '  I am going to Ankara. (Ayni anlam, daha dogal.)\n\n'
            'Ama baska fiillerle kisaltma YAPILMAZ:\n'
            '  I am going to study. (going to study -> dogru)\n'
            '  I am studying.       -> BASKA anlam (su an)',
        turkceKarsilastirma: 'Ankara\u2019ya gidecegim.\n'
            'I am going to go to Ankara. / I am going to Ankara.'),
      AnlatimBlogu(kod: 'S6', baslik: 'Zaman ifadeleri',
        govde: 'Gelecek zaman ifadeleri cumlenin sonuna gelir:\n\n'
            '  tomorrow · next week · next year · tonight\n'
            '  in two days · this evening · soon\n\n'
            '  I am going to call her tomorrow.\n'
            '  We are going to move next month.\n\n'
            'Present Continuous da planlanmis gelecegi anlatabilir '
            '(A2-005):\n'
            '  We are meeting tomorrow.\n\n'
            'Fark inceliktir: "going to" NIYETI, Present Continuous '
            'AYARLANMIS randevuyu vurgular. Ikisi de dogrudur.',
        turkceKarsilastirma: 'Yarin onu arayacagim.\n'
            'I am going to call her tomorrow.'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['travel', 'going to travel', 'I am going to travel.'],
        turkce: 'Seyahat edecegim.', not: 'Uc parca: be + going to + yalin fiil.'),
      AdimliOrnek(adimlar: <String>['She', 'She is going to', 'She is going to study.'],
        turkce: 'Ders calisacak.', not: 'Fiil yalin: study.'),
      AdimliOrnek(adimlar: <String>['Look at those clouds!', 'It is going to', 'It is going to rain.'],
        turkce: 'Yagmur yagacak.', not: 'Gorunur kanit -> tahmin.'),
      AdimliOrnek(adimlar: <String>['I am going to travel.', 'I am not going to', 'I am not going to travel.'],
        turkce: 'Seyahat etmeyecegim.', not: '"not" be\u2019den sonra.'),
      AdimliOrnek(adimlar: <String>['You are going to travel.', 'Are you going to', 'Are you going to travel?'],
        turkce: 'Seyahat edecek misin?', not: 'be basa gecer.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Yarin araba alacagim.', 'Karar ne zaman? Onceden -> going to',
        'I am going to', 'I am going to buy a car tomorrow.'],
        turkce: 'Plan varsa going to.', not: 'Karar sorusunu sor.'),
      AdimliOrnek(adimlar: <String>[
        'Bak su bulutlara!', 'Kanit ortada', 'It is going to rain.',
        'Look at those clouds! It is going to rain.'],
        turkce: 'Kanittan tahmin.', not: 'Kanit yoksa "will".'),
      AdimliOrnek(adimlar: <String>[
        'Ankara\u2019ya gidecegim.', 'Fiil: go', 'going to + go',
        'I am going to go to Ankara.'],
        turkce: '"going to go" dogrudur.', not: 'Kisaca: I am going to Ankara.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I am going to travel next week.', turkce: 'Gelecek hafta seyahat edecegim.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'She is going to study tonight.', turkce: 'Bu gece ders calisacak.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'They are going to move house.', turkce: 'Ev tasiyacaklar.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'We are going to watch a film.', turkce: 'Film izleyecegiz.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'He is going to call you.', turkce: 'Seni arayacak.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'I am going to buy a car.', turkce: 'Araba alacagim.', dogruMu: true, altKonu: kPlan),
      OrnekCumle(ingilizce: 'We are going to start a course next month.', turkce: 'Gelecek ay kursa baslayacagiz.', dogruMu: true, altKonu: kPlan),
      OrnekCumle(ingilizce: 'She is going to visit her family.', turkce: 'Ailesini ziyaret edecek.', dogruMu: true, altKonu: kPlan),
      OrnekCumle(ingilizce: 'They are going to open a shop.', turkce: 'Bir dukkan acacaklar.', dogruMu: true, altKonu: kPlan),
      OrnekCumle(ingilizce: 'I am going to learn Spanish.', turkce: 'Ispanyolca ogrenecegim.', dogruMu: true, altKonu: kPlan),
      OrnekCumle(ingilizce: 'Look at those clouds! It is going to rain.', turkce: 'Bak su bulutlara! Yagmur yagacak.', dogruMu: true, altKonu: kKanit),
      OrnekCumle(ingilizce: 'He is driving too fast. He is going to have an accident.', turkce: 'Cok hizli suruyor. Kaza yapacak.', dogruMu: true, altKonu: kKanit),
      OrnekCumle(ingilizce: 'She is very pale. She is going to faint.', turkce: 'Cok solgun. Bayilacak.', dogruMu: true, altKonu: kKanit),
      OrnekCumle(ingilizce: 'The bus is full. We are going to wait.', turkce: 'Otobus dolu. Bekleyecegiz.', dogruMu: true, altKonu: kKanit),
      OrnekCumle(ingilizce: 'I am not going to travel this year.', turkce: 'Bu yil seyahat etmeyecegim.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'She is not going to come.', turkce: 'Gelmeyecek.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: "They aren't going to move.", turkce: 'Tasinmayacaklar.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: "He isn't going to study tonight.", turkce: 'Bu gece calismayacak.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'Are you going to travel?', turkce: 'Seyahat edecek misin?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Is she going to study?', turkce: 'Ders calisacak mi?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Are they going to move?', turkce: 'Tasinacaklar mi?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Yes, I am.', turkce: 'Evet, edecegim.', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'No, she is not.', turkce: 'Hayir, calismayacak.', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'What are you going to do?', turkce: 'Ne yapacaksin?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'I am going to go to Ankara.', turkce: 'Ankara\u2019ya gidecegim.', dogruMu: true, altKonu: kGitmek),
      OrnekCumle(ingilizce: 'I am going to Ankara.', turkce: 'Ankara\u2019ya gidiyorum.', dogruMu: true, altKonu: kGitmek),
      OrnekCumle(ingilizce: 'She is going to go home early.', turkce: 'Eve erken gidecek.', dogruMu: true, altKonu: kGitmek),
      OrnekCumle(ingilizce: 'I am going to call her tomorrow.', turkce: 'Yarin onu arayacagim.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'We are going to move next month.', turkce: 'Gelecek ay tasinacagiz.', dogruMu: true, altKonu: kPlan),
      OrnekCumle(ingilizce: 'They are going to arrive soon.', turkce: 'Yakinda varacaklar.', dogruMu: true, altKonu: kYapi),

      OrnekCumle(ingilizce: 'I going to travel next week.', turkce: 'Gelecek hafta seyahat edecegim.', dogruMu: false,
        neden: 'be eksik. Yapi: OZNE + am/is/are + going to + yalin fiil.',
        dogruBicim: 'I am going to travel next week.', hataTuru: 'EKSIK_KELIME', altKonu: kYapi),
      OrnekCumle(ingilizce: 'She is going to studies tonight.', turkce: 'Bu gece calisacak.', dogruMu: false,
        neden: '"going to"dan sonra fiil YALIN kalir; -s almaz.',
        dogruBicim: 'She is going to study tonight.', hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'They are going to moving house.', turkce: 'Ev tasiyacaklar.', dogruMu: false,
        neden: 'Fiil yalin kalir; -ing almaz.', dogruBicim: 'They are going to move house.',
        hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'She are going to study.', turkce: 'Ders calisacak.', dogruMu: false,
        neden: 'Tekil ozne -> is.', dogruBicim: 'She is going to study.',
        hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'They is going to move.', turkce: 'Tasinacaklar.', dogruMu: false,
        neden: 'Cogul ozne -> are.', dogruBicim: 'They are going to move.',
        hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'I am going travel next week.', turkce: 'Seyahat edecegim.', dogruMu: false,
        neden: '"to" eksik. Kalip "going TO"dur.', dogruBicim: 'I am going to travel next week.',
        hataTuru: 'EKSIK_KELIME', altKonu: kYapi),
      OrnekCumle(ingilizce: 'I not am going to travel.', turkce: 'Seyahat etmeyecegim.', dogruMu: false,
        neden: '"not" be\u2019den SONRA gelir.', dogruBicim: 'I am not going to travel.',
        hataTuru: 'KELIME_SIRASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'I do not going to travel.', turkce: 'Seyahat etmeyecegim.', dogruMu: false,
        neden: 'Cumlede zaten be var; do/does GIRMEZ.',
        dogruBicim: 'I am not going to travel.', hataTuru: 'GRAMER_HATASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'She will not going to come.', turkce: 'Gelmeyecek.', dogruMu: false,
        neden: 'Iki gelecek isareti birden olmaz: ya will ya going to.',
        dogruBicim: 'She is not going to come.', hataTuru: 'FAZLA_KELIME', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'Do you going to travel?', turkce: 'Seyahat edecek misin?', dogruMu: false,
        neden: 'Soruda be basa gecer; do kullanilmaz.',
        dogruBicim: 'Are you going to travel?', hataTuru: 'GRAMER_HATASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'You are going to travel?', turkce: 'Seyahat edecek misin?', dogruMu: false,
        neden: 'Soruda SIRA degisir; yalnizca soru isareti yetmez.',
        dogruBicim: 'Are you going to travel?', hataTuru: 'KELIME_SIRASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'Is they going to move?', turkce: 'Tasinacaklar mi?', dogruMu: false,
        neden: 'Cogul ozne -> Are.', dogruBicim: 'Are they going to move?',
        hataTuru: 'GRAMER_HATASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'What you are going to do?', turkce: 'Ne yapacaksin?', dogruMu: false,
        neden: 'Soru kelimesi + be + ozne sirasi.', dogruBicim: 'What are you going to do?',
        hataTuru: 'KELIME_SIRASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'Yes, I do. (Are you going to travel?)', turkce: 'Evet, edecegim.', dogruMu: false,
        neden: 'be sorusuna be ile cevap verilir: "Yes, I am."',
        dogruBicim: 'Yes, I am.', hataTuru: 'KELIME_SECIMI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'I am going to go to Ankara tomorrow will.', turkce: 'Yarin Ankara\u2019ya gidecegim.', dogruMu: false,
        neden: '"will" gereksiz; going to zaten gelecegi tasiyor.',
        dogruBicim: 'I am going to go to Ankara tomorrow.',
        hataTuru: 'FAZLA_KELIME', altKonu: kGitmek),
      OrnekCumle(ingilizce: 'I am going to go Ankara.', turkce: 'Ankara\u2019ya gidecegim.', dogruMu: false,
        neden: '"go" fiilinden sonra yer icin "to" gerekir.',
        dogruBicim: 'I am going to go to Ankara.', hataTuru: 'EKSIK_KELIME', altKonu: kGitmek),
      OrnekCumle(ingilizce: 'Look at those clouds! It rains.', turkce: 'Bak su bulutlara! Yagmur yagacak.', dogruMu: false,
        neden: 'Gorunur kanittan tahmin yurutuluyor; going to gerekir.',
        dogruBicim: 'Look at those clouds! It is going to rain.',
        hataTuru: 'ANLAM_FARKI', altKonu: kKanit),
      OrnekCumle(ingilizce: 'He drives too fast. He has an accident.', turkce: 'Cok hizli suruyor. Kaza yapacak.', dogruMu: false,
        neden: 'Su anki kanit + gelecek tahmini: Continuous + going to.',
        dogruBicim: 'He is driving too fast. He is going to have an accident.',
        hataTuru: 'ANLAM_FARKI', altKonu: kKanit),
      OrnekCumle(ingilizce: 'I am going to bought a car.', turkce: 'Araba alacagim.', dogruMu: false,
        neden: 'Fiil yalin kalir; gecmis bicim kullanilmaz.',
        dogruBicim: 'I am going to buy a car.', hataTuru: 'GRAMER_HATASI', altKonu: kPlan),
      OrnekCumle(ingilizce: 'We going to start a course.', turkce: 'Kursa baslayacagiz.', dogruMu: false,
        neden: '"are" eksik.', dogruBicim: 'We are going to start a course.',
        hataTuru: 'EKSIK_KELIME', altKonu: kPlan),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kYapi,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I going to travel.', 'I am going to travel.', 'I am going travel.'],
        kabuller: <String>['I am going to travel.'], geriDonusKodu: 'S1'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kYapi,
        soru: 'She is going to ___ tonight.',
        secenekler: <String>['studies', 'study', 'studying'],
        kabuller: <String>['study'], geriDonusKodu: 'S1',
        aciklama: 'Fiil yalin kalir.'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kKanit,
        soru: 'Look at those clouds! It ___.',
        secenekler: <String>['rains', 'is going to rain', 'rained'],
        kabuller: <String>['is going to rain'], geriDonusKodu: 'S3'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kSoru,
        soru: 'Hangisi dogru?',
        secenekler: <String>['Do you going to travel?', 'Are you going to travel?', 'You are going to travel?'],
        kabuller: <String>['Are you going to travel?'], geriDonusKodu: 'S4'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kGitmek,
        soru: '"Ankara\u2019ya gidecegim." hangisi dogru?',
        secenekler: <String>['I am going to go Ankara.', 'I am going to go to Ankara.', 'I am going go to Ankara.'],
        kabuller: <String>['I am going to go to Ankara.'], geriDonusKodu: 'S5'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kYapi,
        soru: 'She ___ going to study tonight.', kabuller: <String>['is']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kYapi,
        soru: 'They are going to ___ house. (move)', kabuller: <String>['move']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kOlumsuz,
        soru: 'I am ___ going to travel this year.', kabuller: <String>['not']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kSoru,
        soru: '___ they going to move?', kabuller: <String>['Are', 'are']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kSoru,
        soru: 'Are you going to travel? — Yes, I ___.', kabuller: <String>['am']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kPlan,
        soru: 'Bilet aldim ve gidecegim. Hangisi uygun?',
        secenekler: <String>['I will travel.', 'I am going to travel.', 'I travel.'],
        kabuller: <String>['I am going to travel.']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kKanit,
        soru: '"going to" tahmininde ne bulunur?',
        secenekler: <String>['Gorunur kanit', 'Yalnizca fikir', 'Gecmis olay'],
        kabuller: <String>['Gorunur kanit']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kYapi,
        soru: 'Dizin: to / going / am / travel / I',
        kabuller: <String>['I am going to travel.', 'I am going to travel']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kSoru,
        soru: 'Dizin: do / to / What / going / are / you',
        kabuller: <String>['What are you going to do?', 'What are you going to do']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kOlumsuz,
        soru: '"She will not going to come." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kPlan, turkce: 'Araba alacagim.',
        kabuller: <String>['I am going to buy a car.']),
      SerbestGorev(kod: 'SU-2', altKonu: kKanit, turkce: 'Yagmur yagacak.',
        kabuller: <String>['It is going to rain.']),
      SerbestGorev(kod: 'SU-3', altKonu: kSoru, turkce: 'Ne yapacaksin?',
        kabuller: <String>['What are you going to do?']),
      SerbestGorev(kod: 'SU-4', altKonu: kOlumsuz, turkce: 'Bu yil seyahat etmeyecegim.',
        kabuller: <String>['I am not going to travel this year.',
            "I'm not going to travel this year."]),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kYapi,
        soru: 'We ___ going to watch a film.', kabuller: <String>['are']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kYapi,
        soru: 'He is going to ___ you. (call)', kabuller: <String>['call']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kKanit,
        soru: 'She is very pale. She ___ going to faint.', kabuller: <String>['is']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.coktanSecmeli, altKonu: kYapi,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I am going to bought a car.', 'I am going to buy a car.', 'I am going to buying a car.'],
        kabuller: <String>['I am going to buy a car.']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.dogruYanlis, altKonu: kOlumsuz,
        soru: '"I do not going to travel." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kGitmek,
        soru: '"I am going to go to Ankara." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Dogru']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kOlumsuz,
        soru: 'Dizin: come / not / to / She / going / is',
        kabuller: <String>['She is not going to come.', 'She is not going to come']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kPlan,
        soru: 'They are going to ___ a shop. (open)', kabuller: <String>['open']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kYapi,
        soru: 'I ___ going to travel next week.',
        secenekler: <String>['am', 'is', 'are'], kabuller: <String>['am']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kYapi,
        soru: 'She is going to ___ tonight.',
        secenekler: <String>['studies', 'study', 'studied'],
        kabuller: <String>['study']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kKanit,
        soru: 'He is driving too fast. He ___ an accident.',
        secenekler: <String>['has', 'is going to have', 'had'],
        kabuller: <String>['is going to have']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kSoru,
        soru: '___ she going to study?',
        secenekler: <String>['Do', 'Is', 'Are'], kabuller: <String>['Is']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kGitmek,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I am going to go Ankara.', 'I am going to go to Ankara.', 'I am go to Ankara.'],
        kabuller: <String>['I am going to go to Ankara.']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kYapi,
        soru: 'They ___ going to move house.', kabuller: <String>['are']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kPlan,
        soru: 'I am going to ___ Spanish. (learn)', kabuller: <String>['learn']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kSoru,
        soru: 'Is she going to come? — No, she ___ not.', kabuller: <String>['is']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kYapi,
        soru: '"I am going travel." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kSoru,
        soru: '"Do you going to travel?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kOlumsuz,
        soru: '"She will not going to come." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kKanit,
        soru: 'Dizin: rain / is / to / It / going',
        kabuller: <String>['It is going to rain.', 'It is going to rain']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kPlan,
        soru: 'Ingilizceye cevirin: Araba alacagim.',
        kabuller: <String>['I am going to buy a car.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kSoru,
        soru: 'Ingilizceye cevirin: Ne yapacaksin?',
        kabuller: <String>['What are you going to do?']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kKanit,
        soru: 'Ingilizceye cevirin: Yagmur yagacak.',
        kabuller: <String>['It is going to rain.']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Yapi: be + going to + YALIN fiil',
        aciklama: 'Uc parca. Fiil hicbir ek almaz.',
        ornek: 'I am going to travel. (going to travels DEGIL)'),
      OzetMaddesi(baslik: 'Karar sorusu',
        aciklama: '"Bu karari SIMDI mi verdim, ONCEDEN mi?" Onceden -> going to.',
        ornek: 'I am going to buy a car. (plan var)'),
      OzetMaddesi(baslik: 'Gorunur kanit',
        aciklama: 'Su an gordugunuz bir isaretten tahmin yurutmek.',
        ornek: 'Look at those clouds! It is going to rain.'),
      OzetMaddesi(baslik: 'Olumsuz ve soru',
        aciklama: 'A1\u2019deki to be kurallari. do/does/will GIRMEZ.',
        ornek: 'I am not going to travel. · Are you going to travel?'),
      OzetMaddesi(baslik: '"going to go" dogrudur',
        aciklama: 'Birinci gelecek isareti, ikinci ana fiil. Kisaca "going to Ankara" da olur.',
        ornek: 'I am going to go to Ankara.'),
      OzetMaddesi(baslik: 'Zaman ifadeleri',
        aciklama: 'tomorrow · next week · tonight · soon — cumlenin sonuna.',
        ornek: 'I am going to call her tomorrow.'),
    ],
  );
}
