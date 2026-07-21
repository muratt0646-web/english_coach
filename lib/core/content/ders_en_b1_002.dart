/// EN-B1-002 — Past Perfect
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnB1002 {
  const DersEnB1002._();

  static const String kYapi = 'Yapi: had + 3. bicim';
  static const String kSira = 'Gecmisin gecmisi';
  static const String kIsaret = 'Isaret kelimeleri';
  static const String kBeforeAfter = 'before / after ile';
  static const String kOlumsuzSoru = 'Olumsuz ve soru';
  static const String kMisFarki = 'Turkce "-misti" farki';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-B1-002',
    baslik: 'Past Perfect — Gecmisin Gecmisi',
    seviye: 'B1', konu: 'ZAM', tahminiDk: 40,
    onKosullar: <String>['EN-A2-003', 'EN-A2-016', 'EN-B1-001'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'Turkcede "-misti" eki vardir ve ilk bakista karsilik gibi durur:\n\n'
        '  "Gelmisti."  ->  "He had come."\n\n'
        'Ama ayni sey DEGILDIR. Turkce "-mis" oncelikle KANIT bildirir:\n'
        '  gitti   -> gordum\n'
        '  gitmis  -> duydum, cikarim yaptim\n\n'
        'Ingilizce Past Perfect ise yalnizca SIRA bildirir:\n\n'
        '  Iki gecmis olay varsa, ONCE olani "had + 3. bicim" alir.\n\n'
        '  When I arrived, the train HAD LEFT.\n'
        '  (Once tren kalkti, SONRA ben vardim.)\n\n'
        'DUSUNME NOTU: Past Perfect bir GERI ADIM isaretidir. Dinleyene '
        '"bu, az once anlattigimdan ONCE oldu" der.\n\n'
        'Turkce sirayi baglamdan ve zarflardan cikarir; Ingilizce '
        'FIILE gomer.\n\n'
        'IYI HABER: "had" butun ozneler icin ayni. Secim yok.',
    kazanimlar: <String>[
      'had + 3. bicim yapisini kurabilmek',
      'Iki gecmis olayda hangisinin once oldugunu isaretlemek',
      'already / just / never / by the time kullanmak',
      'before ve after ile ne zaman gerekli olmadigini bilmek',
      'Turkce "-misti" ile karistirmamak',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'BB1', baslik: 'Yapi: had + 3. bicim',
        govde: 'Tek bicim, tek kural:\n\n'
            '  OZNE + had + 3. BICIM\n\n'
            '  I had finished.   ·  She had gone.\n'
            '  They had eaten.   ·  It had rained.\n\n'
            '"had" ozneye gore HIC degismez. Present Perfect\u2019te '
            'have/has secmeniz gerekiyordu; burada o dert yok.\n\n'
            '3. bicim A2-016\u2019daki listedir:\n'
            '  go -> went -> GONE\n'
            '  see -> saw -> SEEN\n'
            '  write -> wrote -> WRITTEN\n\n'
            'Kisaltma: I\u2019d · she\u2019d · they\u2019d',
        turkceKarsilastirma: 'Bitirmistim.  ->  I had finished.\n'
            'Tek ek         ->  iki parca'),
      AnlatimBlogu(kod: 'BB2', baslik: 'Gecmisin gecmisi',
        govde: 'Iki gecmis olay varsa, ONCE olani Past Perfect alir:\n\n'
            '  When I arrived, the train had left.\n'
            '     2. olay: vardim (Past Simple)\n'
            '     1. olay: tren kalkti (Past Perfect)\n\n'
            '  She was tired because she had worked all day.\n'
            '  The house was empty; everyone had gone.\n\n'
            'DUSUNME NOTU: Anlati "simdi"si gecmiste bir noktadir. Past '
            'Perfect o noktadan da GERIYE gider.\n\n'
            '  simdi ---- gecmis(anlati) ---- daha eski\n'
            '              Past Simple      Past Perfect',
        turkceKarsilastirma: 'Vardigimda tren kalkmisti.\n'
            'When I arrived, the train had left.'),
      AnlatimBlogu(kod: 'BB3', baslik: 'Neden gerekli? Anlam degisir',
        govde: 'Past Perfect kullanmamak anlami DEGISTIRIR:\n\n'
            '  When I arrived, the train LEFT.\n'
            '  -> Ben vardim, SONRA tren kalkti. (yetistim)\n\n'
            '  When I arrived, the train HAD LEFT.\n'
            '  -> Tren ONCE kalkmisti. (kacirdim)\n\n'
            'Ayni kelimeler, zit sonuc. Bu yuzden Past Perfect sus degil, '
            'ANLAM tasiyan bir secimdir.\n\n'
            'Ikinci ornek:\n'
            '  When she called, I finished the report.  -> aradi, sonra bitirdim\n'
            '  When she called, I had finished the report. -> zaten bitirmistim',
        turkceKarsilastirma: 'Vardigimda tren kalkti. / kalkmisti.\n'
            'Turkcede de "-ti" ve "-misti" ayrimi vardir.'),
      AnlatimBlogu(kod: 'BB4', baslik: 'Isaret kelimeleri',
        govde: 'Bu kelimeler Past Perfect ile cok sik gecer:\n\n'
            '  already   -> coktan\n'
            '     The film had already started.\n'
            '  just      -> az once\n'
            '     They had just left when I called.\n'
            '  never     -> hic\n'
            '     I had never seen such a big house.\n'
            '  by the time -> -digi zamana kadar\n'
            '     By the time we arrived, dinner had finished.\n\n'
            '"by the time" ozellikle guclu bir isarettir: ana cumle '
            'neredeyse her zaman Past Perfect alir.',
        turkceKarsilastirma: 'Biz varana kadar yemek bitmisti.\n'
            'By the time we arrived, dinner had finished.'),
      AnlatimBlogu(kod: 'BB5', baslik: 'before / after: cogu zaman GEREKMEZ',
        govde: 'Sira zaten baska bir kelimeyle belliyse Past Perfect '
            'ZORUNLU degildir:\n\n'
            '  She left before I arrived.       (dogru)\n'
            '  She had left before I arrived.   (dogru, daha vurgulu)\n\n'
            '  After he finished, he went home. (dogru)\n'
            '  After he had finished, he went home. (dogru)\n\n'
            'NEDEN? "before" ve "after" sirayi zaten soyler; fiilin ayrica '
            'soylemesine gerek kalmaz.\n\n'
            'Ama "when" sirayi soylemez — orada Past Perfect ANLAM '
            'belirler (BB3).',
        turkceKarsilastirma: 'Ben varmadan once gitti.\n'
            'She left before I arrived.'),
      AnlatimBlogu(kod: 'BB6', baslik: 'Olumsuz, soru ve "-misti" tuzagi',
        govde: 'Olumsuz: had + not + 3. bicim\n'
            '  I had not seen him before.  ·  hadn\u2019t\n\n'
            'Soru: had basa gecer\n'
            '  Had you finished?  -> Yes, I had. / No, I hadn\u2019t.\n\n'
            'do/does/did GIRMEZ.\n\n'
            'TURKCE TUZAGI: "-misti" her zaman Past Perfect DEGILDIR.\n\n'
            '  "Ali gelmis."   -> duyum. Ingilizce: "Ali came, I heard."\n'
            '  "Ali gelmisti." -> sira. Ingilizce: "Ali had come."\n\n'
            'Kural: Ortada IKI gecmis olay yoksa Past Perfect kullanmayin.',
        turkceKarsilastirma: 'Onu daha once gormemistim.\n'
            'I had not seen him before.'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['finish', 'had finished', 'I had finished the work.'],
        turkce: 'Isi bitirmistim.', not: 'had + 3. bicim.'),
      AdimliOrnek(adimlar: <String>['I arrived', 'the train had left', 'When I arrived, the train had left.'],
        turkce: 'Vardigimda tren kalkmisti.', not: 'Once kalkti, sonra vardim.'),
      AdimliOrnek(adimlar: <String>['the train left', 'the train had left'],
        turkce: 'yetistim / kacirdim', not: 'Anlam tamamen degisir.'),
      AdimliOrnek(adimlar: <String>['By the time we arrived', 'dinner had finished'],
        turkce: 'Biz varana kadar yemek bitmisti.', not: 'Guclu isaret.'),
      AdimliOrnek(adimlar: <String>['I had', 'I had not', "I hadn't seen him."],
        turkce: 'Onu gormemistim.', not: 'do/did GIRMEZ.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Vardigimda tren kalkmisti.', 'Kac olay? IKI',
        'Once olan: tren kalkti -> had left', 'Sonra olan: vardim -> arrived',
        'When I arrived, the train had left.'],
        turkce: 'Once sayiyi sor, sonra sirayi.', not: 'Once olan geri adim alir.'),
      AdimliOrnek(adimlar: <String>[
        'Yorgundu cunku butun gun calismisti.', 'Sonuc: yorgundu (Simple)',
        'Sebep once oldu -> had worked',
        'She was tired because she had worked all day.'],
        turkce: 'Sebep genellikle once olur.', not: 'because ile sik gecer.'),
      AdimliOrnek(adimlar: <String>[
        'Ben varmadan once gitti.', '"before" sirayi ZATEN soyluyor',
        'Past Perfect zorunlu degil', 'She left before I arrived.'],
        turkce: 'Sira belliyse gerekmez.', not: 'had left de dogru olurdu.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I had finished the work.', turkce: 'Isi bitirmistim.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'She had gone home.', turkce: 'Eve gitmisti.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'They had eaten before the film.', turkce: 'Filmden once yemislerdi.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'It had rained all night.', turkce: 'Butun gece yagmur yagmisti.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: "I'd seen that film before.", turkce: 'O filmi daha once gormustum.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'We had written the report.', turkce: 'Raporu yazmistik.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'When I arrived, the train had left.', turkce: 'Vardigimda tren kalkmisti.', dogruMu: true, altKonu: kSira),
      OrnekCumle(ingilizce: 'She was tired because she had worked all day.', turkce: 'Yorgundu cunku butun gun calismisti.', dogruMu: true, altKonu: kSira),
      OrnekCumle(ingilizce: 'The house was empty; everyone had gone.', turkce: 'Ev bostu; herkes gitmisti.', dogruMu: true, altKonu: kSira),
      OrnekCumle(ingilizce: 'He could not enter because he had lost his key.', turkce: 'Giremedi cunku anahtarini kaybetmisti.', dogruMu: true, altKonu: kSira),
      OrnekCumle(ingilizce: 'When we got there, the shop had closed.', turkce: 'Oraya vardigimizda dukkan kapanmisti.', dogruMu: true, altKonu: kSira),
      OrnekCumle(ingilizce: 'She did not come because she had forgotten.', turkce: 'Gelmedi cunku unutmustu.', dogruMu: true, altKonu: kSira),
      OrnekCumle(ingilizce: 'The film had already started.', turkce: 'Film coktan baslamisti.', dogruMu: true, altKonu: kIsaret),
      OrnekCumle(ingilizce: 'They had just left when I called.', turkce: 'Aradigimda az once cikmislardi.', dogruMu: true, altKonu: kIsaret),
      OrnekCumle(ingilizce: 'I had never seen such a big house.', turkce: 'Boyle buyuk bir ev hic gormemistim.', dogruMu: true, altKonu: kIsaret),
      OrnekCumle(ingilizce: 'By the time we arrived, dinner had finished.', turkce: 'Biz varana kadar yemek bitmisti.', dogruMu: true, altKonu: kIsaret),
      OrnekCumle(ingilizce: 'She had already eaten when I arrived.', turkce: 'Ben vardigimda coktan yemisti.', dogruMu: true, altKonu: kIsaret),
      OrnekCumle(ingilizce: 'By the time he called, I had gone to bed.', turkce: 'O aradiginda yatmistim.', dogruMu: true, altKonu: kIsaret),
      OrnekCumle(ingilizce: 'She left before I arrived.', turkce: 'Ben varmadan once gitti.', dogruMu: true, altKonu: kBeforeAfter),
      OrnekCumle(ingilizce: 'She had left before I arrived.', turkce: 'Ben varmadan once gitmisti.', dogruMu: true, altKonu: kBeforeAfter),
      OrnekCumle(ingilizce: 'After he finished, he went home.', turkce: 'Bitirdikten sonra eve gitti.', dogruMu: true, altKonu: kBeforeAfter),
      OrnekCumle(ingilizce: 'After he had finished, he went home.', turkce: 'Bitirdikten sonra eve gitti.', dogruMu: true, altKonu: kBeforeAfter),
      OrnekCumle(ingilizce: 'We ate after they had gone.', turkce: 'Onlar gittikten sonra yedik.', dogruMu: true, altKonu: kBeforeAfter),
      OrnekCumle(ingilizce: 'I had not seen him before.', turkce: 'Onu daha once gormemistim.', dogruMu: true, altKonu: kOlumsuzSoru),
      OrnekCumle(ingilizce: "She hadn't finished her homework.", turkce: 'Odevini bitirmemisti.', dogruMu: true, altKonu: kOlumsuzSoru),
      OrnekCumle(ingilizce: 'Had you finished before the meeting?', turkce: 'Toplantidan once bitirmis miydin?', dogruMu: true, altKonu: kOlumsuzSoru),
      OrnekCumle(ingilizce: 'Yes, I had.', turkce: 'Evet, bitirmistim.', dogruMu: true, altKonu: kOlumsuzSoru),
      OrnekCumle(ingilizce: "No, they hadn't.", turkce: 'Hayir, bitirmemislerdi.', dogruMu: true, altKonu: kOlumsuzSoru),
      OrnekCumle(ingilizce: 'Ali had come before the party.', turkce: 'Ali partiden once gelmisti.', dogruMu: true, altKonu: kMisFarki),
      OrnekCumle(ingilizce: 'Ali came yesterday.', turkce: 'Ali dun geldi.', dogruMu: true, altKonu: kMisFarki),

      OrnekCumle(ingilizce: 'I had finish the work.', turkce: 'Isi bitirmistim.', dogruMu: false,
        neden: '"had"den sonra 3. bicim gelir: finished.',
        dogruBicim: 'I had finished the work.', hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'She had went home.', turkce: 'Eve gitmisti.', dogruMu: false,
        neden: '"went" 2. bicimdir; 3. bicim "gone".',
        dogruBicim: 'She had gone home.', hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'We had wrote the report.', turkce: 'Raporu yazmistik.', dogruMu: false,
        neden: '3. bicim "written".', dogruBicim: 'We had written the report.',
        hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'They had ate before the film.', turkce: 'Filmden once yemislerdi.', dogruMu: false,
        neden: '3. bicim "eaten".', dogruBicim: 'They had eaten before the film.',
        hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'She hads gone home.', turkce: 'Eve gitmisti.', dogruMu: false,
        neden: '"had" ozneye gore DEGISMEZ; -s almaz.',
        dogruBicim: 'She had gone home.', hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'She has gone home before I arrived.', turkce: 'Ben varmadan once gitmisti.', dogruMu: false,
        neden: 'Iki GECMIS olay var; "has" degil "had" gerekir.',
        dogruBicim: 'She had gone home before I arrived.',
        hataTuru: 'GRAMER_HATASI', altKonu: kSira),
      OrnekCumle(ingilizce: 'When I arrived, the train has left.', turkce: 'Vardigimda tren kalkmisti.', dogruMu: false,
        neden: 'Anlati gecmiste; Present Perfect kullanilmaz.',
        dogruBicim: 'When I arrived, the train had left.',
        hataTuru: 'GRAMER_HATASI', altKonu: kSira),
      OrnekCumle(ingilizce: 'She was tired because she worked all day.', turkce: 'Yorgundu cunku butun gun calismisti.', dogruMu: false,
        neden: 'Sebep ONCE oldu; geri adim isareti gerekir.',
        dogruBicim: 'She was tired because she had worked all day.',
        hataTuru: 'ANLAM_FARKI', altKonu: kSira),
      OrnekCumle(ingilizce: 'He could not enter because he lost his key.', turkce: 'Giremedi cunku anahtarini kaybetmisti.', dogruMu: false,
        neden: 'Kaybetme once oldu -> had lost.',
        dogruBicim: 'He could not enter because he had lost his key.',
        hataTuru: 'ANLAM_FARKI', altKonu: kSira),
      OrnekCumle(ingilizce: 'By the time we arrived, dinner finished.', turkce: 'Biz varana kadar yemek bitmisti.', dogruMu: false,
        neden: '"by the time" guclu bir Past Perfect isaretidir.',
        dogruBicim: 'By the time we arrived, dinner had finished.',
        hataTuru: 'ANLAM_FARKI', altKonu: kIsaret),
      OrnekCumle(ingilizce: 'I had never saw such a big house.', turkce: 'Boyle bir ev hic gormemistim.', dogruMu: false,
        neden: '3. bicim "seen".', dogruBicim: 'I had never seen such a big house.',
        hataTuru: 'GRAMER_HATASI', altKonu: kIsaret),
      OrnekCumle(ingilizce: "I hadn't never seen it.", turkce: 'Onu hic gormemistim.', dogruMu: false,
        neden: '"never" zaten olumsuzdur; "not" ile birlikte kullanilmaz.',
        dogruBicim: 'I had never seen it.', hataTuru: 'FAZLA_KELIME', altKonu: kIsaret),
      OrnekCumle(ingilizce: 'They had just leave when I called.', turkce: 'Az once cikmislardi.', dogruMu: false,
        neden: '3. bicim gerekir: left.', dogruBicim: 'They had just left when I called.',
        hataTuru: 'GRAMER_HATASI', altKonu: kIsaret),
      OrnekCumle(ingilizce: 'I did not had seen him.', turkce: 'Onu gormemistim.', dogruMu: false,
        neden: 'Perfect olumsuzunda did GIRMEZ; "had not" yeter.',
        dogruBicim: 'I had not seen him.', hataTuru: 'GRAMER_HATASI', altKonu: kOlumsuzSoru),
      OrnekCumle(ingilizce: 'Did you had finished?', turkce: 'Bitirmis miydin?', dogruMu: false,
        neden: 'Soruda "had" basa gecer; did kullanilmaz.',
        dogruBicim: 'Had you finished?', hataTuru: 'GRAMER_HATASI', altKonu: kOlumsuzSoru),
      OrnekCumle(ingilizce: 'You had finished?', turkce: 'Bitirmis miydin?', dogruMu: false,
        neden: 'Soruda SIRA degisir; yalnizca soru isareti yetmez.',
        dogruBicim: 'Had you finished?', hataTuru: 'KELIME_SIRASI', altKonu: kOlumsuzSoru),
      OrnekCumle(ingilizce: 'Yes, I did. (Had you finished?)', turkce: 'Evet, bitirmistim.', dogruMu: false,
        neden: '"had" sorusuna "had" ile cevap verilir.', dogruBicim: 'Yes, I had.',
        hataTuru: 'KELIME_SECIMI', altKonu: kOlumsuzSoru),
      OrnekCumle(ingilizce: 'Ali had come yesterday.', turkce: 'Ali dun geldi.', dogruMu: false,
        neden: 'Tek bir gecmis olay var; Past Perfect gerekmez. Turkce '
            '"-mis" duyumu anlatir, sira degil.',
        dogruBicim: 'Ali came yesterday.', hataTuru: 'ANLAM_FARKI', altKonu: kMisFarki),
      OrnekCumle(ingilizce: 'I had gone to school every day.', turkce: 'Her gun okula giderdim.', dogruMu: false,
        neden: 'Tekrarlanan gecmis aliskanlik Past Simple ile anlatilir.',
        dogruBicim: 'I went to school every day.', hataTuru: 'ANLAM_FARKI', altKonu: kMisFarki),
      OrnekCumle(ingilizce: 'She had been very happy in 2010.', turkce: '2010\u2019da cok mutluydu.', dogruMu: false,
        neden: 'Ikinci bir gecmis olay yok; Past Simple yeterlidir.',
        dogruBicim: 'She was very happy in 2010.', hataTuru: 'ANLAM_FARKI', altKonu: kMisFarki),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kYapi,
        soru: 'She had ___ home.',
        secenekler: <String>['went', 'gone', 'go'],
        kabuller: <String>['gone'], geriDonusKodu: 'BB1'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kSira,
        soru: 'When I arrived, the train ___.',
        secenekler: <String>['left', 'had left', 'has left'],
        kabuller: <String>['had left'], geriDonusKodu: 'BB2'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kSira,
        soru: '"When I arrived, the train left." ne anlatir?',
        secenekler: <String>['Treni kacirdim', 'Ben vardim, sonra tren kalkti',
            'Tren hic kalkmadi'],
        kabuller: <String>['Ben vardim, sonra tren kalkti'], geriDonusKodu: 'BB3'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kIsaret,
        soru: 'By the time we arrived, dinner ___.',
        secenekler: <String>['finished', 'had finished', 'finishes'],
        kabuller: <String>['had finished'], geriDonusKodu: 'BB4'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kOlumsuzSoru,
        soru: 'Hangisi dogru?',
        secenekler: <String>['Did you had finished?', 'Had you finished?', 'You had finished?'],
        kabuller: <String>['Had you finished?'], geriDonusKodu: 'BB6'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kYapi,
        soru: 'We had ___ the report. (write)', kabuller: <String>['written']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kYapi,
        soru: 'They had ___ before the film. (eat)', kabuller: <String>['eaten']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kSira,
        soru: 'She was tired because she ___ worked all day.',
        kabuller: <String>['had']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kIsaret,
        soru: 'The film had ___ started. (coktan)',
        kabuller: <String>['already']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kOlumsuzSoru,
        soru: 'Had you finished? — Yes, I ___.', kabuller: <String>['had']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kIsaret,
        soru: 'Hangisi guclu bir Past Perfect isaretidir?',
        secenekler: <String>['every day', 'by the time', 'yesterday'],
        kabuller: <String>['by the time']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kBeforeAfter,
        soru: '"before" varsa Past Perfect zorunlu mu?',
        secenekler: <String>['Evet, her zaman', 'Hayir, sira zaten belli',
            'Yalnizca soruda'],
        kabuller: <String>['Hayir, sira zaten belli']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kSira,
        soru: 'Dizin: left / arrived / had / When / the train / I',
        kabuller: <String>['When I arrived, the train had left.',
            'When I arrived the train had left']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kOlumsuzSoru,
        soru: 'Dizin: seen / had / I / him / not / before',
        kabuller: <String>['I had not seen him before.',
            'I had not seen him before']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kMisFarki,
        soru: '"Ali had come yesterday." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kSira,
        turkce: 'Vardigimda tren kalkmisti.',
        kabuller: <String>['When I arrived, the train had left.']),
      SerbestGorev(kod: 'SU-2', altKonu: kIsaret,
        turkce: 'Biz varana kadar yemek bitmisti.',
        kabuller: <String>['By the time we arrived, dinner had finished.']),
      SerbestGorev(kod: 'SU-3', altKonu: kOlumsuzSoru,
        turkce: 'Onu daha once gormemistim.',
        kabuller: <String>['I had not seen him before.',
            "I hadn't seen him before."]),
      SerbestGorev(kod: 'SU-4', altKonu: kSira,
        turkce: 'Ev bostu; herkes gitmisti.',
        kabuller: <String>['The house was empty; everyone had gone.',
            'The house was empty. Everyone had gone.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kYapi,
        soru: 'I had ___ that film before. (see)', kabuller: <String>['seen']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kSira,
        soru: 'When we got there, the shop ___ closed.',
        kabuller: <String>['had']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kIsaret,
        soru: 'I had ___ seen such a big house. (hic)',
        kabuller: <String>['never']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.coktanSecmeli, altKonu: kSira,
        soru: 'Hangisi "treni kacirdim" anlamindadir?',
        secenekler: <String>['When I arrived, the train left.',
            'When I arrived, the train had left.',
            'When I arrived, the train was leaving.'],
        kabuller: <String>['When I arrived, the train had left.']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.dogruYanlis, altKonu: kOlumsuzSoru,
        soru: '"Did you had finished?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kIsaret,
        soru: '"I hadn\'t never seen it." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kIsaret,
        soru: 'Dizin: started / had / The film / already',
        kabuller: <String>['The film had already started.',
            'The film had already started']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kMisFarki,
        soru: 'Ali ___ yesterday. (come, tek olay)',
        kabuller: <String>['came']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kYapi,
        soru: 'We had ___ the report.',
        secenekler: <String>['wrote', 'written', 'write'],
        kabuller: <String>['written']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kYapi,
        soru: 'They had ___ before the film.',
        secenekler: <String>['ate', 'eaten', 'eat'],
        kabuller: <String>['eaten']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kSira,
        soru: 'He could not enter because he ___ his key.',
        secenekler: <String>['lost', 'had lost', 'has lost'],
        kabuller: <String>['had lost']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kIsaret,
        soru: 'By the time he called, I ___ to bed.',
        secenekler: <String>['went', 'had gone', 'go'],
        kabuller: <String>['had gone']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kMisFarki,
        soru: '"Ali dun geldi." hangisi?',
        secenekler: <String>['Ali had come yesterday.', 'Ali came yesterday.',
            'Ali has come yesterday.'],
        kabuller: <String>['Ali came yesterday.']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kSira,
        soru: 'The house was empty; everyone ___ gone.',
        kabuller: <String>['had']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kYapi,
        soru: 'I had ___ that film before. (see)', kabuller: <String>['seen']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kOlumsuzSoru,
        soru: 'Had they finished? — No, they ___ not.',
        kabuller: <String>['had']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kYapi,
        soru: '"She had went home." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kOlumsuzSoru,
        soru: '"I did not had seen him." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kMisFarki,
        soru: '"She had been very happy in 2010." tek olay icin dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kSira,
        soru: 'Dizin: gone / everyone / empty / The house / had / was',
        kabuller: <String>['The house was empty everyone had gone.',
            'The house was empty; everyone had gone.']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kSira,
        soru: 'Ingilizceye cevirin: Vardigimda tren kalkmisti.',
        kabuller: <String>['When I arrived, the train had left.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kIsaret,
        soru: 'Ingilizceye cevirin: Film coktan baslamisti.',
        kabuller: <String>['The film had already started.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kOlumsuzSoru,
        soru: 'Ingilizceye cevirin: Onu daha once gormemistim.',
        kabuller: <String>['I had not seen him before.',
            "I hadn't seen him before."]),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Yapi: had + 3. bicim',
        aciklama: '"had" butun ozneler icin ayni. Secim yok.',
        ornek: 'I had finished. · She had gone.'),
      OzetMaddesi(baslik: 'GERI ADIM isareti',
        aciklama: 'Iki gecmis olayda ONCE olani isaretler.',
        ornek: 'When I arrived, the train had left.'),
      OzetMaddesi(baslik: 'Anlam degistirir',
        aciklama: 'had left = kacirdim · left = yetistim. Sus degil, secim.',
        ornek: 'the train left / the train had left'),
      OzetMaddesi(baslik: 'Isaret kelimeleri',
        aciklama: 'already · just · never · by the time',
        ornek: 'By the time we arrived, dinner had finished.'),
      OzetMaddesi(baslik: 'before / after ile GEREKMEZ',
        aciklama: 'Sira zaten belli; Past Perfect zorunlu degil.',
        ornek: 'She left before I arrived.'),
      OzetMaddesi(baslik: 'Turkce "-misti" tuzagi',
        aciklama: 'Ortada IKI gecmis olay yoksa kullanmayin.',
        ornek: 'Ali came yesterday. (had come DEGIL)'),
    ],
  );
}