/// EN-A1-030 — Yer Edatlari: in / on / at
/// SADECE VERI. Hedef hata kodu: PREP-01.
library;

import '../model/ders_sablonu.dart';

class DersEnA1030 {
  const DersEnA1030._();

  static const String kIn = 'in (icinde)';
  static const String kOn = 'on (uzerinde)';
  static const String kAt = 'at (noktada)';
  static const String kKalip = 'Kaliplasmis kullanim';
  static const String kTekEk = 'Turkce tek ek sorunu';
  static const String kUlasim = 'Ulasim araclari';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A1-030',
    baslik: 'Yer Edatlari — in / on / at',
    seviye: 'A1', konu: 'YAP', tahminiDk: 35,
    onKosullar: <String>['EN-A1-002', 'EN-A1-019'],
    girisMetni:
        'Turkcede yer bildirmek icin TEK bir ek yeter: "-de / -da".\n\n'
        'ev-DE · masa-DA · durak-TA\n\n'
        'Ingilizcede bu tek ek UC ayri kelimeye bolunur ve hangisinin '
        'secilecegi yerin BICIMINE baglidir:\n\n'
        '  in -> kapali bir hacmin ICINDE\n'
        '  on -> bir yuzeyin UZERINDE\n'
        '  at -> bir NOKTADA\n\n'
        'Yani "masada" ile "kutuda" Turkcede ayni eki alir ama Ingilizcede '
        'farklidir: ON the table · IN the box.\n\n'
        'Bu ders liste ezberletmez; secimi tek soruyla yaptirir: '
        'Hacim mi, yuzey mi, nokta mi?',
    kazanimlar: <String>[
      'Yerin bicimine gore in / on / at secebilmek',
      'Turkcedeki tek ekin yaniltmasindan kacinmak',
      'Sik gecen kaliplari tanimak (at home, in bed)',
      'Ulasim araclarinda dogru edati kullanmak',
      'Adres ve sehir belirtirken dogru edati secmek',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'J1', baslik: 'Tek ek, uc kelime',
        govde: 'Turkcede "-de" eki her yerde ayni:\n\n'
            'evde · masada · kutuda · durakta · Ankara\u2019da\n\n'
            'Ingilizcede her biri farkli olabilir:\n\n'
            'at home · on the table · in the box · at the bus stop · '
            'in Ankara\n\n'
            'Bu yuzden ceviri yaparken ek degil, YERIN BICIMI dusunulur.',
        turkceKarsilastirma: 'masada  ->  ON the table\n'
            'kutuda  ->  IN the box\n'
            'Ayni ek  ->  farkli kelime'),
      AnlatimBlogu(kod: 'J2', baslik: 'in — kapali bir hacmin ICINDE',
        govde: 'Etrafi cevrili, icine girilebilen yerler icin:\n\n'
            'in the box · in the room · in the car · in the bag\n'
            'in the garden · in the water\n\n'
            'Buyuk yerler de "in" alir cunku icinde bulunulur:\n\n'
            'in Ankara · in Turkey · in the city\n\n'
            'Sorun sudur: Icinde miyim?',
        turkceKarsilastirma: 'Kutuda   ->  in the box\n'
            'Ankara\u2019da ->  in Ankara'),
      AnlatimBlogu(kod: 'J3', baslik: 'on — bir yuzeyin UZERINDE',
        govde: 'Bir seyin ustune temas ediyorsa:\n\n'
            'on the table · on the wall · on the floor · on the page\n\n'
            'Yuzey yatay olmak zorunda degil: duvardaki resim de "on the '
            'wall"dir.\n\n'
            'Sokak adlari da yuzey sayilir: on Main Street.\n\n'
            'Sorun sudur: Bir yuzeye deger mi?',
        turkceKarsilastirma: 'Masada   ->  on the table\n'
            'Duvarda  ->  on the wall'),
      AnlatimBlogu(kod: 'J4', baslik: 'at — bir NOKTADA',
        govde: 'Yer bir nokta gibi dusunulduginde; icine girmek veya '
            'ustune koymak degil, orada BULUNMAK onemlidir:\n\n'
            'at the bus stop · at the door · at the corner\n'
            'at school · at work · at the party\n\n'
            'Ayni yer farkli edat alabilir ve anlam degisir:\n\n'
            'at school -> ders icin okulda (ogrenci olarak)\n'
            'in school -> binanin icinde\n\n'
            'Sorun sudur: Bir nokta olarak mi dusunuyorum?',
        turkceKarsilastirma: 'Durakta  ->  at the bus stop\n'
            'Okulda   ->  at school'),
      AnlatimBlogu(kod: 'J5', baslik: 'Ezberlenmesi gereken kaliplar',
        govde: 'Bazi ifadeler kurala uymaz; kalip olarak ogrenilir:\n\n'
            'at home (evde)      -> "in the home" denmez\n'
            'at work (iste)\n'
            'in bed (yatakta)    -> "on bed" denmez\n'
            'on the bus / train  -> ama IN the car\n'
            'in the picture · on the phone\n\n'
            'Bunlarin sayisi azdir ama cok sik gecerler.',
        turkceKarsilastirma: 'Evde  ->  at home (in the home DEGIL)\n'
            'Yatakta -> in bed'),
      AnlatimBlogu(kod: 'J6', baslik: 'Ulasim araclari',
        govde: 'Kucuk ve icine girilen araclar "in" alir:\n\n'
            'in the car · in a taxi\n\n'
            'Buyuk ve icinde yurunebilen araclar "on" alir:\n\n'
            'on the bus · on the train · on the plane · on a bike\n\n'
            'Mantik: Buyuk aracin zemininde yururuz, yani bir yuzeyin '
            'uzerindeyiz.',
        turkceKarsilastirma: 'Arabada  ->  in the car\n'
            'Otobuste ->  on the bus'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['the box', 'in the box', 'The pen is in the box.'],
        turkce: 'Kalem kutuda.', not: 'Kapali hacim -> in.'),
      AdimliOrnek(adimlar: <String>['the table', 'on the table', 'The book is on the table.'],
        turkce: 'Kitap masada.', not: 'Yuzey -> on.'),
      AdimliOrnek(adimlar: <String>['the bus stop', 'at the bus stop', 'I am at the bus stop.'],
        turkce: 'Duraktayim.', not: 'Nokta -> at.'),
      AdimliOrnek(adimlar: <String>['home', 'at home', 'She is at home.'],
        turkce: 'O evde.', not: 'Kalip: at home.'),
      AdimliOrnek(adimlar: <String>['the bus', 'on the bus', 'They are on the bus.'],
        turkce: 'Onlar otobuste.', not: 'Buyuk arac -> on.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Kitap masada.', 'Yuzeye mi deger? Evet', 'on', 'The book is on the table.'],
        turkce: 'Tek soru, tek cevap.', not: 'in the table YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Ankara\u2019da yasarim.', 'Icinde miyim? Evet', 'in',
        'I live in Ankara.'],
        turkce: 'Sehirler -> in.', not: 'at Ankara YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Arabada bekliyorum.', 'Kucuk arac -> in', 'in the car',
        'I am waiting in the car.'],
        turkce: 'Araba kucuk -> in.', not: 'on the car = arabanin USTUNDE.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'The pen is in the box.', turkce: 'Kalem kutuda.', dogruMu: true, altKonu: kIn),
      OrnekCumle(ingilizce: 'She is in the room.', turkce: 'O odada.', dogruMu: true, altKonu: kIn),
      OrnekCumle(ingilizce: 'The children are in the garden.', turkce: 'Cocuklar bahcede.', dogruMu: true, altKonu: kIn),
      OrnekCumle(ingilizce: 'I live in Ankara.', turkce: 'Ankara\u2019da yasarim.', dogruMu: true, altKonu: kIn),
      OrnekCumle(ingilizce: 'My keys are in my bag.', turkce: 'Anahtarlarim cantamda.', dogruMu: true, altKonu: kIn),
      OrnekCumle(ingilizce: 'There is water in the glass.', turkce: 'Bardakta su var.', dogruMu: true, altKonu: kIn),
      OrnekCumle(ingilizce: 'He works in a bank.', turkce: 'Bankada calisir.', dogruMu: true, altKonu: kIn),
      OrnekCumle(ingilizce: 'The book is on the table.', turkce: 'Kitap masada.', dogruMu: true, altKonu: kOn),
      OrnekCumle(ingilizce: 'The picture is on the wall.', turkce: 'Resim duvarda.', dogruMu: true, altKonu: kOn),
      OrnekCumle(ingilizce: 'The bag is on the floor.', turkce: 'Canta yerde.', dogruMu: true, altKonu: kOn),
      OrnekCumle(ingilizce: 'Your name is on this page.', turkce: 'Adin bu sayfada.', dogruMu: true, altKonu: kOn),
      OrnekCumle(ingilizce: 'The shop is on Main Street.', turkce: 'Dukkan Main Caddesi\u2019nde.', dogruMu: true, altKonu: kOn),
      OrnekCumle(ingilizce: 'I am at the bus stop.', turkce: 'Duraktayim.', dogruMu: true, altKonu: kAt),
      OrnekCumle(ingilizce: 'She is at the door.', turkce: 'O kapida.', dogruMu: true, altKonu: kAt),
      OrnekCumle(ingilizce: 'They are at school.', turkce: 'Onlar okulda.', dogruMu: true, altKonu: kAt),
      OrnekCumle(ingilizce: 'My father is at work.', turkce: 'Babam iste.', dogruMu: true, altKonu: kAt),
      OrnekCumle(ingilizce: 'We are at the party.', turkce: 'Partideyiz.', dogruMu: true, altKonu: kAt),
      OrnekCumle(ingilizce: 'Wait at the corner.', turkce: 'Kosede bekle.', dogruMu: true, altKonu: kAt),
      OrnekCumle(ingilizce: 'She is at home.', turkce: 'O evde.', dogruMu: true, altKonu: kKalip),
      OrnekCumle(ingilizce: 'I am at home now.', turkce: 'Simdi evdeyim.', dogruMu: true, altKonu: kKalip),
      OrnekCumle(ingilizce: 'The children are in bed.', turkce: 'Cocuklar yatakta.', dogruMu: true, altKonu: kKalip),
      OrnekCumle(ingilizce: 'She is on the phone.', turkce: 'Telefonda.', dogruMu: true, altKonu: kKalip),
      OrnekCumle(ingilizce: 'Who is in this picture?', turkce: 'Bu resimde kim var?', dogruMu: true, altKonu: kKalip),
      OrnekCumle(ingilizce: 'They are on the bus.', turkce: 'Onlar otobuste.', dogruMu: true, altKonu: kUlasim),
      OrnekCumle(ingilizce: 'We are on the train.', turkce: 'Trendeyiz.', dogruMu: true, altKonu: kUlasim),
      OrnekCumle(ingilizce: 'I am waiting in the car.', turkce: 'Arabada bekliyorum.', dogruMu: true, altKonu: kUlasim),
      OrnekCumle(ingilizce: 'She is in a taxi.', turkce: 'Takside.', dogruMu: true, altKonu: kUlasim),
      OrnekCumle(ingilizce: 'He is on a bike.', turkce: 'Bisiklette.', dogruMu: true, altKonu: kUlasim),
      OrnekCumle(ingilizce: 'The cat is on the chair.', turkce: 'Kedi sandalyede.', dogruMu: true, altKonu: kOn),
      OrnekCumle(ingilizce: 'There are books in the bag.', turkce: 'Cantada kitaplar var.', dogruMu: true, altKonu: kIn),

      OrnekCumle(ingilizce: 'The book is in the table.', turkce: 'Kitap masada.', dogruMu: false,
        neden: 'Masa bir YUZEYDIR, hacim degil. Turkcede ikisi de "-da" '
            'eki aldigi icin karistiriliyor.', dogruBicim: 'The book is on the table.',
        hataTuru: 'GRAMER_HATASI', altKonu: kTekEk),
      OrnekCumle(ingilizce: 'The pen is on the box.', turkce: 'Kalem kutuda.', dogruMu: false,
        neden: 'Kutu kapali bir hacimdir. "on the box" kutunun USTUNDE demektir.',
        dogruBicim: 'The pen is in the box.', hataTuru: 'ANLAM_FARKI', altKonu: kTekEk),
      OrnekCumle(ingilizce: 'The picture is in the wall.', turkce: 'Resim duvarda.', dogruMu: false,
        neden: 'Duvar bir yuzeydir. "in the wall" duvarin ICINE gomulu demektir.',
        dogruBicim: 'The picture is on the wall.', hataTuru: 'ANLAM_FARKI', altKonu: kOn),
      OrnekCumle(ingilizce: 'I live at Ankara.', turkce: 'Ankara\u2019da yasarim.', dogruMu: false,
        neden: 'Sehirler icinde bulunulan yerlerdir -> in.',
        dogruBicim: 'I live in Ankara.', hataTuru: 'GRAMER_HATASI', altKonu: kIn),
      OrnekCumle(ingilizce: 'She is on the room.', turkce: 'O odada.', dogruMu: false,
        neden: 'Oda kapali bir hacimdir -> in.', dogruBicim: 'She is in the room.',
        hataTuru: 'GRAMER_HATASI', altKonu: kIn),
      OrnekCumle(ingilizce: 'My keys are on my bag.', turkce: 'Anahtarlarim cantamda.', dogruMu: false,
        neden: 'Canta bir hacimdir. "on my bag" cantanin ustunde demektir.',
        dogruBicim: 'My keys are in my bag.', hataTuru: 'ANLAM_FARKI', altKonu: kIn),
      OrnekCumle(ingilizce: 'The bag is in the floor.', turkce: 'Canta yerde.', dogruMu: false,
        neden: 'Yer bir yuzeydir -> on.', dogruBicim: 'The bag is on the floor.',
        hataTuru: 'GRAMER_HATASI', altKonu: kOn),
      OrnekCumle(ingilizce: 'I am in the bus stop.', turkce: 'Duraktayim.', dogruMu: false,
        neden: 'Durak bir noktadir -> at.', dogruBicim: 'I am at the bus stop.',
        hataTuru: 'GRAMER_HATASI', altKonu: kAt),
      OrnekCumle(ingilizce: 'She is in the door.', turkce: 'O kapida.', dogruMu: false,
        neden: 'Kapi bir noktadir -> at. "in the door" kapinin icinde demektir.',
        dogruBicim: 'She is at the door.', hataTuru: 'ANLAM_FARKI', altKonu: kAt),
      OrnekCumle(ingilizce: 'My father is in work.', turkce: 'Babam iste.', dogruMu: false,
        neden: 'Kaliplasmis ifade: at work.', dogruBicim: 'My father is at work.',
        hataTuru: 'GRAMER_HATASI', altKonu: kKalip),
      OrnekCumle(ingilizce: 'She is in the home.', turkce: 'O evde.', dogruMu: false,
        neden: '"home" kelimesi "at home" kalibinda artikelsiz kullanilir.',
        dogruBicim: 'She is at home.', hataTuru: 'GRAMER_HATASI', altKonu: kKalip),
      OrnekCumle(ingilizce: 'I am at home now, in my house.', turkce: 'Simdi evdeyim.', dogruMu: false,
        neden: 'Iki ifade birlikte gereksiz. Yalnizca "at home" yeterlidir.',
        dogruBicim: 'I am at home now.', hataTuru: 'FAZLA_KELIME', altKonu: kKalip),
      OrnekCumle(ingilizce: 'The children are on bed.', turkce: 'Cocuklar yatakta.', dogruMu: false,
        neden: 'Kaliplasmis ifade: in bed.', dogruBicim: 'The children are in bed.',
        hataTuru: 'GRAMER_HATASI', altKonu: kKalip),
      OrnekCumle(ingilizce: 'She is in the phone.', turkce: 'Telefonda.', dogruMu: false,
        neden: 'Kaliplasmis ifade: on the phone.', dogruBicim: 'She is on the phone.',
        hataTuru: 'GRAMER_HATASI', altKonu: kKalip),
      OrnekCumle(ingilizce: 'They are in the bus.', turkce: 'Onlar otobuste.', dogruMu: false,
        neden: 'Buyuk ulasim araclari "on" alir; icinde yurunur.',
        dogruBicim: 'They are on the bus.', hataTuru: 'GRAMER_HATASI', altKonu: kUlasim),
      OrnekCumle(ingilizce: 'We are in the train.', turkce: 'Trendeyiz.', dogruMu: false,
        neden: 'Tren buyuk bir aractir -> on.', dogruBicim: 'We are on the train.',
        hataTuru: 'GRAMER_HATASI', altKonu: kUlasim),
      OrnekCumle(ingilizce: 'I am waiting on the car.', turkce: 'Arabada bekliyorum.', dogruMu: false,
        neden: 'Araba kucuk bir aractir -> in. "on the car" arabanin '
            'USTUNDE demektir.', dogruBicim: 'I am waiting in the car.',
        hataTuru: 'ANLAM_FARKI', altKonu: kUlasim),
      OrnekCumle(ingilizce: 'He works at a bank.', turkce: 'Bankada calisir.', dogruMu: false,
        neden: 'Bina icinde calisiyorsa "in a bank" daha dogrudur. '
            '"at the bank" musteri olarak orada bulunmayi anlatir.',
        dogruBicim: 'He works in a bank.', hataTuru: 'ANLAM_FARKI', altKonu: kIn),
      OrnekCumle(ingilizce: 'The cat is in the chair.', turkce: 'Kedi sandalyede.', dogruMu: false,
        neden: 'Sandalye bir yuzeydir -> on.', dogruBicim: 'The cat is on the chair.',
        hataTuru: 'GRAMER_HATASI', altKonu: kOn),
      OrnekCumle(ingilizce: 'The shop is at Main Street.', turkce: 'Dukkan Main Caddesi\u2019nde.', dogruMu: false,
        neden: 'Sokak adlari yuzey sayilir -> on Main Street.',
        dogruBicim: 'The shop is on Main Street.', hataTuru: 'GRAMER_HATASI', altKonu: kOn),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kOn,
        soru: 'The book is ___ the table.', secenekler: <String>['in', 'on', 'at'],
        kabuller: <String>['on'], geriDonusKodu: 'J3', aciklama: 'Yuzey -> on.'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kIn,
        soru: 'The pen is ___ the box.', secenekler: <String>['in', 'on', 'at'],
        kabuller: <String>['in'], geriDonusKodu: 'J2', aciklama: 'Hacim -> in.'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kAt,
        soru: 'I am ___ the bus stop.', secenekler: <String>['in', 'on', 'at'],
        kabuller: <String>['at'], geriDonusKodu: 'J4', aciklama: 'Nokta -> at.'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kKalip,
        soru: 'She is ___ home.', secenekler: <String>['in the', 'at', 'on'],
        kabuller: <String>['at'], geriDonusKodu: 'J5', aciklama: 'Kalip: at home.'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kUlasim,
        soru: 'They are ___ the bus.', secenekler: <String>['in', 'on', 'at'],
        kabuller: <String>['on'], geriDonusKodu: 'J6', aciklama: 'Buyuk arac -> on.'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kIn,
        soru: 'The children are ___ the garden.', kabuller: <String>['in']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kOn,
        soru: 'The picture is ___ the wall.', kabuller: <String>['on']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kAt,
        soru: 'My father is ___ work.', kabuller: <String>['at']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kIn,
        soru: 'I live ___ Ankara.', kabuller: <String>['in']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kUlasim,
        soru: 'I am waiting ___ the car.', kabuller: <String>['in']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kKalip,
        soru: '"yatakta" hangisi?',
        secenekler: <String>['on bed', 'in bed', 'at bed'], kabuller: <String>['in bed']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kUlasim,
        soru: '"trende" hangisi?',
        secenekler: <String>['in the train', 'on the train', 'at the train'],
        kabuller: <String>['on the train']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kOn,
        soru: 'Dizin: table / The / on / book / is / the',
        kabuller: <String>['The book is on the table.', 'The book is on the table']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kAt,
        soru: 'Dizin: home / She / at / is',
        kabuller: <String>['She is at home.', 'She is at home']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kTekEk,
        soru: '"The book is in the table." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kOn, turkce: 'Kitap masada.',
        kabuller: <String>['The book is on the table.']),
      SerbestGorev(kod: 'SU-2', altKonu: kIn, turkce: 'Ankara\u2019da yasarim.',
        kabuller: <String>['I live in Ankara.']),
      SerbestGorev(kod: 'SU-3', altKonu: kKalip, turkce: 'O evde.',
        kabuller: <String>['She is at home.', 'He is at home.']),
      SerbestGorev(kod: 'SU-4', altKonu: kUlasim, turkce: 'Onlar otobuste.',
        kabuller: <String>['They are on the bus.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kOn,
        soru: 'The bag is ___ the floor.', kabuller: <String>['on']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kIn,
        soru: 'My keys are ___ my bag.', kabuller: <String>['in']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kAt,
        soru: 'Wait ___ the corner.', kabuller: <String>['at']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.boslukDoldurma, altKonu: kKalip,
        soru: 'She is ___ the phone.', kabuller: <String>['on']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.coktanSecmeli, altKonu: kUlasim,
        soru: 'Hangisi dogru?',
        secenekler: <String>['in the bus', 'on the bus', 'at the bus'],
        kabuller: <String>['on the bus']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kKalip,
        soru: '"She is in the home." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kIn,
        soru: 'Dizin: box / in / The / the / pen / is',
        kabuller: <String>['The pen is in the box.', 'The pen is in the box']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kAt,
        soru: 'They are ___ school.', kabuller: <String>['at']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kIn,
        soru: 'She is ___ the room.', secenekler: <String>['in', 'on', 'at'],
        kabuller: <String>['in']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kOn,
        soru: 'The cat is ___ the chair.', secenekler: <String>['in', 'on', 'at'],
        kabuller: <String>['on']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kAt,
        soru: 'We are ___ the party.', secenekler: <String>['in', 'on', 'at'],
        kabuller: <String>['at']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kUlasim,
        soru: 'She is ___ a taxi.', secenekler: <String>['in', 'on', 'at'],
        kabuller: <String>['in']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kKalip,
        soru: 'The children are ___ bed.', secenekler: <String>['in', 'on', 'at'],
        kabuller: <String>['in']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kOn,
        soru: 'Your name is ___ this page.', kabuller: <String>['on']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kIn,
        soru: 'There is water ___ the glass.', kabuller: <String>['in']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kAt,
        soru: 'She is ___ the door.', kabuller: <String>['at']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kTekEk,
        soru: '"The pen is on the box." kalemin kutuda oldugunu anlatir mi?',
        secenekler: <String>['Evet', 'Hayir'], kabuller: <String>['Hayir']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kUlasim,
        soru: '"We are in the train." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kIn,
        soru: '"I live at Ankara." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kAt,
        soru: 'Dizin: stop / I / bus / at / am / the',
        kabuller: <String>['I am at the bus stop.', 'I am at the bus stop']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kOn,
        soru: 'Ingilizceye cevirin: Resim duvarda.',
        kabuller: <String>['The picture is on the wall.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kKalip,
        soru: 'Ingilizceye cevirin: Babam iste.',
        kabuller: <String>['My father is at work.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kIn,
        soru: 'Ingilizceye cevirin: Kalem kutuda.',
        kabuller: <String>['The pen is in the box.']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Tek soru: yerin bicimi ne?',
        aciklama: 'Hacim mi, yuzey mi, nokta mi? Cevap edati belirler.',
        ornek: 'in / on / at'),
      OzetMaddesi(baslik: 'in — kapali hacim',
        aciklama: 'Icine girilebilen yerler. Sehir ve ulkeler de.',
        ornek: 'in the box · in the room · in Ankara'),
      OzetMaddesi(baslik: 'on — yuzey',
        aciklama: 'Bir seye temas ediyorsa. Sokak adlari da.',
        ornek: 'on the table · on the wall · on Main Street'),
      OzetMaddesi(baslik: 'at — nokta',
        aciklama: 'Orada bulunmak onemli; icine girmek degil.',
        ornek: 'at the bus stop · at school · at the door'),
      OzetMaddesi(baslik: 'Ezberlenen kaliplar',
        aciklama: 'Kurala uymaz ama cok sik gecer.',
        ornek: 'at home · at work · in bed · on the phone'),
      OzetMaddesi(baslik: 'Ulasim araclari',
        aciklama: 'Kucuk arac -> in · Buyuk arac -> on.',
        ornek: 'in the car · on the bus · on the train'),
    ],
  );
}
