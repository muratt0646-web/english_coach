/// EN-A1-010 — Present Simple: Olumlu Cumle
/// SADECE VERI. A2 Past Simple'in on kosuludur.
library;

import '../model/ders_sablonu.dart';

class DersEnA1010 {
  const DersEnA1010._();

  static const String kKavram = 'Genis zaman kavrami';
  static const String kYalin = 'Fiil yalin hali';
  static const String kZaman = 'Zaman ifadeleri';
  static const String kSiklik = 'Siklik zarflari';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A1-010',
    baslik: 'Present Simple — Olumlu Cumle',
    seviye: 'A1', konu: 'ZAM', tahminiDk: 30,
    onKosullar: <String>['EN-A1-003'],
    girisMetni:
        'Turkcede "calisirim, calisirsin, calisir" dersin. Fiil her ozneye '
        'gore degisir ve zaman bilgisi de ekte saklidir.\n\n'
        'Ingilizcede Present Simple\'da fiil DEGISMEZ. Yalin haliyle yazilir: '
        'work.\n\n'
        'Peki zaman nereden anlasilir? Iki yerden: cumledeki zaman '
        'ifadelerinden (every day, on Mondays) ve fiilin yalin olmasindan.\n\n'
        'Bu ders, ALISKANLIK ve GENEL DOGRU anlatan cumleleri kurmayi '
        'ogretir. Su an olan bir sey icin kullanilmaz.',
    kazanimlar: <String>[
      'Present Simple\'in ne zaman kullanildigini bilmek',
      'Fiili yalin haliyle yazmak',
      'Zaman ifadelerini dogru yere koymak',
      'Siklik zarflarini dogru siraya yerlestirmek',
      'Turkce zaman ekleriyle farki gormek',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'P1', baslik: 'Present Simple ne anlatir?',
        govde: 'Uc sey anlatir:\n\n'
            '1. ALISKANLIK: her gun tekrarlanan seyler\n'
            '   I go to school every day.\n\n'
            '2. GENEL DOGRU: her zaman gecerli olan seyler\n'
            '   Water boils at 100 degrees.\n\n'
            '3. DURUM: degismeyen durumlar\n'
            '   She lives in Ankara.\n\n'
            'SU AN olan bir sey icin KULLANILMAZ. "Su anda calisiyorum" '
            'baska bir yapidir (Present Continuous).',
        turkceKarsilastirma: 'Her gun okula giderim.  ->  I go to school every day.\n'
            'Su an okula gidiyorum.  ->  BASKA YAPI (bu derste degil)'),
      AnlatimBlogu(kod: 'P2', baslik: 'Fiil neden degismiyor?',
        govde: 'Turkcede fiil alti bicime girer:\n'
            'calis-IRIM, calis-IRSIN, calis-IR, calis-IRIZ, calis-IRSINIZ, '
            'calis-IRLAR\n\n'
            'Ingilizcede tek bicim vardir: work.\n\n'
            'I work · You work · We work · They work\n\n'
            'Yalnizca he/she/it icin -s eklenir (EN-A1-011). Bu derste '
            'olumlu cumlenin temel kalibini oturtuyoruz.',
        turkceKarsilastirma: 'Ben calisirim / Sen calisirsin / Biz calisiriz\n'
            'I work      / You work      / We work'),
      AnlatimBlogu(kod: 'P3', baslik: 'Kalip: Ozne + Fiil + Geri kalan',
        govde: 'Present Simple olumlu cumle en sade kaliptir:\n\n'
            '   OZNE + FIIL + (nesne) + (yer) + (zaman)\n\n'
            'I  drink  coffee  at home  every morning.\n'
            'We play   football          on Sundays.\n\n'
            'Yardimci fiil YOKTUR. "do" olumlu cumlede kullanilmaz.',
        turkceKarsilastirma: 'Her sabah evde kahve icerim.\n'
            'I drink coffee at home every morning.'),
      AnlatimBlogu(kod: 'P4', baslik: 'Zaman ifadeleri nereye gelir?',
        govde: 'Zaman ifadesi genellikle cumlenin SONUNA gelir:\n\n'
            'every day · every morning · on Mondays · at weekends\n'
            'twice a week · in the evening\n\n'
            'I study English every day.\n\n'
            'Basa da alinabilir, ama sona koymak daha yaygindir:\n'
            'Every day I study English. (dogru ama daha az kullanilir)',
        turkceKarsilastirma: 'Her gun Ingilizce calisirim.\n'
            'I study English every day.  (zaman SONDA)'),
      AnlatimBlogu(kod: 'P5', baslik: 'Siklik zarflari FIILDEN ONCE',
        govde: 'Siklik zarflari zaman ifadelerinden FARKLI davranir. '
            'Fiilden ONCE gelirler:\n\n'
            'always · usually · often · sometimes · never\n\n'
            'I ALWAYS drink coffee.   (fiilden once)\n'
            'She OFTEN reads books.\n\n'
            'Ama "be" fiiliyle SONRA gelirler:\n'
            'I am always tired.  (am\'den sonra)',
        turkceKarsilastirma: 'Her zaman kahve icerim.  ->  I always drink coffee.\n'
            'Her zaman yorgunum.      ->  I am always tired.'),
      AnlatimBlogu(kod: 'P6', baslik: 'Sik yapilan iki hata',
        govde: '1. Turkce zaman ekini fiile tasimak:\n'
            '   "I working every day" (X)  ->  I work every day.\n'
            '   "-yorum" eki Ingilizceye tasinmaz.\n\n'
            '2. Olumluda "do" kullanmak:\n'
            '   "I do work every day" (X — vurgu disinda)\n'
            '   "do" yalnizca OLUMSUZ ve SORUDA gerekir (EN-A1-012).',
        turkceKarsilastirma: 'Her gun calisirim.  ->  I work every day.\n'
            'YANLIS: I working / I do work'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['I', 'I work', 'I work every day.'],
        turkce: 'Her gun calisirim.', not: 'Fiil yalin, zaman sonda.'),
      AdimliOrnek(adimlar: <String>['We', 'We play', 'We play football',
          'We play football on Sundays.'],
        turkce: 'Pazarlari futbol oynariz.', not: 'Nesne once, zaman sonra.'),
      AdimliOrnek(adimlar: <String>['They', 'They always',
          'They always eat breakfast.'],
        turkce: 'Onlar her zaman kahvalti eder.',
        not: 'Siklik zarfi fiilden ONCE.'),
      AdimliOrnek(adimlar: <String>['You', 'You study', 'You study English',
          'You study English twice a week.'],
        turkce: 'Haftada iki kez Ingilizce calisirsin.', not: 'Siklik ifadesi sonda.'),
      AdimliOrnek(adimlar: <String>['I', 'I am', 'I am always',
          'I am always ready.'],
        turkce: 'Her zaman hazirim.', not: 'be ile siklik zarfi SONRA gelir.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Her sabah kahve icerim.', 'Kim? -> I', 'Ne yapar? -> drink (yalin)',
        'Neyi? -> coffee', 'Ne zaman? -> every morning',
        'I drink coffee every morning.'],
        turkce: 'Turkceden Ingilizceye adim adim.',
        not: 'Zaman ifadesi en sona.'),
      AdimliOrnek(adimlar: <String>[
        'Biz asla gec kalmayiz.', 'Kim? -> We', 'Siklik? -> never (fiilden once)',
        'We never', 'We never arrive late.'],
        turkce: 'Siklik zarfinin yeri.',
        not: '"never" zaten olumsuz anlam tasir; "not" EKLENMEZ.'),
      AdimliOrnek(adimlar: <String>[
        'Onlar pazarlari calisir.', 'Kim? -> They', 'They work',
        'They work on Sundays.'],
        turkce: 'Gun adiyla "on" kullanilir.',
        not: 'on Mondays / on Sundays.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I work every day.', turkce: 'Her gun calisirim.', dogruMu: true, altKonu: kYalin),
      OrnekCumle(ingilizce: 'I drink coffee every morning.', turkce: 'Her sabah kahve icerim.', dogruMu: true, altKonu: kZaman),
      OrnekCumle(ingilizce: 'I live in Ankara.', turkce: 'Ankara\u2019da yasarim.', dogruMu: true, altKonu: kKavram),
      OrnekCumle(ingilizce: 'I study English twice a week.', turkce: 'Haftada iki kez Ingilizce calisirim.', dogruMu: true, altKonu: kZaman),
      OrnekCumle(ingilizce: 'I always eat breakfast.', turkce: 'Her zaman kahvalti ederim.', dogruMu: true, altKonu: kSiklik),
      OrnekCumle(ingilizce: 'You read a lot.', turkce: 'Cok okursun.', dogruMu: true, altKonu: kYalin),
      OrnekCumle(ingilizce: 'You often help me.', turkce: 'Bana sik sik yardim edersin.', dogruMu: true, altKonu: kSiklik),
      OrnekCumle(ingilizce: 'You go to school on Mondays.', turkce: 'Pazartesileri okula gidersin.', dogruMu: true, altKonu: kZaman),
      OrnekCumle(ingilizce: 'We play football on Sundays.', turkce: 'Pazarlari futbol oynariz.', dogruMu: true, altKonu: kZaman),
      OrnekCumle(ingilizce: 'We live near the school.', turkce: 'Okulun yakininda yasariz.', dogruMu: true, altKonu: kKavram),
      OrnekCumle(ingilizce: 'We usually walk to work.', turkce: 'Genelde ise yururuz.', dogruMu: true, altKonu: kSiklik),
      OrnekCumle(ingilizce: 'We eat dinner at seven.', turkce: 'Aksam yemegini yedide yeriz.', dogruMu: true, altKonu: kZaman),
      OrnekCumle(ingilizce: 'They study math.', turkce: 'Onlar matematik calisir.', dogruMu: true, altKonu: kYalin),
      OrnekCumle(ingilizce: 'They never arrive late.', turkce: 'Onlar asla gec kalmaz.', dogruMu: true, altKonu: kSiklik),
      OrnekCumle(ingilizce: 'They work in a big office.', turkce: 'Buyuk bir ofiste calisirlar.', dogruMu: true, altKonu: kYalin),
      OrnekCumle(ingilizce: 'They visit us every summer.', turkce: 'Her yaz bizi ziyaret ederler.', dogruMu: true, altKonu: kZaman),
      OrnekCumle(ingilizce: 'Children like sweets.', turkce: 'Cocuklar tatli sever.', dogruMu: true, altKonu: kKavram),
      OrnekCumle(ingilizce: 'Birds fly.', turkce: 'Kuslar ucar.', dogruMu: true, altKonu: kKavram),
      OrnekCumle(ingilizce: 'The shops open at nine.', turkce: 'Dukkanlar dokuzda acilir.', dogruMu: true, altKonu: kZaman),
      OrnekCumle(ingilizce: 'My parents live in Izmir.', turkce: 'Ailem Izmir\u2019de yasar.', dogruMu: true, altKonu: kKavram),
      OrnekCumle(ingilizce: 'I sometimes read at night.', turkce: 'Bazen gece okurum.', dogruMu: true, altKonu: kSiklik),
      OrnekCumle(ingilizce: 'We watch films at weekends.', turkce: 'Hafta sonlari film izleriz.', dogruMu: true, altKonu: kZaman),
      OrnekCumle(ingilizce: 'You speak English very well.', turkce: 'Ingilizceyi cok iyi konusursun.', dogruMu: true, altKonu: kYalin),
      OrnekCumle(ingilizce: 'They buy bread every morning.', turkce: 'Her sabah ekmek alirlar.', dogruMu: true, altKonu: kZaman),
      OrnekCumle(ingilizce: 'I am always ready.', turkce: 'Her zaman hazirim.', dogruMu: true, altKonu: kSiklik),
      OrnekCumle(ingilizce: 'We are usually at home.', turkce: 'Genelde evdeyiz.', dogruMu: true, altKonu: kSiklik),
      OrnekCumle(ingilizce: 'I write emails every day.', turkce: 'Her gun e-posta yazarim.', dogruMu: true, altKonu: kZaman),
      OrnekCumle(ingilizce: 'They listen to music.', turkce: 'Onlar muzik dinler.', dogruMu: true, altKonu: kYalin),
      OrnekCumle(ingilizce: 'We need more time.', turkce: 'Daha fazla zamana ihtiyacimiz var.', dogruMu: true, altKonu: kKavram),
      OrnekCumle(ingilizce: 'I remember your name.', turkce: 'Adini hatirliyorum.', dogruMu: true, altKonu: kKavram),

      OrnekCumle(ingilizce: 'I working every day.', turkce: 'Her gun calisirim.', dogruMu: false,
        neden: 'Present Simple\'da fiil YALIN yazilir. "-ing" Turkcedeki '
            '"-yorum" ekinin karsiligi degildir.',
        dogruBicim: 'I work every day.', hataTuru: 'GRAMER_HATASI', altKonu: kYalin),
      OrnekCumle(ingilizce: 'We playing football.', turkce: 'Futbol oynariz.', dogruMu: false,
        neden: 'Fiil yalin olmali: play. "-ing" bicimi baska bir yapidir.',
        dogruBicim: 'We play football.', hataTuru: 'GRAMER_HATASI', altKonu: kYalin),
      OrnekCumle(ingilizce: 'They studying math.', turkce: 'Matematik calisirlar.', dogruMu: false,
        neden: 'Yalin bicim: study. Ayrica "to be" da eksik.',
        dogruBicim: 'They study math.', hataTuru: 'GRAMER_HATASI', altKonu: kYalin),
      OrnekCumle(ingilizce: 'I am work every day.', turkce: 'Her gun calisirim.', dogruMu: false,
        neden: 'Present Simple\'da "to be" KULLANILMAZ. Fiil tek basina yeter.',
        dogruBicim: 'I work every day.', hataTuru: 'GRAMER_HATASI', altKonu: kYalin),
      OrnekCumle(ingilizce: 'We are live in Ankara.', turkce: 'Ankara\u2019da yasariz.', dogruMu: false,
        neden: '"are" fazladan. Present Simple\'da yardimci fiil yoktur.',
        dogruBicim: 'We live in Ankara.', hataTuru: 'GRAMER_HATASI', altKonu: kYalin),
      OrnekCumle(ingilizce: 'I do work every day.', turkce: 'Her gun calisirim.', dogruMu: false,
        neden: 'Olumlu cumlede "do" kullanilmaz. Yalnizca olumsuz ve soruda '
            'gerekir.', dogruBicim: 'I work every day.',
        hataTuru: 'FAZLA_KELIME', altKonu: kYalin),
      OrnekCumle(ingilizce: 'They do study math.', turkce: 'Matematik calisirlar.', dogruMu: false,
        neden: '"do" olumluda gereksizdir.', dogruBicim: 'They study math.',
        hataTuru: 'FAZLA_KELIME', altKonu: kYalin),
      OrnekCumle(ingilizce: 'I every day work.', turkce: 'Her gun calisirim.', dogruMu: false,
        neden: 'Zaman ifadesi fiil ile ozne arasina GIRMEZ. Sona gelir.',
        dogruBicim: 'I work every day.', hataTuru: 'KELIME_SIRASI', altKonu: kZaman),
      OrnekCumle(ingilizce: 'We on Sundays play football.', turkce: 'Pazarlari futbol oynariz.', dogruMu: false,
        neden: 'Zaman ifadesi cumlenin sonuna gelir.',
        dogruBicim: 'We play football on Sundays.', hataTuru: 'KELIME_SIRASI', altKonu: kZaman),
      OrnekCumle(ingilizce: 'I drink every morning coffee.', turkce: 'Her sabah kahve icerim.', dogruMu: false,
        neden: 'Zaman ifadesi NESNEDEN sonra gelir, arasina girmez.',
        dogruBicim: 'I drink coffee every morning.', hataTuru: 'KELIME_SIRASI', altKonu: kZaman),
      OrnekCumle(ingilizce: 'I drink always coffee.', turkce: 'Her zaman kahve icerim.', dogruMu: false,
        neden: 'Siklik zarfi fiilden ONCE gelir, sonra degil.',
        dogruBicim: 'I always drink coffee.', hataTuru: 'KELIME_SIRASI', altKonu: kSiklik),
      OrnekCumle(ingilizce: 'They arrive never late.', turkce: 'Asla gec kalmazlar.', dogruMu: false,
        neden: '"never" fiilden once gelir.', dogruBicim: 'They never arrive late.',
        hataTuru: 'KELIME_SIRASI', altKonu: kSiklik),
      OrnekCumle(ingilizce: 'Always I read books.', turkce: 'Her zaman kitap okurum.', dogruMu: false,
        neden: 'Siklik zarfi ozneden once degil, fiilden once gelir.',
        dogruBicim: 'I always read books.', hataTuru: 'KELIME_SIRASI', altKonu: kSiklik),
      OrnekCumle(ingilizce: 'I always am ready.', turkce: 'Her zaman hazirim.', dogruMu: false,
        neden: '"be" fiiliyle siklik zarfi SONRA gelir: I am always ready.',
        dogruBicim: 'I am always ready.', hataTuru: 'KELIME_SIRASI', altKonu: kSiklik),
      OrnekCumle(ingilizce: 'They never not work.', turkce: 'Asla calismazlar.', dogruMu: false,
        neden: '"never" zaten olumsuzdur; "not" eklenmez.',
        dogruBicim: 'They never work.', hataTuru: 'FAZLA_KELIME', altKonu: kSiklik),
      OrnekCumle(ingilizce: 'We play football in Sundays.', turkce: 'Pazarlari futbol oynariz.', dogruMu: false,
        neden: 'Gun adlariyla "on" kullanilir, "in" degil.',
        dogruBicim: 'We play football on Sundays.', hataTuru: 'GRAMER_HATASI', altKonu: kZaman),
      OrnekCumle(ingilizce: 'I study English two times a week.', turkce: 'Haftada iki kez calisirim.', dogruMu: false,
        neden: 'Iki kez icin "twice" kullanilir.',
        dogruBicim: 'I study English twice a week.', hataTuru: 'KELIME_SECIMI', altKonu: kZaman),
      OrnekCumle(ingilizce: 'Work every day.', turkce: 'Her gun calisirim.', dogruMu: false,
        neden: 'Ozne eksik; cumle emir gibi anlasilir.',
        dogruBicim: 'I work every day.', hataTuru: 'EKSIK_KELIME', altKonu: kYalin),
      OrnekCumle(ingilizce: 'Birds flies.', turkce: 'Kuslar ucar.', dogruMu: false,
        neden: '"Birds" coguldur; -s ALMAZ.', dogruBicim: 'Birds fly.',
        hataTuru: 'GRAMER_HATASI', altKonu: kYalin),
      OrnekCumle(ingilizce: 'I am living in Ankara every year.', turkce: 'Ankara\u2019da yasarim.', dogruMu: false,
        neden: 'Degismeyen durum icin Present Simple kullanilir.',
        dogruBicim: 'I live in Ankara.', hataTuru: 'GRAMER_HATASI', altKonu: kKavram),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kYalin,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I working every day.', 'I work every day.', 'I am work every day.'],
        kabuller: <String>['I work every day.'], geriDonusKodu: 'P2',
        aciklama: 'Fiil yalin yazilir.'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kZaman,
        soru: 'Zaman ifadesi nereye gelir?',
        secenekler: <String>['Ozne ile fiil arasina', 'Cumlenin sonuna', 'Fiilin onune'],
        kabuller: <String>['Cumlenin sonuna'], geriDonusKodu: 'P4'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kSiklik,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I drink always coffee.', 'I always drink coffee.', 'Always I drink coffee.'],
        kabuller: <String>['I always drink coffee.'], geriDonusKodu: 'P5',
        aciklama: 'Siklik zarfi fiilden once.'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kYalin,
        soru: 'Olumlu cumlede "do" kullanilir mi?',
        secenekler: <String>['Evet, her zaman', 'Hayir, gereksizdir', 'Yalnizca coguldu'],
        kabuller: <String>['Hayir, gereksizdir'], geriDonusKodu: 'P6'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kYalin,
        soru: 'I ___ every day. (work)', kabuller: <String>['work']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kYalin,
        soru: 'They ___ math. (study)', kabuller: <String>['study']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kZaman,
        soru: 'We play football ___ Sundays.', kabuller: <String>['on']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kSiklik,
        soru: 'I ___ eat breakfast. (her zaman)', kabuller: <String>['always']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.eslestirme, altKonu: kSiklik,
        soru: '"be" fiiliyle siklik zarfi nereye gelir?',
        secenekler: <String>['Once', 'Sonra'], kabuller: <String>['Sonra']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kZaman,
        soru: 'Haftada iki kez nasil soylenir?',
        secenekler: <String>['two times a week', 'twice a week', 'two in week'],
        kabuller: <String>['twice a week']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.kelimeDizme, altKonu: kZaman,
        soru: 'Dizin: every day / I / work',
        kabuller: <String>['I work every day.', 'I work every day']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.surukleBirak, altKonu: kSiklik,
        soru: 'Dizin: coffee / always / I / drink',
        kabuller: <String>['I always drink coffee.', 'I always drink coffee']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.coktanSecmeli, altKonu: kKavram,
        soru: 'Present Simple hangisini anlatmaz?',
        secenekler: <String>['Aliskanlik', 'Genel dogru', 'Su an olan is'],
        kabuller: <String>['Su an olan is']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kSiklik,
        soru: '"They never not work." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis'],
        aciklama: '"never" zaten olumsuzdur.'),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kZaman, turkce: 'Her gun calisirim.',
        kabuller: <String>['I work every day.', 'I work every day']),
      SerbestGorev(kod: 'SU-2', altKonu: kSiklik, turkce: 'Her zaman kahve icerim.',
        kabuller: <String>['I always drink coffee.', 'I always drink coffee']),
      SerbestGorev(kod: 'SU-3', altKonu: kZaman, turkce: 'Pazarlari futbol oynariz.',
        kabuller: <String>['We play football on Sundays.',
            'We play football on Sundays']),
      SerbestGorev(kod: 'SU-4', altKonu: kKavram, turkce: 'Onlar Ankara\u2019da yasar.',
        kabuller: <String>['They live in Ankara.', 'They live in Ankara']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kYalin,
        soru: 'We ___ in Izmir. (live)', kabuller: <String>['live']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kSiklik,
        soru: 'They ___ arrive late. (asla)', kabuller: <String>['never']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kZaman,
        soru: 'I read books ___ night.', kabuller: <String>['at']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.coktanSecmeli, altKonu: kYalin,
        soru: 'Hangisi dogru?',
        secenekler: <String>['We are live here.', 'We live here.', 'We living here.'],
        kabuller: <String>['We live here.']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.dogruYanlis, altKonu: kSiklik,
        soru: '"I always am ready." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.kelimeDizme, altKonu: kZaman,
        soru: 'Dizin: at weekends / films / We / watch',
        kabuller: <String>['We watch films at weekends.',
            'We watch films at weekends']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.boslukDoldurma, altKonu: kYalin,
        soru: 'Birds ___. (fly)', kabuller: <String>['fly']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.eslestirme, altKonu: kKavram,
        soru: 'Present Simple hangi durumu anlatir?',
        secenekler: <String>['Su anki is', 'Aliskanlik', 'Gecmis olay'],
        kabuller: <String>['Aliskanlik']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kYalin,
        soru: 'I ___ every day.', secenekler: <String>['work', 'working', 'am work'],
        kabuller: <String>['work']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kYalin,
        soru: 'They ___ math.', secenekler: <String>['studying', 'study', 'are study'],
        kabuller: <String>['study']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kSiklik,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I drink always tea.', 'I always drink tea.', 'Always I drink tea.'],
        kabuller: <String>['I always drink tea.']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kZaman,
        soru: 'We play tennis ___ Mondays.',
        secenekler: <String>['in', 'on', 'at'], kabuller: <String>['on']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kSiklik,
        soru: 'I ___ tired in the morning.',
        secenekler: <String>['always am', 'am always', 'always'],
        kabuller: <String>['am always']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kYalin,
        soru: 'You ___ English very well. (speak)', kabuller: <String>['speak']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kZaman,
        soru: 'They visit us every ___. (yaz)', kabuller: <String>['summer']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kSiklik,
        soru: 'We ___ walk to work. (genelde)', kabuller: <String>['usually']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kYalin,
        soru: '"I do work every day." olumlu cumlede dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kZaman,
        soru: '"I every day work." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.kelimeDizme, altKonu: kZaman,
        soru: 'Dizin: every morning / coffee / I / drink',
        kabuller: <String>['I drink coffee every morning.',
            'I drink coffee every morning']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kSiklik,
        soru: 'Dizin: late / never / They / arrive',
        kabuller: <String>['They never arrive late.', 'They never arrive late']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kZaman,
        soru: 'Ingilizceye cevirin: Her gun Ingilizce calisirim.',
        kabuller: <String>['I study English every day.',
            'I study English every day']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kSiklik,
        soru: 'Ingilizceye cevirin: Onlar her zaman kahvalti eder.',
        kabuller: <String>['They always eat breakfast.',
            'They always eat breakfast']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kKavram,
        soru: 'Ingilizceye cevirin: Biz okulun yakininda yasariz.',
        kabuller: <String>['We live near the school.', 'We live near the school']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Ne anlatir?',
        aciklama: 'Aliskanlik, genel dogru ve degismeyen durum. Su an olan is DEGIL.',
        ornek: 'I go to school every day.'),
      OzetMaddesi(baslik: 'Fiil yalin',
        aciklama: 'I / you / we / they ile fiil hic degismez.',
        ornek: 'I work · You work · We work · They work'),
      OzetMaddesi(baslik: 'Yardimci fiil yok',
        aciklama: 'Olumlu cumlede "do" ve "be" KULLANILMAZ.',
        ornek: 'I work. (X: I do work / I am work)'),
      OzetMaddesi(baslik: 'Zaman ifadesi SONDA',
        aciklama: 'every day, on Mondays, twice a week — cumlenin sonuna.',
        ornek: 'I study English every day.'),
      OzetMaddesi(baslik: 'Siklik zarfi fiilden ONCE',
        aciklama: 'always, usually, often, sometimes, never.',
        ornek: 'I always drink coffee.'),
      OzetMaddesi(baslik: 'be ile istisna',
        aciklama: '"be" fiiliyle siklik zarfi SONRA gelir.',
        ornek: 'I am always tired.'),
    ],
  );
}
