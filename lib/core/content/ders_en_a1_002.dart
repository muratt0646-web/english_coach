/// EN-A1-002 — To Be (am / is / are)
///
/// SADECE VERI. Is mantigi yok. Yeni ders eklemek icin bunun gibi bir
/// dosya yazmak yeterlidir; DersMotoru ve SablonDersEkrani DEGISMEZ.
library;

import '../model/ders_sablonu.dart';

class DersEnA1002 {
  const DersEnA1002._();

  // Alt konu kodlari — zayif konu analizi bunlarla yapilir.
  static const String kAm = 'am (I)';
  static const String kIs = 'is (he/she/it)';
  static const String kAre = 'are (you/we/they)';
  static const String kOlumsuz = 'Olumsuz cumle';
  static const String kSoru = 'Soru cumlesi';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A1-002',
    baslik: 'To Be — am / is / are',
    seviye: 'A1',
    konu: 'YAP',
    tahminiDk: 35,
    girisMetni:
        'Turkcede "Ben ogrenciyim" dersin. Cumlede ayri bir fiil yoktur; '
        '"-im" eki her seyi anlatir.\n\n'
        'Ingilizcede bu ek YOKTUR. Onun yerine ayri bir kelime kullanilir: '
        'am, is veya are.\n\n'
        '"I student" demek, Turkcede "Ben ogrenci" demek gibidir — '
        'eksik ve anlasilmaz.\n\n'
        'Bu derste hangi ozne ile hangisinin kullanildigini ve NEDEN oyle '
        'oldugunu ogreneceksin.',
    kazanimlar: <String>[
      'am / is / are arasindaki farki secebilmek',
      'Olumlu cumle kurabilmek',
      'Olumsuz cumle kurabilmek (not)',
      'Soru cumlesi kurabilmek (ters sira)',
      'Turkce "-im / -sin / -dir" ekleriyle iliskiyi gormek',
    ],

    // ================= 2. KONU ANLATIMI =================
    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(
        kod: 'A1', baslik: 'Neden ayri bir kelime gerekiyor?',
        govde: 'Turkcede yuklem ek alir: ogrenci-YIM, mutlu-SUN, '
            'ogretmen-DIR.\n\n'
            'Ingilizcede isim ve sifat ek almaz. Cumleyi ayakta tutan '
            'kelime ayri yazilir: am / is / are.\n\n'
            'Bu kelime "olmak" anlamini tasir ama Turkcede gorunmez '
            'oldugu icin siklikla unutulur.',
        turkceKarsilastirma: 'Ben ogrenciyim.  ->  I am a student.\n'
            'Ek "-yim"        ->  ayri kelime "am"',
      ),
      AnlatimBlogu(
        kod: 'A2', baslik: 'I am — neden "am"?',
        govde: '"am" YALNIZCA "I" oznesiyle kullanilir. Baska hicbir ozne '
            'ile gelmez.\n\n'
            'Bunu ezberlemek yerine soyle dusun: "I" tek basina, ozel bir '
            'ozne. Kendi kelimesi var.',
        turkceKarsilastirma: 'Ben mutluyum.  ->  I am happy.',
      ),
      AnlatimBlogu(
        kod: 'A3', baslik: 'He / She / It is — neden "is"?',
        govde: 'Tek bir kisi veya tek bir sey anlatiliyorsa "is" gelir: '
            'he, she, it.\n\n'
            'Ozel isimler de buraya girer: Ali IS a teacher. Cunku Ali = he.\n\n'
            'Tekil bir isim de ayni gruptadir: The book IS new.',
        turkceKarsilastirma: 'O ogretmen.  ->  She is a teacher.\n'
            'Kitap yeni.  ->  The book is new.',
      ),
      AnlatimBlogu(
        kod: 'A4', baslik: 'You / We / They are — neden "are"?',
        govde: 'Birden fazla kisi veya sey varsa "are" gelir: we, they.\n\n'
            'Dikkat: "you" tek kisi icin de kullanilsa "are" alir. '
            'Ingilizcede "you" hem sen hem siz demektir.\n\n'
            'Cogul isimler de buraya girer: The books ARE new.',
        turkceKarsilastirma: 'Sen mutlusun.  ->  You are happy.\n'
            'Onlar ogrenci.  ->  They are students.',
      ),
      AnlatimBlogu(
        kod: 'A5', baslik: 'Olumsuz: not nereye gelir?',
        govde: 'Olumsuzluk kelimesi "not", am/is/are\'den HEMEN SONRA '
            'gelir.\n\n'
            'I am not · He is not · They are not\n\n'
            'Kisa yazim: isn\'t, aren\'t. "am not" kisalmaz.',
        turkceKarsilastirma: 'Ben ogrenci degilim.  ->  I am not a student.',
      ),
      AnlatimBlogu(
        kod: 'A6', baslik: 'Soru: sira ters doner',
        govde: 'Soru sorarken am/is/are cumlenin BASINA gecer. Turkcedeki '
            '"mi" eki gibi ayri bir kelime eklenmez; SIRA degisir.\n\n'
            'You are happy.  ->  Are you happy?\n'
            'She is a doctor.  ->  Is she a doctor?',
        turkceKarsilastirma: 'Sen mutlu musun?  ->  Are you happy?\n'
            'Turkcede ek "mi", Ingilizcede SIRA degisimi.',
      ),
    ],

    // ================= 3. GORSEL ORNEKLER =================
    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(
        adimlar: <String>['I', 'I am', 'I am happy.'],
        turkce: 'Ben mutluyum.',
        not: 'Once ozne, sonra "am", sonra sifat.'),
      AdimliOrnek(
        adimlar: <String>['She', 'She is', 'She is a teacher.'],
        turkce: 'O bir ogretmen.',
        not: 'Tekil ozne -> is. Meslek isminden once "a" gerekir.'),
      AdimliOrnek(
        adimlar: <String>['They', 'They are', 'They are students.'],
        turkce: 'Onlar ogrenci.',
        not: 'Cogul ozne -> are. Isim de cogul olur: students.'),
      AdimliOrnek(
        adimlar: <String>['We', 'We are', 'We are not', 'We are not late.'],
        turkce: 'Biz gec kalmadik.',
        not: '"not" her zaman are/is/am\'den SONRA gelir.'),
      AdimliOrnek(
        adimlar: <String>['Is', 'Is he', 'Is he a doctor?'],
        turkce: 'O doktor mu?',
        not: 'Soruda "is" basa gecer.'),
    ],

    // ================= 4. ADIM ADIM ORNEKLER =================
    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(
        adimlar: <String>[
          'Ben ogretmenim.', 'Kim? -> I', 'I am', 'I am a teacher.'
        ],
        turkce: 'Turkceden Ingilizceye adim adim.',
        not: 'Once ozneyi bul, sonra dogru "to be" bicimini sec.'),
      AdimliOrnek(
        adimlar: <String>[
          'Onlar burada degil.', 'Kim? -> They', 'They are',
          'They are not', 'They are not here.'
        ],
        turkce: 'Olumsuz cumle kurulumu.',
        not: 'Ozne -> are -> not -> geri kalan.'),
      AdimliOrnek(
        adimlar: <String>[
          'Sen hazir misin?', 'Kim? -> You', 'You are',
          'Are you', 'Are you ready?'
        ],
        turkce: 'Soru cumlesi kurulumu.',
        not: 'Once duz cumleyi kur, sonra ilk iki kelimeyi yer degistir.'),
    ],

    // ================= 5. ORNEKLER: 30 DOGRU =================
    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I am a student.', turkce: 'Ben ogrenciyim.', dogruMu: true),
      OrnekCumle(ingilizce: 'I am happy.', turkce: 'Ben mutluyum.', dogruMu: true),
      OrnekCumle(ingilizce: 'I am at home.', turkce: 'Ben evdeyim.', dogruMu: true),
      OrnekCumle(ingilizce: 'I am ready.', turkce: 'Ben hazirim.', dogruMu: true),
      OrnekCumle(ingilizce: 'I am not tired.', turkce: 'Ben yorgun degilim.', dogruMu: true),
      OrnekCumle(ingilizce: 'He is a doctor.', turkce: 'O bir doktor.', dogruMu: true),
      OrnekCumle(ingilizce: 'He is busy today.', turkce: 'O bugun mesgul.', dogruMu: true),
      OrnekCumle(ingilizce: 'She is my sister.', turkce: 'O benim kiz kardesim.', dogruMu: true),
      OrnekCumle(ingilizce: 'She is very kind.', turkce: 'O cok kibar.', dogruMu: true),
      OrnekCumle(ingilizce: 'It is a big city.', turkce: 'O buyuk bir sehir.', dogruMu: true),
      OrnekCumle(ingilizce: 'It is cold outside.', turkce: 'Disarisi soguk.', dogruMu: true),
      OrnekCumle(ingilizce: 'Ali is a teacher.', turkce: 'Ali bir ogretmen.', dogruMu: true),
      OrnekCumle(ingilizce: 'The book is new.', turkce: 'Kitap yeni.', dogruMu: true),
      OrnekCumle(ingilizce: 'The market is open.', turkce: 'Pazar acik.', dogruMu: true),
      OrnekCumle(ingilizce: 'My father is at work.', turkce: 'Babam iste.', dogruMu: true),
      OrnekCumle(ingilizce: 'He is not late.', turkce: 'O gec kalmadi.', dogruMu: true),
      OrnekCumle(ingilizce: 'You are my friend.', turkce: 'Sen benim arkadasimsin.', dogruMu: true),
      OrnekCumle(ingilizce: 'You are right.', turkce: 'Haklisin.', dogruMu: true),
      OrnekCumle(ingilizce: 'We are at school.', turkce: 'Biz okuldayiz.', dogruMu: true),
      OrnekCumle(ingilizce: 'We are hungry.', turkce: 'Biz aciz.', dogruMu: true),
      OrnekCumle(ingilizce: 'They are students.', turkce: 'Onlar ogrenci.', dogruMu: true),
      OrnekCumle(ingilizce: 'They are in the garden.', turkce: 'Onlar bahcede.', dogruMu: true),
      OrnekCumle(ingilizce: 'The books are old.', turkce: 'Kitaplar eski.', dogruMu: true),
      OrnekCumle(ingilizce: 'The children are happy.', turkce: 'Cocuklar mutlu.', dogruMu: true),
      OrnekCumle(ingilizce: 'We are not ready.', turkce: 'Biz hazir degiliz.', dogruMu: true),
      OrnekCumle(ingilizce: 'They are not here.', turkce: 'Onlar burada degil.', dogruMu: true),
      OrnekCumle(ingilizce: 'Are you happy?', turkce: 'Mutlu musun?', dogruMu: true),
      OrnekCumle(ingilizce: 'Is she a doctor?', turkce: 'O doktor mu?', dogruMu: true),
      OrnekCumle(ingilizce: 'Is it expensive?', turkce: 'Pahali mi?', dogruMu: true),
      OrnekCumle(ingilizce: 'Are they at home?', turkce: 'Onlar evde mi?', dogruMu: true),

      OrnekCumle(ingilizce: 'I am twenty years old.', turkce: 'Yirmi yasindayim.',
          dogruMu: true, altKonu: kAm),
      OrnekCumle(ingilizce: 'She is thirty years old.', turkce: 'O otuz yasinda.',
          dogruMu: true, altKonu: kIs),
      OrnekCumle(ingilizce: 'I am Turkish.', turkce: 'Ben Turkum.',
          dogruMu: true, altKonu: kAm),
      OrnekCumle(ingilizce: 'They are English.', turkce: 'Onlar Ingiliz.',
          dogruMu: true, altKonu: kAre),
      OrnekCumle(ingilizce: 'Yes, I am.', turkce: 'Evet, oyleyim. (kisa cevap)',
          dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'No, she is not.', turkce: 'Hayir, degil. (kisa cevap)',
          dogruMu: true, altKonu: kSoru),

      // ================= 20 YANLIS ORNEK =================
      OrnekCumle(ingilizce: 'I are happy.', turkce: 'Ben mutluyum.', dogruMu: false,
          neden: 'Ozne "I" tekildir ve YALNIZCA "am" alir. "are" cogul '
              'ozneler (you/we/they) icindir.', dogruBicim: 'I am happy.'),
      OrnekCumle(ingilizce: 'I is a student.', turkce: 'Ben ogrenciyim.', dogruMu: false,
          neden: '"is" yalnizca he/she/it icindir. "I" ozel bir ozne ve '
              'kendi kelimesi vardir: am.', dogruBicim: 'I am a student.'),
      OrnekCumle(ingilizce: 'I student.', turkce: 'Ben ogrenciyim.', dogruMu: false,
          neden: 'To be fiili DUSMEZ. Turkcedeki "-yim" ekinin karsiligi '
              'ayri bir kelimedir.', dogruBicim: 'I am a student.'),
      OrnekCumle(ingilizce: 'He are busy.', turkce: 'O mesgul.', dogruMu: false,
          neden: '"He" tekildir; tekil ozne "is" alir.', dogruBicim: 'He is busy.'),
      OrnekCumle(ingilizce: 'He am a doctor.', turkce: 'O bir doktor.', dogruMu: false,
          neden: '"am" yalnizca "I" ile kullanilir.', dogruBicim: 'He is a doctor.'),
      OrnekCumle(ingilizce: 'She teacher.', turkce: 'O ogretmen.', dogruMu: false,
          neden: 'To be eksik. Turkcede "O ogretmen" yeterli, Ingilizcede degil.',
          dogruBicim: 'She is a teacher.'),
      OrnekCumle(ingilizce: 'It are cold.', turkce: 'Hava soguk.', dogruMu: false,
          neden: '"It" tekildir; "is" alir.', dogruBicim: 'It is cold.'),
      OrnekCumle(ingilizce: 'Ali are a teacher.', turkce: 'Ali ogretmen.', dogruMu: false,
          neden: 'Ozel isim tek kisidir, yani "he" gibidir: is alir.',
          dogruBicim: 'Ali is a teacher.'),
      OrnekCumle(ingilizce: 'The book are new.', turkce: 'Kitap yeni.', dogruMu: false,
          neden: '"The book" tekil bir isimdir; "is" alir.',
          dogruBicim: 'The book is new.'),
      OrnekCumle(ingilizce: 'You is my friend.', turkce: 'Sen arkadasimsin.', dogruMu: false,
          neden: '"You" tek kisi icin bile "are" alir. Ingilizcede "you" '
              'hem sen hem sizdir.', dogruBicim: 'You are my friend.'),
      OrnekCumle(ingilizce: 'We is hungry.', turkce: 'Biz aciz.', dogruMu: false,
          neden: '"We" cogul; "are" alir.', dogruBicim: 'We are hungry.'),
      OrnekCumle(ingilizce: 'They is students.', turkce: 'Onlar ogrenci.', dogruMu: false,
          neden: '"They" cogul; "are" alir.', dogruBicim: 'They are students.'),
      OrnekCumle(ingilizce: 'The books is old.', turkce: 'Kitaplar eski.', dogruMu: false,
          neden: '"The books" cogul bir isimdir; "are" alir.',
          dogruBicim: 'The books are old.'),
      OrnekCumle(ingilizce: 'I not am happy.', turkce: 'Mutlu degilim.', dogruMu: false,
          neden: '"not" to be fiilinden SONRA gelir, once degil.',
          dogruBicim: 'I am not happy.'),
      OrnekCumle(ingilizce: 'He not is late.', turkce: 'O gec kalmadi.', dogruMu: false,
          neden: 'Sira yanlis: once "is", sonra "not".',
          dogruBicim: 'He is not late.'),
      OrnekCumle(ingilizce: 'They not are here.', turkce: 'Onlar burada degil.', dogruMu: false,
          neden: '"not" her zaman are/is/am\'den sonradir.',
          dogruBicim: 'They are not here.'),
      OrnekCumle(ingilizce: 'You are happy?', turkce: 'Mutlu musun?', dogruMu: false,
          neden: 'Soruda sira DEGISIR: to be basa gecer. Yalnizca soru '
              'isareti koymak yetmez.', dogruBicim: 'Are you happy?'),
      OrnekCumle(ingilizce: 'Do you are ready?', turkce: 'Hazir misin?', dogruMu: false,
          neden: 'To be cumlesinde "do" KULLANILMAZ. To be zaten yardimci '
              'gorevi gorur.', dogruBicim: 'Are you ready?'),
      OrnekCumle(ingilizce: 'Is she doctor?', turkce: 'O doktor mu?', dogruMu: false,
          neden: 'Meslek isminden once "a" gerekir.',
          dogruBicim: 'Is she a doctor?'),
      OrnekCumle(ingilizce: 'Are he at home?', turkce: 'O evde mi?', dogruMu: false,
          neden: 'Soruda da ozne-fiil uyumu korunur: "he" -> "is".',
          dogruBicim: 'Is he at home?', hataTuru: 'GRAMER_HATASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'Yes, I is.', turkce: 'Evet, oyleyim.', dogruMu: false,
          neden: 'Kisa cevapta da ozne ile to be uyumlu olmali: I -> am.',
          dogruBicim: 'Yes, I am.', hataTuru: 'GRAMER_HATASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'I have twenty years.', turkce: 'Yirmi yasindayim.',
          dogruMu: false,
          neden: 'Yas "have" ile degil "be" ile soylenir: I AM twenty years old.',
          dogruBicim: 'I am twenty years old.', hataTuru: 'KELIME_SECIMI',
          altKonu: kAm),
    ],

    // ================= 6. MINI KONTROL =================
    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kAm,
          soru: 'I ___ a student.', secenekler: <String>['am', 'is', 'are'],
          kabuller: <String>['am'], geriDonusKodu: 'A2',
          aciklama: '"I" yalnizca "am" alir.'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kIs,
          soru: 'She ___ my sister.', secenekler: <String>['am', 'is', 'are'],
          kabuller: <String>['is'], geriDonusKodu: 'A3',
          aciklama: 'Tekil ozne -> is.'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kAre,
          soru: 'They ___ students.', secenekler: <String>['am', 'is', 'are'],
          kabuller: <String>['are'], geriDonusKodu: 'A4',
          aciklama: 'Cogul ozne -> are.'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kOlumsuz,
          soru: 'Hangisi dogru?',
          secenekler: <String>['I not am here.', 'I am not here.', 'Not I am here.'],
          kabuller: <String>['I am not here.'], geriDonusKodu: 'A5',
          aciklama: '"not" to be\'den sonra gelir.'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kSoru,
          soru: '"You are ready." cumlesinin sorusu hangisidir?',
          secenekler: <String>['You are ready?', 'Are you ready?', 'Do you are ready?'],
          kabuller: <String>['Are you ready?'], geriDonusKodu: 'A6',
          aciklama: 'Soruda sira degisir.'),
    ],

    // ================= 7. KONTROLLU ALISTIRMALAR =================
    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kAm,
          soru: 'I ___ at home.', kabuller: <String>['am'],
          ipucu: 'Ozne "I".'),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kIs,
          soru: 'The market ___ open.', kabuller: <String>['is'],
          ipucu: 'Tekil isim.'),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kAre,
          soru: 'We ___ hungry.', kabuller: <String>['are'],
          ipucu: 'Cogul ozne.'),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.eslestirme, altKonu: kIs,
          soru: '"It" oznesine hangisi uyar?',
          secenekler: <String>['am', 'is', 'are'], kabuller: <String>['is']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.eslestirme, altKonu: kAre,
          soru: '"You" oznesine hangisi uyar?',
          secenekler: <String>['am', 'is', 'are'], kabuller: <String>['are']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.kelimeDizme, altKonu: kAm,
          soru: 'Kelimeleri dizin: happy / I / am',
          kabuller: <String>['I am happy.', 'I am happy'],
          ipucu: 'Ozne + to be + sifat.'),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.kelimeDizme, altKonu: kOlumsuz,
          soru: 'Kelimeleri dizin: not / They / here / are',
          kabuller: <String>['They are not here.', 'They are not here'],
          ipucu: 'not, are\'den sonra.'),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.surukleBirak, altKonu: kSoru,
          soru: 'Soru kurun: she / a doctor / Is',
          kabuller: <String>['Is she a doctor?', 'Is she a doctor'],
          ipucu: 'To be basa gecer.'),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.coktanSecmeli, altKonu: kIs,
          soru: 'Ali ___ a teacher.', secenekler: <String>['am', 'is', 'are'],
          kabuller: <String>['is'], aciklama: 'Ozel isim = he.'),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kOlumsuz,
          soru: '"He isn\'t late." dogru mu?',
          secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Dogru'],
          aciklama: 'isn\'t = is not.'),
    ],

    // ================= 8. SERBEST URETIM =================
    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kAm, turkce: 'Ben ogrenciyim.',
          kabuller: <String>['I am a student.', 'I am a student'],
          ipucu: 'Meslek isminden once "a".'),
      SerbestGorev(kod: 'SU-2', altKonu: kOlumsuz, turkce: 'O yorgun degil.',
          kabuller: <String>['He is not tired.', 'She is not tired.',
              "He isn't tired.", "She isn't tired."]),
      SerbestGorev(kod: 'SU-3', altKonu: kSoru, turkce: 'Onlar evde mi?',
          kabuller: <String>['Are they at home?', 'Are they home?']),
      SerbestGorev(kod: 'SU-4', altKonu: kAre, turkce: 'Biz arkadasiz.',
          kabuller: <String>['We are friends.', 'We are friends']),
    ],

    // ================= 9. PEKISTIRME =================
    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kAm,
          soru: 'I ___ ready.', kabuller: <String>['am']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kIs,
          soru: 'He ___ my brother.', kabuller: <String>['is']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kAre,
          soru: 'The children ___ happy.', kabuller: <String>['are']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.boslukDoldurma, altKonu: kOlumsuz,
          soru: 'We ___ not late.', kabuller: <String>['are']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.coktanSecmeli, altKonu: kSoru,
          soru: 'Hangisi dogru soru?',
          secenekler: <String>['Is he ready?', 'He is ready?', 'Do he is ready?'],
          kabuller: <String>['Is he ready?']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.kelimeDizme, altKonu: kIs,
          soru: 'Dizin: is / new / The book',
          kabuller: <String>['The book is new.', 'The book is new']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.dogruYanlis, altKonu: kAre,
          soru: '"You is my friend." dogru mu?',
          secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kAm,
          soru: 'I ___ not tired.', kabuller: <String>['am']),
    ],

    // ================= 10. MINI SINAV — 15 SORU =================
    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kAm,
          soru: 'I ___ happy.', secenekler: <String>['am', 'is', 'are'],
          kabuller: <String>['am']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kIs,
          soru: 'It ___ cold.', secenekler: <String>['am', 'is', 'are'],
          kabuller: <String>['is']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kAre,
          soru: 'You ___ right.', secenekler: <String>['am', 'is', 'are'],
          kabuller: <String>['are']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kIs,
          soru: 'My father ___ at work.', secenekler: <String>['am', 'is', 'are'],
          kabuller: <String>['is']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kAre,
          soru: 'The books ___ old.', secenekler: <String>['am', 'is', 'are'],
          kabuller: <String>['are']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kAm,
          soru: 'I ___ at school.', kabuller: <String>['am']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kIs,
          soru: 'She ___ very kind.', kabuller: <String>['is']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kAre,
          soru: 'They ___ in the garden.', kabuller: <String>['are']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kOlumsuz,
          soru: '"I not am here." dogru mu?',
          secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kSoru,
          soru: '"Do you are ready?" dogru mu?',
          secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.kelimeDizme, altKonu: kOlumsuz,
          soru: 'Dizin: not / He / late / is',
          kabuller: <String>['He is not late.', 'He is not late']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kSoru,
          soru: 'Dizin: they / Are / at home',
          kabuller: <String>['Are they at home?', 'Are they at home']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kAm,
          soru: 'Ingilizceye cevirin: Ben hazirim.',
          kabuller: <String>['I am ready.', 'I am ready']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kIs,
          soru: 'Ingilizceye cevirin: O bir doktor.',
          kabuller: <String>['He is a doctor.', 'She is a doctor.',
              'He is a doctor', 'She is a doctor']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kSoru,
          soru: 'Ingilizceye cevirin: Sen mutlu musun?',
          kabuller: <String>['Are you happy?', 'Are you happy']),
    ],

    // ================= 11. DERS OZETI =================
    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'am', aciklama: 'Yalnizca "I" oznesiyle.',
          ornek: 'I am a student.'),
      OzetMaddesi(baslik: 'is', aciklama: 'he / she / it ve tekil isimler.',
          ornek: 'She is a teacher. · The book is new.'),
      OzetMaddesi(baslik: 'are', aciklama: 'you / we / they ve cogul isimler.',
          ornek: 'They are students. · You are right.'),
      OzetMaddesi(baslik: 'Olumlu cumle', aciklama: 'Ozne + am/is/are + geri kalan.',
          ornek: 'We are at school.'),
      OzetMaddesi(baslik: 'Olumsuz cumle', aciklama: '"not" to be\'den SONRA gelir.',
          ornek: 'He is not late. · I am not tired.'),
      OzetMaddesi(baslik: 'Soru cumlesi', aciklama: 'To be basa gecer; "do" kullanilmaz.',
          ornek: 'Are you happy? · Is she a doctor?'),
    ],
  );
}
