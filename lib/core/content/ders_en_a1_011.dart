/// EN-A1-011 — Present Simple: 3. Tekil -s Kurali
/// SADECE VERI. Hedef hata kodu: AGR-01.
library;

import '../model/ders_sablonu.dart';

class DersEnA1011 {
  const DersEnA1011._();

  static const String kTemel = '-s eklenmesi';
  static const String kEs = '-es kurali';
  static const String kY = 'y -> ies';
  static const String kHave = 'have -> has';
  static const String kOzneTespiti = 'Ozne tespiti';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A1-011',
    baslik: '3. Tekil -s Kurali (he / she / it)',
    seviye: 'A1', konu: 'ZAM', tahminiDk: 30,
    girisMetni:
        'Turkcede fiil her ozneye gore degisir: gel-IRIM, gel-IRSIN, '
        'gel-IR. Alti farkli ek vardir.\n\n'
        'Ingilizcede Present Simple\'da fiil neredeyse HIC degismez. '
        'Yalnizca TEK bir durumda degisir: ozne he, she veya it ise '
        'fiile "-s" eklenir.\n\n'
        'Bu tek istisna, Turkce konusanlarin en sik yaptigi hatadir: '
        '"He go" demek, Turkcede "O gel" demek gibidir.\n\n'
        'Bu derste -s\'in ne zaman, neden ve hangi bicimde eklendigini '
        'ogreneceksin.',
    kazanimlar: <String>[
      'he/she/it oznesinde fiile -s eklemek',
      '-es gerektiren fiilleri tanimak (go, watch, teach...)',
      'y ile biten fiillerde -ies kuralini uygulamak',
      'have -> has istisnasini bilmek',
      'Ozel isim ve tekil isimlerin he/she/it sayildigini gormek',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'C1', baslik: 'Neden yalnizca tek bir ek var?',
        govde: 'Turkcede fiil alti bicime girer. Ingilizcede Present Simple\'da '
            'fiil DEGISMEZ — tek istisna disinda.\n\n'
            'I work · you work · we work · they work  (hepsi ayni)\n'
            'he workS · she workS · it workS          (tek fark)\n\n'
            'Yani ogrenmeniz gereken tek sey: ozne he/she/it ise -s ekle.',
        turkceKarsilastirma: 'Ben calisirim / Sen calisirsin / O calisir\n'
            'I work      / You work      / He works'),
      AnlatimBlogu(kod: 'C2', baslik: 'Hangi ozneler -s alir?',
        govde: 'Yalnizca UC zamir: he, she, it.\n\n'
            'Ama dikkat: ozel isimler ve TEKIL isimler de bu gruba girer, '
            'cunku onlar da he/she/it demektir.\n\n'
            'Ali = he      -> Ali works\n'
            'My sister = she -> My sister works\n'
            'The dog = it  -> The dog eats\n\n'
            'Cogul isimler almaz: The dogs eat.',
        turkceKarsilastirma: 'Ali calisir.  ->  Ali works.\n'
            'Kopekler yer.  ->  The dogs eat.'),
      AnlatimBlogu(kod: 'C3', baslik: 'Ne zaman -es eklenir?',
        govde: 'Fiil su harflerle bitiyorsa "-es" eklenir:\n\n'
            '-s, -ss, -sh, -ch, -x, -o\n\n'
            'go -> goes · watch -> watches · teach -> teaches\n'
            'wash -> washes · fix -> fixes · pass -> passes\n\n'
            'Sebep telaffuzdur: "watchs" soylenemez, "watches" soylenir.',
        turkceKarsilastirma: 'O izler.  ->  She watches.\n'
            'O gider.  ->  He goes.'),
      AnlatimBlogu(kod: 'C4', baslik: 'y ile biten fiiller',
        govde: 'Fiil SESSIZ harf + y ile bitiyorsa: y duser, "-ies" gelir.\n\n'
            'study -> studies · try -> tries · carry -> carries\n\n'
            'Ama sesli harf + y ise degismez, sadece -s gelir:\n'
            'play -> plays · buy -> buys · say -> says',
        turkceKarsilastirma: 'O calisir (ders).  ->  She studies.\n'
            'O oynar.           ->  He plays.'),
      AnlatimBlogu(kod: 'C5', baslik: 'Tek gercek istisna: have',
        govde: '"have" fiili duzensizdir:\n\n'
            'I have · you have · we have · they have\n'
            'he HAS · she HAS · it HAS\n\n'
            '"haves" diye bir kelime YOKTUR.\n\n'
            'Bunun disinda Present Simple\'da baska istisna yoktur.',
        turkceKarsilastirma: 'Bir arabam var.  ->  I have a car.\n'
            'Onun bir arabasi var. ->  He has a car.'),
      AnlatimBlogu(kod: 'C6', baslik: 'Nerede -s YOKTUR?',
        govde: 'Onemli: -s yalnizca OLUMLU cumlede gorunur.\n\n'
            'Olumsuzda "does" zaten -s tasir, fiil yalin kalir:\n'
            'He does not workS (X)  ->  He does not work\n\n'
            'Soruda da ayni:\n'
            'Does he works? (X)  ->  Does he work?\n\n'
            'Kural: -s ya "does"ta olur ya fiilde; ikisinde birden ASLA.',
        turkceKarsilastirma: 'O calismaz.  ->  He does not work.\n'
            'O calisir mi? ->  Does he work?'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['work', 'He work', 'He works.'],
        turkce: 'O calisir.', not: 'he -> fiile -s.'),
      AdimliOrnek(adimlar: <String>['go', 'She go', 'She goes.'],
        turkce: 'O gider.', not: '-o ile bitiyor -> -es.'),
      AdimliOrnek(adimlar: <String>['study', 'He study', 'He studies.'],
        turkce: 'O ders calisir.', not: 'sessiz + y -> ies.'),
      AdimliOrnek(adimlar: <String>['have', 'She have', 'She has.'],
        turkce: 'Onun var.', not: 'have -> has (duzensiz).'),
      AdimliOrnek(adimlar: <String>['work', 'He does not work', 'He does not work.'],
        turkce: 'O calismaz.', not: 'Olumsuzda fiil YALIN kalir.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Ali her gun calisir.', 'Ali = he', 'work + s', 'Ali works every day.'],
        turkce: 'Ozel isim -> he -> -s.', not: 'Ozel isim tek kisidir.'),
      AdimliOrnek(adimlar: <String>[
        'Kiz kardesim televizyon izler.', 'My sister = she', 'watch + es',
        'My sister watches TV.'],
        turkce: '-ch ile bitiyor -> -es.', not: 'Telaffuz icin -es.'),
      AdimliOrnek(adimlar: <String>[
        'Cocuklar futbol oynar.', 'The children = they', 'play (degismez)',
        'The children play football.'],
        turkce: 'Cogul ozne -s ALMAZ.', not: 'they -> fiil yalin.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'He works in a bank.', turkce: 'O bankada calisir.', dogruMu: true),
      OrnekCumle(ingilizce: 'She reads books.', turkce: 'O kitap okur.', dogruMu: true),
      OrnekCumle(ingilizce: 'It rains in winter.', turkce: 'Kisin yagmur yagar.', dogruMu: true),
      OrnekCumle(ingilizce: 'Ali drinks coffee.', turkce: 'Ali kahve icer.', dogruMu: true),
      OrnekCumle(ingilizce: 'My sister lives in Izmir.', turkce: 'Kiz kardesim Izmir\u2019de yasar.', dogruMu: true),
      OrnekCumle(ingilizce: 'The dog eats meat.', turkce: 'Kopek et yer.', dogruMu: true),
      OrnekCumle(ingilizce: 'My father reads the newspaper.', turkce: 'Babam gazete okur.', dogruMu: true),
      OrnekCumle(ingilizce: 'The shop opens at eight.', turkce: 'Dukkan sekizde acilir.', dogruMu: true),
      OrnekCumle(ingilizce: 'He goes to school.', turkce: 'O okula gider.', dogruMu: true),
      OrnekCumle(ingilizce: 'She watches films.', turkce: 'O film izler.', dogruMu: true),
      OrnekCumle(ingilizce: 'He teaches English.', turkce: 'O Ingilizce ogretir.', dogruMu: true),
      OrnekCumle(ingilizce: 'She washes the car.', turkce: 'O arabayi yikar.', dogruMu: true),
      OrnekCumle(ingilizce: 'He fixes computers.', turkce: 'O bilgisayar tamir eder.', dogruMu: true),
      OrnekCumle(ingilizce: 'The bus passes here.', turkce: 'Otobus buradan gecer.', dogruMu: true),
      OrnekCumle(ingilizce: 'She studies every evening.', turkce: 'O her aksam ders calisir.', dogruMu: true),
      OrnekCumle(ingilizce: 'He tries again.', turkce: 'O tekrar dener.', dogruMu: true),
      OrnekCumle(ingilizce: 'She carries a big bag.', turkce: 'O buyuk bir canta tasir.', dogruMu: true),
      OrnekCumle(ingilizce: 'He plays football.', turkce: 'O futbol oynar.', dogruMu: true),
      OrnekCumle(ingilizce: 'She buys bread every day.', turkce: 'O her gun ekmek alir.', dogruMu: true),
      OrnekCumle(ingilizce: 'He says hello.', turkce: 'O merhaba der.', dogruMu: true),
      OrnekCumle(ingilizce: 'She has a car.', turkce: 'Onun arabasi var.', dogruMu: true),
      OrnekCumle(ingilizce: 'He has two brothers.', turkce: 'Onun iki kardesi var.', dogruMu: true),
      OrnekCumle(ingilizce: 'I work every day.', turkce: 'Her gun calisirim.', dogruMu: true),
      OrnekCumle(ingilizce: 'You read a lot.', turkce: 'Cok okursun.', dogruMu: true),
      OrnekCumle(ingilizce: 'We live in Ankara.', turkce: 'Ankara\u2019da yasariz.', dogruMu: true),
      OrnekCumle(ingilizce: 'They study math.', turkce: 'Onlar matematik calisir.', dogruMu: true),
      OrnekCumle(ingilizce: 'The children play outside.', turkce: 'Cocuklar disarida oynar.', dogruMu: true),
      OrnekCumle(ingilizce: 'He does not work here.', turkce: 'O burada calismaz.', dogruMu: true),
      OrnekCumle(ingilizce: 'Does she read books?', turkce: 'O kitap okur mu?', dogruMu: true),
      OrnekCumle(ingilizce: 'Ali does not have a car.', turkce: 'Ali\u2019nin arabasi yok.', dogruMu: true),

      OrnekCumle(ingilizce: 'He work in a bank.', turkce: 'O bankada calisir.', dogruMu: false,
        neden: 'Ozne "he" tekil ucuncu kisidir; fiile -s eklenmelidir.',
        dogruBicim: 'He works in a bank.'),
      OrnekCumle(ingilizce: 'She read books.', turkce: 'O kitap okur.', dogruMu: false,
        neden: '"she" -> fiile -s. Turkcedeki "okur" bicimi yaniltiyor.',
        dogruBicim: 'She reads books.'),
      OrnekCumle(ingilizce: 'It rain in winter.', turkce: 'Kisin yagmur yagar.', dogruMu: false,
        neden: '"it" de -s alir.', dogruBicim: 'It rains in winter.'),
      OrnekCumle(ingilizce: 'Ali drink coffee.', turkce: 'Ali kahve icer.', dogruMu: false,
        neden: 'Ozel isim tek kisidir, yani "he": -s gerekir.',
        dogruBicim: 'Ali drinks coffee.'),
      OrnekCumle(ingilizce: 'My sister live in Izmir.', turkce: 'Kiz kardesim Izmir\u2019de yasar.', dogruMu: false,
        neden: '"My sister" = she; -s eklenir.',
        dogruBicim: 'My sister lives in Izmir.'),
      OrnekCumle(ingilizce: 'The dog eat meat.', turkce: 'Kopek et yer.', dogruMu: false,
        neden: 'Tekil isim = it; -s eklenir.', dogruBicim: 'The dog eats meat.'),
      OrnekCumle(ingilizce: 'He gos to school.', turkce: 'O okula gider.', dogruMu: false,
        neden: '"go" -o ile biter; -es alir, -s degil.',
        dogruBicim: 'He goes to school.'),
      OrnekCumle(ingilizce: 'She watchs films.', turkce: 'O film izler.', dogruMu: false,
        neden: '-ch ile biten fiiller -es alir.', dogruBicim: 'She watches films.'),
      OrnekCumle(ingilizce: 'He teachs English.', turkce: 'O Ingilizce ogretir.', dogruMu: false,
        neden: '-ch ile bitiyor: -es gerekir.', dogruBicim: 'He teaches English.'),
      OrnekCumle(ingilizce: 'She washs the car.', turkce: 'O arabayi yikar.', dogruMu: false,
        neden: '-sh ile bitiyor: -es gerekir.', dogruBicim: 'She washes the car.'),
      OrnekCumle(ingilizce: 'He fixs computers.', turkce: 'O bilgisayar tamir eder.', dogruMu: false,
        neden: '-x ile bitiyor: -es gerekir.', dogruBicim: 'He fixes computers.'),
      OrnekCumle(ingilizce: 'She studys every evening.', turkce: 'O her aksam calisir.', dogruMu: false,
        neden: 'Sessiz harf + y: y duser, -ies gelir.',
        dogruBicim: 'She studies every evening.'),
      OrnekCumle(ingilizce: 'He trys again.', turkce: 'O tekrar dener.', dogruMu: false,
        neden: 'Sessiz + y -> ies.', dogruBicim: 'He tries again.'),
      OrnekCumle(ingilizce: 'He plaies football.', turkce: 'O futbol oynar.', dogruMu: false,
        neden: 'SESLI harf + y ise -ies OLMAZ; yalnizca -s eklenir.',
        dogruBicim: 'He plays football.'),
      OrnekCumle(ingilizce: 'She haves a car.', turkce: 'Onun arabasi var.', dogruMu: false,
        neden: '"have" duzensizdir: he/she/it ile "has" olur. "haves" yoktur.',
        dogruBicim: 'She has a car.'),
      OrnekCumle(ingilizce: 'I works every day.', turkce: 'Her gun calisirim.', dogruMu: false,
        neden: '-s YALNIZCA he/she/it icindir. "I" almaz.',
        dogruBicim: 'I work every day.'),
      OrnekCumle(ingilizce: 'They studies math.', turkce: 'Onlar matematik calisir.', dogruMu: false,
        neden: '"they" cogul; -s almaz.', dogruBicim: 'They study math.'),
      OrnekCumle(ingilizce: 'The children plays outside.', turkce: 'Cocuklar disarida oynar.', dogruMu: false,
        neden: '"children" cogul bir isimdir; -s almaz.',
        dogruBicim: 'The children play outside.'),
      OrnekCumle(ingilizce: 'He does not works here.', turkce: 'O burada calismaz.', dogruMu: false,
        neden: '-s zaten "does"ta var. Fiil YALIN kalir.',
        dogruBicim: 'He does not work here.'),
      OrnekCumle(ingilizce: 'Does she reads books?', turkce: 'O kitap okur mu?', dogruMu: false,
        neden: 'Soruda da -s "does"tadir; fiil yalin.',
        dogruBicim: 'Does she read books?'),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kTemel,
        soru: 'He ___ in a bank.', secenekler: <String>['work', 'works', 'working'],
        kabuller: <String>['works'], geriDonusKodu: 'C1',
        aciklama: 'he -> fiile -s.'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kOzneTespiti,
        soru: 'The children ___ outside.',
        secenekler: <String>['play', 'plays', 'playes'],
        kabuller: <String>['play'], geriDonusKodu: 'C2',
        aciklama: 'children cogul -> -s yok.'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kEs,
        soru: 'She ___ films every evening.',
        secenekler: <String>['watchs', 'watches', 'watch'],
        kabuller: <String>['watches'], geriDonusKodu: 'C3',
        aciklama: '-ch -> -es.'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kY,
        soru: 'He ___ every evening.',
        secenekler: <String>['studys', 'studies', 'studyes'],
        kabuller: <String>['studies'], geriDonusKodu: 'C4',
        aciklama: 'sessiz + y -> ies.'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kHave,
        soru: 'She ___ two brothers.',
        secenekler: <String>['have', 'haves', 'has'],
        kabuller: <String>['has'], geriDonusKodu: 'C5',
        aciklama: 'have -> has.'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kTemel,
        soru: 'She ___ books. (read)', kabuller: <String>['reads']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kEs,
        soru: 'He ___ to school. (go)', kabuller: <String>['goes']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kY,
        soru: 'She ___ a big bag. (carry)', kabuller: <String>['carries']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kHave,
        soru: 'Ali ___ a new car. (have)', kabuller: <String>['has']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kOzneTespiti,
        soru: 'They ___ in Ankara. (live)', kabuller: <String>['live']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kEs,
        soru: '"teach" fiilinin 3. tekil bicimi?',
        secenekler: <String>['teachs', 'teaches', 'teachies'],
        kabuller: <String>['teaches']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kY,
        soru: '"play" fiilinin 3. tekil bicimi?',
        secenekler: <String>['plaies', 'plays', 'playes'],
        kabuller: <String>['plays']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kTemel,
        soru: 'Dizin: coffee / He / drinks',
        kabuller: <String>['He drinks coffee.', 'He drinks coffee']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kOzneTespiti,
        soru: 'Dizin: work / not / He / does / here',
        kabuller: <String>['He does not work here.', 'He does not work here']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kOzneTespiti,
        soru: '"Does he works?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis'],
        aciklama: '-s zaten does\u2019ta.'),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kTemel, turkce: 'O bankada calisir.',
        kabuller: <String>['He works in a bank.', 'She works in a bank.']),
      SerbestGorev(kod: 'SU-2', altKonu: kEs, turkce: 'O her aksam film izler.',
        kabuller: <String>['He watches films every evening.',
            'She watches films every evening.']),
      SerbestGorev(kod: 'SU-3', altKonu: kHave, turkce: 'Onun bir arabasi var.',
        kabuller: <String>['He has a car.', 'She has a car.']),
      SerbestGorev(kod: 'SU-4', altKonu: kOzneTespiti,
        turkce: 'Cocuklar disarida oynar.',
        kabuller: <String>['The children play outside.',
            'Children play outside.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kTemel,
        soru: 'He ___ in Izmir. (live)', kabuller: <String>['lives']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kEs,
        soru: 'She ___ the car. (wash)', kabuller: <String>['washes']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kY,
        soru: 'He ___ again. (try)', kabuller: <String>['tries']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.boslukDoldurma, altKonu: kHave,
        soru: 'My sister ___ a cat. (have)', kabuller: <String>['has']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.coktanSecmeli, altKonu: kOzneTespiti,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I works.', 'I work.', 'I working.'],
        kabuller: <String>['I work.']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kOzneTespiti,
        soru: '"They studies math." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kEs,
        soru: 'Dizin: English / He / teaches',
        kabuller: <String>['He teaches English.', 'He teaches English']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kTemel,
        soru: 'The shop ___ at eight. (open)', kabuller: <String>['opens']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kTemel,
        soru: 'She ___ coffee.', secenekler: <String>['drink', 'drinks', 'drinkes'],
        kabuller: <String>['drinks']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kEs,
        soru: 'He ___ to work.', secenekler: <String>['gos', 'goes', 'go'],
        kabuller: <String>['goes']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kY,
        soru: 'She ___ math.', secenekler: <String>['studys', 'studies', 'study'],
        kabuller: <String>['studies']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kHave,
        soru: 'It ___ four legs.', secenekler: <String>['have', 'has', 'haves'],
        kabuller: <String>['has']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kOzneTespiti,
        soru: 'We ___ in Ankara.', secenekler: <String>['live', 'lives', 'living'],
        kabuller: <String>['live']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kTemel,
        soru: 'Ali ___ the newspaper. (read)', kabuller: <String>['reads']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kEs,
        soru: 'She ___ computers. (fix)', kabuller: <String>['fixes']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kY,
        soru: 'He ___ a heavy bag. (carry)', kabuller: <String>['carries']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.boslukDoldurma, altKonu: kOzneTespiti,
        soru: 'The dogs ___ meat. (eat)', kabuller: <String>['eat']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kOzneTespiti,
        soru: '"He does not works." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kY,
        soru: '"He plaies football." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kTemel,
        soru: 'Dizin: books / She / reads',
        kabuller: <String>['She reads books.', 'She reads books']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kTemel,
        soru: 'Ingilizceye cevirin: O her gun calisir.',
        kabuller: <String>['He works every day.', 'She works every day.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kHave,
        soru: 'Ingilizceye cevirin: Onun iki kardesi var.',
        kabuller: <String>['He has two brothers.', 'She has two brothers.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kOzneTespiti,
        soru: 'Ingilizceye cevirin: Onlar matematik calisir.',
        kabuller: <String>['They study math.', 'They study maths.']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Temel kural',
        aciklama: 'he / she / it oznesinde fiile -s eklenir. Digerlerinde fiil yalin.',
        ornek: 'He works. · I work.'),
      OzetMaddesi(baslik: 'Ozel ve tekil isimler',
        aciklama: 'Ali = he, my sister = she, the dog = it. Hepsi -s alir.',
        ornek: 'Ali drinks coffee. · The dog eats meat.'),
      OzetMaddesi(baslik: '-es kurali',
        aciklama: '-s, -ss, -sh, -ch, -x, -o ile bitenler -es alir.',
        ornek: 'go -> goes · watch -> watches · fix -> fixes'),
      OzetMaddesi(baslik: 'y kurali',
        aciklama: 'Sessiz + y -> ies. Sesli + y -> yalnizca -s.',
        ornek: 'study -> studies · play -> plays'),
      OzetMaddesi(baslik: 'have -> has',
        aciklama: 'Tek duzensiz bicim. "haves" yoktur.',
        ornek: 'She has a car.'),
      OzetMaddesi(baslik: 'Olumsuz ve soruda -s YOK',
        aciklama: '-s ya "does"ta olur ya fiilde; ikisinde birden asla.',
        ornek: 'He does not work. · Does he work?'),
    ],
  );
}
