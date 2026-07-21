/// EN-A2-005 — Present Continuous (am / is / are + -ing)
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnA2005 {
  const DersEnA2005._();

  static const String kYapi = 'Yapi: be + -ing';
  static const String kSuAn = 'Su an olan';
  static const String kYazim = '-ing yazimi';
  static const String kOlumsuz = 'Olumsuz';
  static const String kSoru = 'Soru ve kisa cevap';
  static const String kDurumFiili = 'Durum fiilleri';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A2-005',
    baslik: 'Present Continuous — Su An Olan',
    seviye: 'A2', konu: 'ZAM', tahminiDk: 35,
    onKosullar: <String>['EN-A1-002', 'EN-A1-010'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'Turkce "-yor" eki IKI isi birden yapar:\n\n'
        '  "Kitap okuyorum."\n'
        '    -> Su an elimde kitap var (SIMDI)\n'
        '    -> Bu aralar kitap okuyorum (SUREC)\n'
        '  Hangisi oldugu baglamdan anlasilir.\n\n'
        'Ingilizce bu ikisini AYIRIR. Ustelik ucuncu bir sey daha ayirir:\n\n'
        '  I read books.        -> genel dogru, aliskanlik\n'
        '  I am reading a book. -> SU AN, tam simdi\n\n'
        'Yani Ingilizcede zamanin "genisligi" bir SECIMDIR.\n\n'
        'Bu ders sunu ogretir: Cumle kurmadan once sorun —\n'
        '  "Bu her zaman mi boyle, yoksa SIMDI mi oluyor?"\n\n'
        'Cevap birinciyse Present Simple, ikinciyse Present Continuous.',
    kazanimlar: <String>[
      'be + -ing yapisini kurabilmek',
      'Su an olan ile genel dogruyu ayirt edebilmek',
      '-ing yazim degisikliklerini uygulamak',
      'Olumsuz ve soru bicimlerini kurmak',
      'Durum fiillerinin -ing almadigini bilmek',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'P1', baslik: 'Iki parca: be + -ing',
        govde: 'Yapi degismez:\n\n'
            '  OZNE + am/is/are + FIIL-ing\n\n'
            '  I am working.\n'
            '  She is reading.\n'
            '  They are playing.\n\n'
            'DIKKAT: Iki parca da ZORUNLUDUR.\n'
            '  I working.     -> be eksik, YANLIS\n'
            '  I am work.     -> -ing eksik, YANLIS\n\n'
            'DUSUNME NOTU: "be" kimin ve ne zaman oldugunu tasir; "-ing" '
            'eylemin surdugunu tasir. Yine "bir kelime bir is".',
        turkceKarsilastirma: 'Calisiyorum.  ->  I am working.\n'
            'Tek ek "-yor"  ->  iki parca: am + working'),
      AnlatimBlogu(kod: 'P2', baslik: 'Ne zaman kullanilir?',
        govde: 'Uc durumda:\n\n'
            '1. TAM SU AN oluyor:\n'
            '   Look! The children are playing.\n\n'
            '2. Bu SIRALAR suruyor (tam su an olmasa bile):\n'
            '   I am reading a good book these days.\n\n'
            '3. Planlanmis yakin gelecek:\n'
            '   We are meeting tomorrow.\n\n'
            'Isaret kelimeleri: now · right now · at the moment\n'
            'Look! · Listen! · these days · today',
        turkceKarsilastirma: 'Bak! Cocuklar oynuyor.\n'
            'Look! The children are playing.'),
      AnlatimBlogu(kod: 'P3', baslik: 'Present Simple ile fark',
        govde: 'Ayni fiil, iki farkli anlam:\n\n'
            '  I work in a bank.      -> Isim bu. Her gun boyle.\n'
            '  I am working now.      -> Su an calisiyorum.\n\n'
            '  She speaks English.    -> Ingilizce bilir.\n'
            '  She is speaking English. -> Su an Ingilizce konusuyor.\n\n'
            'DUSUNME SORUSU: "Bu her zaman mi boyle, yoksa SIMDI mi '
            'oluyor?"\n\n'
            'Turkce bu ayrimi zorunlu kilmaz; Ingilizce kilar. Bu yuzden '
            'ceviri yaparken once bu soruyu sorun.',
        turkceKarsilastirma: 'Bankada calisirim.   ->  I work in a bank.\n'
            'Su an calisiyorum.   ->  I am working now.'),
      AnlatimBlogu(kod: 'P4', baslik: '-ing yazimi',
        govde: 'Cogu fiile dogrudan -ing eklenir: work -> working\n\n'
            'Uc degisiklik vardir:\n\n'
            '1. Sondaki sessiz -e DUSER:\n'
            '   make -> making · write -> writing · come -> coming\n\n'
            '2. Tek heceli, tek sesli + tek sessiz: son harf IKILENIR:\n'
            '   run -> running · sit -> sitting · stop -> stopping\n\n'
            '3. -ie ile bitenler -y olur:\n'
            '   lie -> lying · die -> dying\n\n'
            'DIKKAT: "see -> seeing" (iki e vardir, dusmez).',
        turkceKarsilastirma: 'yaziyor  ->  writing\n'
            'kosuyor  ->  running'),
      AnlatimBlogu(kod: 'P5', baslik: 'Olumsuz ve soru',
        govde: 'A1-004\u2019teki to be kurallarinin AYNISI. Yeni bir sey yok.\n\n'
            'Olumsuz: not, be\u2019den hemen sonra\n'
            '  I am not working.\n'
            '  She is not reading.\n'
            '  They aren\u2019t playing.\n\n'
            'Soru: be basa gecer\n'
            '  Are you working?\n'
            '  Is she reading?\n\n'
            'Kisa cevap: Yes, I am. / No, she is not.\n\n'
            'DIKKAT: do/does GIRMEZ. Cumlede zaten be vardir.\n'
            '  Do you working? -> YANLIS',
        turkceKarsilastirma: 'Calismiyorum.  ->  I am not working.\n'
            'Calisiyor musun? ->  Are you working?'),
      AnlatimBlogu(kod: 'P6', baslik: '-ing almayan fiiller',
        govde: 'Bazi fiiller EYLEM degil DURUM anlatir; bunlar -ing almaz:\n\n'
            '  like · love · hate · want · need · know · understand\n'
            '  believe · remember · belong · have (sahiplik)\n\n'
            '  I am liking it.   -> YANLIS\n'
            '  I like it.        -> DOGRU\n\n'
            'NEDEN? "Sevmek" bir eylem degil, bir durumdur. Baslayip biten '
            'bir sey degildir; suregiden bir haldir. Zaten sureklidir, '
            'ayrica sureklilik isareti gerekmez.\n\n'
            'DIKKAT: "have" eylem anlaminda -ing alabilir:\n'
            '  I have a car. (sahiplik)  ·  I am having lunch. (eylem)',
        turkceKarsilastirma: 'Bunu seviyorum.  ->  I like this.\n'
            'Turkce "-yor" kullanir, Ingilizce KULLANMAZ.'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['work', 'am working', 'I am working now.'],
        turkce: 'Su an calisiyorum.', not: 'Iki parca: be + -ing.'),
      AdimliOrnek(adimlar: <String>['She', 'She is', 'She is reading a book.'],
        turkce: 'Kitap okuyor.', not: 'Tekil ozne -> is.'),
      AdimliOrnek(adimlar: <String>['make', 'making', 'He is making a cake.'],
        turkce: 'Kek yapiyor.', not: 'Sondaki -e dustu.'),
      AdimliOrnek(adimlar: <String>['run', 'running', 'The children are running.'],
        turkce: 'Cocuklar kosuyor.', not: 'Son harf ikilendi.'),
      AdimliOrnek(adimlar: <String>['I work in a bank.', 'I am working now.'],
        turkce: 'Genel dogru / su an.', not: 'Ayni fiil, iki anlam.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Su an kitap okuyorum.', 'SIMDI mi? Evet -> Continuous',
        'I am + read-ing', 'I am reading a book now.'],
        turkce: 'Once zaman genisligini sor.', not: 'I read now YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Her gun kitap okurum.', 'Her zaman mi? Evet -> Simple',
        'I read', 'I read books every day.'],
        turkce: 'Aliskanlik -> Simple.', not: 'I am reading every day YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Bunu seviyorum.', 'like bir DURUM fiili', '-ing ALMAZ',
        'I like this.'],
        turkce: 'Turkce "-yor" der ama Ingilizce demez.',
        not: 'I am liking YANLIS.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I am working now.', turkce: 'Su an calisiyorum.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'She is reading a book.', turkce: 'Kitap okuyor.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'They are playing football.', turkce: 'Futbol oynuyorlar.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'We are waiting for the bus.', turkce: 'Otobus bekliyoruz.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'He is talking on the phone.', turkce: 'Telefonda konusuyor.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'It is raining outside.', turkce: 'Disarida yagmur yagiyor.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'Look! The children are running.', turkce: 'Bak! Cocuklar kosuyor.', dogruMu: true, altKonu: kSuAn),
      OrnekCumle(ingilizce: 'Listen! Someone is singing.', turkce: 'Dinle! Biri sarki soyluyor.', dogruMu: true, altKonu: kSuAn),
      OrnekCumle(ingilizce: 'I am reading a good book these days.', turkce: 'Bu siralar iyi bir kitap okuyorum.', dogruMu: true, altKonu: kSuAn),
      OrnekCumle(ingilizce: 'She is studying at the moment.', turkce: 'Su anda ders calisiyor.', dogruMu: true, altKonu: kSuAn),
      OrnekCumle(ingilizce: 'We are meeting tomorrow.', turkce: 'Yarin bulusuyoruz.', dogruMu: true, altKonu: kSuAn),
      OrnekCumle(ingilizce: 'He is making a cake.', turkce: 'Kek yapiyor.', dogruMu: true, altKonu: kYazim),
      OrnekCumle(ingilizce: 'She is writing a letter.', turkce: 'Mektup yaziyor.', dogruMu: true, altKonu: kYazim),
      OrnekCumle(ingilizce: 'They are coming home.', turkce: 'Eve geliyorlar.', dogruMu: true, altKonu: kYazim),
      OrnekCumle(ingilizce: 'The children are running.', turkce: 'Cocuklar kosuyor.', dogruMu: true, altKonu: kYazim),
      OrnekCumle(ingilizce: 'He is sitting on the chair.', turkce: 'Sandalyede oturuyor.', dogruMu: true, altKonu: kYazim),
      OrnekCumle(ingilizce: 'The bus is stopping here.', turkce: 'Otobus burada duruyor.', dogruMu: true, altKonu: kYazim),
      OrnekCumle(ingilizce: 'I am not working today.', turkce: 'Bugun calismiyorum.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'She is not reading now.', turkce: 'Su an okumuyor.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: "They aren't playing outside.", turkce: 'Disarida oynamiyorlar.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: "It isn't raining now.", turkce: 'Su an yagmur yagmiyor.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'Are you working?', turkce: 'Calisiyor musun?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Is she reading a book?', turkce: 'Kitap mi okuyor?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Are they playing football?', turkce: 'Futbol mu oynuyorlar?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Yes, I am.', turkce: 'Evet, calisiyorum.', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'No, she is not.', turkce: 'Hayir, okumuyor.', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'What are you doing?', turkce: 'Ne yapiyorsun?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'I like this book.', turkce: 'Bu kitabi seviyorum.', dogruMu: true, altKonu: kDurumFiili),
      OrnekCumle(ingilizce: 'She knows the answer.', turkce: 'Cevabi biliyor.', dogruMu: true, altKonu: kDurumFiili),
      OrnekCumle(ingilizce: 'I am having lunch now.', turkce: 'Su an ogle yemegi yiyorum.', dogruMu: true, altKonu: kDurumFiili),

      OrnekCumle(ingilizce: 'I working now.', turkce: 'Su an calisiyorum.', dogruMu: false,
        neden: 'be eksik. Yapi IKI parcadir: am/is/are + fiil-ing.',
        dogruBicim: 'I am working now.', hataTuru: 'EKSIK_KELIME', altKonu: kYapi),
      OrnekCumle(ingilizce: 'I am work now.', turkce: 'Su an calisiyorum.', dogruMu: false,
        neden: '-ing eksik. Sureklilik isaretini fiil tasir.',
        dogruBicim: 'I am working now.', hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'She are reading a book.', turkce: 'Kitap okuyor.', dogruMu: false,
        neden: 'Tekil ozne -> is.', dogruBicim: 'She is reading a book.',
        hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'They is playing football.', turkce: 'Futbol oynuyorlar.', dogruMu: false,
        neden: 'Cogul ozne -> are.', dogruBicim: 'They are playing football.',
        hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'I am reading books every day.', turkce: 'Her gun kitap okurum.', dogruMu: false,
        neden: '"every day" aliskanliktir; Present Simple gerekir. '
            'Continuous SU ANI anlatir.', dogruBicim: 'I read books every day.',
        hataTuru: 'ANLAM_FARKI', altKonu: kSuAn),
      OrnekCumle(ingilizce: 'Look! The children play.', turkce: 'Bak! Cocuklar oynuyor.', dogruMu: false,
        neden: '"Look!" su ani isaret eder; Continuous gerekir.',
        dogruBicim: 'Look! The children are playing.', hataTuru: 'ANLAM_FARKI', altKonu: kSuAn),
      OrnekCumle(ingilizce: 'I work now.', turkce: 'Su an calisiyorum.', dogruMu: false,
        neden: '"now" su ani anlatir; Continuous gerekir.',
        dogruBicim: 'I am working now.', hataTuru: 'ANLAM_FARKI', altKonu: kSuAn),
      OrnekCumle(ingilizce: 'He is makeing a cake.', turkce: 'Kek yapiyor.', dogruMu: false,
        neden: 'Sondaki sessiz -e duser: making.', dogruBicim: 'He is making a cake.',
        hataTuru: 'YAZIM_HATASI', altKonu: kYazim),
      OrnekCumle(ingilizce: 'She is writeing a letter.', turkce: 'Mektup yaziyor.', dogruMu: false,
        neden: '-e duser: writing.', dogruBicim: 'She is writing a letter.',
        hataTuru: 'YAZIM_HATASI', altKonu: kYazim),
      OrnekCumle(ingilizce: 'They are comeing home.', turkce: 'Eve geliyorlar.', dogruMu: false,
        neden: '-e duser: coming.', dogruBicim: 'They are coming home.',
        hataTuru: 'YAZIM_HATASI', altKonu: kYazim),
      OrnekCumle(ingilizce: 'The children are runing.', turkce: 'Cocuklar kosuyor.', dogruMu: false,
        neden: 'Tek heceli, tek sesli + tek sessiz: son harf ikilenir.',
        dogruBicim: 'The children are running.', hataTuru: 'YAZIM_HATASI', altKonu: kYazim),
      OrnekCumle(ingilizce: 'He is siting on the chair.', turkce: 'Sandalyede oturuyor.', dogruMu: false,
        neden: 'Son harf ikilenmeli: sitting.', dogruBicim: 'He is sitting on the chair.',
        hataTuru: 'YAZIM_HATASI', altKonu: kYazim),
      OrnekCumle(ingilizce: 'I not am working.', turkce: 'Calismiyorum.', dogruMu: false,
        neden: '"not" be\u2019den sonra gelir.', dogruBicim: 'I am not working.',
        hataTuru: 'KELIME_SIRASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'I do not working.', turkce: 'Calismiyorum.', dogruMu: false,
        neden: 'Cumlede zaten be var; do/does GIRMEZ.',
        dogruBicim: 'I am not working.', hataTuru: 'GRAMER_HATASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'She does not reading.', turkce: 'Okumuyor.', dogruMu: false,
        neden: 'Continuous olumsuzu be + not ile yapilir.',
        dogruBicim: 'She is not reading.', hataTuru: 'GRAMER_HATASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'Do you working?', turkce: 'Calisiyor musun?', dogruMu: false,
        neden: 'Soruda be basa gecer; do kullanilmaz.',
        dogruBicim: 'Are you working?', hataTuru: 'GRAMER_HATASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'You are working?', turkce: 'Calisiyor musun?', dogruMu: false,
        neden: 'Soruda SIRA degisir; yalnizca soru isareti yetmez.',
        dogruBicim: 'Are you working?', hataTuru: 'KELIME_SIRASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'What you are doing?', turkce: 'Ne yapiyorsun?', dogruMu: false,
        neden: 'Soru kelimesi + be + ozne sirasi.', dogruBicim: 'What are you doing?',
        hataTuru: 'KELIME_SIRASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'I am liking this book.', turkce: 'Bu kitabi seviyorum.', dogruMu: false,
        neden: '"like" bir DURUM fiilidir; -ing almaz. Turkce "-yor" '
            'kullanir ama Ingilizce kullanmaz.', dogruBicim: 'I like this book.',
        hataTuru: 'GRAMER_HATASI', altKonu: kDurumFiili),
      OrnekCumle(ingilizce: 'She is knowing the answer.', turkce: 'Cevabi biliyor.', dogruMu: false,
        neden: '"know" durum fiilidir; -ing almaz.', dogruBicim: 'She knows the answer.',
        hataTuru: 'GRAMER_HATASI', altKonu: kDurumFiili),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kYapi,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I working now.', 'I am working now.', 'I am work now.'],
        kabuller: <String>['I am working now.'], geriDonusKodu: 'P1'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kSuAn,
        soru: '"Her gun kitap okurum." hangisi?',
        secenekler: <String>['I am reading books every day.', 'I read books every day.', 'I reading books every day.'],
        kabuller: <String>['I read books every day.'], geriDonusKodu: 'P3',
        aciklama: 'Aliskanlik -> Simple.'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kYazim,
        soru: '"make" fiilinin -ing bicimi?',
        secenekler: <String>['makeing', 'making', 'makking'],
        kabuller: <String>['making'], geriDonusKodu: 'P4'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kSoru,
        soru: 'Hangisi dogru?',
        secenekler: <String>['Do you working?', 'Are you working?', 'You are working?'],
        kabuller: <String>['Are you working?'], geriDonusKodu: 'P5'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kDurumFiili,
        soru: '"Bu kitabi seviyorum." hangisi?',
        secenekler: <String>['I am liking this book.', 'I like this book.', 'I am like this book.'],
        kabuller: <String>['I like this book.'], geriDonusKodu: 'P6'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kYapi,
        soru: 'She ___ reading a book.', kabuller: <String>['is']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kYazim,
        soru: 'The children are ___. (run)', kabuller: <String>['running']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kYazim,
        soru: 'He is ___ a letter. (write)', kabuller: <String>['writing']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kOlumsuz,
        soru: 'I am ___ working today.', kabuller: <String>['not']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kSoru,
        soru: '___ they playing football?', kabuller: <String>['Are', 'are']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kSuAn,
        soru: '"Look!" ile hangi zaman kullanilir?',
        secenekler: <String>['Present Simple', 'Present Continuous', 'Past Simple'],
        kabuller: <String>['Present Continuous']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kDurumFiili,
        soru: 'Hangisi -ing ALMAZ?',
        secenekler: <String>['work', 'know', 'play'], kabuller: <String>['know']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kYapi,
        soru: 'Dizin: now / am / I / working',
        kabuller: <String>['I am working now.', 'I am working now']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kSoru,
        soru: 'Dizin: doing / are / What / you',
        kabuller: <String>['What are you doing?', 'What are you doing']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kOlumsuz,
        soru: '"I do not working." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kYapi, turkce: 'Su an calisiyorum.',
        kabuller: <String>['I am working now.']),
      SerbestGorev(kod: 'SU-2', altKonu: kSuAn, turkce: 'Her gun kitap okurum.',
        kabuller: <String>['I read books every day.', 'I read a book every day.']),
      SerbestGorev(kod: 'SU-3', altKonu: kSoru, turkce: 'Ne yapiyorsun?',
        kabuller: <String>['What are you doing?']),
      SerbestGorev(kod: 'SU-4', altKonu: kDurumFiili, turkce: 'Bu kitabi seviyorum.',
        kabuller: <String>['I like this book.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kYapi,
        soru: 'They ___ waiting for the bus.', kabuller: <String>['are']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kYazim,
        soru: 'He is ___ a cake. (make)', kabuller: <String>['making']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kYazim,
        soru: 'He is ___ on the chair. (sit)', kabuller: <String>['sitting']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.boslukDoldurma, altKonu: kSoru,
        soru: 'Are you working? — Yes, I ___.', kabuller: <String>['am']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.coktanSecmeli, altKonu: kSuAn,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I work now.', 'I am working now.', 'I am work now.'],
        kabuller: <String>['I am working now.']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kDurumFiili,
        soru: '"She is knowing the answer." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kOlumsuz,
        soru: 'Dizin: today / not / working / I / am',
        kabuller: <String>['I am not working today.', 'I am not working today']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kSuAn,
        soru: 'Listen! Someone ___ singing.', kabuller: <String>['is']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kYapi,
        soru: 'She ___ a book now.',
        secenekler: <String>['read', 'is reading', 'reading'],
        kabuller: <String>['is reading']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kSuAn,
        soru: 'I ___ books every day.',
        secenekler: <String>['am reading', 'read', 'reading'],
        kabuller: <String>['read']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kYazim,
        soru: 'The children are ___.',
        secenekler: <String>['runing', 'running', 'runnning'],
        kabuller: <String>['running']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kYazim,
        soru: 'She is ___ a letter.',
        secenekler: <String>['writeing', 'writing', 'writting'],
        kabuller: <String>['writing']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kDurumFiili,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I am liking it.', 'I like it.', 'I am like it.'],
        kabuller: <String>['I like it.']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kYapi,
        soru: 'It ___ raining outside.', kabuller: <String>['is']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kYazim,
        soru: 'They are ___ home. (come)', kabuller: <String>['coming']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kSoru,
        soru: 'Is she reading? — No, she ___ not.', kabuller: <String>['is']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kOlumsuz,
        soru: '"She does not reading." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kSuAn,
        soru: '"Look! The children play." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kSoru,
        soru: '"Do you working?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kSoru,
        soru: 'Dizin: reading / she / Is / book / a',
        kabuller: <String>['Is she reading a book?', 'Is she reading a book']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kYapi,
        soru: 'Ingilizceye cevirin: Su an calisiyorum.',
        kabuller: <String>['I am working now.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kSuAn,
        soru: 'Ingilizceye cevirin: Bak! Cocuklar kosuyor.',
        kabuller: <String>['Look! The children are running.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kSoru,
        soru: 'Ingilizceye cevirin: Ne yapiyorsun?',
        kabuller: <String>['What are you doing?']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Yapi: be + -ing',
        aciklama: 'Iki parca da zorunlu. be kim/ne zaman, -ing surekliligi tasir.',
        ornek: 'I am working. (I working / I am work DEGIL)'),
      OzetMaddesi(baslik: 'Once bu soruyu sorun',
        aciklama: '"Bu her zaman mi boyle, yoksa SIMDI mi oluyor?"',
        ornek: 'I work in a bank. · I am working now.'),
      OzetMaddesi(baslik: 'Isaret kelimeleri',
        aciklama: 'now · right now · at the moment · Look! · Listen! · these days',
        ornek: 'Look! The children are playing.'),
      OzetMaddesi(baslik: '-ing yazimi',
        aciklama: 'Sondaki -e duser · tek hece son harf ikilenir · -ie -> -y.',
        ornek: 'making · running · lying'),
      OzetMaddesi(baslik: 'Olumsuz ve soru',
        aciklama: 'A1\u2019deki to be kurallari. do/does GIRMEZ.',
        ornek: 'I am not working. · Are you working?'),
      OzetMaddesi(baslik: 'Durum fiilleri -ing ALMAZ',
        aciklama: 'like, know, want, need... Zaten sureklidirler.',
        ornek: 'I like it. (I am liking it. DEGIL)'),
    ],
  );
}
