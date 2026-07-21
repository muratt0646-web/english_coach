/// EN-A2-010 — Ustunluk: Superlative
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnA2010 {
  const DersEnA2010._();

  static const String kKisa = 'Kisa sifat: -est';
  static const String kUzun = 'Uzun sifat: most';
  static const String kThe = '"the" ZORUNLU';
  static const String kGrup = 'in / of ile grup';
  static const String kDuzensiz = 'Duzensiz bicimler';
  static const String kIkiKat = 'Cift ustunluk hatasi';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A2-010',
    baslik: 'Ustunluk — Superlative',
    seviye: 'A2', konu: 'ISM', tahminiDk: 35,
    onKosullar: <String>['EN-A2-009'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'Turkce ustunlugu tek kelimeyle kurar: "en".\n\n'
        '  en buyuk · en guzel · en onemli\n'
        '  Sifat degismez, artikel de yoktur.\n\n'
        'Ingilizcede IKI sey birden degisir:\n\n'
        '  1. Sifat bicim degistirir:  big -> biggest · important -> most important\n'
        '  2. Onune "the" GELIR:       THE biggest · THE most important\n\n'
        'Ikinci madde Turkce konusanin en cok atladigi yerdir. Cunku '
        'Turkcede "en buyuk ev" derken artikel yoktur.\n\n'
        '  biggest house      -> eksik\n'
        '  THE biggest house  -> dogru\n\n'
        'NEDEN "the"? Cunku "en buyuk" dediginizde TEK bir sey kastedersiniz. '
        'Hangisi oldugu bellidir. A1-019\u2019daki kural burada isliyor: '
        'belirli olan sey "the" alir.\n\n'
        'Iyi haber: uzunluk kurali comparative ile AYNI. Yeni bir sey yok.',
    kazanimlar: <String>[
      'Sifatin uzunluguna gore -est veya most secebilmek',
      '"the" kullanmayi unutmamak',
      'in / of ile grubu belirtmek',
      'Duzensiz bicimleri tanimak (good -> the best)',
      'Cift ustunluk hatasindan kacinmak',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'V1', baslik: 'Uzunluk kurali AYNI',
        govde: 'Comparative\u2019de ogrendiginiz kural aynen gecerlidir:\n\n'
            '  1 HECE            -> -est\n'
            '     big -> the biggest · old -> the oldest\n\n'
            '  sessiz + y        -> -iest\n'
            '     easy -> the easiest · happy -> the happiest\n\n'
            '  2+ HECE           -> the most\n'
            '     important -> the most important\n'
            '     expensive -> the most expensive\n\n'
            'Yani yeni bir kural yok; -er yerine -est, more yerine most.',
        turkceKarsilastirma: 'daha buyuk -> bigger\n'
            'en buyuk   -> the biggest'),
      AnlatimBlogu(kod: 'V2', baslik: '"the" neden zorunlu?',
        govde: '"en buyuk" dediginizde TEK bir sey kastedersiniz. Hangisi '
            'oldugu bellidir.\n\n'
            'A1-019\u2019daki kural: belirli olan sey "the" alir.\n\n'
            '  a big house     -> herhangi bir buyuk ev\n'
            '  the biggest house -> hepsi icinde EN buyugu, tek tane\n\n'
            'Bu yuzden "the" atlanamaz:\n'
            '  She is best student.     -> eksik\n'
            '  She is THE best student. -> dogru\n\n'
            'Turkcede artikel olmadigi icin bu en cok unutulan noktadir.',
        turkceKarsilastirma: 'En iyi ogrenci.  ->  the best student\n'
            'Artikel yok      ->  "the" ZORUNLU'),
      AnlatimBlogu(kod: 'V3', baslik: 'Yazim degisiklikleri',
        govde: 'Comparative ile aynidir:\n\n'
            '1. -e ile bitiyorsa yalnizca -st:\n'
            '   large -> the largest · nice -> the nicest\n\n'
            '2. Tek heceli, tek sesli + tek sessiz: son harf IKILENIR:\n'
            '   big -> the biggest · hot -> the hottest\n\n'
            '3. Sessiz + y: y duser, -iest gelir:\n'
            '   easy -> the easiest · happy -> the happiest\n\n'
            'Ayni yazim kurallari -ed, -ing ve -er icin de gecerliydi. '
            'Dorduncu kez ayni mantik.',
        turkceKarsilastirma: 'en buyuk  ->  the biggest\n'
            'en kolay  ->  the easiest'),
      AnlatimBlogu(kod: 'V4', baslik: 'Grup nasil belirtilir: in / of',
        govde: 'Neyin icinde en oldugunu soylerken:\n\n'
            '  YER veya TOPLULUK -> in\n'
            '     the biggest city IN Turkey\n'
            '     the best student IN the class\n\n'
            '  SAYILABILIR GRUP -> of\n'
            '     the best OF all\n'
            '     the tallest OF the three\n\n'
            '  ZAMAN ARALIGI -> of veya in\n'
            '     the hottest day OF the year\n\n'
            'Turkcede tek ek yeter: "Turkiye\u2019NIN en buyuk sehri".',
        turkceKarsilastirma: 'Turkiye\u2019nin en buyuk sehri\n'
            'the biggest city in Turkey'),
      AnlatimBlogu(kod: 'V5', baslik: 'Duzensiz bicimler',
        govde: 'Comparative\u2019deki duzensizler burada da vardir:\n\n'
            '  good -> better -> THE BEST\n'
            '  bad  -> worse  -> THE WORST\n'
            '  far  -> further -> THE FURTHEST\n'
            '  many/much -> more -> THE MOST\n'
            '  little -> less -> THE LEAST\n\n'
            '"the goodest" veya "the most good" YOKTUR.\n\n'
            'Uc bicimi birlikte ogrenmek en kolay yoldur:\n'
            '  good · better · the best',
        turkceKarsilastirma: 'iyi · daha iyi · en iyi\n'
            'good · better · the best'),
      AnlatimBlogu(kod: 'V6', baslik: 'Cift ustunluk hatasi',
        govde: 'Comparative\u2019deki hatanin aynisi burada da olur:\n\n'
            '  the most biggest  -> YANLIS\n'
            '  the most easiest  -> YANLIS\n'
            '  the most best     -> YANLIS\n\n'
            '  the biggest · the easiest · the best  -> DOGRU\n\n'
            'Ters hata: uzun sifata -est eklemek.\n'
            '  the importantest  -> YANLIS\n'
            '  the most important -> DOGRU\n\n'
            'KURAL: Ustunluk isareti BIR KEZ bulunur. Ya -est ya most.\n\n'
            'Ucuncu hata: "the" unutmak. Bu uc hatayi birlikte kontrol edin.',
        turkceKarsilastirma: 'en buyuk -> the biggest\n'
            '"en" ve "-est" AYNI isi yapar.'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['big', 'biggest', 'the biggest', 'It is the biggest house.'],
        turkce: 'En buyuk ev.', not: '"the" ZORUNLU.'),
      AdimliOrnek(adimlar: <String>['important', 'most important', 'the most important'],
        turkce: 'En onemli.', not: 'Uzun sifat -> most.'),
      AdimliOrnek(adimlar: <String>['good', 'better', 'the best'],
        turkce: 'iyi · daha iyi · en iyi', not: 'Uc bicimi birlikte ogrenin.'),
      AdimliOrnek(adimlar: <String>['the biggest city', 'in Turkey', 'the biggest city in Turkey'],
        turkce: 'Turkiye\u2019nin en buyuk sehri.', not: 'Yer -> in.'),
      AdimliOrnek(adimlar: <String>['easy', 'easiest', 'the easiest', 'This is the easiest question.'],
        turkce: 'En kolay soru.', not: 'Sessiz + y -> iest.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Bu en buyuk ev.', 'big -> 1 hece -> -est', '"the" ekle',
        'This is the biggest house.'],
        turkce: 'Uc adim: hece say, ek koy, the ekle.',
        not: 'the unutulmaz.'),
      AdimliOrnek(adimlar: <String>[
        'Sinifin en iyi ogrencisi.', 'good -> duzensiz -> the best',
        'grup: in the class', 'She is the best student in the class.'],
        turkce: 'Duzensiz + grup.', not: 'the goodest YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Bu en pahali araba.', 'expensive -> 3 hece -> most',
        'the most expensive', 'This is the most expensive car.'],
        turkce: 'Uzun sifat.', not: 'the expensivest YANLIS.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'This is the biggest house.', turkce: 'Bu en buyuk ev.', dogruMu: true, altKonu: kKisa),
      OrnekCumle(ingilizce: 'He is the oldest in the family.', turkce: 'Ailenin en yaslisi.', dogruMu: true, altKonu: kKisa),
      OrnekCumle(ingilizce: 'This is the cheapest phone.', turkce: 'Bu en ucuz telefon.', dogruMu: true, altKonu: kKisa),
      OrnekCumle(ingilizce: 'That is the tallest building.', turkce: 'O en yuksek bina.', dogruMu: true, altKonu: kKisa),
      OrnekCumle(ingilizce: 'It was the shortest day of the year.', turkce: 'Yilin en kisa gunuydu.', dogruMu: true, altKonu: kKisa),
      OrnekCumle(ingilizce: 'This is the most important lesson.', turkce: 'Bu en onemli ders.', dogruMu: true, altKonu: kUzun),
      OrnekCumle(ingilizce: 'That is the most expensive car.', turkce: 'O en pahali araba.', dogruMu: true, altKonu: kUzun),
      OrnekCumle(ingilizce: 'She is the most careful driver.', turkce: 'En dikkatli suruculdur.', dogruMu: true, altKonu: kUzun),
      OrnekCumle(ingilizce: 'It is the most interesting book.', turkce: 'En ilginc kitap.', dogruMu: true, altKonu: kUzun),
      OrnekCumle(ingilizce: 'This is the most difficult question.', turkce: 'Bu en zor soru.', dogruMu: true, altKonu: kUzun),
      OrnekCumle(ingilizce: 'She is the best student.', turkce: 'En iyi ogrenci.', dogruMu: true, altKonu: kThe),
      OrnekCumle(ingilizce: 'This is the easiest question.', turkce: 'Bu en kolay soru.', dogruMu: true, altKonu: kThe),
      OrnekCumle(ingilizce: 'He is the happiest person here.', turkce: 'Buradaki en mutlu kisi.', dogruMu: true, altKonu: kThe),
      OrnekCumle(ingilizce: 'It was the hottest day.', turkce: 'En sicak gundu.', dogruMu: true, altKonu: kThe),
      OrnekCumle(ingilizce: 'This is the largest room.', turkce: 'Bu en genis oda.', dogruMu: true, altKonu: kThe),
      OrnekCumle(ingilizce: 'Istanbul is the biggest city in Turkey.', turkce: 'Istanbul Turkiye\u2019nin en buyuk sehri.', dogruMu: true, altKonu: kGrup),
      OrnekCumle(ingilizce: 'She is the best student in the class.', turkce: 'Sinifin en iyi ogrencisi.', dogruMu: true, altKonu: kGrup),
      OrnekCumle(ingilizce: 'He is the tallest of the three.', turkce: 'Ucunun en uzunu.', dogruMu: true, altKonu: kGrup),
      OrnekCumle(ingilizce: 'This is the best of all.', turkce: 'Hepsinin en iyisi.', dogruMu: true, altKonu: kGrup),
      OrnekCumle(ingilizce: 'It was the hottest day of the year.', turkce: 'Yilin en sicak gunuydu.', dogruMu: true, altKonu: kGrup),
      OrnekCumle(ingilizce: 'This is the best book I have.', turkce: 'Sahip oldugum en iyi kitap.', dogruMu: true, altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'That was the worst film.', turkce: 'O en kotu filmdi.', dogruMu: true, altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'This shop is the furthest.', turkce: 'Bu dukkan en uzak.', dogruMu: true, altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'He has the most money.', turkce: 'En cok parasi olan o.', dogruMu: true, altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'She has the least time.', turkce: 'En az zamani olan o.', dogruMu: true, altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'Ankara is the second largest city.', turkce: 'Ankara ikinci en buyuk sehir.', dogruMu: true, altKonu: kGrup),
      OrnekCumle(ingilizce: 'This is the youngest child.', turkce: 'Bu en kucuk cocuk.', dogruMu: true, altKonu: kKisa),
      OrnekCumle(ingilizce: 'It is the safest street here.', turkce: 'Buradaki en guvenli sokak.', dogruMu: true, altKonu: kThe),
      OrnekCumle(ingilizce: 'This is the most useful book.', turkce: 'Bu en faydali kitap.', dogruMu: true, altKonu: kUzun),
      OrnekCumle(ingilizce: 'He is the strongest in the team.', turkce: 'Takimin en guclusu.', dogruMu: true, altKonu: kGrup),

      OrnekCumle(ingilizce: 'This is biggest house.', turkce: 'Bu en buyuk ev.', dogruMu: false,
        neden: 'Ustunlukte "the" ZORUNLUDUR. Turkcede artikel olmadigi '
            'icin en sik atlanan noktadir.', dogruBicim: 'This is the biggest house.',
        hataTuru: 'EKSIK_KELIME', altKonu: kThe),
      OrnekCumle(ingilizce: 'She is best student.', turkce: 'En iyi ogrenci.', dogruMu: false,
        neden: '"the" eksik.', dogruBicim: 'She is the best student.',
        hataTuru: 'EKSIK_KELIME', altKonu: kThe),
      OrnekCumle(ingilizce: 'It was hottest day of the year.', turkce: 'Yilin en sicak gunuydu.', dogruMu: false,
        neden: '"the" eksik.', dogruBicim: 'It was the hottest day of the year.',
        hataTuru: 'EKSIK_KELIME', altKonu: kThe),
      OrnekCumle(ingilizce: 'This is the most biggest house.', turkce: 'Bu en buyuk ev.', dogruMu: false,
        neden: 'Ustunluk isareti BIR KEZ bulunur. "-est" zaten "en" '
            'demektir.', dogruBicim: 'This is the biggest house.',
        hataTuru: 'FAZLA_KELIME', altKonu: kIkiKat),
      OrnekCumle(ingilizce: 'This is the most easiest question.', turkce: 'Bu en kolay soru.', dogruMu: false,
        neden: '"easiest" zaten ustunluktur.', dogruBicim: 'This is the easiest question.',
        hataTuru: 'FAZLA_KELIME', altKonu: kIkiKat),
      OrnekCumle(ingilizce: 'She is the most best student.', turkce: 'En iyi ogrenci.', dogruMu: false,
        neden: '"best" zaten "en iyi" demektir.', dogruBicim: 'She is the best student.',
        hataTuru: 'FAZLA_KELIME', altKonu: kIkiKat),
      OrnekCumle(ingilizce: 'This is the importantest lesson.', turkce: 'Bu en onemli ders.', dogruMu: false,
        neden: 'Uzun sifatlara -est eklenmez; "the most" kullanilir.',
        dogruBicim: 'This is the most important lesson.', hataTuru: 'GRAMER_HATASI', altKonu: kUzun),
      OrnekCumle(ingilizce: 'That is the expensivest car.', turkce: 'O en pahali araba.', dogruMu: false,
        neden: '3 heceli sifat -> the most expensive.',
        dogruBicim: 'That is the most expensive car.', hataTuru: 'GRAMER_HATASI', altKonu: kUzun),
      OrnekCumle(ingilizce: 'It is the interestingest book.', turkce: 'En ilginc kitap.', dogruMu: false,
        neden: 'Uzun sifat -> the most interesting.',
        dogruBicim: 'It is the most interesting book.', hataTuru: 'GRAMER_HATASI', altKonu: kUzun),
      OrnekCumle(ingilizce: 'This is the most cheap phone.', turkce: 'Bu en ucuz telefon.', dogruMu: false,
        neden: 'Tek heceli sifat -est alir; most kullanilmaz.',
        dogruBicim: 'This is the cheapest phone.', hataTuru: 'GRAMER_HATASI', altKonu: kKisa),
      OrnekCumle(ingilizce: 'He is the most old in the family.', turkce: 'Ailenin en yaslisi.', dogruMu: false,
        neden: '1 hece -> the oldest.', dogruBicim: 'He is the oldest in the family.',
        hataTuru: 'GRAMER_HATASI', altKonu: kKisa),
      OrnekCumle(ingilizce: 'This is the largeest room.', turkce: 'Bu en genis oda.', dogruMu: false,
        neden: 'Sondaki -e varken yalnizca -st eklenir: largest.',
        dogruBicim: 'This is the largest room.', hataTuru: 'YAZIM_HATASI', altKonu: kThe),
      OrnekCumle(ingilizce: 'It was the hotest day.', turkce: 'En sicak gundu.', dogruMu: false,
        neden: 'Tek heceli, tek sesli + tek sessiz: son harf ikilenir.',
        dogruBicim: 'It was the hottest day.', hataTuru: 'YAZIM_HATASI', altKonu: kThe),
      OrnekCumle(ingilizce: 'This is the easyest question.', turkce: 'Bu en kolay soru.', dogruMu: false,
        neden: 'Sessiz + y: y duser, -iest gelir.',
        dogruBicim: 'This is the easiest question.', hataTuru: 'YAZIM_HATASI', altKonu: kThe),
      OrnekCumle(ingilizce: 'He is the happyest person here.', turkce: 'En mutlu kisi.', dogruMu: false,
        neden: 'Sessiz + y -> iest: happiest.', dogruBicim: 'He is the happiest person here.',
        hataTuru: 'YAZIM_HATASI', altKonu: kThe),
      OrnekCumle(ingilizce: 'This is the goodest book.', turkce: 'Bu en iyi kitap.', dogruMu: false,
        neden: '"good" duzensizdir: the best.', dogruBicim: 'This is the best book.',
        hataTuru: 'YAZIM_HATASI', altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'That was the baddest film.', turkce: 'O en kotu filmdi.', dogruMu: false,
        neden: '"bad" duzensizdir: the worst.', dogruBicim: 'That was the worst film.',
        hataTuru: 'YAZIM_HATASI', altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'Istanbul is the biggest city of Turkey.', turkce: 'Istanbul Turkiye\u2019nin en buyuk sehri.', dogruMu: false,
        neden: 'Yer belirtirken "in" kullanilir.',
        dogruBicim: 'Istanbul is the biggest city in Turkey.', hataTuru: 'KELIME_SECIMI', altKonu: kGrup),
      OrnekCumle(ingilizce: 'She is the best student of the class.', turkce: 'Sinifin en iyi ogrencisi.', dogruMu: false,
        neden: 'Topluluk icin "in" daha dogrudur.',
        dogruBicim: 'She is the best student in the class.', hataTuru: 'KELIME_SECIMI', altKonu: kGrup),
      OrnekCumle(ingilizce: 'He is the tallest in the three.', turkce: 'Ucunun en uzunu.', dogruMu: false,
        neden: 'Sayilabilir grupta "of" kullanilir.',
        dogruBicim: 'He is the tallest of the three.', hataTuru: 'KELIME_SECIMI', altKonu: kGrup),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kThe,
        soru: 'Hangisi dogru?',
        secenekler: <String>['This is biggest house.', 'This is the biggest house.', 'This is most big house.'],
        kabuller: <String>['This is the biggest house.'], geriDonusKodu: 'V2',
        aciklama: '"the" zorunlu.'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kUzun,
        soru: '"important" sifatinin ustunluk bicimi?',
        secenekler: <String>['the importantest', 'the most important', 'the more important'],
        kabuller: <String>['the most important'], geriDonusKodu: 'V1'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kDuzensiz,
        soru: '"good" sifatinin ustunluk bicimi?',
        secenekler: <String>['the goodest', 'the best', 'the most good'],
        kabuller: <String>['the best'], geriDonusKodu: 'V5'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kIkiKat,
        soru: 'Hangisi dogru?',
        secenekler: <String>['the most biggest', 'the biggest', 'the more biggest'],
        kabuller: <String>['the biggest'], geriDonusKodu: 'V6'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kGrup,
        soru: 'Istanbul is the biggest city ___ Turkey.',
        secenekler: <String>['of', 'in', 'from'],
        kabuller: <String>['in'], geriDonusKodu: 'V4'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kKisa,
        soru: 'This is the ___ phone. (cheap)', kabuller: <String>['cheapest']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kUzun,
        soru: 'It is the ___ book. (interesting)',
        kabuller: <String>['most interesting']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kThe,
        soru: 'This is ___ largest room.', kabuller: <String>['the']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kDuzensiz,
        soru: 'That was the ___ film. (bad)', kabuller: <String>['worst']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kGrup,
        soru: 'She is the best student ___ the class.', kabuller: <String>['in']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kUzun,
        soru: '"expensive" sifatinin ustunlugu?',
        secenekler: <String>['the expensivest', 'the most expensive', 'the more expensive'],
        kabuller: <String>['the most expensive']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kGrup,
        soru: 'Sayilabilir grupta hangisi?',
        secenekler: <String>['in', 'of', 'from'], kabuller: <String>['of']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kThe,
        soru: 'Dizin: house / the / This / biggest / is',
        kabuller: <String>['This is the biggest house.', 'This is the biggest house']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kDuzensiz,
        soru: 'Dizin: student / best / She / the / is',
        kabuller: <String>['She is the best student.', 'She is the best student']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kIkiKat,
        soru: '"the most biggest" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kThe, turkce: 'Bu en buyuk ev.',
        kabuller: <String>['This is the biggest house.']),
      SerbestGorev(kod: 'SU-2', altKonu: kUzun, turkce: 'Bu en onemli ders.',
        kabuller: <String>['This is the most important lesson.']),
      SerbestGorev(kod: 'SU-3', altKonu: kGrup,
        turkce: 'Istanbul Turkiye\u2019nin en buyuk sehri.',
        kabuller: <String>['Istanbul is the biggest city in Turkey.']),
      SerbestGorev(kod: 'SU-4', altKonu: kDuzensiz, turkce: 'Bu en iyi kitap.',
        kabuller: <String>['This is the best book.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kKisa,
        soru: 'That is the ___ building. (tall)', kabuller: <String>['tallest']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kUzun,
        soru: 'She is the ___ driver. (careful)',
        kabuller: <String>['most careful']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kThe,
        soru: 'It was the ___ day. (hot)', kabuller: <String>['hottest']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.boslukDoldurma, altKonu: kDuzensiz,
        soru: 'He has the ___ money. (much)', kabuller: <String>['most']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.coktanSecmeli, altKonu: kThe,
        soru: 'Hangisi dogru?',
        secenekler: <String>['She is best student.', 'She is the best student.', 'She is most best student.'],
        kabuller: <String>['She is the best student.']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kUzun,
        soru: '"the importantest" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kGrup,
        soru: 'Dizin: three / the / He / tallest / of / is / the',
        kabuller: <String>['He is the tallest of the three.',
            'He is the tallest of the three']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kThe,
        soru: 'This is the ___ question. (easy)', kabuller: <String>['easiest']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kThe,
        soru: 'Hangisi dogru?',
        secenekler: <String>['This is biggest house.', 'This is the biggest house.', 'This is a biggest house.'],
        kabuller: <String>['This is the biggest house.']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kUzun,
        soru: 'That is the ___ car.',
        secenekler: <String>['expensivest', 'most expensive', 'more expensive'],
        kabuller: <String>['most expensive']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kDuzensiz,
        soru: 'That was the ___ film.',
        secenekler: <String>['baddest', 'worst', 'most bad'],
        kabuller: <String>['worst']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kIkiKat,
        soru: 'Hangisi dogru?',
        secenekler: <String>['the most easiest', 'the easiest', 'the more easiest'],
        kabuller: <String>['the easiest']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kGrup,
        soru: 'He is the tallest ___ the three.',
        secenekler: <String>['in', 'of', 'from'], kabuller: <String>['of']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kKisa,
        soru: 'He is the ___ in the family. (old)', kabuller: <String>['oldest']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kThe,
        soru: 'This is the ___ room. (large)', kabuller: <String>['largest']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kGrup,
        soru: 'Istanbul is the biggest city ___ Turkey.', kabuller: <String>['in']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kThe,
        soru: '"She is best student." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kIkiKat,
        soru: '"the most biggest house" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kDuzensiz,
        soru: '"the goodest book" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kUzun,
        soru: 'Dizin: lesson / the / This / important / is / most',
        kabuller: <String>['This is the most important lesson.',
            'This is the most important lesson']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kThe,
        soru: 'Ingilizceye cevirin: Bu en kolay soru.',
        kabuller: <String>['This is the easiest question.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kDuzensiz,
        soru: 'Ingilizceye cevirin: Bu en iyi kitap.',
        kabuller: <String>['This is the best book.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kGrup,
        soru: 'Ingilizceye cevirin: Sinifin en iyi ogrencisi.',
        kabuller: <String>['She is the best student in the class.',
            'He is the best student in the class.']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Uzunluk kurali AYNI',
        aciklama: '1 hece -> -est · sessiz+y -> -iest · 2+ hece -> the most.',
        ornek: 'the biggest · the easiest · the most important'),
      OzetMaddesi(baslik: '"the" ZORUNLU',
        aciklama: '"En" dediginizde tek bir sey kastedersiniz; belirlidir.',
        ornek: 'biggest house (X) -> THE biggest house'),
      OzetMaddesi(baslik: 'Yazim degisiklikleri',
        aciklama: '-e -> yalnizca -st · tek hece harf ikilenir · y -> iest.',
        ornek: 'largest · hottest · happiest'),
      OzetMaddesi(baslik: 'Grup: in / of',
        aciklama: 'Yer ve topluluk -> in · sayilabilir grup -> of.',
        ornek: 'the biggest city in Turkey · the tallest of the three'),
      OzetMaddesi(baslik: 'Duzensiz bicimler',
        aciklama: 'Uc bicimi birlikte ogrenin.',
        ornek: 'good · better · the best  ·  bad · worse · the worst'),
      OzetMaddesi(baslik: 'Uc hatayi birlikte kontrol edin',
        aciklama: '"the" var mi? · cift isaret var mi? · uzunluk dogru mu?',
        ornek: 'the most biggest (X) -> the biggest'),
    ],
  );
}
