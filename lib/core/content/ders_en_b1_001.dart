/// EN-B1-001 — Past Continuous
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnB1001 {
  const DersEnB1001._();

  static const String kYapi = 'Yapi: was/were + -ing';
  static const String kAnda = 'Gecmiste bir ANDA';
  static const String kKesilen = 'Kesilen eylem (when)';
  static const String kEszamanli = 'Es zamanli (while)';
  static const String kArkaPlan = 'Arka plan anlatimi';
  static const String kDurumFiili = 'Durum fiilleri';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-B1-001',
    baslik: 'Past Continuous — Gecmiste Suren Eylem',
    seviye: 'B1', konu: 'ZAM', tahminiDk: 35,
    onKosullar: <String>['EN-A2-001', 'EN-A2-005'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'Bu ders yeni bir yapi getirmiyor. Bildiginiz iki parcayi '
        'birlestiriyor:\n\n'
        '  A2-001: was / were   (gecmis)\n'
        '  A2-005: be + -ing    (sureklilik)\n\n'
        '  I WAS READING.  ->  gecmis + suren\n\n'
        'Turkce "-yordu" eki bu ise iyi uyar: "okuyordum".\n\n'
        'Asil beceri BURADA degil, SECIMDE:\n\n'
        '  I read a book yesterday.   -> bitmis, tamamlanmis\n'
        '  I was reading when he came. -> sururken kesilmis\n\n'
        'DUSUNME SORUSU: "Bu eylem bir NOKTA mi, yoksa bir SERIT mi?"\n\n'
        '  Nokta (basladi bitti)  -> Past Simple\n'
        '  Serit (surerken)       -> Past Continuous\n\n'
        'Hikaye anlatirken serit ARKA PLAN, nokta ise OLAY olur. Bu, '
        'Ingilizce anlatimin temel ritmidir.',
    kazanimlar: <String>[
      'was/were + -ing yapisini kurabilmek',
      'Gecmiste bir andaki eylemi anlatmak',
      'when ile kesilen eylemi ifade etmek',
      'while ile es zamanli eylemleri anlatmak',
      'Hikayede arka plan ile olayi ayirmak',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'BA1', baslik: 'Iki bildik parca',
        govde: 'Yapi tamamen tanidik:\n\n'
            '  OZNE + was/were + FIIL-ing\n\n'
            '  I was working.       ·  You were reading.\n'
            '  She was sleeping.    ·  They were playing.\n\n'
            'was/were secimi A2-001\u2019deki gibi:\n'
            '  I / he / she / it -> was\n'
            '  you / we / they   -> were\n\n'
            '-ing yazimi A2-005\u2019teki gibi:\n'
            '  make -> making · run -> running · lie -> lying\n\n'
            'Yeni kural YOK. Iki dersi birlestiriyorsunuz.',
        turkceKarsilastirma: 'Calisiyordum.  ->  I was working.\n'
            'Tek ek "-yordu" ->  iki parca'),
      AnlatimBlogu(kod: 'BA2', baslik: 'Gecmiste bir ANDA',
        govde: 'En temel kullanim: gecmiste belirli bir anda eylem '
            'surmekteydi.\n\n'
            '  At eight o\u2019clock I was having dinner.\n'
            '  This time yesterday we were travelling.\n'
            '  When you called, I was sleeping.\n\n'
            'Cumlede genellikle bir ZAMAN NOKTASI bulunur: at eight, '
            'this time yesterday, at that moment.\n\n'
            'DUSUNME NOTU: O an bir fotograf gibi dusunun. Fotografta '
            'eylem YARIM kalmis, tamamlanmamistir.',
        turkceKarsilastirma: 'Sekizde yemek yiyordum.\n'
            'At eight I was having dinner.'),
      AnlatimBlogu(kod: 'BA3', baslik: 'Kesilen eylem: when',
        govde: 'Iki eylem karsilastiginda:\n\n'
            '  UZUN eylem (serit)  -> Past Continuous\n'
            '  KISA eylem (nokta)  -> Past Simple\n\n'
            '  I WAS READING when the phone RANG.\n'
            '  She WAS COOKING when I ARRIVED.\n\n'
            'Kisa eylem uzun eylemi KESER. "when" genellikle kisa '
            'eylemin basina gelir.\n\n'
            'Sira degisebilir, anlam degismez:\n'
            '  When the phone rang, I was reading.\n\n'
            'DIKKAT: Ikisi de Past Simple olursa anlam degisir:\n'
            '  When he arrived, I cooked.  -> once geldi, SONRA pisirdim\n'
            '  When he arrived, I was cooking. -> geldiginde ZATEN pisiriyordum',
        turkceKarsilastirma: 'Telefon caldiginda okuyordum.\n'
            'I was reading when the phone rang.'),
      AnlatimBlogu(kod: 'BA4', baslik: 'Es zamanli: while',
        govde: 'Iki eylem AYNI ANDA suruyorsa ikisi de Continuous olur ve '
            '"while" kullanilir:\n\n'
            '  While I was cooking, she was studying.\n'
            '  They were talking while we were waiting.\n\n'
            'FARK:\n'
            '  when  -> genellikle kisa eylemle (Past Simple)\n'
            '  while -> genellikle uzun eylemle (Continuous)\n\n'
            'Ama "while" tek eylemle de kullanilabilir:\n'
            '  While I was walking, I saw an accident.',
        turkceKarsilastirma: 'Ben yemek yaparken o ders calisiyordu.\n'
            'While I was cooking, she was studying.'),
      AnlatimBlogu(kod: 'BA5', baslik: 'Hikayenin ritmi',
        govde: 'Ingilizce anlatimda iki katman vardir:\n\n'
            '  ARKA PLAN -> Past Continuous (sahne kurulur)\n'
            '  OLAY      -> Past Simple (bir sey olur)\n\n'
            '  It was raining and the streets were empty. Nobody was '
            'walking outside. Then a car STOPPED in front of the house '
            'and a man GOT OUT.\n\n'
            'Ilk iki cumle sahneyi kurar; son cumle olayi baslatir.\n\n'
            'DUSUNME ALISKANLIGI: Hikaye yazarken once sahneyi Continuous '
            'ile kurun, sonra olayi Simple ile anlatin. Bu, Ingilizce '
            'anlatimin tipik ritmidir.',
        turkceKarsilastirma: 'Yagmur yagiyordu ve sokaklar bostu.\n'
            'It was raining and the streets were empty.'),
      AnlatimBlogu(kod: 'BA6', baslik: 'Durum fiilleri yine -ing ALMAZ',
        govde: 'A2-005\u2019teki kural burada da gecerli:\n\n'
            '  know · understand · believe · want · need · like · love\n'
            '  belong · remember\n\n'
            '  I was knowing the answer.   -> YANLIS\n'
            '  I knew the answer.          -> DOGRU\n\n'
            '  She was wanting to leave.   -> YANLIS\n'
            '  She wanted to leave.        -> DOGRU\n\n'
            'Sebep ayni: bunlar zaten SUREGIDEN hallerdir; ayrica '
            'sureklilik isareti gerekmez.\n\n'
            'ISTISNA: "have" eylem anlaminda -ing alir.\n'
            '  I was having dinner. (yemek yiyordum)',
        turkceKarsilastirma: 'Cevabi biliyordum.  ->  I knew the answer.\n'
            'Turkce "-yordu" der, Ingilizce DEMEZ.'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['work', 'was working', 'I was working at eight.'],
        turkce: 'Sekizde calisiyordum.', not: 'was/were + -ing.'),
      AdimliOrnek(adimlar: <String>['I was reading', 'when', 'I was reading when the phone rang.'],
        turkce: 'Telefon caldiginda okuyordum.', not: 'Serit + nokta.'),
      AdimliOrnek(adimlar: <String>['While I was cooking', 'she was studying'],
        turkce: 'Ben yemek yaparken o ders calisiyordu.', not: 'Iki serit -> while.'),
      AdimliOrnek(adimlar: <String>['It was raining.', 'Then a car stopped.'],
        turkce: 'Arka plan / olay', not: 'Hikayenin ritmi.'),
      AdimliOrnek(adimlar: <String>['I knew the answer.', 'I was knowing (X)'],
        turkce: 'Durum fiili -ing almaz.', not: 'A2-005 kurali.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Geldiginde uyuyordum.', 'Uzun eylem: uyumak -> Continuous',
        'Kisa eylem: gelmek -> Simple', 'I was sleeping when he came.'],
        turkce: 'Serit ve nokta.', not: 'Kisa eylem uzunu keser.'),
      AdimliOrnek(adimlar: <String>[
        'Ben okurken o yaziyordu.', 'Iki eylem de UZUN',
        'ikisi de Continuous -> while', 'While I was reading, she was writing.'],
        turkce: 'Es zamanli.', not: 'when degil while.'),
      AdimliOrnek(adimlar: <String>[
        'Cevabi biliyordum.', 'know bir DURUM fiili', '-ing ALMAZ',
        'I knew the answer.'],
        turkce: 'Turkce "-yordu" yaniltir.', not: 'was knowing YANLIS.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I was working at eight.', turkce: 'Sekizde calisiyordum.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'She was reading a book.', turkce: 'Kitap okuyordu.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'They were playing football.', turkce: 'Futbol oynuyorlardi.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'We were waiting for the bus.', turkce: 'Otobus bekliyorduk.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'He was making a cake.', turkce: 'Kek yapiyordu.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'The children were running in the garden.', turkce: 'Cocuklar bahcede kosuyordu.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'At eight I was having dinner.', turkce: 'Sekizde yemek yiyordum.', dogruMu: true, altKonu: kAnda),
      OrnekCumle(ingilizce: 'This time yesterday we were travelling.', turkce: 'Dun bu saatlerde seyahat ediyorduk.', dogruMu: true, altKonu: kAnda),
      OrnekCumle(ingilizce: 'At that moment she was sleeping.', turkce: 'O anda uyuyordu.', dogruMu: true, altKonu: kAnda),
      OrnekCumle(ingilizce: 'I was not working yesterday morning.', turkce: 'Dun sabah calismiyordum.', dogruMu: true, altKonu: kAnda),
      OrnekCumle(ingilizce: 'Were you waiting for me?', turkce: 'Beni mi bekliyordun?', dogruMu: true, altKonu: kAnda),
      OrnekCumle(ingilizce: 'I was reading when the phone rang.', turkce: 'Telefon caldiginda okuyordum.', dogruMu: true, altKonu: kKesilen),
      OrnekCumle(ingilizce: 'She was cooking when I arrived.', turkce: 'Ben vardigimda yemek yapiyordu.', dogruMu: true, altKonu: kKesilen),
      OrnekCumle(ingilizce: 'When the phone rang, I was reading.', turkce: 'Telefon caldiginda okuyordum.', dogruMu: true, altKonu: kKesilen),
      OrnekCumle(ingilizce: 'He was driving when the accident happened.', turkce: 'Kaza olurken araba kullaniyordu.', dogruMu: true, altKonu: kKesilen),
      OrnekCumle(ingilizce: 'They were talking when the teacher came in.', turkce: 'Ogretmen girdiginde konusuyorlardi.', dogruMu: true, altKonu: kKesilen),
      OrnekCumle(ingilizce: 'I was sleeping when he came.', turkce: 'Geldiginde uyuyordum.', dogruMu: true, altKonu: kKesilen),
      OrnekCumle(ingilizce: 'While I was cooking, she was studying.', turkce: 'Ben yemek yaparken o ders calisiyordu.', dogruMu: true, altKonu: kEszamanli),
      OrnekCumle(ingilizce: 'They were talking while we were waiting.', turkce: 'Biz beklerken onlar konusuyordu.', dogruMu: true, altKonu: kEszamanli),
      OrnekCumle(ingilizce: 'While I was walking, I saw an accident.', turkce: 'Yururken bir kaza gordum.', dogruMu: true, altKonu: kEszamanli),
      OrnekCumle(ingilizce: 'While she was reading, he was writing.', turkce: 'O okurken digeri yaziyordu.', dogruMu: true, altKonu: kEszamanli),
      OrnekCumle(ingilizce: 'It was raining and the streets were empty.', turkce: 'Yagmur yagiyordu ve sokaklar bostu.', dogruMu: true, altKonu: kArkaPlan),
      OrnekCumle(ingilizce: 'Nobody was walking outside.', turkce: 'Disarida kimse yurumuyordu.', dogruMu: true, altKonu: kArkaPlan),
      OrnekCumle(ingilizce: 'The sun was shining and the birds were singing.', turkce: 'Gunes parliyor ve kuslar otuyordu.', dogruMu: true, altKonu: kArkaPlan),
      OrnekCumle(ingilizce: 'Everyone was waiting quietly.', turkce: 'Herkes sessizce bekliyordu.', dogruMu: true, altKonu: kArkaPlan),
      OrnekCumle(ingilizce: 'Then a car stopped in front of the house.', turkce: 'Sonra evin onunde bir araba durdu.', dogruMu: true, altKonu: kArkaPlan),
      OrnekCumle(ingilizce: 'I knew the answer.', turkce: 'Cevabi biliyordum.', dogruMu: true, altKonu: kDurumFiili),
      OrnekCumle(ingilizce: 'She wanted to leave early.', turkce: 'Erken ayrilmak istiyordu.', dogruMu: true, altKonu: kDurumFiili),
      OrnekCumle(ingilizce: 'We understood the problem.', turkce: 'Sorunu anliyorduk.', dogruMu: true, altKonu: kDurumFiili),
      OrnekCumle(ingilizce: 'I was having lunch at that time.', turkce: 'O sirada ogle yemegi yiyordum.', dogruMu: true, altKonu: kDurumFiili),

      OrnekCumle(ingilizce: 'I was work at eight.', turkce: 'Sekizde calisiyordum.', dogruMu: false,
        neden: '-ing eksik. Yapi IKI parcadir: was/were + fiil-ing.',
        dogruBicim: 'I was working at eight.', hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'I working at eight.', turkce: 'Sekizde calisiyordum.', dogruMu: false,
        neden: 'was/were eksik.', dogruBicim: 'I was working at eight.',
        hataTuru: 'EKSIK_KELIME', altKonu: kYapi),
      OrnekCumle(ingilizce: 'She were reading a book.', turkce: 'Kitap okuyordu.', dogruMu: false,
        neden: 'Tekil ozne "was" alir.', dogruBicim: 'She was reading a book.',
        hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'They was playing football.', turkce: 'Futbol oynuyorlardi.', dogruMu: false,
        neden: 'Cogul ozne "were" alir.', dogruBicim: 'They were playing football.',
        hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'He was makeing a cake.', turkce: 'Kek yapiyordu.', dogruMu: false,
        neden: 'Sondaki sessiz -e duser: making.', dogruBicim: 'He was making a cake.',
        hataTuru: 'YAZIM_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'The children were runing.', turkce: 'Cocuklar kosuyordu.', dogruMu: false,
        neden: 'Tek heceli, tek sesli + tek sessiz: son harf ikilenir.',
        dogruBicim: 'The children were running.', hataTuru: 'YAZIM_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'I did not was working.', turkce: 'Calismiyordum.', dogruMu: false,
        neden: 'Cumlede zaten was var; did GIRMEZ.',
        dogruBicim: 'I was not working.', hataTuru: 'GRAMER_HATASI', altKonu: kAnda),
      OrnekCumle(ingilizce: 'Did you waiting for me?', turkce: 'Beni mi bekliyordun?', dogruMu: false,
        neden: 'Soruda was/were basa gecer; did kullanilmaz.',
        dogruBicim: 'Were you waiting for me?', hataTuru: 'GRAMER_HATASI', altKonu: kAnda),
      OrnekCumle(ingilizce: 'I read when the phone rang.', turkce: 'Telefon caldiginda okuyordum.', dogruMu: false,
        neden: 'Uzun eylem (okumak) Continuous olmali; aksi halde once '
            'caldi sonra okudum anlami cikar.',
        dogruBicim: 'I was reading when the phone rang.',
        hataTuru: 'ANLAM_FARKI', altKonu: kKesilen),
      OrnekCumle(ingilizce: 'I was reading when the phone was ringing.', turkce: 'Telefon caldiginda okuyordum.', dogruMu: false,
        neden: 'Kisa kesici eylem Past Simple olur.',
        dogruBicim: 'I was reading when the phone rang.',
        hataTuru: 'GRAMER_HATASI', altKonu: kKesilen),
      OrnekCumle(ingilizce: 'She cooked when I was arriving.', turkce: 'Ben vardigimda yemek yapiyordu.', dogruMu: false,
        neden: 'Zamanlar ters kullanilmis: uzun eylem pisirmek, kisa eylem varmak.',
        dogruBicim: 'She was cooking when I arrived.',
        hataTuru: 'ANLAM_FARKI', altKonu: kKesilen),
      OrnekCumle(ingilizce: 'He drove when the accident was happening.', turkce: 'Kaza olurken araba kullaniyordu.', dogruMu: false,
        neden: 'Uzun eylem surus, kisa eylem kaza.',
        dogruBicim: 'He was driving when the accident happened.',
        hataTuru: 'ANLAM_FARKI', altKonu: kKesilen),
      OrnekCumle(ingilizce: 'When I was cooking, she was studying.', turkce: 'Ben yemek yaparken o ders calisiyordu.', dogruMu: false,
        neden: 'Iki uzun eylem es zamanliysa "while" daha dogrudur.',
        dogruBicim: 'While I was cooking, she was studying.',
        hataTuru: 'KELIME_SECIMI', altKonu: kEszamanli),
      OrnekCumle(ingilizce: 'While I was walking, I was seeing an accident.', turkce: 'Yururken bir kaza gordum.', dogruMu: false,
        neden: '"see" durum fiilidir ve olay kisadir; Past Simple gerekir.',
        dogruBicim: 'While I was walking, I saw an accident.',
        hataTuru: 'GRAMER_HATASI', altKonu: kEszamanli),
      OrnekCumle(ingilizce: 'They talked while we were waiting.', turkce: 'Biz beklerken onlar konusuyordu.', dogruMu: false,
        neden: 'Iki eylem de suruyorsa ikisi de Continuous olur.',
        dogruBicim: 'They were talking while we were waiting.',
        hataTuru: 'ANLAM_FARKI', altKonu: kEszamanli),
      OrnekCumle(ingilizce: 'It rained and the streets were empty.', turkce: 'Yagmur yagiyordu ve sokaklar bostu.', dogruMu: false,
        neden: 'Arka plan tasviri Continuous ile kurulur.',
        dogruBicim: 'It was raining and the streets were empty.',
        hataTuru: 'ANLAM_FARKI', altKonu: kArkaPlan),
      OrnekCumle(ingilizce: 'Then a car was stopping in front of the house.', turkce: 'Sonra evin onunde bir araba durdu.', dogruMu: false,
        neden: 'Olay (nokta) Past Simple olur; Continuous arka plandir.',
        dogruBicim: 'Then a car stopped in front of the house.',
        hataTuru: 'ANLAM_FARKI', altKonu: kArkaPlan),
      OrnekCumle(ingilizce: 'I was knowing the answer.', turkce: 'Cevabi biliyordum.', dogruMu: false,
        neden: '"know" durum fiilidir; -ing almaz. Turkce "-yordu" der ama '
            'Ingilizce demez.', dogruBicim: 'I knew the answer.',
        hataTuru: 'GRAMER_HATASI', altKonu: kDurumFiili),
      OrnekCumle(ingilizce: 'She was wanting to leave early.', turkce: 'Erken ayrilmak istiyordu.', dogruMu: false,
        neden: '"want" durum fiilidir.', dogruBicim: 'She wanted to leave early.',
        hataTuru: 'GRAMER_HATASI', altKonu: kDurumFiili),
      OrnekCumle(ingilizce: 'We were understanding the problem.', turkce: 'Sorunu anliyorduk.', dogruMu: false,
        neden: '"understand" durum fiilidir.', dogruBicim: 'We understood the problem.',
        hataTuru: 'GRAMER_HATASI', altKonu: kDurumFiili),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kYapi,
        soru: 'She ___ reading a book.',
        secenekler: <String>['was', 'were', 'did'],
        kabuller: <String>['was'], geriDonusKodu: 'BA1'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kKesilen,
        soru: 'I ___ when the phone rang.',
        secenekler: <String>['read', 'was reading', 'have read'],
        kabuller: <String>['was reading'], geriDonusKodu: 'BA3'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kKesilen,
        soru: 'I was reading when the phone ___.',
        secenekler: <String>['rang', 'was ringing', 'rings'],
        kabuller: <String>['rang'], geriDonusKodu: 'BA3'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kEszamanli,
        soru: '___ I was cooking, she was studying.',
        secenekler: <String>['When', 'While', 'After'],
        kabuller: <String>['While'], geriDonusKodu: 'BA4'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kDurumFiili,
        soru: '"Cevabi biliyordum." hangisi?',
        secenekler: <String>['I was knowing the answer.', 'I knew the answer.', 'I was know the answer.'],
        kabuller: <String>['I knew the answer.'], geriDonusKodu: 'BA6'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kYapi,
        soru: 'They ___ playing football. (be)', kabuller: <String>['were']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kYapi,
        soru: 'He was ___ a cake. (make)', kabuller: <String>['making']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kYapi,
        soru: 'The children were ___. (run)', kabuller: <String>['running']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kKesilen,
        soru: 'She was cooking when I ___. (arrive)',
        kabuller: <String>['arrived']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kAnda,
        soru: '___ you waiting for me?', kabuller: <String>['Were', 'were']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kEszamanli,
        soru: 'Iki uzun eylem es zamanliysa hangisi?',
        secenekler: <String>['when', 'while', 'after'],
        kabuller: <String>['while']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kDurumFiili,
        soru: 'Hangisi -ing ALMAZ?',
        secenekler: <String>['work', 'know', 'play'], kabuller: <String>['know']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kKesilen,
        soru: 'Dizin: rang / was / when / I / the phone / reading',
        kabuller: <String>['I was reading when the phone rang.',
            'I was reading when the phone rang']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kArkaPlan,
        soru: 'Dizin: raining / It / was',
        kabuller: <String>['It was raining.', 'It was raining']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kDurumFiili,
        soru: '"I was knowing the answer." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kYapi, turkce: 'Sekizde calisiyordum.',
        kabuller: <String>['I was working at eight.']),
      SerbestGorev(kod: 'SU-2', altKonu: kKesilen,
        turkce: 'Telefon caldiginda okuyordum.',
        kabuller: <String>['I was reading when the phone rang.']),
      SerbestGorev(kod: 'SU-3', altKonu: kEszamanli,
        turkce: 'Ben yemek yaparken o ders calisiyordu.',
        kabuller: <String>['While I was cooking, she was studying.']),
      SerbestGorev(kod: 'SU-4', altKonu: kDurumFiili, turkce: 'Cevabi biliyordum.',
        kabuller: <String>['I knew the answer.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kAnda,
        soru: 'At eight I ___ having dinner.', kabuller: <String>['was']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kKesilen,
        soru: 'They were talking when the teacher ___ in. (come)',
        kabuller: <String>['came']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kEszamanli,
        soru: 'While she ___ reading, he was writing.',
        kabuller: <String>['was']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.coktanSecmeli, altKonu: kArkaPlan,
        soru: 'Hikayede ARKA PLAN hangi zamanla kurulur?',
        secenekler: <String>['Past Simple', 'Past Continuous', 'Present Perfect'],
        kabuller: <String>['Past Continuous']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.dogruYanlis, altKonu: kAnda,
        soru: '"Did you waiting for me?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kDurumFiili,
        soru: '"She was wanting to leave." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kEszamanli,
        soru: 'Dizin: studying / cooking / was / While / she / I / was',
        kabuller: <String>['While I was cooking, she was studying.',
            'While I was cooking she was studying']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kYapi,
        soru: 'We ___ waiting for the bus. (be)', kabuller: <String>['were']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kYapi,
        soru: 'They ___ playing football.',
        secenekler: <String>['was', 'were', 'did'], kabuller: <String>['were']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kYapi,
        soru: 'He was ___ a cake.',
        secenekler: <String>['makeing', 'making', 'makking'],
        kabuller: <String>['making']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kKesilen,
        soru: 'She ___ when I arrived.',
        secenekler: <String>['cooked', 'was cooking', 'cooks'],
        kabuller: <String>['was cooking']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kKesilen,
        soru: 'He was driving when the accident ___.',
        secenekler: <String>['happened', 'was happening', 'happens'],
        kabuller: <String>['happened']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kDurumFiili,
        soru: 'Hangisi dogru?',
        secenekler: <String>['We were understanding.', 'We understood.', 'We was understanding.'],
        kabuller: <String>['We understood.']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kAnda,
        soru: 'This time yesterday we ___ travelling.',
        kabuller: <String>['were']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kEszamanli,
        soru: '___ I was walking, I saw an accident.',
        kabuller: <String>['While', 'while']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kYapi,
        soru: 'The children were ___ in the garden. (run)',
        kabuller: <String>['running']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kYapi,
        soru: '"I did not was working." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kKesilen,
        soru: '"I read when the phone rang." kesilen eylemi anlatir mi?',
        secenekler: <String>['Evet', 'Hayir'], kabuller: <String>['Hayir']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kDurumFiili,
        soru: '"I was knowing the answer." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kKesilen,
        soru: 'Dizin: came / sleeping / I / when / he / was',
        kabuller: <String>['I was sleeping when he came.',
            'I was sleeping when he came']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kYapi,
        soru: 'Ingilizceye cevirin: Sekizde yemek yiyordum.',
        kabuller: <String>['At eight I was having dinner.',
            'I was having dinner at eight.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kKesilen,
        soru: 'Ingilizceye cevirin: Ben vardigimda yemek yapiyordu.',
        kabuller: <String>['She was cooking when I arrived.',
            'He was cooking when I arrived.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kArkaPlan,
        soru: 'Ingilizceye cevirin: Yagmur yagiyordu ve sokaklar bostu.',
        kabuller: <String>['It was raining and the streets were empty.']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Iki bildik parca',
        aciklama: 'A2-001 (was/were) + A2-005 (be + -ing). Yeni kural yok.',
        ornek: 'I was working. · They were playing.'),
      OzetMaddesi(baslik: 'Gecmiste bir ANDA',
        aciklama: 'O an bir fotograf gibi; eylem yarim kalmistir.',
        ornek: 'At eight I was having dinner.'),
      OzetMaddesi(baslik: 'Nokta mi serit mi?',
        aciklama: 'Uzun eylem -> Continuous · Kisa kesici eylem -> Past Simple.',
        ornek: 'I was reading when the phone rang.'),
      OzetMaddesi(baslik: 'when / while',
        aciklama: 'when kisa eylemle · while uzun (es zamanli) eylemle.',
        ornek: 'While I was cooking, she was studying.'),
      OzetMaddesi(baslik: 'Hikayenin ritmi',
        aciklama: 'Once sahneyi Continuous ile kur, sonra olayi Simple ile anlat.',
        ornek: 'It was raining. Then a car stopped.'),
      OzetMaddesi(baslik: 'Durum fiilleri -ing ALMAZ',
        aciklama: 'know, want, understand... Turkce "-yordu" der, Ingilizce demez.',
        ornek: 'I knew the answer. (was knowing DEGIL)'),
    ],
  );
}