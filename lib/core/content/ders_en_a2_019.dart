/// EN-A2-019 — Yer Edatlari (A2): Konum ve Yon
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnA2019 {
  const DersEnA2019._();

  static const String kKonum = 'Konum: onunde / arkasinda';
  static const String kArasinda = 'between / among';
  static const String kYakinlik = 'next to / near / opposite';
  static const String kUstAlt = 'above / under / over';
  static const String kYon = 'Yon: to / into / onto';
  static const String kAtTo = 'be at / go to';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A2-019',
    baslik: 'Yer Edatlari — Konum ve Yon',
    seviye: 'A2', konu: 'YAP', tahminiDk: 35,
    onKosullar: <String>['EN-A1-030'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'A1\u2019de uc temel edati ogrendiniz: in / on / at.\n'
        'Turkcedeki tek "-de" ekinin uce bolunmesiydi.\n\n'
        'Bu derste ayrim daha da incelir. Turkce cogu konumu tek bir '
        'sozcukle anlatir:\n\n'
        '  masanin YANINDA · masanin ONUNDE · masanin ALTINDA\n'
        '  Hepsi ayni yapiyi kullanir: isim + ek + konum sozcugu.\n\n'
        'Ingilizce her konum icin AYRI bir edat kullanir ve bu edatlar '
        'tek kelime olmayabilir:\n\n'
        '  next to the table · in front of the table · under the table\n\n'
        'Ayrica Ingilizce KONUM ile YONU ayirir:\n\n'
        '  I am AT school.   -> konum (oradayim)\n'
        '  I go TO school.   -> yon (oraya gidiyorum)\n\n'
        'Turkcede bu ayrim eklerle yapilir (-de / -e); Ingilizcede '
        'farkli kelimelerle.\n\n'
        'DUSUNME SORUSU: "Duruyor mu, gidiyor mu?"',
    kazanimlar: <String>[
      'Konum edatlarini dogru secebilmek',
      'between ile among arasindaki farki bilmek',
      'above / over ve under / below ayrimini yapmak',
      'Konum ile yonu ayirt etmek (at / to)',
      'into ve onto ile hareketi anlatmak',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'AE1', baslik: 'Temel konum edatlari',
        govde: 'Bu edatlar bir seye GORE konum bildirir:\n\n'
            '  in front of  -> onunde\n'
            '  behind       -> arkasinda\n'
            '  next to      -> yaninda\n'
            '  between      -> arasinda (iki sey)\n'
            '  opposite     -> karsisinda\n'
            '  near         -> yakininda\n\n'
            '  The car is in front of the house.\n'
            '  The garden is behind the house.\n'
            '  The bank is next to the shop.\n\n'
            'DIKKAT: "in front of" UC kelimedir; "in front the house" '
            'eksiktir.',
        turkceKarsilastirma: 'Evin onunde  ->  in front of the house\n'
            'Tek ek        ->  uc kelime'),
      AnlatimBlogu(kod: 'AE2', baslik: 'between mi among mi?',
        govde: 'Ikisi de "arasinda" demektir ama SAYI belirleyicidir:\n\n'
            '  BETWEEN -> IKI belirli sey arasinda\n'
            '     The bank is between the shop and the school.\n'
            '     He sat between his parents.\n\n'
            '  AMONG   -> UC veya daha fazla, belirsiz bir kalabalik\n'
            '     She was among the students.\n'
            '     There is a house among the trees.\n\n'
            'DUSUNME NOTU: Sayabiliyorsaniz ve iki taneyse "between"; '
            'kalabalik icinde kayboluyorsa "among".',
        turkceKarsilastirma: 'Dukkan ile okul arasinda\n'
            'between the shop and the school'),
      AnlatimBlogu(kod: 'AE3', baslik: 'above / over ve under / below',
        govde: 'Ust ve alt icin ikiser edat vardir:\n\n'
            '  ABOVE -> daha yukarida, TEMAS YOK\n'
            '     The picture is above the sofa.\n'
            '  OVER  -> uzerinde, ortuyor veya gecerek\n'
            '     There is a bridge over the river.\n'
            '     She put a blanket over the child.\n\n'
            '  UNDER -> hemen altinda\n'
            '     The cat is under the table.\n'
            '  BELOW -> daha asagida, olcek anlaminda\n'
            '     The temperature is below zero.\n\n'
            'A2 duzeyinde en cok "above" ve "under" gecer.',
        turkceKarsilastirma: 'Kanepenin ustunde (duvarda)  ->  above the sofa\n'
            'Masanin altinda             ->  under the table'),
      AnlatimBlogu(kod: 'AE4', baslik: 'Konum mu yon mu?',
        govde: 'Bu, Turkce konusanin en cok karistirdigi ayrimdir:\n\n'
            '  KONUM (duruyorum)  -> at / in / on\n'
            '     I am at school.   ·  She is in the room.\n\n'
            '  YON (gidiyorum)    -> to\n'
            '     I go to school.   ·  She came to the room.\n\n'
            'Turkcede ayrim eklerle yapilir:\n'
            '  okul-DA (konum) · okul-A (yon)\n\n'
            'Yanlislar:\n'
            '  I go at school.   -> YANLIS\n'
            '  I am to school.   -> YANLIS\n\n'
            'ISTISNA: "home" edatsiz kullanilir.\n'
            '  I go home. (to home DEGIL)',
        turkceKarsilastirma: 'Okuldayim.  ->  I am at school.\n'
            'Okula gidiyorum. ->  I go to school.'),
      AnlatimBlogu(kod: 'AE5', baslik: 'into ve onto: hareket',
        govde: 'Hareket bir seyin ICINE veya USTUNE ise:\n\n'
            '  INTO -> icine (disaridan iceri hareket)\n'
            '     She walked into the room.\n'
            '     Put the books into the box.\n\n'
            '  ONTO -> ustune (yuzeye hareket)\n'
            '     The cat jumped onto the table.\n\n'
            'FARK:\n'
            '  She is IN the room.     -> konum, hareket yok\n'
            '  She walked INTO the room. -> hareket var\n\n'
            'Gunluk dilde "in" ve "on" da kullanilir ama "into/onto" '
            'hareketi netlestirir.',
        turkceKarsilastirma: 'Odaya girdi.  ->  She walked into the room.\n'
            'Odada.        ->  She is in the room.'),
      AnlatimBlogu(kod: 'AE6', baslik: 'Sik kullanilan kaliplar',
        govde: 'Bazi ifadeler kalip olarak ogrenilir:\n\n'
            '  at the corner    -> kosede\n'
            '  on the left / right -> solda / sagda\n'
            '  in the middle of -> ortasinda\n'
            '  at the end of    -> sonunda\n'
            '  on the way       -> yolda\n'
            '  far from         -> uzak\n\n'
            '  The shop is on the left.\n'
            '  There is a table in the middle of the room.\n'
            '  My house is far from the school.\n\n'
            'Bunlar cok sik gecer; ezberlemek zaman kazandirir.',
        turkceKarsilastirma: 'Solda  ->  on the left\n'
            'Ortasinda -> in the middle of'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['the house', 'in front of the house', 'The car is in front of the house.'],
        turkce: 'Araba evin onunde.', not: 'Uc kelimelik edat.'),
      AdimliOrnek(adimlar: <String>['two things', 'between', 'between the shop and the school'],
        turkce: 'Iki sey arasinda.', not: 'Iki taneyse between.'),
      AdimliOrnek(adimlar: <String>['I am at school.', 'I go to school.'],
        turkce: 'konum / yon', not: 'Duruyor mu, gidiyor mu?'),
      AdimliOrnek(adimlar: <String>['She is in the room.', 'She walked into the room.'],
        turkce: 'konum / hareket', not: 'into hareket bildirir.'),
      AdimliOrnek(adimlar: <String>['home', 'I go home.'],
        turkce: 'Eve gidiyorum.', not: '"to home" DEGIL.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Banka dukkan ile okul arasinda.', 'Kac sey? IKI -> between',
        'between A and B', 'The bank is between the shop and the school.'],
        turkce: 'Iki sey -> between.', not: 'among YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Okula gidiyorum.', 'Duruyor mu gidiyor mu? GIDIYOR',
        'to', 'I go to school.'],
        turkce: 'Yon -> to.', not: 'at school YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Eve gidiyorum.', '"home" ozel bir kelime', 'edat almaz',
        'I go home.'],
        turkce: 'Istisna.', not: 'to home YANLIS.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'The car is in front of the house.', turkce: 'Araba evin onunde.', dogruMu: true, altKonu: kKonum),
      OrnekCumle(ingilizce: 'The garden is behind the house.', turkce: 'Bahce evin arkasinda.', dogruMu: true, altKonu: kKonum),
      OrnekCumle(ingilizce: 'The bank is next to the shop.', turkce: 'Banka dukkanin yaninda.', dogruMu: true, altKonu: kYakinlik),
      OrnekCumle(ingilizce: 'The school is opposite the park.', turkce: 'Okul parkin karsisinda.', dogruMu: true, altKonu: kYakinlik),
      OrnekCumle(ingilizce: 'My house is near the station.', turkce: 'Evim istasyonun yakininda.', dogruMu: true, altKonu: kYakinlik),
      OrnekCumle(ingilizce: 'My house is far from the school.', turkce: 'Evim okuldan uzak.', dogruMu: true, altKonu: kYakinlik),
      OrnekCumle(ingilizce: 'The bank is between the shop and the school.', turkce: 'Banka dukkan ile okul arasinda.', dogruMu: true, altKonu: kArasinda),
      OrnekCumle(ingilizce: 'He sat between his parents.', turkce: 'Ailesinin arasina oturdu.', dogruMu: true, altKonu: kArasinda),
      OrnekCumle(ingilizce: 'She was among the students.', turkce: 'Ogrencilerin arasindaydi.', dogruMu: true, altKonu: kArasinda),
      OrnekCumle(ingilizce: 'There is a house among the trees.', turkce: 'Agaclarin arasinda bir ev var.', dogruMu: true, altKonu: kArasinda),
      OrnekCumle(ingilizce: 'The picture is above the sofa.', turkce: 'Resim kanepenin ustunde.', dogruMu: true, altKonu: kUstAlt),
      OrnekCumle(ingilizce: 'The cat is under the table.', turkce: 'Kedi masanin altinda.', dogruMu: true, altKonu: kUstAlt),
      OrnekCumle(ingilizce: 'There is a bridge over the river.', turkce: 'Nehrin uzerinde bir kopru var.', dogruMu: true, altKonu: kUstAlt),
      OrnekCumle(ingilizce: 'The temperature is below zero.', turkce: 'Sicaklik sifirin altinda.', dogruMu: true, altKonu: kUstAlt),
      OrnekCumle(ingilizce: 'I am at school.', turkce: 'Okuldayim.', dogruMu: true, altKonu: kAtTo),
      OrnekCumle(ingilizce: 'I go to school every day.', turkce: 'Her gun okula giderim.', dogruMu: true, altKonu: kAtTo),
      OrnekCumle(ingilizce: 'She is in the room.', turkce: 'Odada.', dogruMu: true, altKonu: kAtTo),
      OrnekCumle(ingilizce: 'She came to the room.', turkce: 'Odaya geldi.', dogruMu: true, altKonu: kAtTo),
      OrnekCumle(ingilizce: 'I go home at six.', turkce: 'Altida eve giderim.', dogruMu: true, altKonu: kAtTo),
      OrnekCumle(ingilizce: 'We are at home now.', turkce: 'Simdi evdeyiz.', dogruMu: true, altKonu: kAtTo),
      OrnekCumle(ingilizce: 'She walked into the room.', turkce: 'Odaya girdi.', dogruMu: true, altKonu: kYon),
      OrnekCumle(ingilizce: 'Put the books into the box.', turkce: 'Kitaplari kutuya koy.', dogruMu: true, altKonu: kYon),
      OrnekCumle(ingilizce: 'The cat jumped onto the table.', turkce: 'Kedi masaya zipladi.', dogruMu: true, altKonu: kYon),
      OrnekCumle(ingilizce: 'He got into the car.', turkce: 'Arabaya bindi.', dogruMu: true, altKonu: kYon),
      OrnekCumle(ingilizce: 'They ran out of the building.', turkce: 'Binadan disari kostular.', dogruMu: true, altKonu: kYon),
      OrnekCumle(ingilizce: 'The shop is on the left.', turkce: 'Dukkan solda.', dogruMu: true, altKonu: kKonum),
      OrnekCumle(ingilizce: 'There is a table in the middle of the room.', turkce: 'Odanin ortasinda bir masa var.', dogruMu: true, altKonu: kKonum),
      OrnekCumle(ingilizce: 'Wait at the corner.', turkce: 'Kosede bekle.', dogruMu: true, altKonu: kKonum),
      OrnekCumle(ingilizce: 'The bank is at the end of the street.', turkce: 'Banka sokagin sonunda.', dogruMu: true, altKonu: kKonum),
      OrnekCumle(ingilizce: 'I met him on the way home.', turkce: 'Eve giderken onunla karsilastim.', dogruMu: true, altKonu: kKonum),

      OrnekCumle(ingilizce: 'The car is in front the house.', turkce: 'Araba evin onunde.', dogruMu: false,
        neden: 'Kalip UC kelimedir: "in front OF".',
        dogruBicim: 'The car is in front of the house.', hataTuru: 'EKSIK_KELIME', altKonu: kKonum),
      OrnekCumle(ingilizce: 'The bank is next the shop.', turkce: 'Banka dukkanin yaninda.', dogruMu: false,
        neden: '"next TO" seklinde kullanilir.', dogruBicim: 'The bank is next to the shop.',
        hataTuru: 'EKSIK_KELIME', altKonu: kYakinlik),
      OrnekCumle(ingilizce: 'My house is far the school.', turkce: 'Evim okuldan uzak.', dogruMu: false,
        neden: '"far FROM" seklinde kullanilir.',
        dogruBicim: 'My house is far from the school.', hataTuru: 'EKSIK_KELIME', altKonu: kYakinlik),
      OrnekCumle(ingilizce: 'The bank is among the shop and the school.', turkce: 'Banka dukkan ile okul arasinda.', dogruMu: false,
        neden: 'IKI belirli sey arasinda "between" kullanilir.',
        dogruBicim: 'The bank is between the shop and the school.',
        hataTuru: 'KELIME_SECIMI', altKonu: kArasinda),
      OrnekCumle(ingilizce: 'She was between the students.', turkce: 'Ogrencilerin arasindaydi.', dogruMu: false,
        neden: 'Kalabalik bir grup icinde "among" kullanilir.',
        dogruBicim: 'She was among the students.', hataTuru: 'KELIME_SECIMI', altKonu: kArasinda),
      OrnekCumle(ingilizce: 'The bank is between the shop with the school.', turkce: 'Dukkan ile okul arasinda.', dogruMu: false,
        neden: '"between A AND B" kalibi kullanilir.',
        dogruBicim: 'The bank is between the shop and the school.',
        hataTuru: 'KELIME_SECIMI', altKonu: kArasinda),
      OrnekCumle(ingilizce: 'The picture is on the sofa. (duvarda kastediliyor)', turkce: 'Resim kanepenin ustunde (duvarda).', dogruMu: false,
        neden: 'Temas yoksa ve daha yukaridaysa "above" kullanilir. '
            '"on the sofa" kanepenin uzerinde demektir.',
        dogruBicim: 'The picture is above the sofa.', hataTuru: 'ANLAM_FARKI', altKonu: kUstAlt),
      OrnekCumle(ingilizce: 'There is a bridge above the river.', turkce: 'Nehrin uzerinde kopru var.', dogruMu: false,
        neden: 'Bir seyi bastan basa gecen yapilarda "over" kullanilir.',
        dogruBicim: 'There is a bridge over the river.', hataTuru: 'KELIME_SECIMI', altKonu: kUstAlt),
      OrnekCumle(ingilizce: 'The temperature is under zero.', turkce: 'Sicaklik sifirin altinda.', dogruMu: false,
        neden: 'Olcek ve sayilarda "below" kullanilir.',
        dogruBicim: 'The temperature is below zero.', hataTuru: 'KELIME_SECIMI', altKonu: kUstAlt),
      OrnekCumle(ingilizce: 'I go at school every day.', turkce: 'Her gun okula giderim.', dogruMu: false,
        neden: 'Yon bildirirken "to" kullanilir; "at" konum bildirir.',
        dogruBicim: 'I go to school every day.', hataTuru: 'KELIME_SECIMI', altKonu: kAtTo),
      OrnekCumle(ingilizce: 'I am to school.', turkce: 'Okuldayim.', dogruMu: false,
        neden: 'Konum bildirirken "at" kullanilir.', dogruBicim: 'I am at school.',
        hataTuru: 'KELIME_SECIMI', altKonu: kAtTo),
      OrnekCumle(ingilizce: 'She came in the room. (hareket)', turkce: 'Odaya geldi.', dogruMu: false,
        neden: 'Hareket bildirirken "to" veya "into" kullanilir.',
        dogruBicim: 'She came to the room.', hataTuru: 'KELIME_SECIMI', altKonu: kAtTo),
      OrnekCumle(ingilizce: 'I go to home at six.', turkce: 'Altida eve giderim.', dogruMu: false,
        neden: '"home" edatsiz kullanilir: go home.', dogruBicim: 'I go home at six.',
        hataTuru: 'FAZLA_KELIME', altKonu: kAtTo),
      OrnekCumle(ingilizce: 'We are in home now.', turkce: 'Simdi evdeyiz.', dogruMu: false,
        neden: 'Kalip "at home"dur.', dogruBicim: 'We are at home now.',
        hataTuru: 'KELIME_SECIMI', altKonu: kAtTo),
      OrnekCumle(ingilizce: 'She walked in the room. (icine girdi)', turkce: 'Odaya girdi.', dogruMu: false,
        neden: 'Iceri dogru hareket "into" ile anlatilir. "in the room" '
            'zaten icerideymis gibi anlasilir.', dogruBicim: 'She walked into the room.',
        hataTuru: 'ANLAM_FARKI', altKonu: kYon),
      OrnekCumle(ingilizce: 'The cat jumped on the table. (zipladi)', turkce: 'Kedi masaya zipladi.', dogruMu: false,
        neden: 'Yuzeye dogru hareket "onto" ile netlesir.',
        dogruBicim: 'The cat jumped onto the table.', hataTuru: 'ANLAM_FARKI', altKonu: kYon),
      OrnekCumle(ingilizce: 'He got in to the car.', turkce: 'Arabaya bindi.', dogruMu: false,
        neden: '"into" tek kelimedir.', dogruBicim: 'He got into the car.',
        hataTuru: 'YAZIM_HATASI', altKonu: kYon),
      OrnekCumle(ingilizce: 'They ran out the building.', turkce: 'Binadan disari kostular.', dogruMu: false,
        neden: 'Kalip "out OF"tur.', dogruBicim: 'They ran out of the building.',
        hataTuru: 'EKSIK_KELIME', altKonu: kYon),
      OrnekCumle(ingilizce: 'There is a table in middle of the room.', turkce: 'Odanin ortasinda masa var.', dogruMu: false,
        neden: 'Kalip "in THE middle of"tur.',
        dogruBicim: 'There is a table in the middle of the room.',
        hataTuru: 'EKSIK_KELIME', altKonu: kKonum),
      OrnekCumle(ingilizce: 'The shop is in the left.', turkce: 'Dukkan solda.', dogruMu: false,
        neden: 'Kalip "on the left"tir.', dogruBicim: 'The shop is on the left.',
        hataTuru: 'KELIME_SECIMI', altKonu: kKonum),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kKonum,
        soru: 'The car is ___ the house. (onunde)',
        secenekler: <String>['in front', 'in front of', 'front of'],
        kabuller: <String>['in front of'], geriDonusKodu: 'AE1'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kArasinda,
        soru: 'The bank is ___ the shop and the school.',
        secenekler: <String>['among', 'between', 'in'],
        kabuller: <String>['between'], geriDonusKodu: 'AE2'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kAtTo,
        soru: 'I go ___ school every day.',
        secenekler: <String>['at', 'to', 'in'],
        kabuller: <String>['to'], geriDonusKodu: 'AE4'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kAtTo,
        soru: '"Eve giderim." hangisi?',
        secenekler: <String>['I go to home.', 'I go home.', 'I go at home.'],
        kabuller: <String>['I go home.'], geriDonusKodu: 'AE4'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kYon,
        soru: 'She walked ___ the room. (icine girdi)',
        secenekler: <String>['in', 'into', 'at'],
        kabuller: <String>['into'], geriDonusKodu: 'AE5'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kKonum,
        soru: 'The garden is ___ the house. (arkasinda)',
        kabuller: <String>['behind']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kYakinlik,
        soru: 'The bank is next ___ the shop.', kabuller: <String>['to']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kYakinlik,
        soru: 'My house is far ___ the school.', kabuller: <String>['from']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kUstAlt,
        soru: 'The cat is ___ the table. (altinda)', kabuller: <String>['under']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kAtTo,
        soru: 'We are ___ home now.', kabuller: <String>['at']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kArasinda,
        soru: 'Kalabalik bir grup icinde hangisi?',
        secenekler: <String>['between', 'among', 'in front of'],
        kabuller: <String>['among']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kYon,
        soru: '"Arabaya bindi." hangisi?',
        secenekler: <String>['He got in the car.', 'He got into the car.', 'He got at the car.'],
        kabuller: <String>['He got into the car.']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kKonum,
        soru: 'Dizin: house / of / in / the / front / The car is',
        kabuller: <String>['The car is in front of the house.',
            'The car is in front of the house']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kAtTo,
        soru: 'Dizin: day / school / go / to / I / every',
        kabuller: <String>['I go to school every day.',
            'I go to school every day']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kAtTo,
        soru: '"I go to home." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kKonum, turkce: 'Araba evin onunde.',
        kabuller: <String>['The car is in front of the house.']),
      SerbestGorev(kod: 'SU-2', altKonu: kArasinda,
        turkce: 'Banka dukkan ile okul arasinda.',
        kabuller: <String>['The bank is between the shop and the school.']),
      SerbestGorev(kod: 'SU-3', altKonu: kAtTo, turkce: 'Her gun okula giderim.',
        kabuller: <String>['I go to school every day.']),
      SerbestGorev(kod: 'SU-4', altKonu: kYon, turkce: 'Odaya girdi.',
        kabuller: <String>['She walked into the room.',
            'He walked into the room.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kYakinlik,
        soru: 'The school is ___ the park. (karsisinda)',
        kabuller: <String>['opposite']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kUstAlt,
        soru: 'The picture is ___ the sofa. (duvarda, ustunde)',
        kabuller: <String>['above']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kYon,
        soru: 'They ran out ___ the building.', kabuller: <String>['of']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.coktanSecmeli, altKonu: kArasinda,
        soru: 'Hangisi dogru?',
        secenekler: <String>['She was between the students.', 'She was among the students.', 'She was in front the students.'],
        kabuller: <String>['She was among the students.']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.dogruYanlis, altKonu: kAtTo,
        soru: '"I am to school." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kKonum,
        soru: '"The car is in front the house." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kUstAlt,
        soru: 'Dizin: table / the / under / cat / The / is',
        kabuller: <String>['The cat is under the table.',
            'The cat is under the table']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kKonum,
        soru: 'The shop is ___ the left.', kabuller: <String>['on']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kKonum,
        soru: 'The garden is ___ the house.',
        secenekler: <String>['behind', 'in front', 'next'],
        kabuller: <String>['behind']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kYakinlik,
        soru: 'The bank is ___ the shop.',
        secenekler: <String>['next', 'next to', 'near to'],
        kabuller: <String>['next to']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kArasinda,
        soru: 'He sat ___ his parents.',
        secenekler: <String>['among', 'between', 'in'],
        kabuller: <String>['between']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kAtTo,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I go at school.', 'I go to school.', 'I go in school.'],
        kabuller: <String>['I go to school.']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kYon,
        soru: 'The cat jumped ___ the table.',
        secenekler: <String>['on', 'onto', 'at'], kabuller: <String>['onto']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kYakinlik,
        soru: 'My house is far ___ the school.', kabuller: <String>['from']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kUstAlt,
        soru: 'There is a bridge ___ the river.', kabuller: <String>['over']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kAtTo,
        soru: 'We are ___ home now.', kabuller: <String>['at']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kAtTo,
        soru: '"I go to home." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kKonum,
        soru: '"The bank is next the shop." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kArasinda,
        soru: '"She was between the students." kalabalik icin dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kYon,
        soru: 'Dizin: room / the / into / walked / She',
        kabuller: <String>['She walked into the room.',
            'She walked into the room']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kKonum,
        soru: 'Ingilizceye cevirin: Kedi masanin altinda.',
        kabuller: <String>['The cat is under the table.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kArasinda,
        soru: 'Ingilizceye cevirin: Agaclarin arasinda bir ev var.',
        kabuller: <String>['There is a house among the trees.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kAtTo,
        soru: 'Ingilizceye cevirin: Altida eve giderim.',
        kabuller: <String>['I go home at six.']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Cok kelimeli edatlar',
        aciklama: 'in front OF · next TO · far FROM · out OF — parcalar duser.',
        ornek: 'in front of the house (in front the house DEGIL)'),
      OzetMaddesi(baslik: 'between / among',
        aciklama: 'Iki belirli sey -> between · Kalabalik grup -> among.',
        ornek: 'between A and B · among the trees'),
      OzetMaddesi(baslik: 'above / over · under / below',
        aciklama: 'above temassiz yukarida · over ortuyor/geciyor · below olcekte.',
        ornek: 'above the sofa · over the river · below zero'),
      OzetMaddesi(baslik: 'KONUM mu YON mu?',
        aciklama: 'Duruyor -> at/in/on · Gidiyor -> to.',
        ornek: 'I am at school. · I go to school.'),
      OzetMaddesi(baslik: 'into / onto: hareket',
        aciklama: 'Icine dogru -> into · Yuzeye dogru -> onto.',
        ornek: 'walked into the room · jumped onto the table'),
      OzetMaddesi(baslik: 'home istisnasi',
        aciklama: '"home" yon bildirirken edat ALMAZ.',
        ornek: 'I go home. (to home DEGIL) · ama "at home"'),
    ],
  );
}
