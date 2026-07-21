/// EN-A2-003 — Past Simple: Duzensiz Fiiller
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnA2003 {
  const DersEnA2003._();

  static const String kNeden = 'Neden duzensiz?';
  static const String kDegismez = 'Hic degismeyenler';
  static const String kSesli = 'Sesli harf degisenler';
  static const String kTumu = 'Tamamen degisenler';
  static const String kSik = 'En sik kullanilanlar';
  static const String kKarisim = 'Duzenli ile karistirmama';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A2-003',
    baslik: 'Past Simple — Duzensiz Fiiller',
    seviye: 'A2', konu: 'ZAM', tahminiDk: 40,
    onKosullar: <String>['EN-A2-002'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'Gecen derste kolay haberi aldiniz: gecmis zaman icin tek ek var, '
        'kisi eki yok.\n\n'
        'Simdi zor haber: EN SIK KULLANILAN fiiller bu kurala uymaz.\n\n'
        '  go -> went    see -> saw    have -> had\n'
        '  come -> came  take -> took  make -> made\n\n'
        'Neden? Cunku bir kelime ne kadar sik kullanilirsa, degisime o '
        'kadar cok DIRENIR. Herkesin her gun soyledigi bir kelime, '
        'yeni kurala uymak zorunda kalmaz.\n\n'
        'Turkcede de ayni durum vardir: "gitmek" fiilinin emir bicimi '
        '"git" iken "demek" -> "de" olur; en eski fiiller kurali bozar.\n\n'
        'IYI HABER: Duzensiz fiiller COKTUR ama SAYILIDIR. Gunluk dilde '
        'yaklasik 60 tanesi yeter ve hepsi ayni sekilde davranir: '
        'kisiye gore DEGISMEZLER.\n\n'
        '  I went · you went · he went · they went',
    kazanimlar: <String>[
      'Duzensiz fiillerin neden var oldugunu anlamak',
      'En sik 20 duzensiz fiilin gecmis bicimini bilmek',
      'Uc davranis grubunu ayirt etmek',
      'Duzenli ve duzensiz fiili karistirmamak',
      'Duzensizde de kisi eki OLMADIGINI icsellestirmek',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'N1', baslik: 'Neden duzensiz fiiller var?',
        govde: 'Bir kelime ne kadar sik kullanilirsa degisime o kadar '
            'direnir.\n\n'
            'Ingilizce yuzyillar icinde sadelesti ve cogu fiil "-ed" '
            'kuralina gecti. Ama "go", "see", "have" gibi HERKESIN HER GUN '
            'kullandigi fiiller eski bicimlerini korudu.\n\n'
            'Bu yuzden duzensiz fiiller rastgele degildir: neredeyse '
            'hepsi temel, gunluk fiillerdir.\n\n'
            'PRATIK SONUC: Ogrenmeniz gereken liste uzun gorunur ama '
            'zaten en cok kullanacaginiz fiillerdir. Ezberleme yuku '
            'sandiginizdan azdir.',
        turkceKarsilastirma: 'Turkcede de en eski fiiller kurali bozar.\n'
            'Sik kullanim = degisime direnc.'),
      AnlatimBlogu(kod: 'N2', baslik: 'Grup 1 — hic degismeyenler',
        govde: 'Bazi fiiller gecmiste HIC degismez:\n\n'
            '  put -> put · cut -> cut · let -> let\n'
            '  cost -> cost · hit -> hit · read -> read\n\n'
            'DIKKAT: "read" yazimi degismez ama TELAFFUZ degisir:\n'
            '  simdiki: "riid"  ·  gecmis: "red"\n\n'
            'Bu grupta cumlenin gecmis oldugunu ancak zaman ifadesinden '
            'anlarsiniz:\n'
            '  I put it here yesterday.',
        turkceKarsilastirma: 'Dun buraya koydum.  ->  I put it here yesterday.\n'
            'Turkcede ek var, Ingilizcede yalnizca "yesterday".'),
      AnlatimBlogu(kod: 'N3', baslik: 'Grup 2 — sesli harf degisenler',
        govde: 'En kalabalik grup. Kelimenin ortasindaki sesli harf '
            'degisir:\n\n'
            '  come -> came · give -> gave · sit -> sat\n'
            '  drink -> drank · begin -> began · win -> won\n'
            '  meet -> met · sleep -> slept · keep -> kept\n\n'
            'Bir duzen sezilir ama guvenilir bir kural yoktur. Yine de '
            'benzer fiiller benzer davranir:\n\n'
            '  sleep -> slept · keep -> kept · feel -> felt',
        turkceKarsilastirma: 'geldi   ->  came\n'
            'icti    ->  drank'),
      AnlatimBlogu(kod: 'N4', baslik: 'Grup 3 — tamamen degisenler',
        govde: 'Bu fiiller taninmayacak kadar degisir:\n\n'
            '  go -> went · be -> was/were · do -> did\n'
            '  see -> saw · take -> took · buy -> bought\n'
            '  make -> made · have -> had · say -> said\n\n'
            '"go -> went" ozellikle ilginctir: "went" aslinda BASKA bir '
            'fiilden ("wend") gelir. Iki fiil zamanla birlesmistir.\n\n'
            'Bu gruptakiler ezberlenir; kural aramak zaman kaybidir.',
        turkceKarsilastirma: 'gitti  ->  went\n'
            'gordu  ->  saw'),
      AnlatimBlogu(kod: 'N5', baslik: 'Duzensizde de kisi eki YOK',
        govde: 'Duzensiz olmalari kisiye gore degistikleri anlamina '
            'GELMEZ:\n\n'
            '  I went · you went · he went · we went · they went\n'
            '  I saw · she saw · they saw\n\n'
            'Yani duzensizlik yalnizca BICIMDEDIR; kullanim kurali '
            'duzenli fiillerle aynidir.\n\n'
            'TEK ISTISNA: to be. Yalnizca o was/were diye ikiye ayrilir '
            '(A2-001).',
        turkceKarsilastirma: 'gittim / gittin / gitti\n'
            'I went / you went / he went'),
      AnlatimBlogu(kod: 'N6', baslik: 'Duzenli mi duzensiz mi?',
        govde: 'Bir fiilin duzensiz olup olmadigini yazimindan anlayamazsiniz. '
            'Ogrenmenin tek yolu karsilastikca not etmektir.\n\n'
            'Sik yapilan hata: duzensiz fiile -ed eklemek.\n\n'
            '  goed · seed · buyed · maked  -> HEPSI YANLIS\n'
            '  went · saw · bought · made   -> DOGRU\n\n'
            'Ters hata da olur: duzenli fiili duzensiz sanmak.\n'
            '  work -> "wor"? Hayir: worked.\n\n'
            'PRATIK: Emin degilseniz -ed ekleyin; duzenli fiiller '
            'cogunluktadir. Sonra kontrol edin.',
        turkceKarsilastirma: 'gitti  ->  went   (goed DEGIL)\n'
            'calisti ->  worked (wort DEGIL)'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['go', 'went', 'I went to school.'],
        turkce: 'Okula gittim.', not: 'Tamamen degisen grup.'),
      AdimliOrnek(adimlar: <String>['see', 'saw', 'She saw a film.'],
        turkce: 'Bir film gordu.', not: 'seed DEGIL.'),
      AdimliOrnek(adimlar: <String>['put', 'put', 'I put it here yesterday.'],
        turkce: 'Dun buraya koydum.', not: 'Hic degismedi.'),
      AdimliOrnek(adimlar: <String>['I went', 'you went', 'he went', 'they went'],
        turkce: 'Kisiye gore degismez.', not: 'Duzensizlik yalnizca bicimde.'),
      AdimliOrnek(adimlar: <String>['have', 'had', 'We had a good time.'],
        turkce: 'Iyi vakit gecirdik.', not: 'haved DEGIL.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Dun okula gittim.', 'Fiil: go', 'Duzensiz -> went',
        'Zaman: yesterday', 'I went to school yesterday.'],
        turkce: 'Duzensiz fiil kurulumu.', not: 'goed YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Yeni bir araba aldi.', 'Fiil: buy', 'Duzensiz -> bought',
        'She bought a new car.'],
        turkce: 'Tamamen degisen grup.', not: 'buyed YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Onlar calisti ve gittiler.', 'work -> worked (duzenli)',
        'go -> went (duzensiz)', 'They worked and went.'],
        turkce: 'Ikisi bir arada.', not: 'Her fiil kendi bicimini alir.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I went to school yesterday.', turkce: 'Dun okula gittim.', dogruMu: true, altKonu: kTumu),
      OrnekCumle(ingilizce: 'She saw a film last night.', turkce: 'Dun gece bir film gordu.', dogruMu: true, altKonu: kTumu),
      OrnekCumle(ingilizce: 'We had a good time.', turkce: 'Iyi vakit gecirdik.', dogruMu: true, altKonu: kTumu),
      OrnekCumle(ingilizce: 'He bought a new car.', turkce: 'Yeni bir araba aldi.', dogruMu: true, altKonu: kTumu),
      OrnekCumle(ingilizce: 'They made a cake.', turkce: 'Bir kek yaptilar.', dogruMu: true, altKonu: kTumu),
      OrnekCumle(ingilizce: 'She took my book.', turkce: 'Kitabimi aldi.', dogruMu: true, altKonu: kTumu),
      OrnekCumle(ingilizce: 'He said nothing.', turkce: 'Hicbir sey soylemedi.', dogruMu: true, altKonu: kTumu),
      OrnekCumle(ingilizce: 'I did my homework.', turkce: 'Odevimi yaptim.', dogruMu: true, altKonu: kTumu),
      OrnekCumle(ingilizce: 'He came home late.', turkce: 'Eve gec geldi.', dogruMu: true, altKonu: kSesli),
      OrnekCumle(ingilizce: 'She gave me a book.', turkce: 'Bana bir kitap verdi.', dogruMu: true, altKonu: kSesli),
      OrnekCumle(ingilizce: 'We sat on the bench.', turkce: 'Banka oturduk.', dogruMu: true, altKonu: kSesli),
      OrnekCumle(ingilizce: 'They drank tea.', turkce: 'Cay ictiler.', dogruMu: true, altKonu: kSesli),
      OrnekCumle(ingilizce: 'The lesson began at nine.', turkce: 'Ders dokuzda basladi.', dogruMu: true, altKonu: kSesli),
      OrnekCumle(ingilizce: 'I met her last week.', turkce: 'Gecen hafta onunla tanistim.', dogruMu: true, altKonu: kSesli),
      OrnekCumle(ingilizce: 'He slept for eight hours.', turkce: 'Sekiz saat uyudu.', dogruMu: true, altKonu: kSesli),
      OrnekCumle(ingilizce: 'She kept the letter.', turkce: 'Mektubu sakladi.', dogruMu: true, altKonu: kSesli),
      OrnekCumle(ingilizce: 'I put it here yesterday.', turkce: 'Dun buraya koydum.', dogruMu: true, altKonu: kDegismez),
      OrnekCumle(ingilizce: 'She cut the bread.', turkce: 'Ekmegi kesti.', dogruMu: true, altKonu: kDegismez),
      OrnekCumle(ingilizce: 'It cost ten liras.', turkce: 'On lira tuttu.', dogruMu: true, altKonu: kDegismez),
      OrnekCumle(ingilizce: 'He read the book last night.', turkce: 'Dun gece kitabi okudu.', dogruMu: true, altKonu: kDegismez),
      OrnekCumle(ingilizce: 'They let me go.', turkce: 'Gitmeme izin verdiler.', dogruMu: true, altKonu: kDegismez),
      OrnekCumle(ingilizce: 'I went and you went.', turkce: 'Ben gittim ve sen gittin.', dogruMu: true, altKonu: kSik),
      OrnekCumle(ingilizce: 'He went to work.', turkce: 'Ise gitti.', dogruMu: true, altKonu: kSik),
      OrnekCumle(ingilizce: 'They went home.', turkce: 'Eve gittiler.', dogruMu: true, altKonu: kSik),
      OrnekCumle(ingilizce: 'We saw them yesterday.', turkce: 'Onlari dun gorduk.', dogruMu: true, altKonu: kSik),
      OrnekCumle(ingilizce: 'She had two brothers.', turkce: 'Iki kardesi vardi.', dogruMu: true, altKonu: kSik),
      OrnekCumle(ingilizce: 'They worked and went home.', turkce: 'Calistilar ve eve gittiler.', dogruMu: true, altKonu: kKarisim),
      OrnekCumle(ingilizce: 'She studied and took the exam.', turkce: 'Calisti ve sinava girdi.', dogruMu: true, altKonu: kKarisim),
      OrnekCumle(ingilizce: 'He opened the door and came in.', turkce: 'Kapiyi acti ve iceri geldi.', dogruMu: true, altKonu: kKarisim),
      OrnekCumle(ingilizce: 'I called her and she came.', turkce: 'Onu aradim ve geldi.', dogruMu: true, altKonu: kKarisim),

      OrnekCumle(ingilizce: 'I goed to school yesterday.', turkce: 'Dun okula gittim.', dogruMu: false,
        neden: '"go" duzensiz bir fiildir; -ed almaz. Gecmis bicimi "went".',
        dogruBicim: 'I went to school yesterday.', hataTuru: 'YAZIM_HATASI', altKonu: kTumu),
      OrnekCumle(ingilizce: 'She seed a film.', turkce: 'Bir film gordu.', dogruMu: false,
        neden: '"see" duzensizdir: saw.', dogruBicim: 'She saw a film.',
        hataTuru: 'YAZIM_HATASI', altKonu: kTumu),
      OrnekCumle(ingilizce: 'We haved a good time.', turkce: 'Iyi vakit gecirdik.', dogruMu: false,
        neden: '"have" duzensizdir: had.', dogruBicim: 'We had a good time.',
        hataTuru: 'YAZIM_HATASI', altKonu: kTumu),
      OrnekCumle(ingilizce: 'He buyed a new car.', turkce: 'Yeni bir araba aldi.', dogruMu: false,
        neden: '"buy" duzensizdir: bought.', dogruBicim: 'He bought a new car.',
        hataTuru: 'YAZIM_HATASI', altKonu: kTumu),
      OrnekCumle(ingilizce: 'They maked a cake.', turkce: 'Bir kek yaptilar.', dogruMu: false,
        neden: '"make" duzensizdir: made.', dogruBicim: 'They made a cake.',
        hataTuru: 'YAZIM_HATASI', altKonu: kTumu),
      OrnekCumle(ingilizce: 'She taked my book.', turkce: 'Kitabimi aldi.', dogruMu: false,
        neden: '"take" duzensizdir: took.', dogruBicim: 'She took my book.',
        hataTuru: 'YAZIM_HATASI', altKonu: kTumu),
      OrnekCumle(ingilizce: 'He sayed nothing.', turkce: 'Hicbir sey soylemedi.', dogruMu: false,
        neden: '"say" duzensizdir: said.', dogruBicim: 'He said nothing.',
        hataTuru: 'YAZIM_HATASI', altKonu: kTumu),
      OrnekCumle(ingilizce: 'I doed my homework.', turkce: 'Odevimi yaptim.', dogruMu: false,
        neden: '"do" duzensizdir: did.', dogruBicim: 'I did my homework.',
        hataTuru: 'YAZIM_HATASI', altKonu: kTumu),
      OrnekCumle(ingilizce: 'He comed home late.', turkce: 'Eve gec geldi.', dogruMu: false,
        neden: '"come" duzensizdir: came.', dogruBicim: 'He came home late.',
        hataTuru: 'YAZIM_HATASI', altKonu: kSesli),
      OrnekCumle(ingilizce: 'She gived me a book.', turkce: 'Bana bir kitap verdi.', dogruMu: false,
        neden: '"give" duzensizdir: gave.', dogruBicim: 'She gave me a book.',
        hataTuru: 'YAZIM_HATASI', altKonu: kSesli),
      OrnekCumle(ingilizce: 'They drinked tea.', turkce: 'Cay ictiler.', dogruMu: false,
        neden: '"drink" duzensizdir: drank.', dogruBicim: 'They drank tea.',
        hataTuru: 'YAZIM_HATASI', altKonu: kSesli),
      OrnekCumle(ingilizce: 'I meeted her last week.', turkce: 'Gecen hafta tanistim.', dogruMu: false,
        neden: '"meet" duzensizdir: met.', dogruBicim: 'I met her last week.',
        hataTuru: 'YAZIM_HATASI', altKonu: kSesli),
      OrnekCumle(ingilizce: 'He sleeped for eight hours.', turkce: 'Sekiz saat uyudu.', dogruMu: false,
        neden: '"sleep" duzensizdir: slept.', dogruBicim: 'He slept for eight hours.',
        hataTuru: 'YAZIM_HATASI', altKonu: kSesli),
      OrnekCumle(ingilizce: 'I putted it here yesterday.', turkce: 'Dun buraya koydum.', dogruMu: false,
        neden: '"put" gecmiste HIC degismez.', dogruBicim: 'I put it here yesterday.',
        hataTuru: 'YAZIM_HATASI', altKonu: kDegismez),
      OrnekCumle(ingilizce: 'She cutted the bread.', turkce: 'Ekmegi kesti.', dogruMu: false,
        neden: '"cut" degismez.', dogruBicim: 'She cut the bread.',
        hataTuru: 'YAZIM_HATASI', altKonu: kDegismez),
      OrnekCumle(ingilizce: 'It costed ten liras.', turkce: 'On lira tuttu.', dogruMu: false,
        neden: '"cost" degismez.', dogruBicim: 'It cost ten liras.',
        hataTuru: 'YAZIM_HATASI', altKonu: kDegismez),
      OrnekCumle(ingilizce: 'I went to school and worked hard yesterdays.', turkce: 'Dun okula gittim ve cok calistim.', dogruMu: false,
        neden: '"yesterday" bir zaman ifadesidir, cogul yapilmaz.',
        dogruBicim: 'I went to school and worked hard yesterday.',
        hataTuru: 'YAZIM_HATASI', altKonu: kKarisim),
      OrnekCumle(ingilizce: 'They worked and goed home.', turkce: 'Calistilar ve eve gittiler.', dogruMu: false,
        neden: 'Her fiil kendi bicimini alir: work -> worked (duzenli), '
            'go -> went (duzensiz).', dogruBicim: 'They worked and went home.',
        hataTuru: 'YAZIM_HATASI', altKonu: kKarisim),
      OrnekCumle(ingilizce: 'He wented to work.', turkce: 'Ise gitti.', dogruMu: false,
        neden: '"went" zaten gecmis bicimdir; uzerine -ed eklenmez.',
        dogruBicim: 'He went to work.', hataTuru: 'GRAMER_HATASI', altKonu: kSik),
      OrnekCumle(ingilizce: 'She was went home.', turkce: 'Eve gitti.', dogruMu: false,
        neden: 'Ana fiil varken was/were GIRMEZ.', dogruBicim: 'She went home.',
        hataTuru: 'FAZLA_KELIME', altKonu: kKarisim),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kNeden,
        soru: 'Duzensiz fiiller neden kurala uymaz?',
        secenekler: <String>['Rastgele secilmisler',
            'Cok sik kullanildiklari icin degisime direndiler',
            'Yeni fiiller olduklari icin'],
        kabuller: <String>['Cok sik kullanildiklari icin degisime direndiler'],
        geriDonusKodu: 'N1'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kTumu,
        soru: '"go" fiilinin gecmis bicimi?',
        secenekler: <String>['goed', 'went', 'gone'],
        kabuller: <String>['went'], geriDonusKodu: 'N4'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kDegismez,
        soru: '"put" fiilinin gecmis bicimi?',
        secenekler: <String>['putted', 'put', 'pat'],
        kabuller: <String>['put'], geriDonusKodu: 'N2'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kSesli,
        soru: '"drink" fiilinin gecmis bicimi?',
        secenekler: <String>['drinked', 'drank', 'drunk'],
        kabuller: <String>['drank'], geriDonusKodu: 'N3'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kSik,
        soru: 'Duzensiz fiiller kisiye gore degisir mi?',
        secenekler: <String>['Evet, her kisi icin farkli',
            'Hayir, hicbiri degismez', 'Yalnizca he/she/it icin degisir'],
        kabuller: <String>['Hayir, hicbiri degismez'], geriDonusKodu: 'N5'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kTumu,
        soru: 'She ___ a film last night. (see)', kabuller: <String>['saw']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kTumu,
        soru: 'He ___ a new car. (buy)', kabuller: <String>['bought']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kSesli,
        soru: 'They ___ tea. (drink)', kabuller: <String>['drank']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kDegismez,
        soru: 'She ___ the bread. (cut)', kabuller: <String>['cut']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kSesli,
        soru: 'He ___ home late. (come)', kabuller: <String>['came']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kTumu,
        soru: '"take" fiilinin gecmis bicimi?',
        secenekler: <String>['taked', 'took', 'taken'], kabuller: <String>['took']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kSesli,
        soru: '"sleep" fiilinin gecmis bicimi?',
        secenekler: <String>['sleeped', 'slept', 'sleepd'], kabuller: <String>['slept']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kTumu,
        soru: 'Dizin: school / went / I / to',
        kabuller: <String>['I went to school.', 'I went to school']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kKarisim,
        soru: 'Dizin: home / worked / and / They / went',
        kabuller: <String>['They worked and went home.', 'They worked and went home']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kSik,
        soru: '"He wented to work." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kTumu, turkce: 'Dun okula gittim.',
        kabuller: <String>['I went to school yesterday.',
            'Yesterday I went to school.']),
      SerbestGorev(kod: 'SU-2', altKonu: kSesli, turkce: 'Bana bir kitap verdi.',
        kabuller: <String>['She gave me a book.', 'He gave me a book.']),
      SerbestGorev(kod: 'SU-3', altKonu: kDegismez, turkce: 'Ekmegi kesti.',
        kabuller: <String>['She cut the bread.', 'He cut the bread.']),
      SerbestGorev(kod: 'SU-4', altKonu: kKarisim, turkce: 'Calistilar ve eve gittiler.',
        kabuller: <String>['They worked and went home.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kTumu,
        soru: 'They ___ a cake. (make)', kabuller: <String>['made']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kTumu,
        soru: 'I ___ my homework. (do)', kabuller: <String>['did']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kSesli,
        soru: 'The lesson ___ at nine. (begin)', kabuller: <String>['began']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.boslukDoldurma, altKonu: kDegismez,
        soru: 'It ___ ten liras. (cost)', kabuller: <String>['cost']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.coktanSecmeli, altKonu: kKarisim,
        soru: 'Hangisi dogru?',
        secenekler: <String>['She was went home.', 'She went home.', 'She wented home.'],
        kabuller: <String>['She went home.']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kDegismez,
        soru: '"I putted it here." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kSesli,
        soru: 'Dizin: bench / We / the / sat / on',
        kabuller: <String>['We sat on the bench.', 'We sat on the bench']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kSesli,
        soru: 'I ___ her last week. (meet)', kabuller: <String>['met']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kTumu,
        soru: 'I ___ to school yesterday.',
        secenekler: <String>['goed', 'went', 'gone'], kabuller: <String>['went']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kTumu,
        soru: 'She ___ a film last night.',
        secenekler: <String>['seed', 'saw', 'seen'], kabuller: <String>['saw']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kTumu,
        soru: 'He ___ nothing.',
        secenekler: <String>['sayed', 'said', 'says'], kabuller: <String>['said']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kSesli,
        soru: 'They ___ tea.',
        secenekler: <String>['drinked', 'drank', 'drunk'], kabuller: <String>['drank']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kDegismez,
        soru: 'She ___ the bread.',
        secenekler: <String>['cutted', 'cut', 'cuted'], kabuller: <String>['cut']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kTumu,
        soru: 'We ___ a good time. (have)', kabuller: <String>['had']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kTumu,
        soru: 'She ___ my book. (take)', kabuller: <String>['took']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kSesli,
        soru: 'He ___ home late. (come)', kabuller: <String>['came']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kTumu,
        soru: '"He buyed a car." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kSik,
        soru: '"He wented to work." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kKarisim,
        soru: '"She was went home." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kKarisim,
        soru: 'Dizin: came / I / and / called / she / her',
        kabuller: <String>['I called her and she came.', 'I called her and she came']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kTumu,
        soru: 'Ingilizceye cevirin: Yeni bir araba aldi.',
        kabuller: <String>['He bought a new car.', 'She bought a new car.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kSesli,
        soru: 'Ingilizceye cevirin: Eve gec geldi.',
        kabuller: <String>['He came home late.', 'She came home late.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kDegismez,
        soru: 'Ingilizceye cevirin: Dun buraya koydum.',
        kabuller: <String>['I put it here yesterday.']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Neden duzensiz?',
        aciklama: 'Sik kullanilan kelimeler degisime direnir. Hepsi temel fiillerdir.',
        ornek: 'go · see · have · come · take'),
      OzetMaddesi(baslik: 'Grup 1 — degismeyenler',
        aciklama: 'Yazim ayni kalir; zamani ancak baglamdan anlarsiniz.',
        ornek: 'put · cut · cost · let · hit'),
      OzetMaddesi(baslik: 'Grup 2 — sesli harf degisenler',
        aciklama: 'Ortadaki sesli degisir. Benzer fiiller benzer davranir.',
        ornek: 'come->came · drink->drank · sleep->slept'),
      OzetMaddesi(baslik: 'Grup 3 — tamamen degisenler',
        aciklama: 'Taninmayacak kadar degisir; ezberlenir.',
        ornek: 'go->went · see->saw · buy->bought'),
      OzetMaddesi(baslik: 'Kisi eki YINE yok',
        aciklama: 'Duzensizlik yalnizca bicimde. Kullanim kurali ayni.',
        ornek: 'I went · he went · they went'),
      OzetMaddesi(baslik: 'Sik yapilan hata',
        aciklama: 'Duzensiz fiile -ed eklemek. Emin degilseniz once -ed deneyin, sonra kontrol edin.',
        ornek: 'goed (X) -> went · buyed (X) -> bought'),
    ],
  );
}
