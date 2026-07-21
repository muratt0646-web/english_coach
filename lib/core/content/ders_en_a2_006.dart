/// EN-A2-006 — Present Simple ile Present Continuous Farki
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnA2006 {
  const DersEnA2006._();

  static const String kAliskanlik = 'Aliskanlik / genel dogru';
  static const String kSuAn = 'Su an olan';
  static const String kIsaret = 'Isaret kelimeleri';
  static const String kAnlamDegisir = 'Anlami degisen fiiller';
  static const String kGecici = 'Gecici / kalici durum';
  static const String kSecim = 'Secim yapma';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A2-006',
    baslik: 'Present Simple mi Continuous mu?',
    seviye: 'A2', konu: 'ZAM', tahminiDk: 40,
    onKosullar: <String>['EN-A2-005', 'EN-A1-010'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'Iki zamani ayri ayri ogrendiniz. Simdi asil beceri: SECMEK.\n\n'
        'Turkce konusan icin zorluk sudur — Turkce bu secimi zorunlu '
        'kilmaz. "Calisiyorum" hem su ani hem genel durumu anlatabilir.\n\n'
        'Ingilizce ise her cumlede bir KARAR ister:\n\n'
        '  I work here.        -> Burasi benim isim. Kalici.\n'
        '  I am working here.  -> Su an buradayim. Gecici.\n\n'
        'Ikisi de dogru cumledir ama BASKA sey soyler.\n\n'
        'Karar vermek icin tek soru yeter:\n\n'
        '  "Bu bir CERCEVE mi, yoksa bir AN mi?"\n\n'
        '  Cerceve (her zaman, genel, kalici)  -> Simple\n'
        '  An (su an, bu siralar, gecici)      -> Continuous\n\n'
        'Bu ders o karari otomatiklestirir.',
    kazanimlar: <String>[
      'Cerceve ile an ayrimini yapabilmek',
      'Isaret kelimelerinden dogru zamani secmek',
      'Kalici ile gecici durumu ayirt etmek',
      'Anlami degisen fiilleri taniyabilmek',
      'Karisik metinde iki zamani birlikte kullanmak',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'R1', baslik: 'Cerceve mi, an mi?',
        govde: 'Her cumlede su soruyu sorun:\n\n'
            '  Bu bir CERCEVE mi (her zaman boyle), yoksa bir AN mi '
            '(su an oluyor)?\n\n'
            '  CERCEVE -> Present Simple\n'
            '     I work in a bank.        (Isim bu.)\n'
            '     Water boils at 100.      (Her zaman boyle.)\n'
            '     She speaks three languages.\n\n'
            '  AN -> Present Continuous\n'
            '     I am working right now.  (Su an.)\n'
            '     The water is boiling.    (Simdi kayniyor.)\n'
            '     She is speaking English. (Su an konusuyor.)\n\n'
            'Ayni fiil, iki cerceve, iki anlam.',
        turkceKarsilastirma: 'Bankada calisirim.  ->  I work in a bank.\n'
            'Su an calisiyorum.  ->  I am working now.'),
      AnlatimBlogu(kod: 'R2', baslik: 'Isaret kelimeleri karari verir',
        govde: 'Cumlede bulunan zaman ifadesi cogu zaman secimi belirler:\n\n'
            '  SIMPLE isaretleri:\n'
            '    always · usually · often · sometimes · never\n'
            '    every day · every week · on Mondays\n\n'
            '  CONTINUOUS isaretleri:\n'
            '    now · right now · at the moment · today\n'
            '    Look! · Listen! · these days · this week\n\n'
            'PRATIK: Once isaret kelimesini bulun, zaman kendiliginden '
            'belli olur.\n\n'
            '  I ___ football every Sunday.  -> "every Sunday" -> play\n'
            '  I ___ football right now.     -> "right now" -> am playing',
        turkceKarsilastirma: 'Her pazar futbol oynarim.  ->  I play...\n'
            'Su an futbol oynuyorum.    ->  I am playing...'),
      AnlatimBlogu(kod: 'R3', baslik: 'Siklik zarflari nereye gelir?',
        govde: 'Present Simple\u2019da siklik zarflari OZNE ile FIIL arasina '
            'girer:\n\n'
            '  I always work on Mondays.\n'
            '  She usually reads at night.\n'
            '  They never come late.\n\n'
            'Ama to be varsa be\u2019den SONRA gelir:\n\n'
            '  He is always late.  (He always is late DEGIL)\n\n'
            'Continuous\u2019ta be ile -ing arasina girer:\n\n'
            '  He is always talking. (surekli sikayeti anlatir)',
        turkceKarsilastirma: 'Her zaman gec kalir.  ->  He is always late.'),
      AnlatimBlogu(kod: 'R4', baslik: 'Kalici mi gecici mi?',
        govde: 'Bazen ikisi de dogrudur; fark KALICILIKTADIR:\n\n'
            '  She lives in Ankara.         -> Orasi evi. Kalici.\n'
            '  She is living in Ankara.     -> Gecici olarak orada.\n\n'
            '  He works at a bank.          -> Isi bu.\n'
            '  He is working at a bank.     -> Su siralar orada calisiyor.\n\n'
            'DUSUNME NOTU: Continuous kullandiginizda dinleyene "bu gecici" '
            'mesaji verirsiniz. Bu bir dilbilgisi suslemesi degil, ANLAM '
            'tasiyan bir secimdir.',
        turkceKarsilastirma: 'Ankara\u2019da yasiyor.\n'
            'lives -> kalici · is living -> gecici'),
      AnlatimBlogu(kod: 'R5', baslik: 'Anlami DEGISEN fiiller',
        govde: 'Bazi durum fiilleri -ing aldiginda anlam degistirir:\n\n'
            '  I think it is good.       -> Bence iyi. (fikir)\n'
            '  I am thinking about it.   -> Uzerinde dusunuyorum. (eylem)\n\n'
            '  I have a car.             -> Sahibim. (sahiplik)\n'
            '  I am having lunch.        -> Yemek yiyorum. (eylem)\n\n'
            '  She is kind.              -> Kibar biridir. (karakter)\n'
            '  She is being kind today.  -> Bugun kibar davraniyor. (gecici)\n\n'
            'KURAL: Fiil DURUM anlatiyorsa Simple, EYLEM anlatiyorsa '
            'Continuous.',
        turkceKarsilastirma: 'Bir arabam var.   ->  I have a car.\n'
            'Yemek yiyorum.    ->  I am having lunch.'),
      AnlatimBlogu(kod: 'R6', baslik: 'Ikisi bir arada',
        govde: 'Gercek konusmada iki zaman yan yana gelir:\n\n'
            '  I usually walk to work, but today I am taking the bus.\n'
            '  (Genelde yururum, ama bugun otobuse biniyorum.)\n\n'
            '  She speaks English well, but she is not speaking now.\n\n'
            'Bu yapida "but" veya "today" gecisi isaret eder.\n\n'
            'DUSUNME ALISKANLIGI: Once cerceveyi kurun (Simple), sonra '
            'istisnayi soyleyin (Continuous). Ingilizce dusunmenin '
            'tipik bir bicimidir.',
        turkceKarsilastirma: 'Genelde yururum ama bugun otobuse biniyorum.\n'
            'I usually walk, but today I am taking the bus.'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['I work in a bank.', 'I am working now.'],
        turkce: 'Cerceve / an.', not: 'Ayni fiil, iki anlam.'),
      AdimliOrnek(adimlar: <String>['every day', 'Simple', 'I read every day.'],
        turkce: 'Isaret kelimesi karari verdi.', not: 'Aliskanlik.'),
      AdimliOrnek(adimlar: <String>['right now', 'Continuous', 'I am reading right now.'],
        turkce: 'Su an.', not: 'An.'),
      AdimliOrnek(adimlar: <String>['She lives in Ankara.', 'She is living in Ankara.'],
        turkce: 'Kalici / gecici.', not: 'Continuous "gecici" mesaji verir.'),
      AdimliOrnek(adimlar: <String>['I have a car.', 'I am having lunch.'],
        turkce: 'Sahiplik / eylem.', not: 'have anlam degistirir.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Her pazar futbol oynarim.', 'Isaret: every Sunday',
        'Cerceve -> Simple', 'I play football every Sunday.'],
        turkce: 'Once isaret kelimesini bul.', not: 'am playing YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Bak! Yagmur yagiyor.', 'Isaret: Look!', 'An -> Continuous',
        'Look! It is raining.'],
        turkce: 'Look! her zaman Continuous ister.', not: 'It rains YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Genelde yururum ama bugun otobuse biniyorum.',
        'Cerceve: I usually walk', 'Istisna: today I am taking the bus',
        'I usually walk, but today I am taking the bus.'],
        turkce: 'Once cerceve, sonra istisna.', not: 'Ingilizce dusunmenin bicimi.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I work in a bank.', turkce: 'Bankada calisirim.', dogruMu: true, altKonu: kAliskanlik),
      OrnekCumle(ingilizce: 'She reads every night.', turkce: 'Her gece okur.', dogruMu: true, altKonu: kAliskanlik),
      OrnekCumle(ingilizce: 'Water boils at 100 degrees.', turkce: 'Su 100 derecede kaynar.', dogruMu: true, altKonu: kAliskanlik),
      OrnekCumle(ingilizce: 'They play football every Sunday.', turkce: 'Her pazar futbol oynarlar.', dogruMu: true, altKonu: kAliskanlik),
      OrnekCumle(ingilizce: 'He never comes late.', turkce: 'Asla gec kalmaz.', dogruMu: true, altKonu: kAliskanlik),
      OrnekCumle(ingilizce: 'We usually walk to work.', turkce: 'Genelde ise yururuz.', dogruMu: true, altKonu: kAliskanlik),
      OrnekCumle(ingilizce: 'I am working right now.', turkce: 'Su an calisiyorum.', dogruMu: true, altKonu: kSuAn),
      OrnekCumle(ingilizce: 'Look! It is raining.', turkce: 'Bak! Yagmur yagiyor.', dogruMu: true, altKonu: kSuAn),
      OrnekCumle(ingilizce: 'The water is boiling.', turkce: 'Su kayniyor.', dogruMu: true, altKonu: kSuAn),
      OrnekCumle(ingilizce: 'She is speaking English at the moment.', turkce: 'Su anda Ingilizce konusuyor.', dogruMu: true, altKonu: kSuAn),
      OrnekCumle(ingilizce: 'They are playing football now.', turkce: 'Su an futbol oynuyorlar.', dogruMu: true, altKonu: kSuAn),
      OrnekCumle(ingilizce: 'I always work on Mondays.', turkce: 'Pazartesileri her zaman calisirim.', dogruMu: true, altKonu: kIsaret),
      OrnekCumle(ingilizce: 'She usually reads at night.', turkce: 'Genelde gece okur.', dogruMu: true, altKonu: kIsaret),
      OrnekCumle(ingilizce: 'He is always late.', turkce: 'Her zaman gec kalir.', dogruMu: true, altKonu: kIsaret),
      OrnekCumle(ingilizce: 'I am reading a good book these days.', turkce: 'Bu siralar iyi bir kitap okuyorum.', dogruMu: true, altKonu: kIsaret),
      OrnekCumle(ingilizce: 'She sometimes takes the bus.', turkce: 'Bazen otobuse biner.', dogruMu: true, altKonu: kIsaret),
      OrnekCumle(ingilizce: 'She lives in Ankara.', turkce: 'Ankara\u2019da yasar.', dogruMu: true, altKonu: kGecici),
      OrnekCumle(ingilizce: 'She is living in Ankara this year.', turkce: 'Bu yil Ankara\u2019da yasiyor.', dogruMu: true, altKonu: kGecici),
      OrnekCumle(ingilizce: 'He works at a bank.', turkce: 'Bankada calisir.', dogruMu: true, altKonu: kGecici),
      OrnekCumle(ingilizce: 'He is working at a bank these days.', turkce: 'Bu siralar bankada calisiyor.', dogruMu: true, altKonu: kGecici),
      OrnekCumle(ingilizce: 'I think it is good.', turkce: 'Bence iyi.', dogruMu: true, altKonu: kAnlamDegisir),
      OrnekCumle(ingilizce: 'I am thinking about it.', turkce: 'Uzerinde dusunuyorum.', dogruMu: true, altKonu: kAnlamDegisir),
      OrnekCumle(ingilizce: 'I have a car.', turkce: 'Bir arabam var.', dogruMu: true, altKonu: kAnlamDegisir),
      OrnekCumle(ingilizce: 'I am having lunch.', turkce: 'Ogle yemegi yiyorum.', dogruMu: true, altKonu: kAnlamDegisir),
      OrnekCumle(ingilizce: 'She is kind.', turkce: 'O kibardir.', dogruMu: true, altKonu: kAnlamDegisir),
      OrnekCumle(ingilizce: 'She is being kind today.', turkce: 'Bugun kibar davraniyor.', dogruMu: true, altKonu: kAnlamDegisir),
      OrnekCumle(ingilizce: 'I usually walk to work, but today I am taking the bus.', turkce: 'Genelde yururum ama bugun otobuse biniyorum.', dogruMu: true, altKonu: kSecim),
      OrnekCumle(ingilizce: 'She speaks English, but she is not speaking now.', turkce: 'Ingilizce bilir ama su an konusmuyor.', dogruMu: true, altKonu: kSecim),
      OrnekCumle(ingilizce: 'He drinks coffee every morning, but he is drinking tea today.', turkce: 'Her sabah kahve icer ama bugun cay iciyor.', dogruMu: true, altKonu: kSecim),
      OrnekCumle(ingilizce: 'They live here, but they are staying at a hotel this week.', turkce: 'Burada yasarlar ama bu hafta otelde kaliyorlar.', dogruMu: true, altKonu: kSecim),

      OrnekCumle(ingilizce: 'I am working in a bank.', turkce: 'Bankada calisirim. (isim bu)', dogruMu: false,
        neden: 'Kalici bir durum anlatiliyorsa Simple gerekir. Continuous '
            '"gecici" mesaji verir ve yanlis anlasilir.',
        dogruBicim: 'I work in a bank.', hataTuru: 'ANLAM_FARKI', altKonu: kAliskanlik),
      OrnekCumle(ingilizce: 'She is reading every night.', turkce: 'Her gece okur.', dogruMu: false,
        neden: '"every night" aliskanliktir; Simple gerekir.',
        dogruBicim: 'She reads every night.', hataTuru: 'ANLAM_FARKI', altKonu: kIsaret),
      OrnekCumle(ingilizce: 'Water is boiling at 100 degrees.', turkce: 'Su 100 derecede kaynar.', dogruMu: false,
        neden: 'Genel dogru anlatiliyor; Simple gerekir.',
        dogruBicim: 'Water boils at 100 degrees.', hataTuru: 'ANLAM_FARKI', altKonu: kAliskanlik),
      OrnekCumle(ingilizce: 'They are playing football every Sunday.', turkce: 'Her pazar oynarlar.', dogruMu: false,
        neden: '"every Sunday" -> Simple.', dogruBicim: 'They play football every Sunday.',
        hataTuru: 'ANLAM_FARKI', altKonu: kIsaret),
      OrnekCumle(ingilizce: 'I work right now.', turkce: 'Su an calisiyorum.', dogruMu: false,
        neden: '"right now" su ani anlatir; Continuous gerekir.',
        dogruBicim: 'I am working right now.', hataTuru: 'ANLAM_FARKI', altKonu: kSuAn),
      OrnekCumle(ingilizce: 'Look! It rains.', turkce: 'Bak! Yagmur yagiyor.', dogruMu: false,
        neden: '"Look!" su ani isaret eder; Continuous gerekir.',
        dogruBicim: 'Look! It is raining.', hataTuru: 'ANLAM_FARKI', altKonu: kSuAn),
      OrnekCumle(ingilizce: 'She speaks English at the moment.', turkce: 'Su anda Ingilizce konusuyor.', dogruMu: false,
        neden: '"at the moment" -> Continuous.', dogruBicim: 'She is speaking English at the moment.',
        hataTuru: 'ANLAM_FARKI', altKonu: kSuAn),
      OrnekCumle(ingilizce: 'I always am working on Mondays.', turkce: 'Pazartesileri hep calisirim.', dogruMu: false,
        neden: 'Siklik zarfi be\u2019den SONRA gelir; ayrica aliskanlik '
            'Simple ister.', dogruBicim: 'I always work on Mondays.',
        hataTuru: 'KELIME_SIRASI', altKonu: kIsaret),
      OrnekCumle(ingilizce: 'He always is late.', turkce: 'Her zaman gec kalir.', dogruMu: false,
        neden: 'To be varsa siklik zarfi be\u2019den SONRA gelir.',
        dogruBicim: 'He is always late.', hataTuru: 'KELIME_SIRASI', altKonu: kIsaret),
      OrnekCumle(ingilizce: 'She reads usually at night.', turkce: 'Genelde gece okur.', dogruMu: false,
        neden: 'Siklik zarfi ozne ile fiil ARASINA girer.',
        dogruBicim: 'She usually reads at night.', hataTuru: 'KELIME_SIRASI', altKonu: kIsaret),
      OrnekCumle(ingilizce: 'I am thinking it is good.', turkce: 'Bence iyi.', dogruMu: false,
        neden: 'Fikir belirtirken "think" durum fiilidir; Simple gerekir.',
        dogruBicim: 'I think it is good.', hataTuru: 'ANLAM_FARKI', altKonu: kAnlamDegisir),
      OrnekCumle(ingilizce: 'I think about it now.', turkce: 'Su an uzerinde dusunuyorum.', dogruMu: false,
        neden: 'Eylem anlatiliyorsa Continuous gerekir.',
        dogruBicim: 'I am thinking about it now.', hataTuru: 'ANLAM_FARKI', altKonu: kAnlamDegisir),
      OrnekCumle(ingilizce: 'I am having a car.', turkce: 'Bir arabam var.', dogruMu: false,
        neden: 'Sahiplik anlatiliyorsa "have" -ing almaz.',
        dogruBicim: 'I have a car.', hataTuru: 'GRAMER_HATASI', altKonu: kAnlamDegisir),
      OrnekCumle(ingilizce: 'I have lunch right now.', turkce: 'Su an yemek yiyorum.', dogruMu: false,
        neden: 'Eylem anlatiliyor ve "right now" var; Continuous gerekir.',
        dogruBicim: 'I am having lunch right now.', hataTuru: 'ANLAM_FARKI', altKonu: kAnlamDegisir),
      OrnekCumle(ingilizce: 'She is kind today. (bugun kibar davraniyor)', turkce: 'Bugun kibar davraniyor.', dogruMu: false,
        neden: 'Gecici davranis icin "is being" kullanilir. "is kind" '
            'karakter anlatir.', dogruBicim: 'She is being kind today.',
        hataTuru: 'ANLAM_FARKI', altKonu: kAnlamDegisir),
      OrnekCumle(ingilizce: 'I usually am walking to work.', turkce: 'Genelde ise yururum.', dogruMu: false,
        neden: 'Aliskanlik -> Simple; ayrica zarf sirasi yanlis.',
        dogruBicim: 'I usually walk to work.', hataTuru: 'ANLAM_FARKI', altKonu: kSecim),
      OrnekCumle(ingilizce: 'I walk to work, but today I take the bus.', turkce: 'Genelde yururum ama bugun otobuse biniyorum.', dogruMu: false,
        neden: '"today" istisnayi isaret eder; ikinci bolum Continuous olmali.',
        dogruBicim: 'I usually walk to work, but today I am taking the bus.',
        hataTuru: 'ANLAM_FARKI', altKonu: kSecim),
      OrnekCumle(ingilizce: 'She is speaking English well.', turkce: 'Ingilizceyi iyi konusur.', dogruMu: false,
        neden: 'Yetenek anlatiliyor, su anki eylem degil; Simple gerekir.',
        dogruBicim: 'She speaks English well.', hataTuru: 'ANLAM_FARKI', altKonu: kAliskanlik),
      OrnekCumle(ingilizce: 'They are living here and they live at a hotel this week.', turkce: 'Burada yasarlar ama bu hafta otelde kaliyorlar.', dogruMu: false,
        neden: 'Zamanlar ters kullanilmis: kalici -> Simple, gecici -> Continuous.',
        dogruBicim: 'They live here, but they are staying at a hotel this week.',
        hataTuru: 'ANLAM_FARKI', altKonu: kGecici),
      OrnekCumle(ingilizce: 'He drinks tea today.', turkce: 'Bugun cay iciyor.', dogruMu: false,
        neden: '"today" gecici bir durumu isaret eder; Continuous daha dogrudur.',
        dogruBicim: 'He is drinking tea today.', hataTuru: 'ANLAM_FARKI', altKonu: kGecici),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kIsaret,
        soru: 'I ___ football every Sunday.',
        secenekler: <String>['play', 'am playing', 'playing'],
        kabuller: <String>['play'], geriDonusKodu: 'R2',
        aciklama: '"every Sunday" -> Simple.'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kSuAn,
        soru: 'Look! It ___.', secenekler: <String>['rains', 'is raining', 'rain'],
        kabuller: <String>['is raining'], geriDonusKodu: 'R1'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kIsaret,
        soru: 'Hangisi dogru?',
        secenekler: <String>['He always is late.', 'He is always late.', 'He is late always.'],
        kabuller: <String>['He is always late.'], geriDonusKodu: 'R3'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kAnlamDegisir,
        soru: '"Bir arabam var." hangisi?',
        secenekler: <String>['I am having a car.', 'I have a car.', 'I having a car.'],
        kabuller: <String>['I have a car.'], geriDonusKodu: 'R5'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kSecim,
        soru: 'I usually walk, but today I ___ the bus.',
        secenekler: <String>['take', 'am taking', 'taking'],
        kabuller: <String>['am taking'], geriDonusKodu: 'R6'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kAliskanlik,
        soru: 'Water ___ at 100 degrees. (boil)', kabuller: <String>['boils']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kSuAn,
        soru: 'The water ___ now. (boil)', kabuller: <String>['is boiling']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kIsaret,
        soru: 'She ___ at night. (usually / read)',
        kabuller: <String>['usually reads']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kAnlamDegisir,
        soru: 'I ___ lunch right now. (have)', kabuller: <String>['am having']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kAnlamDegisir,
        soru: 'I ___ it is a good idea. (think)', kabuller: <String>['think']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kIsaret,
        soru: '"at the moment" hangi zamani isaret eder?',
        secenekler: <String>['Present Simple', 'Present Continuous', 'Past Simple'],
        kabuller: <String>['Present Continuous']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kGecici,
        soru: '"She is living in Ankara." ne anlatir?',
        secenekler: <String>['Kalici olarak orada', 'Gecici olarak orada', 'Hic orada degil'],
        kabuller: <String>['Gecici olarak orada']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kIsaret,
        soru: 'Dizin: late / is / He / always',
        kabuller: <String>['He is always late.', 'He is always late']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kSecim,
        soru: 'Dizin: now / but / speaks / she / English / She / is / not / speaking',
        kabuller: <String>['She speaks English, but she is not speaking now.',
            'She speaks English but she is not speaking now.']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kAliskanlik,
        soru: '"She is reading every night." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kAliskanlik, turkce: 'Her pazar futbol oynarim.',
        kabuller: <String>['I play football every Sunday.']),
      SerbestGorev(kod: 'SU-2', altKonu: kSuAn, turkce: 'Bak! Yagmur yagiyor.',
        kabuller: <String>['Look! It is raining.']),
      SerbestGorev(kod: 'SU-3', altKonu: kIsaret, turkce: 'O her zaman gec kalir.',
        kabuller: <String>['He is always late.', 'She is always late.']),
      SerbestGorev(kod: 'SU-4', altKonu: kSecim,
        turkce: 'Genelde yururum ama bugun otobuse biniyorum.',
        kabuller: <String>['I usually walk, but today I am taking the bus.',
            'I usually walk to work, but today I am taking the bus.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kAliskanlik,
        soru: 'He never ___ late. (come)', kabuller: <String>['comes']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kSuAn,
        soru: 'They ___ football now. (play)', kabuller: <String>['are playing']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kAnlamDegisir,
        soru: 'She ___ kind today. (be)', kabuller: <String>['is being']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.coktanSecmeli, altKonu: kIsaret,
        soru: 'Hangisi dogru?',
        secenekler: <String>['She reads usually at night.', 'She usually reads at night.', 'Usually she reads at night always.'],
        kabuller: <String>['She usually reads at night.']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.dogruYanlis, altKonu: kAliskanlik,
        soru: '"Water is boiling at 100 degrees." genel dogru icin uygun mu?',
        secenekler: <String>['Evet', 'Hayir'], kabuller: <String>['Hayir']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kAnlamDegisir,
        soru: '"I am having a car." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kSuAn,
        soru: 'Dizin: raining / is / Look / It',
        kabuller: <String>['Look! It is raining.', 'Look It is raining']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kGecici,
        soru: 'She ___ in Ankara this year. (live)', kabuller: <String>['is living']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kAliskanlik,
        soru: 'I ___ in a bank. (isim bu)',
        secenekler: <String>['work', 'am working', 'working'],
        kabuller: <String>['work']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kSuAn,
        soru: 'I ___ right now.',
        secenekler: <String>['work', 'am working', 'works'],
        kabuller: <String>['am working']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kIsaret,
        soru: 'She ___ every night.',
        secenekler: <String>['is reading', 'reads', 'reading'],
        kabuller: <String>['reads']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kIsaret,
        soru: 'Hangisi dogru?',
        secenekler: <String>['He always is late.', 'He is always late.', 'Always he is late.'],
        kabuller: <String>['He is always late.']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kAnlamDegisir,
        soru: '"Uzerinde dusunuyorum." hangisi?',
        secenekler: <String>['I think about it.', 'I am thinking about it.', 'I am think about it.'],
        kabuller: <String>['I am thinking about it.']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kSuAn,
        soru: 'The water ___ now. (boil)', kabuller: <String>['is boiling']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kAliskanlik,
        soru: 'They ___ football every Sunday. (play)', kabuller: <String>['play']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kAnlamDegisir,
        soru: 'I ___ lunch now. (have)', kabuller: <String>['am having']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kSuAn,
        soru: '"Look! It rains." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kIsaret,
        soru: '"They are playing football every Sunday." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kAnlamDegisir,
        soru: '"I am thinking it is good." fikir belirtmek icin dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kIsaret,
        soru: 'Dizin: night / usually / at / She / reads',
        kabuller: <String>['She usually reads at night.', 'She usually reads at night']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kAliskanlik,
        soru: 'Ingilizceye cevirin: Her gece okur.',
        kabuller: <String>['She reads every night.', 'He reads every night.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kSuAn,
        soru: 'Ingilizceye cevirin: Su an calisiyorum.',
        kabuller: <String>['I am working now.', 'I am working right now.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kSecim,
        soru: 'Ingilizceye cevirin: Genelde yururum ama bugun otobuse biniyorum.',
        kabuller: <String>['I usually walk, but today I am taking the bus.',
            'I usually walk to work, but today I am taking the bus.']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Tek soru: cerceve mi, an mi?',
        aciklama: 'Her zaman boyle -> Simple · Su an oluyor -> Continuous.',
        ornek: 'I work in a bank. · I am working now.'),
      OzetMaddesi(baslik: 'Isaret kelimeleri karari verir',
        aciklama: 'always/every day -> Simple · now/Look!/these days -> Continuous.',
        ornek: 'every Sunday -> play · right now -> am playing'),
      OzetMaddesi(baslik: 'Siklik zarfinin yeri',
        aciklama: 'Ozne ile fiil arasina; ama to be varsa be\u2019den SONRA.',
        ornek: 'She usually reads. · He is always late.'),
      OzetMaddesi(baslik: 'Kalici / gecici',
        aciklama: 'Continuous dinleyene "bu gecici" mesaji verir.',
        ornek: 'She lives here. · She is living here this year.'),
      OzetMaddesi(baslik: 'Anlami degisen fiiller',
        aciklama: 'Durum -> Simple · Eylem -> Continuous.',
        ornek: 'I have a car. · I am having lunch.'),
      OzetMaddesi(baslik: 'Ikisi bir arada',
        aciklama: 'Once cerceveyi kurun, sonra istisnayi soyleyin.',
        ornek: 'I usually walk, but today I am taking the bus.'),
    ],
  );
}
