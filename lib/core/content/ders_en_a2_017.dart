/// EN-A2-017 — for / since ve Present Perfect Suresi
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnA2017 {
  const DersEnA2017._();

  static const String kFor = 'for (sure)';
  static const String kSince = 'since (baslangic)';
  static const String kHowLong = 'How long soru';
  static const String kSuruyor = 'Hala suruyor';
  static const String kAgoFark = 'ago ile fark';
  static const String kSecim = 'for mu since mi?';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A2-017',
    baslik: 'for / since — Ne Kadar Suredir',
    seviye: 'A2', konu: 'ZAM', tahminiDk: 35,
    onKosullar: <String>['EN-A2-016'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'Turkce sureyi tek yapiyla anlatir: "-dir / -dan beri".\n\n'
        '  Bes yildir burada yasiyorum.\n'
        '  2020\u2019den beri burada yasiyorum.\n\n'
        'Ingilizce ikisini AYRI kelimelerle isaretler:\n\n'
        '  FOR   -> SURE ne kadar?      for five years\n'
        '  SINCE -> NE ZAMAN basladi?   since 2020\n\n'
        'Karar vermek icin tek soru yeter:\n\n'
        '  "Bu bir SURE mi, yoksa bir BASLANGIC NOKTASI mi?"\n\n'
        '  Sure (uzunluk)     -> for\n'
        '  Nokta (baslangic)  -> since\n\n'
        'Ve cok onemli bir nokta: bu yapi eylemin HALA SURDUGUNU '
        'anlatir. "I have lived here for five years" demek, hala '
        'burada yasadiginiz anlamina gelir.\n\n'
        'Bu, Present Perfect\u2019in ikinci temel kullanimidir: gecmiste '
        'baslayip SIMDIYE kadar suren durumlar.',
    kazanimlar: <String>[
      'for ile sure uzunlugunu anlatmak',
      'since ile baslangic noktasini anlatmak',
      'How long sorusunu kurmak',
      'Eylemin hala surdugunu ifade etmek',
      'ago ile since farkini bilmek',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'AC1', baslik: 'for: SURE uzunlugu',
        govde: '"for" ne kadar SURE gectigini bildirir. Bir uzunluktur.\n\n'
            '  for two hours · for three days · for five years\n'
            '  for a long time · for ten minutes · for ages\n\n'
            '  I have lived here for five years.\n'
            '  She has worked here for two months.\n\n'
            'DUSUNME NOTU: "for"dan sonra gelen sey bir SAYI + ZAMAN '
            'BIRIMIDIR. Takvimde bir nokta degildir.',
        turkceKarsilastirma: 'Bes yildir burada yasiyorum.\n'
            'I have lived here for five years.'),
      AnlatimBlogu(kod: 'AC2', baslik: 'since: BASLANGIC noktasi',
        govde: '"since" eylemin NE ZAMAN basladigini bildirir. Takvimde '
            'bir noktadir.\n\n'
            '  since 2020 · since Monday · since January\n'
            '  since yesterday · since I was a child\n'
            '  since this morning\n\n'
            '  I have lived here since 2020.\n'
            '  She has worked here since March.\n\n'
            'DUSUNME NOTU: "since"tan sonra gelen sey takvime bakip '
            'gosterebileceginiz bir andir.',
        turkceKarsilastirma: '2020\u2019den beri burada yasiyorum.\n'
            'I have lived here since 2020.'),
      AnlatimBlogu(kod: 'AC3', baslik: 'Secim: uzunluk mu nokta mi?',
        govde: 'Ayni durum iki sekilde anlatilabilir:\n\n'
            '  I have been here FOR five years.   (uzunluk)\n'
            '  I have been here SINCE 2020.       (nokta)\n\n'
            'Ikisi de dogrudur; yalnizca bakis acisi degisir.\n\n'
            'HIZLI TEST: Ifadenin onune "ne kadar sure?" sorusunu koyun.\n'
            '  "bes yil" -> ne kadar sure? EVET -> for\n'
            '  "2020"    -> ne kadar sure? HAYIR, bu bir tarih -> since\n\n'
            'Sik hata: ikisini karistirmak.\n'
            '  since five years -> YANLIS\n'
            '  for 2020         -> YANLIS',
        turkceKarsilastirma: 'Turkcede "-dir" ve "-dan beri" ayni islevi '
            'gorur; Ingilizcede ayrilir.'),
      AnlatimBlogu(kod: 'AC4', baslik: 'Hala suruyor',
        govde: 'Bu yapi eylemin HALA devam ettigini anlatir:\n\n'
            '  I have lived here for five years.\n'
            '  -> Bes yil once geldim ve HALA buradayim.\n\n'
            'Bittiyse Past Simple kullanilir:\n'
            '  I lived there for five years. (artik orada degilim)\n\n'
            'FARK:\n'
            '  I have worked here for two years.  -> hala calisiyorum\n'
            '  I worked there for two years.      -> artik calismiyorum\n\n'
            'DUSUNME NOTU: Present Perfect bir KOPRU kurar. Kopru hala '
            'ayaktaysa Perfect, yikildiysa Past Simple.',
        turkceKarsilastirma: 'Iki yildir burada calisiyorum. (suruyor)\n'
            'I have worked here for two years.'),
      AnlatimBlogu(kod: 'AC5', baslik: 'How long soru kalibi',
        govde: 'Sure sorarken:\n\n'
            '  HOW LONG + have/has + ozne + 3. bicim\n\n'
            '  How long have you lived here?\n'
            '  How long has she worked there?\n\n'
            'Cevapta for veya since kullanilir:\n'
            '  For five years. / Since 2020.\n\n'
            'DIKKAT: "How long time" diye bir sey YOKTUR.\n'
            '  How long time have you...  -> YANLIS\n'
            '  How long have you...       -> DOGRU',
        turkceKarsilastirma: 'Ne kadar suredir burada yasiyorsun?\n'
            'How long have you lived here?'),
      AnlatimBlogu(kod: 'AC6', baslik: 'since ile ago karistirmayin',
        govde: 'Ikisi de gecmise isaret eder ama farkli calisirlar:\n\n'
            '  AGO   -> Past Simple ile, geriye sayar\n'
            '     I came here five years AGO.\n'
            '     (Bes yil once geldim — o an bitti.)\n\n'
            '  SINCE -> Present Perfect ile, o andan bugune\n'
            '     I have been here SINCE 2020.\n'
            '     (2020\u2019den bu yana — hala suruyor.)\n\n'
            'Yanlis birlesimler:\n'
            '  I have come here five years ago. -> YANLIS\n'
            '  I am here since 2020.            -> YANLIS\n\n'
            'Son ornek onemli: "since" varsa Present Perfect gerekir, '
            'Present Simple degil.',
        turkceKarsilastirma: 'Bes yil once geldim.   ->  I came five years ago.\n'
            '2020\u2019den beri buradayim. ->  I have been here since 2020.'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['five years', 'for five years', 'I have lived here for five years.'],
        turkce: 'Bes yildir burada yasiyorum.', not: 'Uzunluk -> for.'),
      AdimliOrnek(adimlar: <String>['2020', 'since 2020', 'I have lived here since 2020.'],
        turkce: '2020\u2019den beri.', not: 'Nokta -> since.'),
      AdimliOrnek(adimlar: <String>['How long', 'How long have you', 'How long have you lived here?'],
        turkce: 'Ne kadar suredir?', not: '"How long time" YOK.'),
      AdimliOrnek(adimlar: <String>['I have worked here.', 'I worked there.'],
        turkce: 'suruyor / bitti', not: 'Kopru ayakta mi?'),
      AdimliOrnek(adimlar: <String>['five years ago', 'since 2020'],
        turkce: 'Past Simple / Present Perfect', not: 'Farkli yapilar.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Iki aydir burada calisiyor.', 'iki ay = UZUNLUK -> for',
        'hala suruyor -> Perfect', 'She has worked here for two months.'],
        turkce: 'Uzunluk + suruyor.', not: 'since two months YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Mart\u2019tan beri burada.', 'Mart = NOKTA -> since',
        'has been', 'She has been here since March.'],
        turkce: 'Baslangic noktasi.', not: 'for March YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Bes yil once geldim.', 'ago -> Past Simple', 'came',
        'I came here five years ago.'],
        turkce: 'ago Perfect ile kullanilmaz.',
        not: 'have come ago YANLIS.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I have lived here for five years.', turkce: 'Bes yildir burada yasiyorum.', dogruMu: true, altKonu: kFor),
      OrnekCumle(ingilizce: 'She has worked here for two months.', turkce: 'Iki aydir burada calisiyor.', dogruMu: true, altKonu: kFor),
      OrnekCumle(ingilizce: 'We have waited for two hours.', turkce: 'Iki saattir bekliyoruz.', dogruMu: true, altKonu: kFor),
      OrnekCumle(ingilizce: 'They have known each other for a long time.', turkce: 'Uzun zamandir birbirlerini taniyorlar.', dogruMu: true, altKonu: kFor),
      OrnekCumle(ingilizce: 'He has been ill for three days.', turkce: 'Uc gundur hasta.', dogruMu: true, altKonu: kFor),
      OrnekCumle(ingilizce: 'I have studied English for ten years.', turkce: 'On yildir Ingilizce calisiyorum.', dogruMu: true, altKonu: kFor),
      OrnekCumle(ingilizce: 'I have lived here since 2020.', turkce: '2020\u2019den beri burada yasiyorum.', dogruMu: true, altKonu: kSince),
      OrnekCumle(ingilizce: 'She has worked here since March.', turkce: 'Mart\u2019tan beri burada calisiyor.', dogruMu: true, altKonu: kSince),
      OrnekCumle(ingilizce: 'We have been friends since childhood.', turkce: 'Cocukluktan beri arkadasiz.', dogruMu: true, altKonu: kSince),
      OrnekCumle(ingilizce: 'He has been here since Monday.', turkce: 'Pazartesiden beri burada.', dogruMu: true, altKonu: kSince),
      OrnekCumle(ingilizce: 'It has rained since this morning.', turkce: 'Bu sabahtan beri yagmur yagiyor.', dogruMu: true, altKonu: kSince),
      OrnekCumle(ingilizce: 'I have known her since I was a child.', turkce: 'Cocuklugumdan beri onu taniyorum.', dogruMu: true, altKonu: kSince),
      OrnekCumle(ingilizce: 'How long have you lived here?', turkce: 'Ne kadar suredir burada yasiyorsun?', dogruMu: true, altKonu: kHowLong),
      OrnekCumle(ingilizce: 'How long has she worked there?', turkce: 'Ne kadar suredir orada calisiyor?', dogruMu: true, altKonu: kHowLong),
      OrnekCumle(ingilizce: 'How long have they been married?', turkce: 'Ne kadar suredir evliler?', dogruMu: true, altKonu: kHowLong),
      OrnekCumle(ingilizce: 'For five years.', turkce: 'Bes yildir.', dogruMu: true, altKonu: kHowLong),
      OrnekCumle(ingilizce: 'Since 2020.', turkce: '2020\u2019den beri.', dogruMu: true, altKonu: kHowLong),
      OrnekCumle(ingilizce: 'I have worked here for two years.', turkce: 'Iki yildir burada calisiyorum.', dogruMu: true, altKonu: kSuruyor),
      OrnekCumle(ingilizce: 'I worked there for two years.', turkce: 'Orada iki yil calistim.', dogruMu: true, altKonu: kSuruyor),
      OrnekCumle(ingilizce: 'She has been my teacher since 2019.', turkce: '2019\u2019dan beri ogretmenim.', dogruMu: true, altKonu: kSuruyor),
      OrnekCumle(ingilizce: 'We have had this car for six months.', turkce: 'Alti aydir bu arabamiz var.', dogruMu: true, altKonu: kSuruyor),
      OrnekCumle(ingilizce: 'I came here five years ago.', turkce: 'Bes yil once buraya geldim.', dogruMu: true, altKonu: kAgoFark),
      OrnekCumle(ingilizce: 'She started the job two months ago.', turkce: 'Ise iki ay once basladi.', dogruMu: true, altKonu: kAgoFark),
      OrnekCumle(ingilizce: 'They moved here a year ago.', turkce: 'Bir yil once buraya tasindilar.', dogruMu: true, altKonu: kAgoFark),
      OrnekCumle(ingilizce: 'I met him three days ago.', turkce: 'Onunla uc gun once tanistim.', dogruMu: true, altKonu: kAgoFark),
      OrnekCumle(ingilizce: 'I have been here for a week.', turkce: 'Bir haftadir buradayim.', dogruMu: true, altKonu: kSecim),
      OrnekCumle(ingilizce: 'I have been here since last week.', turkce: 'Gecen haftadan beri buradayim.', dogruMu: true, altKonu: kSecim),
      OrnekCumle(ingilizce: "She hasn't called me for two days.", turkce: 'Iki gundur beni aramadi.', dogruMu: true, altKonu: kSecim),
      OrnekCumle(ingilizce: "We haven't seen him since Friday.", turkce: 'Cumadan beri onu gormedik.', dogruMu: true, altKonu: kSecim),
      OrnekCumle(ingilizce: 'He has not eaten anything since morning.', turkce: 'Sabahtan beri bir sey yemedi.', dogruMu: true, altKonu: kSecim),

      OrnekCumle(ingilizce: 'I have lived here since five years.', turkce: 'Bes yildir burada yasiyorum.', dogruMu: false,
        neden: '"bes yil" bir UZUNLUKTUR; "for" gerekir. "since" takvimde '
            'bir nokta ister.', dogruBicim: 'I have lived here for five years.',
        hataTuru: 'KELIME_SECIMI', altKonu: kSecim),
      OrnekCumle(ingilizce: 'She has worked here for March.', turkce: 'Mart\u2019tan beri calisiyor.', dogruMu: false,
        neden: '"Mart" bir NOKTADIR; "since" gerekir.',
        dogruBicim: 'She has worked here since March.', hataTuru: 'KELIME_SECIMI', altKonu: kSecim),
      OrnekCumle(ingilizce: 'We have waited since two hours.', turkce: 'Iki saattir bekliyoruz.', dogruMu: false,
        neden: '"iki saat" uzunluktur -> for.', dogruBicim: 'We have waited for two hours.',
        hataTuru: 'KELIME_SECIMI', altKonu: kSecim),
      OrnekCumle(ingilizce: 'He has been here for Monday.', turkce: 'Pazartesiden beri burada.', dogruMu: false,
        neden: '"Pazartesi" bir nokta -> since.', dogruBicim: 'He has been here since Monday.',
        hataTuru: 'KELIME_SECIMI', altKonu: kSecim),
      OrnekCumle(ingilizce: 'I have known her for I was a child.', turkce: 'Cocuklugumdan beri taniyorum.', dogruMu: false,
        neden: 'Baslangic anini anlatan yan cumle "since" alir.',
        dogruBicim: 'I have known her since I was a child.', hataTuru: 'KELIME_SECIMI', altKonu: kSince),
      OrnekCumle(ingilizce: 'I live here for five years.', turkce: 'Bes yildir burada yasiyorum.', dogruMu: false,
        neden: 'Gecmiste baslayip suren durum Present Perfect ister.',
        dogruBicim: 'I have lived here for five years.', hataTuru: 'GRAMER_HATASI', altKonu: kSuruyor),
      OrnekCumle(ingilizce: 'I am here since 2020.', turkce: '2020\u2019den beri buradayim.', dogruMu: false,
        neden: '"since" varsa Present Perfect gerekir; Present Simple olmaz.',
        dogruBicim: 'I have been here since 2020.', hataTuru: 'GRAMER_HATASI', altKonu: kSuruyor),
      OrnekCumle(ingilizce: 'She works here since March.', turkce: 'Mart\u2019tan beri calisiyor.', dogruMu: false,
        neden: 'since + Present Perfect gerekir.',
        dogruBicim: 'She has worked here since March.', hataTuru: 'GRAMER_HATASI', altKonu: kSuruyor),
      OrnekCumle(ingilizce: 'I have come here five years ago.', turkce: 'Bes yil once geldim.', dogruMu: false,
        neden: '"ago" bitmis zamandir; Past Simple gerekir.',
        dogruBicim: 'I came here five years ago.', hataTuru: 'ANLAM_FARKI', altKonu: kAgoFark),
      OrnekCumle(ingilizce: 'She has started the job two months ago.', turkce: 'Iki ay once basladi.', dogruMu: false,
        neden: '"ago" ile Present Perfect kullanilmaz.',
        dogruBicim: 'She started the job two months ago.', hataTuru: 'ANLAM_FARKI', altKonu: kAgoFark),
      OrnekCumle(ingilizce: 'I have been here since five years ago.', turkce: 'Bes yildir buradayim.', dogruMu: false,
        neden: '"since ... ago" birlesimi kullanilmaz; "for five years" '
            'denir.', dogruBicim: 'I have been here for five years.',
        hataTuru: 'FAZLA_KELIME', altKonu: kAgoFark),
      OrnekCumle(ingilizce: 'How long time have you lived here?', turkce: 'Ne kadar suredir burada yasiyorsun?', dogruMu: false,
        neden: '"How long time" diye bir kalip YOKTUR.',
        dogruBicim: 'How long have you lived here?', hataTuru: 'FAZLA_KELIME', altKonu: kHowLong),
      OrnekCumle(ingilizce: 'How long you have lived here?', turkce: 'Ne kadar suredir yasiyorsun?', dogruMu: false,
        neden: 'Soruda "have" ozneden ONCE gelir.',
        dogruBicim: 'How long have you lived here?', hataTuru: 'KELIME_SIRASI', altKonu: kHowLong),
      OrnekCumle(ingilizce: 'How long has they been married?', turkce: 'Ne kadar suredir evliler?', dogruMu: false,
        neden: 'Cogul ozne "have" alir.', dogruBicim: 'How long have they been married?',
        hataTuru: 'GRAMER_HATASI', altKonu: kHowLong),
      OrnekCumle(ingilizce: 'I have lived here for since 2020.', turkce: '2020\u2019den beri.', dogruMu: false,
        neden: 'Ikisi birlikte kullanilmaz; biri secilir.',
        dogruBicim: 'I have lived here since 2020.', hataTuru: 'FAZLA_KELIME', altKonu: kSecim),
      OrnekCumle(ingilizce: 'He has been ill since three days.', turkce: 'Uc gundur hasta.', dogruMu: false,
        neden: '"uc gun" uzunluktur -> for.', dogruBicim: 'He has been ill for three days.',
        hataTuru: 'KELIME_SECIMI', altKonu: kFor),
      OrnekCumle(ingilizce: 'It has rained for this morning.', turkce: 'Bu sabahtan beri yagiyor.', dogruMu: false,
        neden: '"bu sabah" bir baslangic noktasidir -> since.',
        dogruBicim: 'It has rained since this morning.', hataTuru: 'KELIME_SECIMI', altKonu: kSince),
      OrnekCumle(ingilizce: "She doesn't call me for two days.", turkce: 'Iki gundur aramadi.', dogruMu: false,
        neden: 'Suren durum Present Perfect ister.',
        dogruBicim: "She hasn't called me for two days.", hataTuru: 'GRAMER_HATASI', altKonu: kSuruyor),
      OrnekCumle(ingilizce: 'We have known each other since a long time.', turkce: 'Uzun zamandir taniyoruz.', dogruMu: false,
        neden: '"uzun zaman" bir uzunluktur -> for.',
        dogruBicim: 'We have known each other for a long time.',
        hataTuru: 'KELIME_SECIMI', altKonu: kFor),
      OrnekCumle(ingilizce: 'I have studied English since ten years.', turkce: 'On yildir calisiyorum.', dogruMu: false,
        neden: '"on yil" uzunluktur -> for.',
        dogruBicim: 'I have studied English for ten years.', hataTuru: 'KELIME_SECIMI', altKonu: kFor),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kFor,
        soru: 'I have lived here ___ five years.',
        secenekler: <String>['since', 'for', 'ago'],
        kabuller: <String>['for'], geriDonusKodu: 'AC1'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kSince,
        soru: 'She has worked here ___ March.',
        secenekler: <String>['for', 'since', 'ago'],
        kabuller: <String>['since'], geriDonusKodu: 'AC2'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kSuruyor,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I am here since 2020.', 'I have been here since 2020.', 'I was here since 2020.'],
        kabuller: <String>['I have been here since 2020.'], geriDonusKodu: 'AC4'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kHowLong,
        soru: 'Hangisi dogru?',
        secenekler: <String>['How long time have you lived here?', 'How long have you lived here?', 'How long you have lived here?'],
        kabuller: <String>['How long have you lived here?'], geriDonusKodu: 'AC5'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kAgoFark,
        soru: '"Bes yil once geldim." hangisi?',
        secenekler: <String>['I have come here five years ago.', 'I came here five years ago.', 'I have been here five years ago.'],
        kabuller: <String>['I came here five years ago.'], geriDonusKodu: 'AC6'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kFor,
        soru: 'We have waited ___ two hours.', kabuller: <String>['for']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kSince,
        soru: 'He has been here ___ Monday.', kabuller: <String>['since']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kFor,
        soru: 'He has been ill ___ three days.', kabuller: <String>['for']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kSince,
        soru: 'It has rained ___ this morning.', kabuller: <String>['since']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kHowLong,
        soru: 'How long ___ you lived here?', kabuller: <String>['have']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kSecim,
        soru: '"a long time" ile hangisi kullanilir?',
        secenekler: <String>['for', 'since', 'ago'], kabuller: <String>['for']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kSecim,
        soru: '"childhood" ile hangisi kullanilir?',
        secenekler: <String>['for', 'since', 'ago'], kabuller: <String>['since']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kFor,
        soru: 'Dizin: years / here / for / lived / I / five / have',
        kabuller: <String>['I have lived here for five years.',
            'I have lived here for five years']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kHowLong,
        soru: 'Dizin: here / lived / How / have / long / you',
        kabuller: <String>['How long have you lived here?',
            'How long have you lived here']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kAgoFark,
        soru: '"I have come here five years ago." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kFor, turkce: 'Bes yildir burada yasiyorum.',
        kabuller: <String>['I have lived here for five years.']),
      SerbestGorev(kod: 'SU-2', altKonu: kSince, turkce: '2020\u2019den beri burada yasiyorum.',
        kabuller: <String>['I have lived here since 2020.']),
      SerbestGorev(kod: 'SU-3', altKonu: kHowLong, turkce: 'Ne kadar suredir burada yasiyorsun?',
        kabuller: <String>['How long have you lived here?']),
      SerbestGorev(kod: 'SU-4', altKonu: kAgoFark, turkce: 'Bes yil once buraya geldim.',
        kabuller: <String>['I came here five years ago.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kFor,
        soru: 'I have studied English ___ ten years.', kabuller: <String>['for']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kSince,
        soru: 'We have been friends ___ childhood.', kabuller: <String>['since']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kSuruyor,
        soru: 'She ___ worked here since March. (has / does)',
        kabuller: <String>['has']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.coktanSecmeli, altKonu: kAgoFark,
        soru: 'Hangisi dogru?',
        secenekler: <String>['She has started two months ago.', 'She started two months ago.', 'She started since two months.'],
        kabuller: <String>['She started two months ago.']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.dogruYanlis, altKonu: kSecim,
        soru: '"I have lived here since five years." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kHowLong,
        soru: '"How long time have you...?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kSince,
        soru: 'Dizin: March / worked / She / since / here / has',
        kabuller: <String>['She has worked here since March.',
            'She has worked here since March']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kSuruyor,
        soru: 'I ___ been here since Monday. (have / am)',
        kabuller: <String>['have']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kFor,
        soru: 'We have waited ___ two hours.',
        secenekler: <String>['since', 'for', 'ago'], kabuller: <String>['for']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kSince,
        soru: 'He has been here ___ Monday.',
        secenekler: <String>['for', 'since', 'ago'], kabuller: <String>['since']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kFor,
        soru: 'They have known each other ___ a long time.',
        secenekler: <String>['since', 'for', 'ago'], kabuller: <String>['for']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kSuruyor,
        soru: 'Hangisi dogru?',
        secenekler: <String>['She works here since March.', 'She has worked here since March.', 'She worked here since March.'],
        kabuller: <String>['She has worked here since March.']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kAgoFark,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I have met him three days ago.', 'I met him three days ago.', 'I have met him since three days.'],
        kabuller: <String>['I met him three days ago.']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kSince,
        soru: 'It has rained ___ this morning.', kabuller: <String>['since']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kHowLong,
        soru: 'How long ___ they been married?', kabuller: <String>['have']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kFor,
        soru: 'He has been ill ___ three days.', kabuller: <String>['for']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kSecim,
        soru: '"We have waited since two hours." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kSuruyor,
        soru: '"I am here since 2020." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kHowLong,
        soru: '"How long time have you lived here?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kFor,
        soru: 'Dizin: months / here / for / worked / She / two / has',
        kabuller: <String>['She has worked here for two months.',
            'She has worked here for two months']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kFor,
        soru: 'Ingilizceye cevirin: Iki saattir bekliyoruz.',
        kabuller: <String>['We have waited for two hours.',
            'We have been waiting for two hours.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kSince,
        soru: 'Ingilizceye cevirin: Cocukluktan beri arkadasiz.',
        kabuller: <String>['We have been friends since childhood.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kHowLong,
        soru: 'Ingilizceye cevirin: Ne kadar suredir burada yasiyorsun?',
        kabuller: <String>['How long have you lived here?']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Tek soru: uzunluk mu nokta mi?',
        aciklama: 'Uzunluk -> for · Takvimde bir nokta -> since.',
        ornek: 'for five years · since 2020'),
      OzetMaddesi(baslik: 'for: sure uzunlugu',
        aciklama: 'Sayi + zaman birimi gelir.',
        ornek: 'for two hours · for a long time'),
      OzetMaddesi(baslik: 'since: baslangic noktasi',
        aciklama: 'Takvimde gosterebileceginiz bir an.',
        ornek: 'since Monday · since I was a child'),
      OzetMaddesi(baslik: 'Hala suruyor',
        aciklama: 'Kopru ayaktaysa Perfect, yikildiysa Past Simple.',
        ornek: 'I have worked here... (suruyor) · I worked there... (bitti)'),
      OzetMaddesi(baslik: 'How long kalibi',
        aciklama: '"How long time" YOKTUR. have/has ozneden once gelir.',
        ornek: 'How long have you lived here?'),
      OzetMaddesi(baslik: 'ago ile karistirmayin',
        aciklama: 'ago -> Past Simple · since -> Present Perfect.',
        ornek: 'I came five years ago. · I have been here since 2020.'),
    ],
  );
}
