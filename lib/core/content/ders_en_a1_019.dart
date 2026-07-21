/// EN-A1-019 — Artikeller: a / an / the
/// SADECE VERI. Hedef hata kodlari: ART-01, ART-02.
library;

import '../model/ders_sablonu.dart';

class DersEnA1019 {
  const DersEnA1019._();

  static const String kAAn = 'a / an secimi';
  static const String kBelirsiz = 'Belirsiz artikel (a/an)';
  static const String kBelirli = 'Belirli artikel (the)';
  static const String kArtikelsiz = 'Artikelsiz kullanim';
  static const String kMeslek = 'Meslek ve tanim';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A1-019',
    baslik: 'Artikeller — a / an / the',
    seviye: 'A1', konu: 'ISM', tahminiDk: 35,
    onKosullar: <String>['EN-A1-002'],
    girisMetni:
        'Turkcede artikel YOKTUR. "Kitap aldim" derken kitabin hangisi '
        'oldugunu belirtmeye gerek duymayiz.\n\n'
        'Ingilizcede tekil sayilabilir bir isim neredeyse HIC yalniz durmaz. '
        'Onunde ya a/an ya the ya da bir belirleyici bulunur.\n\n'
        '"I saw dog." cumlesi bir Ingilize eksik gelir — hangi kopek?\n\n'
        'Bu ders artikeli ezberletmez; hangi durumda hangisinin NEDEN '
        'secildigini gosterir.',
    kazanimlar: <String>[
      'a ile an arasindaki secimi SES kuralina gore yapabilmek',
      'Ilk kez soz edilen sey icin a/an kullanabilmek',
      'Belirli sey icin the kullanabilmek',
      'Meslek belirtirken a/an unutmamak',
      'Artikel gerekmeyen durumlari taniyabilmek',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'E1', baslik: 'Turkcede olmayan bir sey',
        govde: 'Turkcede "bir" kelimesi vardir ama zorunlu degildir: '
            '"Kopek gordum" da "Bir kopek gordum" da dogrudur.\n\n'
            'Ingilizcede tekil sayilabilir isim BOS BIRAKILAMAZ. Onunde '
            'mutlaka bir belirleyici olur: a, an, the, my, this, one...\n\n'
            'Bu yuzden "I saw dog." kulaga yarim gelir.',
        turkceKarsilastirma: 'Kopek gordum.  ->  I saw a dog.\n'
            'Ek yok          ->  ayri kelime "a"'),
      AnlatimBlogu(kod: 'E2', baslik: 'a mi an mi? SESE bak',
        govde: 'Kural YAZIMA degil SESE bakar.\n\n'
            'Sesli harf sesiyle basliyorsa -> an\n'
            'Sessiz harf sesiyle basliyorsa -> a\n\n'
            'an apple · an egg · an orange · an hour (h okunmaz!)\n'
            'a book · a car · a university (yu- diye okunur!)\n\n'
            '"hour" h ile yazilir ama "aur" diye okunur -> an.\n'
            '"university" u ile yazilir ama "yuniversiti" diye okunur -> a.',
        turkceKarsilastirma: 'Bir elma  ->  an apple\n'
            'Bir kitap ->  a book'),
      AnlatimBlogu(kod: 'E3', baslik: 'a/an: ILK kez sozu edilen',
        govde: 'Dinleyen henuz hangisini kastettiginizi bilmiyorsa a/an '
            'kullanilir.\n\n'
            'I saw a dog.  (hangi kopek oldugu onemli degil, herhangi biri)\n\n'
            'Ayni sey ikinci kez anilinca artik BILINIR hale gelir ve "the" '
            'olur:\n\n'
            'I saw a dog. THE dog was very big.',
        turkceKarsilastirma: 'Bir kopek gordum. Kopek cok buyuktu.\n'
            'I saw a dog. The dog was very big.'),
      AnlatimBlogu(kod: 'E4', baslik: 'the: hangisi oldugu BELLI',
        govde: '"the" hem tekil hem cogul isimle kullanilir. Sart tek: '
            'dinleyen hangisini kastettiginizi bilmeli.\n\n'
            'Bilinmesinin uc yolu vardir:\n'
            '  1. Daha once anildi     -> The dog was big.\n'
            '  2. Ortamda tek tane var -> Close the door. (buradaki kapi)\n'
            '  3. Dunyada tek tane var -> the sun, the sea',
        turkceKarsilastirma: 'Kapiyi kapat.  ->  Close the door.\n'
            'Turkcede "-yi" eki belirlilik tasir; Ingilizcede "the".'),
      AnlatimBlogu(kod: 'E5', baslik: 'Meslek ve tanimda a/an ZORUNLU',
        govde: 'Bir kisinin ne oldugunu soylerken artikel DUSMEZ:\n\n'
            'She is a teacher.   (She is teacher. YANLIS)\n'
            'He is an engineer.\n\n'
            'Turkcede "O ogretmen" yeterlidir; Ingilizcede degil.\n\n'
            'Cogulda artikel kullanilmaz: They are teachers.',
        turkceKarsilastirma: 'O ogretmen.    ->  She is a teacher.\n'
            'Onlar ogretmen. ->  They are teachers.'),
      AnlatimBlogu(kod: 'E6', baslik: 'Artikel gerekmeyen durumlar',
        govde: 'Uc durumda artikel KULLANILMAZ:\n\n'
            '1. Cogul, genel anlamda:  I like books. (kitaplari genel olarak)\n'
            '2. Sayilamayan isimler:   I drink water. (a water YANLIS)\n'
            '3. Ozel isimler:          I live in Ankara.\n\n'
            'Ama belirli hale gelirse "the" gelir:\n'
            'The books on the table are mine.',
        turkceKarsilastirma: 'Su icerim.      ->  I drink water.\n'
            'Kitap severim.  ->  I like books.'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['dog', 'a dog', 'I saw a dog.'],
        turkce: 'Bir kopek gordum.', not: 'Ilk kez soz ediliyor -> a.'),
      AdimliOrnek(adimlar: <String>['I saw a dog.', 'The dog', 'The dog was big.'],
        turkce: 'Kopek cok buyuktu.', not: 'Ikinci anista -> the.'),
      AdimliOrnek(adimlar: <String>['apple', 'an apple', 'I eat an apple.'],
        turkce: 'Bir elma yerim.', not: 'Sesli sesle basliyor -> an.'),
      AdimliOrnek(adimlar: <String>['teacher', 'a teacher', 'She is a teacher.'],
        turkce: 'O bir ogretmen.', not: 'Meslekte artikel ZORUNLU.'),
      AdimliOrnek(adimlar: <String>['water', 'water', 'I drink water.'],
        turkce: 'Su icerim.', not: 'Sayilamayan isim -> artikel YOK.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Bir saat bekledim.', 'hour -> "aur" okunur', 'an hour', 'I waited an hour.'],
        turkce: 'Yazim degil SES onemli.', not: 'h okunmuyor -> an.'),
      AdimliOrnek(adimlar: <String>[
        'O bir universitede calisir.', 'university -> "yuni" okunur',
        'a university', 'She works at a university.'],
        turkce: 'u yazilir ama y sesiyle baslar.', not: 'Sessiz ses -> a.'),
      AdimliOrnek(adimlar: <String>[
        'Kapiyi kapat.', 'Hangi kapi? Buradaki.', 'the door', 'Close the door.'],
        turkce: 'Ortamda tek tane -> the.', not: 'Belirlilik "the" ile.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I saw a dog.', turkce: 'Bir kopek gordum.', dogruMu: true, altKonu: kBelirsiz),
      OrnekCumle(ingilizce: 'She has a car.', turkce: 'Onun bir arabasi var.', dogruMu: true, altKonu: kBelirsiz),
      OrnekCumle(ingilizce: 'I need a pen.', turkce: 'Bir kaleme ihtiyacim var.', dogruMu: true, altKonu: kBelirsiz),
      OrnekCumle(ingilizce: 'He reads a book.', turkce: 'Bir kitap okur.', dogruMu: true, altKonu: kBelirsiz),
      OrnekCumle(ingilizce: 'There is a shop here.', turkce: 'Burada bir dukkan var.', dogruMu: true, altKonu: kBelirsiz),
      OrnekCumle(ingilizce: 'I eat an apple.', turkce: 'Bir elma yerim.', dogruMu: true, altKonu: kAAn),
      OrnekCumle(ingilizce: 'She wants an egg.', turkce: 'Bir yumurta ister.', dogruMu: true, altKonu: kAAn),
      OrnekCumle(ingilizce: 'He is an engineer.', turkce: 'O bir muhendis.', dogruMu: true, altKonu: kAAn),
      OrnekCumle(ingilizce: 'I waited an hour.', turkce: 'Bir saat bekledim.', dogruMu: true, altKonu: kAAn),
      OrnekCumle(ingilizce: 'It is an old house.', turkce: 'Eski bir ev.', dogruMu: true, altKonu: kAAn),
      OrnekCumle(ingilizce: 'She works at a university.', turkce: 'Bir universitede calisir.', dogruMu: true, altKonu: kAAn),
      OrnekCumle(ingilizce: 'The dog was very big.', turkce: 'Kopek cok buyuktu.', dogruMu: true, altKonu: kBelirli),
      OrnekCumle(ingilizce: 'Close the door.', turkce: 'Kapiyi kapat.', dogruMu: true, altKonu: kBelirli),
      OrnekCumle(ingilizce: 'The sun is hot.', turkce: 'Gunes sicak.', dogruMu: true, altKonu: kBelirli),
      OrnekCumle(ingilizce: 'The book on the table is mine.', turkce: 'Masadaki kitap benim.', dogruMu: true, altKonu: kBelirli),
      OrnekCumle(ingilizce: 'Open the window, please.', turkce: 'Pencereyi ac lutfen.', dogruMu: true, altKonu: kBelirli),
      OrnekCumle(ingilizce: 'The children are in the garden.', turkce: 'Cocuklar bahcede.', dogruMu: true, altKonu: kBelirli),
      OrnekCumle(ingilizce: 'The shop opens at eight.', turkce: 'Dukkan sekizde acilir.', dogruMu: true, altKonu: kBelirli),
      OrnekCumle(ingilizce: 'She is a teacher.', turkce: 'O bir ogretmen.', dogruMu: true, altKonu: kMeslek),
      OrnekCumle(ingilizce: 'He is a doctor.', turkce: 'O bir doktor.', dogruMu: true, altKonu: kMeslek),
      OrnekCumle(ingilizce: 'I am a student.', turkce: 'Ben ogrenciyim.', dogruMu: true, altKonu: kMeslek),
      OrnekCumle(ingilizce: 'My sister is a nurse.', turkce: 'Kiz kardesim hemsire.', dogruMu: true, altKonu: kMeslek),
      OrnekCumle(ingilizce: 'They are teachers.', turkce: 'Onlar ogretmen.', dogruMu: true, altKonu: kMeslek),
      OrnekCumle(ingilizce: 'I drink water.', turkce: 'Su icerim.', dogruMu: true, altKonu: kArtikelsiz),
      OrnekCumle(ingilizce: 'We eat bread every day.', turkce: 'Her gun ekmek yeriz.', dogruMu: true, altKonu: kArtikelsiz),
      OrnekCumle(ingilizce: 'I like books.', turkce: 'Kitap severim.', dogruMu: true, altKonu: kArtikelsiz),
      OrnekCumle(ingilizce: 'She lives in Ankara.', turkce: 'Ankara\u2019da yasar.', dogruMu: true, altKonu: kArtikelsiz),
      OrnekCumle(ingilizce: 'Children play outside.', turkce: 'Cocuklar disarida oynar.', dogruMu: true, altKonu: kArtikelsiz),
      OrnekCumle(ingilizce: 'I need money.', turkce: 'Paraya ihtiyacim var.', dogruMu: true, altKonu: kArtikelsiz),
      OrnekCumle(ingilizce: 'He speaks English.', turkce: 'Ingilizce konusur.', dogruMu: true, altKonu: kArtikelsiz),

      OrnekCumle(ingilizce: 'I saw dog.', turkce: 'Bir kopek gordum.', dogruMu: false,
        neden: 'Tekil sayilabilir isim yalniz duramaz. Ilk kez soz ediliyorsa '
            'a/an gerekir.', dogruBicim: 'I saw a dog.',
        hataTuru: 'GRAMER_HATASI', altKonu: kBelirsiz),
      OrnekCumle(ingilizce: 'She has car.', turkce: 'Onun arabasi var.', dogruMu: false,
        neden: 'Turkcede artikel yok, Ingilizcede ZORUNLU.',
        dogruBicim: 'She has a car.', hataTuru: 'GRAMER_HATASI', altKonu: kBelirsiz),
      OrnekCumle(ingilizce: 'He reads book.', turkce: 'Kitap okur.', dogruMu: false,
        neden: 'Tekil isimden once belirleyici gerekir.',
        dogruBicim: 'He reads a book.', hataTuru: 'GRAMER_HATASI', altKonu: kBelirsiz),
      OrnekCumle(ingilizce: 'I eat a apple.', turkce: 'Bir elma yerim.', dogruMu: false,
        neden: '"apple" sesli sesle baslar; "an" gerekir.',
        dogruBicim: 'I eat an apple.', hataTuru: 'GRAMER_HATASI', altKonu: kAAn),
      OrnekCumle(ingilizce: 'She wants a egg.', turkce: 'Bir yumurta ister.', dogruMu: false,
        neden: 'Sesli ses -> an.', dogruBicim: 'She wants an egg.',
        hataTuru: 'GRAMER_HATASI', altKonu: kAAn),
      OrnekCumle(ingilizce: 'He is a engineer.', turkce: 'O bir muhendis.', dogruMu: false,
        neden: '"engineer" sesli sesle baslar -> an.',
        dogruBicim: 'He is an engineer.', hataTuru: 'GRAMER_HATASI', altKonu: kAAn),
      OrnekCumle(ingilizce: 'I waited a hour.', turkce: 'Bir saat bekledim.', dogruMu: false,
        neden: '"hour" h ile yazilir ama "aur" okunur. Kural YAZIMA degil '
            'SESE bakar.', dogruBicim: 'I waited an hour.',
        hataTuru: 'GRAMER_HATASI', altKonu: kAAn),
      OrnekCumle(ingilizce: 'She works at an university.', turkce: 'Bir universitede calisir.', dogruMu: false,
        neden: '"university" u ile yazilir ama "yuni" okunur; sessiz ses -> a.',
        dogruBicim: 'She works at a university.', hataTuru: 'GRAMER_HATASI', altKonu: kAAn),
      OrnekCumle(ingilizce: 'She is teacher.', turkce: 'O ogretmen.', dogruMu: false,
        neden: 'Meslek belirtirken artikel DUSMEZ. Turkcedeki "O ogretmen" '
            'yapisi yaniltiyor.', dogruBicim: 'She is a teacher.',
        hataTuru: 'GRAMER_HATASI', altKonu: kMeslek),
      OrnekCumle(ingilizce: 'He is doctor.', turkce: 'O doktor.', dogruMu: false,
        neden: 'Tanim cumlesinde a/an zorunludur.', dogruBicim: 'He is a doctor.',
        hataTuru: 'GRAMER_HATASI', altKonu: kMeslek),
      OrnekCumle(ingilizce: 'I am student.', turkce: 'Ogrenciyim.', dogruMu: false,
        neden: 'Meslek/tanim -> a gerekir.', dogruBicim: 'I am a student.',
        hataTuru: 'GRAMER_HATASI', altKonu: kMeslek),
      OrnekCumle(ingilizce: 'They are a teachers.', turkce: 'Onlar ogretmen.', dogruMu: false,
        neden: '"a" yalnizca TEKIL isimle kullanilir; cogulda artikel yok.',
        dogruBicim: 'They are teachers.', hataTuru: 'GRAMER_HATASI', altKonu: kMeslek),
      OrnekCumle(ingilizce: 'I drink a water.', turkce: 'Su icerim.', dogruMu: false,
        neden: '"water" sayilamayan bir isimdir; a/an almaz.',
        dogruBicim: 'I drink water.', hataTuru: 'GRAMER_HATASI', altKonu: kArtikelsiz),
      OrnekCumle(ingilizce: 'I need a money.', turkce: 'Paraya ihtiyacim var.', dogruMu: false,
        neden: '"money" sayilamaz; artikel almaz.', dogruBicim: 'I need money.',
        hataTuru: 'GRAMER_HATASI', altKonu: kArtikelsiz),
      OrnekCumle(ingilizce: 'I like the books.', turkce: 'Kitap severim.', dogruMu: false,
        neden: 'Genel anlamda cogul isim artikel almaz. "the books" belirli '
            'kitaplar demektir.', dogruBicim: 'I like books.',
        hataTuru: 'ANLAM_FARKI', altKonu: kArtikelsiz),
      OrnekCumle(ingilizce: 'She lives in the Ankara.', turkce: 'Ankara\u2019da yasar.', dogruMu: false,
        neden: 'Sehir adlari gibi ozel isimler artikel almaz.',
        dogruBicim: 'She lives in Ankara.', hataTuru: 'GRAMER_HATASI', altKonu: kArtikelsiz),
      OrnekCumle(ingilizce: 'Close a door.', turkce: 'Kapiyi kapat.', dogruMu: false,
        neden: 'Hangi kapi oldugu belli; belirli artikel gerekir.',
        dogruBicim: 'Close the door.', hataTuru: 'ANLAM_FARKI', altKonu: kBelirli),
      OrnekCumle(ingilizce: 'A sun is hot.', turkce: 'Gunes sicak.', dogruMu: false,
        neden: 'Dunyada tek tane olan seyler "the" alir.',
        dogruBicim: 'The sun is hot.', hataTuru: 'GRAMER_HATASI', altKonu: kBelirli),
      OrnekCumle(ingilizce: 'I saw a dog. A dog was big.', turkce: 'Bir kopek gordum. Kopek buyuktu.', dogruMu: false,
        neden: 'Ikinci anista artik hangisi oldugu bilinir -> the.',
        dogruBicim: 'I saw a dog. The dog was big.', hataTuru: 'ANLAM_FARKI', altKonu: kBelirli),
      OrnekCumle(ingilizce: 'Open window, please.', turkce: 'Pencereyi ac lutfen.', dogruMu: false,
        neden: 'Ortamda belirli bir pencere var; "the" gerekir.',
        dogruBicim: 'Open the window, please.', hataTuru: 'GRAMER_HATASI', altKonu: kBelirli),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kBelirsiz,
        soru: 'I saw ___ dog.', secenekler: <String>['a', 'an', '-'],
        kabuller: <String>['a'], geriDonusKodu: 'E3', aciklama: 'Ilk kez soz ediliyor.'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kAAn,
        soru: 'I eat ___ apple.', secenekler: <String>['a', 'an', '-'],
        kabuller: <String>['an'], geriDonusKodu: 'E2', aciklama: 'Sesli ses -> an.'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kAAn,
        soru: 'I waited ___ hour.', secenekler: <String>['a', 'an', '-'],
        kabuller: <String>['an'], geriDonusKodu: 'E2', aciklama: 'h okunmaz.'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kMeslek,
        soru: 'She is ___ teacher.', secenekler: <String>['a', 'the', '-'],
        kabuller: <String>['a'], geriDonusKodu: 'E5', aciklama: 'Meslekte zorunlu.'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kArtikelsiz,
        soru: 'I drink ___ water.', secenekler: <String>['a', 'the', '-'],
        kabuller: <String>['-'], geriDonusKodu: 'E6', aciklama: 'Sayilamayan isim.'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kBelirsiz,
        soru: 'She has ___ car.', kabuller: <String>['a']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kAAn,
        soru: 'He is ___ engineer.', kabuller: <String>['an']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kBelirli,
        soru: 'Close ___ door.', kabuller: <String>['the']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kBelirli,
        soru: '___ sun is hot.', kabuller: <String>['The', 'the']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.eslestirme, altKonu: kAAn,
        soru: '"university" kelimesinden once hangisi gelir?',
        secenekler: <String>['a', 'an', 'the'], kabuller: <String>['a']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kAAn,
        soru: '"old house" ifadesinden once hangisi gelir?',
        secenekler: <String>['a', 'an', '-'], kabuller: <String>['an']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.kelimeDizme, altKonu: kMeslek,
        soru: 'Dizin: a / She / teacher / is',
        kabuller: <String>['She is a teacher.', 'She is a teacher']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.surukleBirak, altKonu: kBelirli,
        soru: 'Dizin: is / The / mine / book',
        kabuller: <String>['The book is mine.', 'The book is mine']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.dogruYanlis, altKonu: kMeslek,
        soru: '"He is doctor." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kArtikelsiz,
        soru: '"I need a money." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kMeslek, turkce: 'O bir doktor.',
        kabuller: <String>['He is a doctor.', 'She is a doctor.']),
      SerbestGorev(kod: 'SU-2', altKonu: kAAn, turkce: 'Bir elma yerim.',
        kabuller: <String>['I eat an apple.']),
      SerbestGorev(kod: 'SU-3', altKonu: kBelirli, turkce: 'Pencereyi ac.',
        kabuller: <String>['Open the window.']),
      SerbestGorev(kod: 'SU-4', altKonu: kArtikelsiz, turkce: 'Su icerim.',
        kabuller: <String>['I drink water.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kBelirsiz,
        soru: 'There is ___ shop here.', kabuller: <String>['a']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kAAn,
        soru: 'She wants ___ egg.', kabuller: <String>['an']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kBelirli,
        soru: '___ children are in the garden.', kabuller: <String>['The', 'the']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.boslukDoldurma, altKonu: kMeslek,
        soru: 'I am ___ student.', kabuller: <String>['a']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.coktanSecmeli, altKonu: kArtikelsiz,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I like the books.', 'I like books.', 'I like a books.'],
        kabuller: <String>['I like books.']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kAAn,
        soru: '"a hour" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kBelirsiz,
        soru: 'Dizin: a / I / dog / saw',
        kabuller: <String>['I saw a dog.', 'I saw a dog']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kArtikelsiz,
        soru: 'She lives in ___ Ankara.', kabuller: <String>['-']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kBelirsiz,
        soru: 'I need ___ pen.', secenekler: <String>['a', 'an', 'the'],
        kabuller: <String>['a']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kAAn,
        soru: 'It is ___ old house.', secenekler: <String>['a', 'an', 'the'],
        kabuller: <String>['an']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kAAn,
        soru: 'She works at ___ university.', secenekler: <String>['a', 'an', 'the'],
        kabuller: <String>['a']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kBelirli,
        soru: '___ shop opens at eight.', secenekler: <String>['A', 'An', 'The'],
        kabuller: <String>['The']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kMeslek,
        soru: 'My sister is ___ nurse.', secenekler: <String>['a', 'an', '-'],
        kabuller: <String>['a']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kBelirsiz,
        soru: 'He reads ___ book.', kabuller: <String>['a']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kBelirli,
        soru: 'The book on ___ table is mine.', kabuller: <String>['the']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kArtikelsiz,
        soru: 'We eat ___ bread every day.', kabuller: <String>['-']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kMeslek,
        soru: '"She is teacher." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kArtikelsiz,
        soru: '"I drink a water." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kMeslek,
        soru: '"They are a teachers." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kBelirli,
        soru: 'Dizin: door / Close / the',
        kabuller: <String>['Close the door.', 'Close the door']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kMeslek,
        soru: 'Ingilizceye cevirin: Ben ogrenciyim.',
        kabuller: <String>['I am a student.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kAAn,
        soru: 'Ingilizceye cevirin: Bir saat bekledim.',
        kabuller: <String>['I waited an hour.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kArtikelsiz,
        soru: 'Ingilizceye cevirin: Kitap severim.',
        kabuller: <String>['I like books.']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'a / an secimi',
        aciklama: 'Kural YAZIMA degil SESE bakar. Sesli ses -> an, sessiz ses -> a.',
        ornek: 'an apple · an hour · a university'),
      OzetMaddesi(baslik: 'a/an: ilk kez soz edilen',
        aciklama: 'Dinleyen hangisini kastettiginizi henuz bilmiyorsa.',
        ornek: 'I saw a dog.'),
      OzetMaddesi(baslik: 'the: hangisi oldugu belli',
        aciklama: 'Daha once anildi · ortamda tek · dunyada tek.',
        ornek: 'The dog was big. · Close the door. · The sun'),
      OzetMaddesi(baslik: 'Meslek ve tanimda ZORUNLU',
        aciklama: 'Turkcede "O ogretmen" yeterli, Ingilizcede degil.',
        ornek: 'She is a teacher. (She is teacher. YANLIS)'),
      OzetMaddesi(baslik: 'Artikel gerekmeyen durumlar',
        aciklama: 'Genel cogul · sayilamayan isim · ozel isim.',
        ornek: 'I like books. · I drink water. · in Ankara'),
      OzetMaddesi(baslik: 'Tekil isim yalniz duramaz',
        aciklama: 'Onunde a, an, the, my, this gibi bir belirleyici olur.',
        ornek: 'I saw dog. (X) -> I saw a dog.'),
    ],
  );
}
