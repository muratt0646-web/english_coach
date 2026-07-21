/// EN-A1-003 — Kisi Zamirleri (I, you, he, she, it, we, they)
/// SADECE VERI.
library;

import '../model/ders_sablonu.dart';

class DersEnA1003 {
  const DersEnA1003._();

  static const String kOzne = 'Ozne zamiri';
  static const String kNesne = 'Nesne zamiri';
  static const String kIyelik = 'Iyelik sifati';
  static const String kDusurme = 'Ozne dusurme';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A1-003',
    baslik: 'Kisi Zamirleri — I, you, he, she, it, we, they',
    seviye: 'A1', konu: 'KEL', tahminiDk: 30,
    girisMetni:
        'Turkcede "Geliyorum" demek yeterlidir. Ozne yoktur ama fiildeki '
        '"-um" eki kimin geldigini soyler.\n\n'
        'Ingilizcede fiil bu bilgiyi tasimaz. Bu yuzden ozne HER ZAMAN '
        'yazilir: "I am coming."\n\n'
        'Ayrica Turkcede tek bir "o" vardir. Ingilizcede uc tane: '
        'he (erkek), she (kadin), it (canli olmayan).\n\n'
        'Bu ders zamirleri ezberletmez; hangisinin NEDEN secildigini gosterir.',
    kazanimlar: <String>[
      'Yedi ozne zamirini dogru secebilmek',
      'he / she / it ayrimini yapabilmek',
      'Ozneyi asla dusurmemek',
      'Nesne zamirlerini (me, him, her...) kullanabilmek',
      'Iyelik sifatlarini (my, your, his...) kullanabilmek',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'B1', baslik: 'Ozne neden zorunlu?',
        govde: 'Turkcede fiil ekleri ozneyi tasir: gel-IYORUM, gel-IYORSUN.\n\n'
            'Ingilizce fiillerde boyle bir ek yoktur. "coming" tek basina '
            'kimin geldigini soylemez. Bu yuzden ozne yazilmak ZORUNDADIR.\n\n'
            'Ozne dusurmek, Ingilizcede cumleyi emir haline getirir: '
            '"Come!" = "Gel!"',
        turkceKarsilastirma: 'Geliyorum.  ->  I am coming.\n'
            'Ek "-um"    ->  ayri kelime "I"'),
      AnlatimBlogu(kod: 'B2', baslik: 'Tek "o" yerine uc kelime',
        govde: 'Turkcede "o" hem erkek, hem kadin, hem de nesne icin '
            'kullanilir. Ingilizcede ucu ayridir:\n\n'
            'he  -> erkek kisi\n'
            'she -> kadin kisi\n'
            'it  -> insan olmayan her sey (nesne, hayvan, hava, sehir)\n\n'
            'Bu ayrim zorunludur; yanlisi kulagi hemen tirmalar.',
        turkceKarsilastirma: 'O bir doktor. (erkek)  ->  He is a doctor.\n'
            'O bir doktor. (kadin)  ->  She is a doctor.\n'
            'O yeni. (kitap)        ->  It is new.'),
      AnlatimBlogu(kod: 'B3', baslik: 'you: hem sen hem siz',
        govde: '"you" tek kisi icin de, birden fazla kisi icin de aynidir. '
            'Ingilizcede "sen" ve "siz" ayrimi yoktur.\n\n'
            'Bu yuzden "you" her zaman "are" alir — tek kisiye bile.',
        turkceKarsilastirma: 'Sen hazirsin.  ->  You are ready.\n'
            'Siz hazirsiniz. ->  You are ready.'),
      AnlatimBlogu(kod: 'B4', baslik: 'Nesne zamirleri: me, him, her...',
        govde: 'Zamir cumlede NESNE olunca sekil degistirir:\n\n'
            'I -> me · he -> him · she -> her · we -> us · they -> them\n'
            'you ve it degismez.\n\n'
            'Turkcede bu degisiklik ektir: ben -> ben-I, o -> on-U.',
        turkceKarsilastirma: 'O beni gorur.   ->  He sees me.\n'
            'Ben onu gorurum. ->  I see him.'),
      AnlatimBlogu(kod: 'B5', baslik: 'Iyelik sifatlari: my, your, his...',
        govde: 'Sahiplik anlatan bicimler:\n\n'
            'I -> my · you -> your · he -> his · she -> her\n'
            'it -> its · we -> our · they -> their\n\n'
            'Bunlar isimden ONCE gelir: my book, her car.\n\n'
            'Dikkat: "her" hem nesne zamiri hem iyelik sifatidir.',
        turkceKarsilastirma: 'Benim kitabim.  ->  my book\n'
            'Ek "-im"       ->  ayri kelime "my"'),
      AnlatimBlogu(kod: 'B6', baslik: 'Hangi bicim nerede?',
        govde: 'Uc bicim, uc gorev:\n\n'
            'OZNE   : I, you, he, she, it, we, they   -> cumlenin basinda\n'
            'NESNE  : me, you, him, her, it, us, them -> fiilden sonra\n'
            'IYELIK : my, your, his, her, its, our, their -> isimden once\n\n'
            'Ornek: I (ozne) see him (nesne) with my (iyelik) friend.',
        turkceKarsilastirma: 'Ben onu arkadasimla gorurum.\n'
            'I see him with my friend.'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['I', 'I see', 'I see him.'],
        turkce: 'Ben onu gorurum.', not: 'Ozne "I", nesne "him".'),
      AdimliOrnek(adimlar: <String>['She', 'She is', 'She is my sister.'],
        turkce: 'O benim kiz kardesim.', not: 'Kadin kisi -> she. Iyelik -> my.'),
      AdimliOrnek(adimlar: <String>['It', 'It is', 'It is their car.'],
        turkce: 'O onlarin arabasi.', not: 'Nesne -> it. Iyelik -> their.'),
      AdimliOrnek(adimlar: <String>['They', 'They know', 'They know us.'],
        turkce: 'Onlar bizi tanir.', not: 'we -> us (nesne bicimi).'),
      AdimliOrnek(adimlar: <String>['We', 'We help', 'We help her.'],
        turkce: 'Biz ona yardim ederiz.', not: 'she -> her (nesne bicimi).'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Ali bir ogretmen.', 'Ali = erkek -> he', 'He is', 'He is a teacher.'],
        turkce: 'Ozel ismi zamire cevirme.', not: 'Erkek isim -> he.'),
      AdimliOrnek(adimlar: <String>[
        'Kitap masada.', 'Kitap = nesne -> it', 'It is', 'It is on the table.'],
        turkce: 'Nesneler icin it.', not: 'Canli olmayan her sey -> it.'),
      AdimliOrnek(adimlar: <String>[
        'Onu tanirim.', 'Kim taniyor? -> I', 'I know', 'I know her.'],
        turkce: 'Ozne dusmez, nesne bicimi kullanilir.',
        not: 'Turkcede ozne yok; Ingilizcede ZORUNLU.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I am a student.', turkce: 'Ben ogrenciyim.', dogruMu: true),
      OrnekCumle(ingilizce: 'I know her.', turkce: 'Onu tanirim.', dogruMu: true),
      OrnekCumle(ingilizce: 'You are my friend.', turkce: 'Sen arkadasimsin.', dogruMu: true),
      OrnekCumle(ingilizce: 'You help us.', turkce: 'Sen bize yardim edersin.', dogruMu: true),
      OrnekCumle(ingilizce: 'He is a doctor.', turkce: 'O bir doktor.', dogruMu: true),
      OrnekCumle(ingilizce: 'He sees me.', turkce: 'O beni gorur.', dogruMu: true),
      OrnekCumle(ingilizce: 'His car is new.', turkce: 'Onun arabasi yeni.', dogruMu: true),
      OrnekCumle(ingilizce: 'She is my sister.', turkce: 'O kiz kardesim.', dogruMu: true),
      OrnekCumle(ingilizce: 'I call her every day.', turkce: 'Onu her gun ararim.', dogruMu: true),
      OrnekCumle(ingilizce: 'Her book is here.', turkce: 'Onun kitabi burada.', dogruMu: true),
      OrnekCumle(ingilizce: 'It is cold today.', turkce: 'Bugun hava soguk.', dogruMu: true),
      OrnekCumle(ingilizce: 'It is a big city.', turkce: 'O buyuk bir sehir.', dogruMu: true),
      OrnekCumle(ingilizce: 'Its colour is blue.', turkce: 'Onun rengi mavi.', dogruMu: true),
      OrnekCumle(ingilizce: 'We are at home.', turkce: 'Biz evdeyiz.', dogruMu: true),
      OrnekCumle(ingilizce: 'They know us.', turkce: 'Onlar bizi tanir.', dogruMu: true),
      OrnekCumle(ingilizce: 'Our house is small.', turkce: 'Bizim evimiz kucuk.', dogruMu: true),
      OrnekCumle(ingilizce: 'They are students.', turkce: 'Onlar ogrenci.', dogruMu: true),
      OrnekCumle(ingilizce: 'I see them.', turkce: 'Onlari gorurum.', dogruMu: true),
      OrnekCumle(ingilizce: 'Their teacher is kind.', turkce: 'Ogretmenleri kibar.', dogruMu: true),
      OrnekCumle(ingilizce: 'My name is Ali.', turkce: 'Benim adim Ali.', dogruMu: true),
      OrnekCumle(ingilizce: 'Your bag is heavy.', turkce: 'Cantan agir.', dogruMu: true),
      OrnekCumle(ingilizce: 'He helps his brother.', turkce: 'O kardesine yardim eder.', dogruMu: true),
      OrnekCumle(ingilizce: 'She loves her family.', turkce: 'Ailesini sever.', dogruMu: true),
      OrnekCumle(ingilizce: 'We visit them on Sunday.', turkce: 'Pazar onlari ziyaret ederiz.', dogruMu: true),
      OrnekCumle(ingilizce: 'They wait for me.', turkce: 'Onlar beni bekler.', dogruMu: true),
      OrnekCumle(ingilizce: 'I write to you.', turkce: 'Sana yazarim.', dogruMu: true),
      OrnekCumle(ingilizce: 'It is not my book.', turkce: 'O benim kitabim degil.', dogruMu: true),
      OrnekCumle(ingilizce: 'Are they your friends?', turkce: 'Onlar arkadaslarin mi?', dogruMu: true),
      OrnekCumle(ingilizce: 'Is he your teacher?', turkce: 'O senin ogretmenin mi?', dogruMu: true),
      OrnekCumle(ingilizce: 'She is with us.', turkce: 'O bizimle.', dogruMu: true),

      OrnekCumle(ingilizce: 'Am a student.', turkce: 'Ogrenciyim.', dogruMu: false,
        neden: 'Ozne DUSMEZ. Turkcede "-im" eki yeterli, Ingilizcede "I" '
            'yazilmak zorunda.', dogruBicim: 'I am a student.'),
      OrnekCumle(ingilizce: 'Is a doctor.', turkce: 'O bir doktor.', dogruMu: false,
        neden: 'Ozne eksik. Kim doktor? he mi she mi belli degil.',
        dogruBicim: 'He is a doctor.'),
      OrnekCumle(ingilizce: 'Are coming.', turkce: 'Geliyorlar.', dogruMu: false,
        neden: 'Ozne olmadan cumle emir gibi anlasilir.',
        dogruBicim: 'They are coming.'),
      OrnekCumle(ingilizce: 'He is my sister.', turkce: 'O kiz kardesim.', dogruMu: false,
        neden: '"sister" kadin demektir; zamir "she" olmali. Turkcedeki tek '
            '"o" yaniltiyor.', dogruBicim: 'She is my sister.'),
      OrnekCumle(ingilizce: 'She is my brother.', turkce: 'O erkek kardesim.', dogruMu: false,
        neden: '"brother" erkek demektir; zamir "he" olmali.',
        dogruBicim: 'He is my brother.'),
      OrnekCumle(ingilizce: 'He is a big city.', turkce: 'O buyuk bir sehir.', dogruMu: false,
        neden: 'Sehir insan degildir; "it" kullanilir.',
        dogruBicim: 'It is a big city.'),
      OrnekCumle(ingilizce: 'Me am happy.', turkce: 'Ben mutluyum.', dogruMu: false,
        neden: '"me" NESNE bicimidir; ozne olamaz. Ozne "I".',
        dogruBicim: 'I am happy.'),
      OrnekCumle(ingilizce: 'Him is a doctor.', turkce: 'O bir doktor.', dogruMu: false,
        neden: '"him" nesne bicimidir. Ozne "he".', dogruBicim: 'He is a doctor.'),
      OrnekCumle(ingilizce: 'Them are students.', turkce: 'Onlar ogrenci.', dogruMu: false,
        neden: '"them" nesne bicimidir. Ozne "they".',
        dogruBicim: 'They are students.'),
      OrnekCumle(ingilizce: 'I see he.', turkce: 'Onu gorurum.', dogruMu: false,
        neden: 'Fiilden sonra NESNE bicimi gelir: him.', dogruBicim: 'I see him.'),
      OrnekCumle(ingilizce: 'She knows I.', turkce: 'O beni tanir.', dogruMu: false,
        neden: 'Nesne bicimi "me" olmali.', dogruBicim: 'She knows me.'),
      OrnekCumle(ingilizce: 'They wait for we.', turkce: 'Bizi beklerler.', dogruMu: false,
        neden: 'Edattan sonra da nesne bicimi gelir: us.',
        dogruBicim: 'They wait for us.'),
      OrnekCumle(ingilizce: 'I book is new.', turkce: 'Kitabim yeni.', dogruMu: false,
        neden: 'Isimden once IYELIK sifati gelir: my.',
        dogruBicim: 'My book is new.'),
      OrnekCumle(ingilizce: 'He car is red.', turkce: 'Onun arabasi kirmizi.', dogruMu: false,
        neden: 'Iyelik bicimi "his" olmali.', dogruBicim: 'His car is red.'),
      OrnekCumle(ingilizce: 'They house is big.', turkce: 'Onlarin evi buyuk.', dogruMu: false,
        neden: 'Iyelik bicimi "their" olmali.', dogruBicim: 'Their house is big.'),
      OrnekCumle(ingilizce: 'She book is here.', turkce: 'Onun kitabi burada.', dogruMu: false,
        neden: 'Iyelik bicimi "her" olmali.', dogruBicim: 'Her book is here.'),
      OrnekCumle(ingilizce: 'We are at they house.', turkce: 'Onlarin evindeyiz.', dogruMu: false,
        neden: 'Isimden once iyelik: their.', dogruBicim: 'We are at their house.'),
      OrnekCumle(ingilizce: 'You is my friend.', turkce: 'Sen arkadasimsin.', dogruMu: false,
        neden: '"you" tek kisi olsa bile "are" alir.',
        dogruBicim: 'You are my friend.'),
      OrnekCumle(ingilizce: 'It are cold.', turkce: 'Hava soguk.', dogruMu: false,
        neden: '"it" tekildir; "is" alir.', dogruBicim: 'It is cold.'),
      OrnekCumle(ingilizce: 'Us are ready.', turkce: 'Biz haziriz.', dogruMu: false,
        neden: '"us" nesne bicimidir. Ozne "we".', dogruBicim: 'We are ready.'),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kDusurme,
        soru: 'Hangisi dogru?',
        secenekler: <String>['Am a student.', 'I am a student.', 'A student am.'],
        kabuller: <String>['I am a student.'], geriDonusKodu: 'B1',
        aciklama: 'Ozne dusmez.'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kOzne,
        soru: 'My sister is a nurse. ___ is very kind.',
        secenekler: <String>['He', 'She', 'It'], kabuller: <String>['She'],
        geriDonusKodu: 'B2', aciklama: 'sister = kadin -> she.'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kNesne,
        soru: 'I see ___ every day.',
        secenekler: <String>['he', 'him', 'his'], kabuller: <String>['him'],
        geriDonusKodu: 'B4', aciklama: 'Fiilden sonra nesne bicimi.'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kIyelik,
        soru: '___ book is new.',
        secenekler: <String>['I', 'Me', 'My'], kabuller: <String>['My'],
        geriDonusKodu: 'B5', aciklama: 'Isimden once iyelik sifati.'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kOzne,
        soru: 'Ali is my brother. ___ is a doctor.', kabuller: <String>['He']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kOzne,
        soru: 'The book is old. ___ is on the table.', kabuller: <String>['It']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kNesne,
        soru: 'She knows ___. (I)', kabuller: <String>['me']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kNesne,
        soru: 'We visit ___ on Sunday. (they)', kabuller: <String>['them']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kIyelik,
        soru: '___ house is big. (we)', kabuller: <String>['Our', 'our']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kNesne,
        soru: '"she" zamirinin nesne bicimi hangisidir?',
        secenekler: <String>['her', 'hers', 'she'], kabuller: <String>['her']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kIyelik,
        soru: '"they" zamirinin iyelik bicimi hangisidir?',
        secenekler: <String>['them', 'their', 'theirs'],
        kabuller: <String>['their']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kNesne,
        soru: 'Dizin: him / I / see',
        kabuller: <String>['I see him.', 'I see him']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kIyelik,
        soru: 'Dizin: is / My / new / book',
        kabuller: <String>['My book is new.', 'My book is new']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kDusurme,
        soru: '"Are coming." dogru bir cumle mi?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis'],
        aciklama: 'Ozne eksik.'),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kDusurme, turkce: 'Ben ogretmenim.',
        kabuller: <String>['I am a teacher.', 'I am a teacher']),
      SerbestGorev(kod: 'SU-2', altKonu: kNesne, turkce: 'Onu her gun gorurum.',
        kabuller: <String>['I see him every day.', 'I see her every day.']),
      SerbestGorev(kod: 'SU-3', altKonu: kIyelik, turkce: 'Bizim evimiz kucuk.',
        kabuller: <String>['Our house is small.', 'Our house is small']),
      SerbestGorev(kod: 'SU-4', altKonu: kOzne, turkce: 'O bir sehir. (nesne)',
        kabuller: <String>['It is a city.', 'It is a city']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kOzne,
        soru: 'My mother is here. ___ is tired.', kabuller: <String>['She']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kNesne,
        soru: 'They help ___. (we)', kabuller: <String>['us']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kIyelik,
        soru: '___ name is Deniz. (I)', kabuller: <String>['My', 'my']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.coktanSecmeli, altKonu: kDusurme,
        soru: 'Hangisi eksiksiz?',
        secenekler: <String>['Is a doctor.', 'He is a doctor.', 'Doctor is.'],
        kabuller: <String>['He is a doctor.']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.dogruYanlis, altKonu: kNesne,
        soru: '"I see he." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.kelimeDizme, altKonu: kIyelik,
        soru: 'Dizin: car / is / red / His',
        kabuller: <String>['His car is red.', 'His car is red']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.boslukDoldurma, altKonu: kOzne,
        soru: 'The cat is small. ___ is white.', kabuller: <String>['It']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.eslestirme, altKonu: kNesne,
        soru: '"we" zamirinin nesne bicimi?',
        secenekler: <String>['us', 'our', 'we'], kabuller: <String>['us']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kOzne,
        soru: 'Ayse is my friend. ___ is a nurse.',
        secenekler: <String>['He', 'She', 'It'], kabuller: <String>['She']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kOzne,
        soru: 'The city is big. ___ is beautiful.',
        secenekler: <String>['He', 'She', 'It'], kabuller: <String>['It']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kNesne,
        soru: 'I know ___.', secenekler: <String>['they', 'them', 'their'],
        kabuller: <String>['them']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kIyelik,
        soru: '___ teacher is kind.',
        secenekler: <String>['Our', 'Us', 'We'], kabuller: <String>['Our']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kNesne,
        soru: 'She waits for ___.', secenekler: <String>['I', 'me', 'my'],
        kabuller: <String>['me']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kOzne,
        soru: 'My father is at work. ___ is busy.', kabuller: <String>['He']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kIyelik,
        soru: '___ bag is heavy. (you)', kabuller: <String>['Your', 'your']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kNesne,
        soru: 'We help ___. (she)', kabuller: <String>['her']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kDusurme,
        soru: '"Is a student." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kNesne,
        soru: '"Them are students." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.kelimeDizme, altKonu: kNesne,
        soru: 'Dizin: her / We / know',
        kabuller: <String>['We know her.', 'We know her']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kIyelik,
        soru: 'Dizin: is / Their / big / house',
        kabuller: <String>['Their house is big.', 'Their house is big']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kDusurme,
        soru: 'Ingilizceye cevirin: Ben hazirim.',
        kabuller: <String>['I am ready.', 'I am ready']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kNesne,
        soru: 'Ingilizceye cevirin: Onlar bizi tanir.',
        kabuller: <String>['They know us.', 'They know us']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kIyelik,
        soru: 'Ingilizceye cevirin: Benim adim Ali.',
        kabuller: <String>['My name is Ali.', 'My name is Ali']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Ozne zamirleri',
        aciklama: 'I, you, he, she, it, we, they — cumlenin basinda.',
        ornek: 'They are students.'),
      OzetMaddesi(baslik: 'he / she / it ayrimi',
        aciklama: 'Turkcedeki tek "o" ucce ayrilir: erkek, kadin, nesne.',
        ornek: 'He is a doctor. · She is a nurse. · It is a city.'),
      OzetMaddesi(baslik: 'Ozne dusmez',
        aciklama: 'Ingilizce fiil ozneyi tasimaz; ozne her zaman yazilir.',
        ornek: 'Am a student. (X)  ->  I am a student.'),
      OzetMaddesi(baslik: 'Nesne zamirleri',
        aciklama: 'me, you, him, her, it, us, them — fiilden sonra.',
        ornek: 'I see him. · They know us.'),
      OzetMaddesi(baslik: 'Iyelik sifatlari',
        aciklama: 'my, your, his, her, its, our, their — isimden once.',
        ornek: 'My book · Their house'),
      OzetMaddesi(baslik: 'you tek bicim',
        aciklama: '"you" hem sen hem siz; her zaman "are" alir.',
        ornek: 'You are ready.'),
    ],
  );
}
