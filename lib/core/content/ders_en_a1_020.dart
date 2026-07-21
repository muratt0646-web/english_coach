/// EN-A1-020 — Cogul Isimler
/// SADECE VERI.
library;

import '../model/ders_sablonu.dart';

class DersEnA1020 {
  const DersEnA1020._();

  static const String kDuzenli = 'Duzenli cogul (-s)';
  static const String kEs = '-es kurali';
  static const String kY = 'y -> ies';
  static const String kDuzensiz = 'Duzensiz cogullar';
  static const String kSayilamaz = 'Sayilamayan isimler';
  static const String kUyum = 'Cogul - fiil uyumu';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A1-020',
    baslik: 'Cogul Isimler',
    seviye: 'A1', konu: 'ISM', tahminiDk: 35,
    onKosullar: <String>['EN-A1-019'],
    girisMetni:
        'Turkcede cogul eki "-ler / -lar" tek bir kurala uyar ve sayi '
        'varsa DUSER: "bes kitap" deriz, "bes kitaplar" demeyiz.\n\n'
        'Ingilizcede tam tersi: sayi varsa cogul eki ZORUNLUDUR. '
        '"five book" degil "five bookS".\n\n'
        'Ayrica ekin bicimi kelimenin son harfine gore degisir ve bir avuc '
        'kelime hic kurala uymaz: man -> men, child -> children.\n\n'
        'Bu ders hangi ekin NEDEN geldigini gosterir; liste ezberletmez.',
    kazanimlar: <String>[
      'Duzenli cogul ekini dogru secebilmek (-s / -es / -ies)',
      'Sik kullanilan duzensiz cogullari tanimak',
      'Sayi varken cogul ekini unutmamak',
      'Sayilamayan isimleri ayirt edebilmek',
      'Cogul ozneyle fiili uyumlu kullanabilmek',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'F1', baslik: 'Sayi varsa ek DUSMEZ',
        govde: 'Turkcede sayi cogulu zaten belirtir, bu yuzden ek duser:\n'
            '  bir kitap · bes kitap · on kitap\n\n'
            'Ingilizcede sayi olsa da olmasa da cogul eki gerekir:\n'
            '  one book · five bookS · ten bookS\n\n'
            'Bu, Turkce konusanlarin en sik yaptigi cogul hatasidir.',
        turkceKarsilastirma: 'Bes kitap  ->  five books\n'
            'Ek DUSER    ->  ek KALIR'),
      AnlatimBlogu(kod: 'F2', baslik: 'Temel kural: -s',
        govde: 'Cogu isim yalnizca "-s" alir:\n\n'
            'book -> books · car -> cars · friend -> friends\n'
            'teacher -> teachers · window -> windows\n\n'
            'Telaffuz degisebilir ama yazim aynidir.',
        turkceKarsilastirma: 'kitaplar  ->  books\n'
            'arkadaslar ->  friends'),
      AnlatimBlogu(kod: 'F3', baslik: '-es ne zaman gelir?',
        govde: 'Kelime su harflerle bitiyorsa "-es" eklenir:\n\n'
            '-s, -ss, -sh, -ch, -x, -o\n\n'
            'bus -> buses · glass -> glasses · dish -> dishes\n'
            'watch -> watches · box -> boxes · tomato -> tomatoes\n\n'
            'Sebep telaffuzdur: "buss" soylenemez, "busiz" soylenir.\n'
            'Bu, fiillerdeki 3. tekil -es kuralinin AYNISIDIR.',
        turkceKarsilastirma: 'otobusler ->  buses\n'
            'kutular   ->  boxes'),
      AnlatimBlogu(kod: 'F4', baslik: 'y ile bitenler',
        govde: 'SESSIZ harf + y ise: y duser, "-ies" gelir.\n\n'
            'city -> cities · country -> countries · baby -> babies\n\n'
            'SESLI harf + y ise degismez, yalnizca -s:\n\n'
            'boy -> boys · day -> days · key -> keys\n\n'
            'Fiillerdeki study -> studies kurali ile ayni mantik.',
        turkceKarsilastirma: 'sehirler ->  cities\n'
            'gunler   ->  days'),
      AnlatimBlogu(kod: 'F5', baslik: 'Kurala uymayanlar',
        govde: 'Bir avuc kelime hic ek almaz, sekil degistirir. Bunlar '
            'gunluk dilde cok sik gecer:\n\n'
            'man -> men · woman -> women · child -> children\n'
            'person -> people · foot -> feet · tooth -> teeth\n'
            'mouse -> mice\n\n'
            'Bazilari hic degismez: fish -> fish · sheep -> sheep\n\n'
            'Bunlar ezberlenir; kural yoktur. Ama sayilari azdir.',
        turkceKarsilastirma: 'cocuklar ->  children (childs DEGIL)\n'
            'insanlar ->  people'),
      AnlatimBlogu(kod: 'F6', baslik: 'Sayilamayan isimler',
        govde: 'Bazi isimler parcalara ayrilmadigi icin cogul yapilmaz:\n\n'
            'water · bread · money · music · rice · information\n\n'
            'Bunlar "a" da almaz, "-s" de almaz. Miktar belirtmek icin '
            'kap veya olcu kullanilir:\n\n'
            'a glass of water · two pieces of bread\n\n'
            'Cogul ozne gibi degil, TEKIL gibi davranirlar: '
            'The water is cold.',
        turkceKarsilastirma: 'Su icerim.  ->  I drink water.\n'
            'Iki ekmek   ->  two pieces of bread'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['book', 'books', 'I have three books.'],
        turkce: 'Uc kitabim var.', not: 'Sayi varken ek DUSMEZ.'),
      AdimliOrnek(adimlar: <String>['box', 'boxes', 'There are two boxes.'],
        turkce: 'Iki kutu var.', not: '-x ile bitiyor -> -es.'),
      AdimliOrnek(adimlar: <String>['city', 'cities', 'I visited three cities.'],
        turkce: 'Uc sehir gezdim.', not: 'Sessiz + y -> ies.'),
      AdimliOrnek(adimlar: <String>['child', 'children', 'The children are happy.'],
        turkce: 'Cocuklar mutlu.', not: 'Duzensiz: childs DEGIL.'),
      AdimliOrnek(adimlar: <String>['water', 'water', 'I drink water.'],
        turkce: 'Su icerim.', not: 'Sayilamaz -> cogul YOK.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Bes kitabim var.', 'kitap = book', 'bes -> cogul ZORUNLU',
        'I have five books.'],
        turkce: 'Turkcede ek duser, Ingilizcede kalir.',
        not: 'five book YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Iki kadin geldi.', 'kadin = woman', 'duzensiz -> women',
        'Two women came.'],
        turkce: 'Duzensiz cogul.', not: 'womans DEGIL.'),
      AdimliOrnek(adimlar: <String>[
        'Kitaplar masada.', 'The books', 'cogul -> are',
        'The books are on the table.'],
        turkce: 'Cogul ozne "are" alir.', not: 'is DEGIL.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I have three books.', turkce: 'Uc kitabim var.', dogruMu: true, altKonu: kDuzenli),
      OrnekCumle(ingilizce: 'She has two cars.', turkce: 'Iki arabasi var.', dogruMu: true, altKonu: kDuzenli),
      OrnekCumle(ingilizce: 'They are my friends.', turkce: 'Onlar arkadaslarim.', dogruMu: true, altKonu: kDuzenli),
      OrnekCumle(ingilizce: 'The teachers are here.', turkce: 'Ogretmenler burada.', dogruMu: true, altKonu: kDuzenli),
      OrnekCumle(ingilizce: 'I open the windows.', turkce: 'Pencereleri acarim.', dogruMu: true, altKonu: kDuzenli),
      OrnekCumle(ingilizce: 'We need five pens.', turkce: 'Bes kaleme ihtiyacimiz var.', dogruMu: true, altKonu: kDuzenli),
      OrnekCumle(ingilizce: 'There are two boxes.', turkce: 'Iki kutu var.', dogruMu: true, altKonu: kEs),
      OrnekCumle(ingilizce: 'The buses are late.', turkce: 'Otobusler gec kaldi.', dogruMu: true, altKonu: kEs),
      OrnekCumle(ingilizce: 'I wash the dishes.', turkce: 'Bulasiklari yikarim.', dogruMu: true, altKonu: kEs),
      OrnekCumle(ingilizce: 'She has two watches.', turkce: 'Iki saati var.', dogruMu: true, altKonu: kEs),
      OrnekCumle(ingilizce: 'We buy tomatoes.', turkce: 'Domates aliriz.', dogruMu: true, altKonu: kEs),
      OrnekCumle(ingilizce: 'The glasses are clean.', turkce: 'Bardaklar temiz.', dogruMu: true, altKonu: kEs),
      OrnekCumle(ingilizce: 'I visited three cities.', turkce: 'Uc sehir gezdim.', dogruMu: true, altKonu: kY),
      OrnekCumle(ingilizce: 'We study two countries.', turkce: 'Iki ulke calisiriz.', dogruMu: true, altKonu: kY),
      OrnekCumle(ingilizce: 'The babies are sleeping.', turkce: 'Bebekler uyuyor.', dogruMu: true, altKonu: kY),
      OrnekCumle(ingilizce: 'The boys play football.', turkce: 'Cocuklar futbol oynar.', dogruMu: true, altKonu: kY),
      OrnekCumle(ingilizce: 'Two days are enough.', turkce: 'Iki gun yeter.', dogruMu: true, altKonu: kY),
      OrnekCumle(ingilizce: 'I lost my keys.', turkce: 'Anahtarlarimi kaybettim.', dogruMu: true, altKonu: kY),
      OrnekCumle(ingilizce: 'The children are happy.', turkce: 'Cocuklar mutlu.', dogruMu: true, altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'Two women came.', turkce: 'Iki kadin geldi.', dogruMu: true, altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'Three men are waiting.', turkce: 'Uc adam bekliyor.', dogruMu: true, altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'Many people live here.', turkce: 'Burada cok insan yasar.', dogruMu: true, altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'My feet are cold.', turkce: 'Ayaklarim usudu.', dogruMu: true, altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'I have two fish.', turkce: 'Iki balgim var.', dogruMu: true, altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'I drink water.', turkce: 'Su icerim.', dogruMu: true, altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'We eat bread every day.', turkce: 'Her gun ekmek yeriz.', dogruMu: true, altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'I need money.', turkce: 'Paraya ihtiyacim var.', dogruMu: true, altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'She likes music.', turkce: 'Muzik sever.', dogruMu: true, altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'The books are on the table.', turkce: 'Kitaplar masada.', dogruMu: true, altKonu: kUyum),
      OrnekCumle(ingilizce: 'The water is cold.', turkce: 'Su soguk.', dogruMu: true, altKonu: kUyum),

      OrnekCumle(ingilizce: 'I have three book.', turkce: 'Uc kitabim var.', dogruMu: false,
        neden: 'Turkcede sayi varsa ek duser ("uc kitap"), Ingilizcede '
            'DUSMEZ. Sayi ne olursa olsun cogul eki gerekir.',
        dogruBicim: 'I have three books.', hataTuru: 'GRAMER_HATASI', altKonu: kDuzenli),
      OrnekCumle(ingilizce: 'She has two car.', turkce: 'Iki arabasi var.', dogruMu: false,
        neden: 'Sayi cogul eki yerine GECMEZ.', dogruBicim: 'She has two cars.',
        hataTuru: 'GRAMER_HATASI', altKonu: kDuzenli),
      OrnekCumle(ingilizce: 'We need five pen.', turkce: 'Bes kaleme ihtiyacimiz var.', dogruMu: false,
        neden: 'Cogul eki zorunludur.', dogruBicim: 'We need five pens.',
        hataTuru: 'GRAMER_HATASI', altKonu: kDuzenli),
      OrnekCumle(ingilizce: 'There are two boxs.', turkce: 'Iki kutu var.', dogruMu: false,
        neden: '-x ile biten kelimeler "-es" alir.', dogruBicim: 'There are two boxes.',
        hataTuru: 'YAZIM_HATASI', altKonu: kEs),
      OrnekCumle(ingilizce: 'The buss are late.', turkce: 'Otobusler gec kaldi.', dogruMu: false,
        neden: '-s ile biten kelimeler "-es" alir: buses.',
        dogruBicim: 'The buses are late.', hataTuru: 'YAZIM_HATASI', altKonu: kEs),
      OrnekCumle(ingilizce: 'I wash the dishs.', turkce: 'Bulasiklari yikarim.', dogruMu: false,
        neden: '-sh ile bitiyor -> dishes.', dogruBicim: 'I wash the dishes.',
        hataTuru: 'YAZIM_HATASI', altKonu: kEs),
      OrnekCumle(ingilizce: 'She has two watchs.', turkce: 'Iki saati var.', dogruMu: false,
        neden: '-ch ile bitiyor -> watches.', dogruBicim: 'She has two watches.',
        hataTuru: 'YAZIM_HATASI', altKonu: kEs),
      OrnekCumle(ingilizce: 'We buy tomatos.', turkce: 'Domates aliriz.', dogruMu: false,
        neden: '-o ile biten bu kelime "-es" alir: tomatoes.',
        dogruBicim: 'We buy tomatoes.', hataTuru: 'YAZIM_HATASI', altKonu: kEs),
      OrnekCumle(ingilizce: 'I visited three citys.', turkce: 'Uc sehir gezdim.', dogruMu: false,
        neden: 'Sessiz harf + y: y duser, -ies gelir.',
        dogruBicim: 'I visited three cities.', hataTuru: 'YAZIM_HATASI', altKonu: kY),
      OrnekCumle(ingilizce: 'The babys are sleeping.', turkce: 'Bebekler uyuyor.', dogruMu: false,
        neden: 'Sessiz + y -> ies: babies.', dogruBicim: 'The babies are sleeping.',
        hataTuru: 'YAZIM_HATASI', altKonu: kY),
      OrnekCumle(ingilizce: 'The boies play football.', turkce: 'Cocuklar futbol oynar.', dogruMu: false,
        neden: 'SESLI harf + y ise -ies OLMAZ; yalnizca -s eklenir: boys.',
        dogruBicim: 'The boys play football.', hataTuru: 'YAZIM_HATASI', altKonu: kY),
      OrnekCumle(ingilizce: 'I lost my keies.', turkce: 'Anahtarlarimi kaybettim.', dogruMu: false,
        neden: 'Sesli + y -> keys.', dogruBicim: 'I lost my keys.',
        hataTuru: 'YAZIM_HATASI', altKonu: kY),
      OrnekCumle(ingilizce: 'The childs are happy.', turkce: 'Cocuklar mutlu.', dogruMu: false,
        neden: '"child" duzensizdir: children. "childs" diye bir kelime yoktur.',
        dogruBicim: 'The children are happy.', hataTuru: 'YAZIM_HATASI', altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'Two womans came.', turkce: 'Iki kadin geldi.', dogruMu: false,
        neden: '"woman" duzensizdir: women.', dogruBicim: 'Two women came.',
        hataTuru: 'YAZIM_HATASI', altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'Three mans are waiting.', turkce: 'Uc adam bekliyor.', dogruMu: false,
        neden: '"man" duzensizdir: men.', dogruBicim: 'Three men are waiting.',
        hataTuru: 'YAZIM_HATASI', altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'Many persons live here.', turkce: 'Burada cok insan yasar.', dogruMu: false,
        neden: 'Gunluk dilde "person" cogulu "people" olarak kullanilir.',
        dogruBicim: 'Many people live here.', hataTuru: 'KELIME_SECIMI', altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'My foots are cold.', turkce: 'Ayaklarim usudu.', dogruMu: false,
        neden: '"foot" duzensizdir: feet.', dogruBicim: 'My feet are cold.',
        hataTuru: 'YAZIM_HATASI', altKonu: kDuzensiz),
      OrnekCumle(ingilizce: 'I drink waters.', turkce: 'Su icerim.', dogruMu: false,
        neden: '"water" sayilamaz; cogul yapilmaz.', dogruBicim: 'I drink water.',
        hataTuru: 'GRAMER_HATASI', altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'I need moneys.', turkce: 'Paraya ihtiyacim var.', dogruMu: false,
        neden: '"money" sayilamaz.', dogruBicim: 'I need money.',
        hataTuru: 'GRAMER_HATASI', altKonu: kSayilamaz),
      OrnekCumle(ingilizce: 'The books is on the table.', turkce: 'Kitaplar masada.', dogruMu: false,
        neden: 'Cogul ozne "are" alir.', dogruBicim: 'The books are on the table.',
        hataTuru: 'GRAMER_HATASI', altKonu: kUyum),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kDuzenli,
        soru: 'I have three ___.', secenekler: <String>['book', 'books', 'bookes'],
        kabuller: <String>['books'], geriDonusKodu: 'F1',
        aciklama: 'Sayi varken ek dusmez.'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kEs,
        soru: 'There are two ___.', secenekler: <String>['boxs', 'boxes', 'box'],
        kabuller: <String>['boxes'], geriDonusKodu: 'F3', aciklama: '-x -> -es.'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kY,
        soru: 'I visited three ___.', secenekler: <String>['citys', 'cities', 'cityes'],
        kabuller: <String>['cities'], geriDonusKodu: 'F4', aciklama: 'Sessiz + y -> ies.'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kDuzensiz,
        soru: 'The ___ are happy.', secenekler: <String>['childs', 'children', 'childrens'],
        kabuller: <String>['children'], geriDonusKodu: 'F5', aciklama: 'Duzensiz.'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kSayilamaz,
        soru: 'I drink ___.', secenekler: <String>['waters', 'water', 'a waters'],
        kabuller: <String>['water'], geriDonusKodu: 'F6', aciklama: 'Sayilamaz.'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kDuzenli,
        soru: 'She has two ___. (car)', kabuller: <String>['cars']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kEs,
        soru: 'I wash the ___. (dish)', kabuller: <String>['dishes']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kY,
        soru: 'The ___ are sleeping. (baby)', kabuller: <String>['babies']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kY,
        soru: 'The ___ play football. (boy)', kabuller: <String>['boys']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kDuzensiz,
        soru: 'Two ___ came. (woman)', kabuller: <String>['women']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kEs,
        soru: '"watch" kelimesinin cogulu?',
        secenekler: <String>['watchs', 'watches', 'watchies'],
        kabuller: <String>['watches']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kDuzensiz,
        soru: '"foot" kelimesinin cogulu?',
        secenekler: <String>['foots', 'feet', 'footes'], kabuller: <String>['feet']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kUyum,
        soru: 'Dizin: are / The / table / books / on / the',
        kabuller: <String>['The books are on the table.', 'The books are on the table']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kDuzensiz,
        soru: 'Dizin: happy / children / The / are',
        kabuller: <String>['The children are happy.', 'The children are happy']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kDuzenli,
        soru: '"I have three book." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kDuzenli, turkce: 'Bes kitabim var.',
        kabuller: <String>['I have five books.']),
      SerbestGorev(kod: 'SU-2', altKonu: kDuzensiz, turkce: 'Cocuklar mutlu.',
        kabuller: <String>['The children are happy.', 'Children are happy.']),
      SerbestGorev(kod: 'SU-3', altKonu: kEs, turkce: 'Iki kutu var.',
        kabuller: <String>['There are two boxes.']),
      SerbestGorev(kod: 'SU-4', altKonu: kSayilamaz, turkce: 'Paraya ihtiyacim var.',
        kabuller: <String>['I need money.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kDuzenli,
        soru: 'I open the ___. (window)', kabuller: <String>['windows']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kEs,
        soru: 'We buy ___. (tomato)', kabuller: <String>['tomatoes']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kY,
        soru: 'We study two ___. (country)', kabuller: <String>['countries']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.boslukDoldurma, altKonu: kDuzensiz,
        soru: 'Many ___ live here. (person)', kabuller: <String>['people']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.coktanSecmeli, altKonu: kUyum,
        soru: 'Hangisi dogru?',
        secenekler: <String>['The books is here.', 'The books are here.', 'The books be here.'],
        kabuller: <String>['The books are here.']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kSayilamaz,
        soru: '"I drink waters." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kDuzenli,
        soru: 'Dizin: friends / They / my / are',
        kabuller: <String>['They are my friends.', 'They are my friends']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kEs,
        soru: 'The ___ are late. (bus)', kabuller: <String>['buses']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kDuzenli,
        soru: 'We need five ___.', secenekler: <String>['pen', 'pens', 'penes'],
        kabuller: <String>['pens']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kEs,
        soru: 'The ___ are clean.', secenekler: <String>['glasss', 'glasses', 'glass'],
        kabuller: <String>['glasses']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kY,
        soru: 'Two ___ are enough.', secenekler: <String>['daies', 'days', 'dayes'],
        kabuller: <String>['days']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kDuzensiz,
        soru: 'Three ___ are waiting.', secenekler: <String>['mans', 'men', 'mens'],
        kabuller: <String>['men']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kSayilamaz,
        soru: 'She likes ___.', secenekler: <String>['musics', 'music', 'a music'],
        kabuller: <String>['music']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kDuzenli,
        soru: 'The ___ are here. (teacher)', kabuller: <String>['teachers']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kY,
        soru: 'I lost my ___. (key)', kabuller: <String>['keys']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kDuzensiz,
        soru: 'My ___ are cold. (foot)', kabuller: <String>['feet']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kDuzenli,
        soru: '"She has two car." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kDuzensiz,
        soru: '"The childs are happy." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kUyum,
        soru: '"The books is on the table." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kEs,
        soru: 'Dizin: boxes / are / There / two',
        kabuller: <String>['There are two boxes.', 'There are two boxes']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kDuzenli,
        soru: 'Ingilizceye cevirin: Uc kitabim var.',
        kabuller: <String>['I have three books.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kDuzensiz,
        soru: 'Ingilizceye cevirin: Iki kadin geldi.',
        kabuller: <String>['Two women came.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kSayilamaz,
        soru: 'Ingilizceye cevirin: Su icerim.',
        kabuller: <String>['I drink water.']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Sayi varsa ek DUSMEZ',
        aciklama: 'Turkcede "bes kitap", Ingilizcede "five books".',
        ornek: 'five books · ten cars'),
      OzetMaddesi(baslik: 'Temel kural: -s',
        aciklama: 'Cogu isim yalnizca -s alir.',
        ornek: 'book -> books · friend -> friends'),
      OzetMaddesi(baslik: '-es kurali',
        aciklama: '-s, -ss, -sh, -ch, -x, -o ile bitenler -es alir.',
        ornek: 'box -> boxes · dish -> dishes · tomato -> tomatoes'),
      OzetMaddesi(baslik: 'y kurali',
        aciklama: 'Sessiz + y -> ies. Sesli + y -> yalnizca -s.',
        ornek: 'city -> cities · boy -> boys'),
      OzetMaddesi(baslik: 'Duzensiz cogullar',
        aciklama: 'Ezberlenir ama sayilari azdir.',
        ornek: 'man -> men · child -> children · person -> people'),
      OzetMaddesi(baslik: 'Sayilamayan isimler',
        aciklama: 'Cogul yapilmaz, a/an almaz, tekil gibi davranir.',
        ornek: 'water · bread · money · The water is cold.'),
    ],
  );
}
