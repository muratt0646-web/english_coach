/// EN-A2-009 — Karsilastirma: Comparative
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnA2009 {
  const DersEnA2009._();

  static const String kKisa = 'Kisa sifat: -er';
  static const String kUzun = 'Uzun sifat: more';
  static const String kYazim = 'Yazim degisiklikleri';
  static const String kThan = 'than kullanimi';
  static const String kDuzensiz = 'Duzensiz bicimler';
  static const String kIkiKat = 'Cift karsilastirma hatasi';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A2-009',
    baslik: 'Karsilastirma — Comparative',
    seviye: 'A2', konu: 'ISM', tahminiDk: 35,
    onKosullar: <String>['EN-A1-022'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'Turkce karsilastirmayi TEK yolla yapar: "daha" kelimesini '
        'sifatin onune koyar.\n\n'
        '  daha buyuk · daha guzel · daha onemli\n'
        '  Sifat ne kadar uzun olursa olsun kalip degismez.\n\n'
        'Ingilizce ise sifatin UZUNLUGUNA bakar:\n\n'
        '  KISA sifat -> sifata -er eklenir:  big -> bigger\n'
        '  UZUN sifat -> onune more gelir:    important -> more important\n\n'
        'Yani Ingilizcede karsilastirma yaparken once sunu sorarsiniz:\n\n'
        '  "Bu sifat kisa mi, uzun mu?"\n\n'
        'Turkce konusanin en sik hatasi ikisini birlestirmektir:\n'
        '  "more bigger" -> YANLIS. Turkcede "daha" var diye more '
        'eklemek, -er varken gereksizdir.\n\n'
        'Bir de karsilastirilan sey "than" ile baglanir: bigger THAN.',
    kazanimlar: <String>[
      'Sifatin uzunluguna gore -er veya more secebilmek',
      'Yazim degisikliklerini uygulamak',
      '"than" ile karsilastirma cumlesi kurmak',
      'Duzensiz bicimleri tanimak (good -> better)',
      'Cift karsilastirma hatasindan kacinmak',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'U1', baslik: 'Once uzunluga bakin',
        govde: 'Kural hece sayisina dayanir:\n\n'
            '  1 HECE            -> -er\n'
            '     big -> bigger · old -> older · fast -> faster\n\n'
            '  2 hece, -y ile bitiyorsa -> -ier\n'
            '     easy -> easier · happy -> happier · busy -> busier\n\n'
            '  2 hece (digerleri) ve 3+ HECE -> more\n'
            '     careful -> more careful\n'
            '     important -> more important\n'
            '     expensive -> more expensive\n\n'
            'DUSUNME ALISKANLIGI: Sifati duydugunuz anda hecelerini '
            'sayin. Karar kendiliginden gelir.',
        turkceKarsilastirma: 'daha buyuk  ->  bigger    (1 hece)\n'
            'daha onemli ->  more important (3 hece)'),
      AnlatimBlogu(kod: 'U2', baslik: 'Kisa sifatlar: -er',
        govde: 'Tek heceli sifatlara dogrudan -er eklenir:\n\n'
            '  old -> older · small -> smaller · cheap -> cheaper\n'
            '  young -> younger · long -> longer · short -> shorter\n\n'
            'Bu sifatlarla "more" KULLANILMAZ:\n'
            '  more old  -> YANLIS\n'
            '  older     -> DOGRU\n\n'
            'Bu, Turkcedeki "daha"nin dogrudan cevrilemeyecegini gosterir. '
            '"daha eski" -> "more old" degil, "older".',
        turkceKarsilastirma: 'daha ucuz  ->  cheaper (more cheap DEGIL)'),
      AnlatimBlogu(kod: 'U3', baslik: 'Yazim degisiklikleri',
        govde: 'Uc degisiklik vardir ve hepsi tanidik:\n\n'
            '1. -e ile bitiyorsa yalnizca -r:\n'
            '   large -> larger · nice -> nicer · safe -> safer\n\n'
            '2. Tek heceli, tek sesli + tek sessiz: son harf IKILENIR:\n'
            '   big -> bigger · hot -> hotter · thin -> thinner\n\n'
            '3. Sessiz + y: y duser, -ier gelir:\n'
            '   easy -> easier · happy -> happier · heavy -> heavier\n\n'
            'DIKKAT: Bu kurallar -ed ve -ing kurallarinin AYNISIDIR '
            '(A2-002, A2-005). Yeni bir sey ogrenmiyorsunuz.',
        turkceKarsilastirma: 'daha buyuk  ->  bigger\n'
            'daha kolay  ->  easier'),
      AnlatimBlogu(kod: 'U4', baslik: 'than: karsilastirilan sey',
        govde: 'Karsilastirmanin ikinci tarafi "than" ile baglanir:\n\n'
            '  This car is faster THAN that car.\n'
            '  She is younger THAN me.\n'
            '  English is easier THAN Chinese.\n\n'
            'Turkcede karsilastirilan seye "-den/-dan" eki gelir:\n'
            '  Benden genc.  ->  younger than me\n\n'
            'Karsilastirilan taraf belliyse "than" kullanilmayabilir:\n'
            '  This car is faster. (neyden oldugu baglamdan anlasilir)',
        turkceKarsilastirma: 'Benden genc.  ->  She is younger than me.\n'
            'Ek "-den"      ->  ayri kelime "than"'),
      AnlatimBlogu(kod: 'U5', baslik: 'Duzensiz bicimler',
        govde: 'Uc sifat kurala uymaz ve cok sik kullanilir:\n\n'
            '  good -> better   (iyi -> daha iyi)\n'
            '  bad  -> worse    (kotu -> daha kotu)\n'
            '  far  -> further / farther  (uzak -> daha uzak)\n\n'
            'Bunlar "gooder" veya "more good" olmaz.\n\n'
            'Ayrica iki sifat ozeldir:\n'
            '  many/much -> more   (cok -> daha cok)\n'
            '  little    -> less   (az -> daha az)\n\n'
            'Duzensiz fiillerdeki mantik burada da gecerli: en sik '
            'kullanilan kelimeler degisime direnir.',
        turkceKarsilastirma: 'daha iyi  ->  better (more good DEGIL)\n'
            'daha kotu ->  worse'),
      AnlatimBlogu(kod: 'U6', baslik: 'En sik hata: cift karsilastirma',
        govde: 'Turkcede "daha" tek basina yeter. Ingilizcede -er ZATEN '
            '"daha" demektir. Ikisini birlestirmek yanlistir:\n\n'
            '  more bigger      -> YANLIS\n'
            '  more easier      -> YANLIS\n'
            '  more better      -> YANLIS\n\n'
            '  bigger · easier · better  -> DOGRU\n\n'
            'Ters hata da olur: uzun sifata -er eklemek.\n'
            '  importanter  -> YANLIS\n'
            '  more important -> DOGRU\n\n'
            'KURAL: Bir cumlede karsilastirma isareti BIR KEZ bulunur. '
            'Ya -er ya more.',
        turkceKarsilastirma: 'daha buyuk -> bigger\n'
            '"daha" ve "-er" AYNI isi yapar; ikisi birden olmaz.'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['big', 'bigger', 'This house is bigger.'],
        turkce: 'Bu ev daha buyuk.', not: '1 hece -> -er.'),
      AdimliOrnek(adimlar: <String>['important', 'more important', 'This is more important.'],
        turkce: 'Bu daha onemli.', not: '3 hece -> more.'),
      AdimliOrnek(adimlar: <String>['easy', 'easier', 'English is easier than Chinese.'],
        turkce: 'Ingilizce Cinceden daha kolay.', not: 'Sessiz + y -> ier.'),
      AdimliOrnek(adimlar: <String>['good', 'better', 'This book is better.'],
        turkce: 'Bu kitap daha iyi.', not: 'Duzensiz: gooder DEGIL.'),
      AdimliOrnek(adimlar: <String>['She is younger', 'than me', 'She is younger than me.'],
        turkce: 'Benden genc.', not: '"than" ile baglanir.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Bu araba daha hizli.', 'fast -> 1 hece', '-er ekle',
        'This car is faster.'],
        turkce: 'Once hece say.', not: 'more fast YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Bu daha pahali.', 'expensive -> 3 hece', 'more ekle',
        'This is more expensive.'],
        turkce: 'Uzun sifat -> more.', not: 'expensiver YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Bu kitap sundan daha iyi.', 'good -> duzensiz -> better',
        'than that book', 'This book is better than that book.'],
        turkce: 'Duzensiz + than.', not: 'more better YANLIS.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'This house is bigger.', turkce: 'Bu ev daha buyuk.', dogruMu: true, altKonu: kKisa),
      OrnekCumle(ingilizce: 'My brother is older than me.', turkce: 'Abim benden buyuk.', dogruMu: true, altKonu: kKisa),
      OrnekCumle(ingilizce: 'This car is faster.', turkce: 'Bu araba daha hizli.', dogruMu: true, altKonu: kKisa),
      OrnekCumle(ingilizce: 'The book is cheaper than the bag.', turkce: 'Kitap cantadan daha ucuz.', dogruMu: true, altKonu: kKisa),
      OrnekCumle(ingilizce: 'Winter days are shorter.', turkce: 'Kis gunleri daha kisa.', dogruMu: true, altKonu: kKisa),
      OrnekCumle(ingilizce: 'She is younger than her sister.', turkce: 'Kiz kardesinden genc.', dogruMu: true, altKonu: kKisa),
      OrnekCumle(ingilizce: 'This is more important.', turkce: 'Bu daha onemli.', dogruMu: true, altKonu: kUzun),
      OrnekCumle(ingilizce: 'That car is more expensive.', turkce: 'O araba daha pahali.', dogruMu: true, altKonu: kUzun),
      OrnekCumle(ingilizce: 'She is more careful than him.', turkce: 'Ondan daha dikkatli.', dogruMu: true, altKonu: kUzun),
      OrnekCumle(ingilizce: 'This film is more interesting.', turkce: 'Bu film daha ilginc.', dogruMu: true, altKonu: kUzun),
      OrnekCumle(ingilizce: 'The exam was more difficult than last year.', turkce: 'Sinav gecen yildan daha zordu.', dogruMu: true, altKonu: kUzun),
      OrnekCumle(ingilizce: 'This house is larger than that one.', turkce: 'Bu ev sundan daha genis.', dogruMu: true, altKonu: kYazim),
      OrnekCumle(ingilizce: 'Today is hotter than yesterday.', turkce: 'Bugun dunden daha sicak.', dogruMu: true, altKonu: kYazim),
      OrnekCumle(ingilizce: 'English is easier than Chinese.', turkce: 'Ingilizce Cinceden daha kolay.', dogruMu: true, altKonu: kYazim),
      OrnekCumle(ingilizce: 'This bag is heavier than mine.', turkce: 'Bu canta benimkinden daha agir.', dogruMu: true, altKonu: kYazim),
      OrnekCumle(ingilizce: 'She looks happier today.', turkce: 'Bugun daha mutlu gorunuyor.', dogruMu: true, altKonu: kYazim),
      OrnekCumle(ingilizce: 'This street is safer.', turkce: 'Bu sokak daha guvenli.', dogruMu: true, altKonu: kYazim),
      OrnekCumle(ingilizce: 'She is younger than me.', turkce: 'Benden genc.', dogruMu: true, altKonu: kThan),
      OrnekCumle(ingilizce: 'My car is older than yours.', turkce: 'Arabam seninkinden eski.', dogruMu: true, altKonu: kThan),
      OrnekCumle(ingilizce: 'This exam is easier than the last one.', turkce: 'Bu sinav oncekinden kolay.', dogruMu: true, altKonu: kThan),
      OrnekCumle(ingilizce: 'Ankara is colder than Izmir.', turkce: 'Ankara Izmir\u2019den soguk.', dogruMu: true, altKonu: kThan),
      OrnekCumle(ingilizce: 'This book is better.', turkce: 'Bu kitap daha iyi.', dogruMu: true, altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'The weather is worse today.', turkce: 'Hava bugun daha kotu.', dogruMu: true, altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'My house is further than the school.', turkce: 'Evim okuldan daha uzak.', dogruMu: true, altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'I need more time.', turkce: 'Daha fazla zamana ihtiyacim var.', dogruMu: true, altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'He has less money than me.', turkce: 'Benden az parasi var.', dogruMu: true, altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'This is a better idea.', turkce: 'Bu daha iyi bir fikir.', dogruMu: true, altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'This test is easier than that one.', turkce: 'Bu test sundan kolay.', dogruMu: true, altKonu: kIkiKat),
      OrnekCumle(ingilizce: 'My bag is bigger than yours.', turkce: 'Cantam seninkinden buyuk.', dogruMu: true, altKonu: kIkiKat),
      OrnekCumle(ingilizce: 'This job is more difficult.', turkce: 'Bu is daha zor.', dogruMu: true, altKonu: kIkiKat),

      OrnekCumle(ingilizce: 'This house is more bigger.', turkce: 'Bu ev daha buyuk.', dogruMu: false,
        neden: 'Karsilastirma isareti BIR KEZ bulunur. "-er" zaten "daha" '
            'demektir; "more" gereksizdir.', dogruBicim: 'This house is bigger.',
        hataTuru: 'FAZLA_KELIME', altKonu: kIkiKat),
      OrnekCumle(ingilizce: 'English is more easier than Chinese.', turkce: 'Ingilizce Cinceden kolay.', dogruMu: false,
        neden: '"easier" zaten karsilastirmadir.',
        dogruBicim: 'English is easier than Chinese.', hataTuru: 'FAZLA_KELIME', altKonu: kIkiKat),
      OrnekCumle(ingilizce: 'This book is more better.', turkce: 'Bu kitap daha iyi.', dogruMu: false,
        neden: '"better" zaten "daha iyi" demektir.',
        dogruBicim: 'This book is better.', hataTuru: 'FAZLA_KELIME', altKonu: kIkiKat),
      OrnekCumle(ingilizce: 'This is importanter.', turkce: 'Bu daha onemli.', dogruMu: false,
        neden: 'Uzun sifatlara -er eklenmez; "more" kullanilir.',
        dogruBicim: 'This is more important.', hataTuru: 'GRAMER_HATASI', altKonu: kUzun),
      OrnekCumle(ingilizce: 'That car is expensiver.', turkce: 'O araba daha pahali.', dogruMu: false,
        neden: '3 heceli sifat -> more expensive.',
        dogruBicim: 'That car is more expensive.', hataTuru: 'GRAMER_HATASI', altKonu: kUzun),
      OrnekCumle(ingilizce: 'This film is interestinger.', turkce: 'Bu film daha ilginc.', dogruMu: false,
        neden: 'Uzun sifat -> more interesting.',
        dogruBicim: 'This film is more interesting.', hataTuru: 'GRAMER_HATASI', altKonu: kUzun),
      OrnekCumle(ingilizce: 'My brother is more old than me.', turkce: 'Abim benden buyuk.', dogruMu: false,
        neden: 'Tek heceli sifat -er alir; more kullanilmaz.',
        dogruBicim: 'My brother is older than me.', hataTuru: 'GRAMER_HATASI', altKonu: kKisa),
      OrnekCumle(ingilizce: 'The book is more cheap than the bag.', turkce: 'Kitap cantadan ucuz.', dogruMu: false,
        neden: '1 hece -> cheaper.', dogruBicim: 'The book is cheaper than the bag.',
        hataTuru: 'GRAMER_HATASI', altKonu: kKisa),
      OrnekCumle(ingilizce: 'This house is largeer than that one.', turkce: 'Bu ev daha genis.', dogruMu: false,
        neden: 'Sondaki -e varken yalnizca -r eklenir: larger.',
        dogruBicim: 'This house is larger than that one.', hataTuru: 'YAZIM_HATASI', altKonu: kYazim),
      OrnekCumle(ingilizce: 'Today is hoter than yesterday.', turkce: 'Bugun daha sicak.', dogruMu: false,
        neden: 'Tek heceli, tek sesli + tek sessiz: son harf ikilenir.',
        dogruBicim: 'Today is hotter than yesterday.', hataTuru: 'YAZIM_HATASI', altKonu: kYazim),
      OrnekCumle(ingilizce: 'English is easyer than Chinese.', turkce: 'Ingilizce daha kolay.', dogruMu: false,
        neden: 'Sessiz + y: y duser, -ier gelir.',
        dogruBicim: 'English is easier than Chinese.', hataTuru: 'YAZIM_HATASI', altKonu: kYazim),
      OrnekCumle(ingilizce: 'This bag is heavyer than mine.', turkce: 'Bu canta daha agir.', dogruMu: false,
        neden: 'Sessiz + y -> ier: heavier.', dogruBicim: 'This bag is heavier than mine.',
        hataTuru: 'YAZIM_HATASI', altKonu: kYazim),
      OrnekCumle(ingilizce: 'She is younger from me.', turkce: 'Benden genc.', dogruMu: false,
        neden: 'Karsilastirmada "from" degil "than" kullanilir.',
        dogruBicim: 'She is younger than me.', hataTuru: 'KELIME_SECIMI', altKonu: kThan),
      OrnekCumle(ingilizce: 'My car is older that yours.', turkce: 'Arabam seninkinden eski.', dogruMu: false,
        neden: '"that" degil "than" olmali.', dogruBicim: 'My car is older than yours.',
        hataTuru: 'YAZIM_HATASI', altKonu: kThan),
      OrnekCumle(ingilizce: 'Ankara is colder of Izmir.', turkce: 'Ankara Izmir\u2019den soguk.', dogruMu: false,
        neden: 'Karsilastirmada "of" kullanilmaz.', dogruBicim: 'Ankara is colder than Izmir.',
        hataTuru: 'KELIME_SECIMI', altKonu: kThan),
      OrnekCumle(ingilizce: 'This book is gooder.', turkce: 'Bu kitap daha iyi.', dogruMu: false,
        neden: '"good" duzensizdir: better.', dogruBicim: 'This book is better.',
        hataTuru: 'YAZIM_HATASI', altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'The weather is badder today.', turkce: 'Hava daha kotu.', dogruMu: false,
        neden: '"bad" duzensizdir: worse.', dogruBicim: 'The weather is worse today.',
        hataTuru: 'YAZIM_HATASI', altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'I need more many time.', turkce: 'Daha fazla zamana ihtiyacim var.', dogruMu: false,
        neden: '"many" karsilastirmasi zaten "more"dur.',
        dogruBicim: 'I need more time.', hataTuru: 'FAZLA_KELIME', altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'He has littler money than me.', turkce: 'Benden az parasi var.', dogruMu: false,
        neden: '"little" karsilastirmasi "less"tir.',
        dogruBicim: 'He has less money than me.', hataTuru: 'YAZIM_HATASI', altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'This is a more better idea.', turkce: 'Bu daha iyi bir fikir.', dogruMu: false,
        neden: 'Cift karsilastirma. "better" yeterlidir.',
        dogruBicim: 'This is a better idea.', hataTuru: 'FAZLA_KELIME', altKonu: kIkiKat),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kKisa,
        soru: '"big" sifatinin karsilastirma bicimi?',
        secenekler: <String>['more big', 'bigger', 'more bigger'],
        kabuller: <String>['bigger'], geriDonusKodu: 'U2'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kUzun,
        soru: '"important" sifatinin karsilastirma bicimi?',
        secenekler: <String>['importanter', 'more important', 'more importanter'],
        kabuller: <String>['more important'], geriDonusKodu: 'U1'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kYazim,
        soru: '"easy" sifatinin karsilastirma bicimi?',
        secenekler: <String>['easyer', 'easier', 'more easy'],
        kabuller: <String>['easier'], geriDonusKodu: 'U3'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kDuzensiz,
        soru: '"good" sifatinin karsilastirma bicimi?',
        secenekler: <String>['gooder', 'better', 'more good'],
        kabuller: <String>['better'], geriDonusKodu: 'U5'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kThan,
        soru: 'She is younger ___ me.',
        secenekler: <String>['from', 'than', 'that'],
        kabuller: <String>['than'], geriDonusKodu: 'U4'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kKisa,
        soru: 'This car is ___ than that one. (fast)', kabuller: <String>['faster']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kUzun,
        soru: 'This film is ___ . (interesting)',
        kabuller: <String>['more interesting']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kYazim,
        soru: 'Today is ___ than yesterday. (hot)', kabuller: <String>['hotter']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kYazim,
        soru: 'This bag is ___ than mine. (heavy)', kabuller: <String>['heavier']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kDuzensiz,
        soru: 'The weather is ___ today. (bad)', kabuller: <String>['worse']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kUzun,
        soru: '"expensive" sifatinin karsilastirmasi?',
        secenekler: <String>['expensiver', 'more expensive', 'more expensiver'],
        kabuller: <String>['more expensive']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kDuzensiz,
        soru: '"bad" sifatinin karsilastirmasi?',
        secenekler: <String>['badder', 'worse', 'more bad'],
        kabuller: <String>['worse']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kThan,
        soru: 'Dizin: me / She / than / younger / is',
        kabuller: <String>['She is younger than me.', 'She is younger than me']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kUzun,
        soru: 'Dizin: important / This / more / is',
        kabuller: <String>['This is more important.', 'This is more important']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kIkiKat,
        soru: '"This house is more bigger." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kKisa, turkce: 'Bu ev daha buyuk.',
        kabuller: <String>['This house is bigger.']),
      SerbestGorev(kod: 'SU-2', altKonu: kUzun, turkce: 'Bu daha onemli.',
        kabuller: <String>['This is more important.']),
      SerbestGorev(kod: 'SU-3', altKonu: kThan, turkce: 'Benden genc.',
        kabuller: <String>['She is younger than me.', 'He is younger than me.']),
      SerbestGorev(kod: 'SU-4', altKonu: kDuzensiz, turkce: 'Bu kitap daha iyi.',
        kabuller: <String>['This book is better.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kKisa,
        soru: 'Winter days are ___. (short)', kabuller: <String>['shorter']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kUzun,
        soru: 'She is ___ than him. (careful)',
        kabuller: <String>['more careful']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kYazim,
        soru: 'This street is ___. (safe)', kabuller: <String>['safer']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.boslukDoldurma, altKonu: kDuzensiz,
        soru: 'He has ___ money than me. (little)', kabuller: <String>['less']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.coktanSecmeli, altKonu: kIkiKat,
        soru: 'Hangisi dogru?',
        secenekler: <String>['more easier', 'easier', 'more easy'],
        kabuller: <String>['easier']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kThan,
        soru: '"She is younger from me." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kKisa,
        soru: 'Dizin: than / bag / cheaper / the / The book / is',
        kabuller: <String>['The book is cheaper than the bag.',
            'The book is cheaper than the bag']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kDuzensiz,
        soru: 'I need ___ time. (much)', kabuller: <String>['more']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kKisa,
        soru: 'My brother is ___ than me.',
        secenekler: <String>['more old', 'older', 'more older'],
        kabuller: <String>['older']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kUzun,
        soru: 'That car is ___.',
        secenekler: <String>['expensiver', 'more expensive', 'more expensiver'],
        kabuller: <String>['more expensive']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kYazim,
        soru: 'This house is ___ than that one.',
        secenekler: <String>['largeer', 'larger', 'more large'],
        kabuller: <String>['larger']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kDuzensiz,
        soru: 'The weather is ___ today.',
        secenekler: <String>['badder', 'worse', 'more bad'],
        kabuller: <String>['worse']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kThan,
        soru: 'Ankara is colder ___ Izmir.',
        secenekler: <String>['from', 'than', 'of'], kabuller: <String>['than']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kKisa,
        soru: 'She is ___ than her sister. (young)', kabuller: <String>['younger']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kYazim,
        soru: 'She looks ___ today. (happy)', kabuller: <String>['happier']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kUzun,
        soru: 'The exam was ___ than last year. (difficult)',
        kabuller: <String>['more difficult']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kIkiKat,
        soru: '"This book is more better." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kUzun,
        soru: '"This is importanter." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kDuzensiz,
        soru: '"This book is gooder." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kThan,
        soru: 'Dizin: Chinese / easier / English / than / is',
        kabuller: <String>['English is easier than Chinese.',
            'English is easier than Chinese']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kKisa,
        soru: 'Ingilizceye cevirin: Bu araba daha hizli.',
        kabuller: <String>['This car is faster.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kUzun,
        soru: 'Ingilizceye cevirin: Bu film daha ilginc.',
        kabuller: <String>['This film is more interesting.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kDuzensiz,
        soru: 'Ingilizceye cevirin: Hava bugun daha kotu.',
        kabuller: <String>['The weather is worse today.']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Once hece sayin',
        aciklama: '1 hece -> -er · sessiz+y -> -ier · 2+ hece -> more.',
        ornek: 'bigger · easier · more important'),
      OzetMaddesi(baslik: 'Yazim degisiklikleri',
        aciklama: '-e -> yalnizca -r · tek hece son harf ikilenir · y -> ier.',
        ornek: 'larger · hotter · happier'),
      OzetMaddesi(baslik: 'than ile baglanir',
        aciklama: 'Turkcedeki "-den" ekinin karsiligi. from/that/of DEGIL.',
        ornek: 'She is younger than me.'),
      OzetMaddesi(baslik: 'Duzensiz bicimler',
        aciklama: 'good -> better · bad -> worse · far -> further · little -> less',
        ornek: 'This book is better. (gooder DEGIL)'),
      OzetMaddesi(baslik: 'EN SIK HATA: cift karsilastirma',
        aciklama: 'Karsilastirma isareti BIR KEZ bulunur. Ya -er ya more.',
        ornek: 'more bigger (X) -> bigger'),
      OzetMaddesi(baslik: 'Ters hata',
        aciklama: 'Uzun sifata -er eklemek de yanlistir.',
        ornek: 'importanter (X) -> more important'),
    ],
  );
}
