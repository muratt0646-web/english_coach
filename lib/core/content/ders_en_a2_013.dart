/// EN-A2-013 — there is / there are: Zaman ve Miktar (A2)
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnA2013 {
  const DersEnA2013._();

  static const String kGecmis = 'Gecmis: there was / were';
  static const String kGelecek = 'Gelecek: there will be';
  static const String kMiktar = 'Miktar kelimeleriyle';
  static const String kThereIt = 'there is / it is farki';
  static const String kModal = 'Modal ile kullanim';
  static const String kUyum = 'Liste ve uyum';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A2-013',
    baslik: 'there is / there are — Zaman ve Miktar',
    seviye: 'A2', konu: 'YAP', tahminiDk: 35,
    onKosullar: <String>['EN-A1-023', 'EN-A2-001', 'EN-A2-012'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'A1\u2019de "there is / there are" kalibini ogrendiniz. Turkcedeki '
        '"var" karsiligiydi.\n\n'
        'Turkcede zaman degisince yalnizca EK degisir; kelime aynidir:\n\n'
        '  var · var-DI · ol-ACAK\n\n'
        'Ingilizcede "there" hic degismez; degisen BE fiilidir:\n\n'
        '  there IS · there WAS · there WILL BE\n\n'
        'Yani kalibin sabit parcasi "there", degisken parcasi "be".\n\n'
        'DUSUNME NOTU: Bu, ogrendiginiz her zamanin ayni kalipta '
        'calistigi anlamina gelir. Yeni kural yok — yalnizca be fiilini '
        'dogru zamana koyun.\n\n'
        'Bu derste ayrica cok karistirilan bir ayrimi netlestirecegiz:\n\n'
        '  There is a problem.  -> Bir sorun VAR.  (varlik)\n'
        '  It is a problem.     -> Bu bir sorun.   (tanimlama)',
    kazanimlar: <String>[
      'there was / there were kullanabilmek',
      'there will be ile gelecek kurabilmek',
      'some / any / much / many ile birlikte kullanmak',
      'there is ile it is arasindaki farki gormek',
      'Modal fiillerle kullanmak (there might be)',
      'Liste halinde ilk ogeye gore uyum kurmak',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'Y1', baslik: 'Degisen "be", sabit "there"',
        govde: 'Kalibin iki parcasi vardir ve yalnizca biri degisir:\n\n'
            '  THERE + be\n'
            '  sabit   degisken\n\n'
            '  Simdiki: there is / there are\n'
            '  Gecmis:  there was / there were\n'
            '  Gelecek: there will be\n\n'
            'Turkcede "var" kelimesi ek alir (var-di); Ingilizcede '
            '"there" hic degismez.\n\n'
            'DUSUNME ALISKANLIGI: Once zamani belirleyin, sonra be '
            'fiilini o zamana gore secin. "there" hep ayni kalir.',
        turkceKarsilastirma: 'Bir sorun vardi.  ->  There was a problem.\n'
            'Ek "-di"           ->  be degisti'),
      AnlatimBlogu(kod: 'Y2', baslik: 'Gecmis: was / were',
        govde: 'A2-001\u2019deki secim burada da gecerlidir:\n\n'
            '  Tekil isim  -> there WAS\n'
            '     There was a car in the garden.\n'
            '     There was no time.\n\n'
            '  Cogul isim  -> there WERE\n'
            '     There were three books on the table.\n'
            '     There were many people at the party.\n\n'
            'Sayilamayan isimler her zaman "was" alir:\n'
            '     There was water in the glass.\n\n'
            'Olumsuz: there was not / there were not\n'
            'Soru:    Was there...? / Were there...?',
        turkceKarsilastirma: 'Masada uc kitap vardi.\n'
            'There were three books on the table.'),
      AnlatimBlogu(kod: 'Y3', baslik: 'Gelecek: there will be',
        govde: 'Gelecekte tek bicim vardir; tekil-cogul ayrimi YOK:\n\n'
            '  There WILL BE a meeting tomorrow.\n'
            '  There WILL BE many people there.\n\n'
            'Cunku "will" ozneye gore degismez (A2-008).\n\n'
            'Alternatif: there is going to be\n'
            '  There is going to be a storm. (kanit var)\n\n'
            'Olumsuz: there will not be / there won\u2019t be\n'
            'Soru:    Will there be...?\n\n'
            'PRATIK SONUC: Gelecekte secim yapmaniza gerek yok. '
            'Gecmis ve simdikiden daha kolay.',
        turkceKarsilastirma: 'Yarin bir toplanti olacak.\n'
            'There will be a meeting tomorrow.'),
      AnlatimBlogu(kod: 'Y4', baslik: 'Miktar kelimeleriyle',
        govde: 'A2-011 ve A2-012\u2019deki kurallar aynen isler:\n\n'
            '  There are SOME books here.        (olumlu, cogul)\n'
            '  There is SOME water in the glass. (olumlu, sayilamaz)\n'
            '  There aren\u2019t ANY books here.      (olumsuz)\n'
            '  Are there ANY questions?          (soru)\n'
            '  There are MANY people here.       (sayilabilir)\n'
            '  There isn\u2019t MUCH time.            (sayilamaz)\n\n'
            'Soru kalibi: How many / How much + isim + are/is there\n'
            '  How many books are there?\n'
            '  How much time is there?',
        turkceKarsilastirma: 'Kac kitap var?  ->  How many books are there?'),
      AnlatimBlogu(kod: 'Y5', baslik: 'there is mi it is mi?',
        govde: 'Cok karistirilan bir ayrim:\n\n'
            '  THERE IS -> bir seyin VAR OLDUGUNU bildirir\n'
            '     There is a problem.  (Bir sorun var.)\n'
            '     There is a book on the table.\n\n'
            '  IT IS -> bilinen bir seyi TANIMLAR\n'
            '     It is a problem.  (Bu bir sorun.)\n'
            '     It is cold today. (Hava soguk.)\n\n'
            'KURAL: Ilk kez soz ediyorsaniz "there is"; zaten bilinen '
            'bir seyden bahsediyorsaniz "it is".\n\n'
            'Sik hata: hava, saat ve mesafe icin "there is" kullanmak.\n'
            '  There is cold today.  -> YANLIS\n'
            '  It is cold today.     -> DOGRU',
        turkceKarsilastirma: 'Bir sorun var.  ->  There is a problem.\n'
            'Hava soguk.     ->  It is cold.'),
      AnlatimBlogu(kod: 'Y6', baslik: 'Modal ile ve liste uyumu',
        govde: 'Modal fiillerle "there be" yapisi korunur:\n\n'
            '  There might be a problem.   (olabilir)\n'
            '  There should be a solution. (olmali)\n'
            '  There must be a mistake.    (olmali, kesin)\n'
            '  There can be delays.        (olabilir)\n\n'
            'Modal\u2019den sonra her zaman yalin "be" gelir; is/are gelmez.\n\n'
            'LISTE UYUMU: Birden fazla sey sayarken ILK ogeye bakilir:\n\n'
            '  There IS a book and two pens.   (ilk oge tekil)\n'
            '  There ARE two pens and a book.  (ilk oge cogul)',
        turkceKarsilastirma: 'Bir sorun olabilir.  ->  There might be a problem.'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['there is', 'there was', 'There was a problem.'],
        turkce: 'Bir sorun vardi.', not: '"there" sabit, be degisti.'),
      AdimliOrnek(adimlar: <String>['three books', 'there were', 'There were three books.'],
        turkce: 'Uc kitap vardi.', not: 'Cogul -> were.'),
      AdimliOrnek(adimlar: <String>['there will be', 'a meeting', 'There will be a meeting.'],
        turkce: 'Bir toplanti olacak.', not: 'Gelecekte tek bicim.'),
      AdimliOrnek(adimlar: <String>['There is a problem.', 'It is a problem.'],
        turkce: 'Sorun var. / Bu bir sorun.', not: 'Varlik / tanimlama.'),
      AdimliOrnek(adimlar: <String>['there', 'there might', 'There might be a problem.'],
        turkce: 'Bir sorun olabilir.', not: 'Modal + yalin be.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Partide cok insan vardi.', 'Zaman: gecmis', 'people = cogul -> were',
        'There were many people at the party.'],
        turkce: 'Once zaman, sonra sayi.', not: 'there was YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Yarin toplanti olacak.', 'Zaman: gelecek', 'there will be',
        'There will be a meeting tomorrow.'],
        turkce: 'Gelecekte secim yok.', not: 'there will are YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Bugun hava soguk.', 'Varlik mi tanimlama mi?', 'Tanimlama -> It is',
        'It is cold today.'],
        turkce: 'Hava icin "it is".', not: 'There is cold YANLIS.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'There was a car in the garden.', turkce: 'Bahcede bir araba vardi.', dogruMu: true, altKonu: kGecmis),
      OrnekCumle(ingilizce: 'There was no time.', turkce: 'Zaman yoktu.', dogruMu: true, altKonu: kGecmis),
      OrnekCumle(ingilizce: 'There were three books on the table.', turkce: 'Masada uc kitap vardi.', dogruMu: true, altKonu: kGecmis),
      OrnekCumle(ingilizce: 'There were many people at the party.', turkce: 'Partide cok insan vardi.', dogruMu: true, altKonu: kGecmis),
      OrnekCumle(ingilizce: 'There was water in the glass.', turkce: 'Bardakta su vardi.', dogruMu: true, altKonu: kGecmis),
      OrnekCumle(ingilizce: 'Was there a problem?', turkce: 'Bir sorun var miydi?', dogruMu: true, altKonu: kGecmis),
      OrnekCumle(ingilizce: 'Were there any students?', turkce: 'Hic ogrenci var miydi?', dogruMu: true, altKonu: kGecmis),
      OrnekCumle(ingilizce: 'There will be a meeting tomorrow.', turkce: 'Yarin bir toplanti olacak.', dogruMu: true, altKonu: kGelecek),
      OrnekCumle(ingilizce: 'There will be many people there.', turkce: 'Orada cok insan olacak.', dogruMu: true, altKonu: kGelecek),
      OrnekCumle(ingilizce: "There won't be any problems.", turkce: 'Hicbir sorun olmayacak.', dogruMu: true, altKonu: kGelecek),
      OrnekCumle(ingilizce: 'Will there be enough time?', turkce: 'Yeterli zaman olacak mi?', dogruMu: true, altKonu: kGelecek),
      OrnekCumle(ingilizce: 'There is going to be a storm.', turkce: 'Firtina olacak.', dogruMu: true, altKonu: kGelecek),
      OrnekCumle(ingilizce: 'There are some books here.', turkce: 'Burada birkac kitap var.', dogruMu: true, altKonu: kMiktar),
      OrnekCumle(ingilizce: 'There is some water in the glass.', turkce: 'Bardakta biraz su var.', dogruMu: true, altKonu: kMiktar),
      OrnekCumle(ingilizce: "There aren't any books here.", turkce: 'Burada hic kitap yok.', dogruMu: true, altKonu: kMiktar),
      OrnekCumle(ingilizce: 'Are there any questions?', turkce: 'Hic soru var mi?', dogruMu: true, altKonu: kMiktar),
      OrnekCumle(ingilizce: 'There are many people here.', turkce: 'Burada cok insan var.', dogruMu: true, altKonu: kMiktar),
      OrnekCumle(ingilizce: "There isn't much time.", turkce: 'Fazla zaman yok.', dogruMu: true, altKonu: kMiktar),
      OrnekCumle(ingilizce: 'How many books are there?', turkce: 'Kac kitap var?', dogruMu: true, altKonu: kMiktar),
      OrnekCumle(ingilizce: 'How much time is there?', turkce: 'Ne kadar zaman var?', dogruMu: true, altKonu: kMiktar),
      OrnekCumle(ingilizce: 'There is a problem.', turkce: 'Bir sorun var.', dogruMu: true, altKonu: kThereIt),
      OrnekCumle(ingilizce: 'It is a problem.', turkce: 'Bu bir sorun.', dogruMu: true, altKonu: kThereIt),
      OrnekCumle(ingilizce: 'It is cold today.', turkce: 'Bugun hava soguk.', dogruMu: true, altKonu: kThereIt),
      OrnekCumle(ingilizce: 'It is five o\u2019clock.', turkce: 'Saat bes.', dogruMu: true, altKonu: kThereIt),
      OrnekCumle(ingilizce: 'There is a book on the table. It is new.', turkce: 'Masada bir kitap var. Yeni.', dogruMu: true, altKonu: kThereIt),
      OrnekCumle(ingilizce: 'There might be a problem.', turkce: 'Bir sorun olabilir.', dogruMu: true, altKonu: kModal),
      OrnekCumle(ingilizce: 'There should be a solution.', turkce: 'Bir cozum olmali.', dogruMu: true, altKonu: kModal),
      OrnekCumle(ingilizce: 'There must be a mistake.', turkce: 'Bir hata olmali.', dogruMu: true, altKonu: kModal),
      OrnekCumle(ingilizce: 'There is a book and two pens.', turkce: 'Bir kitap ve iki kalem var.', dogruMu: true, altKonu: kUyum),
      OrnekCumle(ingilizce: 'There are two pens and a book.', turkce: 'Iki kalem ve bir kitap var.', dogruMu: true, altKonu: kUyum),

      OrnekCumle(ingilizce: 'There were a car in the garden.', turkce: 'Bahcede bir araba vardi.', dogruMu: false,
        neden: 'Tekil isim "there was" alir.', dogruBicim: 'There was a car in the garden.',
        hataTuru: 'GRAMER_HATASI', altKonu: kGecmis),
      OrnekCumle(ingilizce: 'There was three books on the table.', turkce: 'Masada uc kitap vardi.', dogruMu: false,
        neden: 'Cogul isim "there were" alir.',
        dogruBicim: 'There were three books on the table.', hataTuru: 'GRAMER_HATASI', altKonu: kGecmis),
      OrnekCumle(ingilizce: 'There were water in the glass.', turkce: 'Bardakta su vardi.', dogruMu: false,
        neden: 'Sayilamayan isim her zaman "was" alir.',
        dogruBicim: 'There was water in the glass.', hataTuru: 'GRAMER_HATASI', altKonu: kGecmis),
      OrnekCumle(ingilizce: 'There had a car in the garden.', turkce: 'Bahcede bir araba vardi.', dogruMu: false,
        neden: 'Varlik bildirirken "have/had" kullanilmaz.',
        dogruBicim: 'There was a car in the garden.', hataTuru: 'KELIME_SECIMI', altKonu: kGecmis),
      OrnekCumle(ingilizce: 'Did there be a problem?', turkce: 'Bir sorun var miydi?', dogruMu: false,
        neden: 'To be sorusunda "did" kullanilmaz; was/were basa gecer.',
        dogruBicim: 'Was there a problem?', hataTuru: 'GRAMER_HATASI', altKonu: kGecmis),
      OrnekCumle(ingilizce: 'There will are many people there.', turkce: 'Orada cok insan olacak.', dogruMu: false,
        neden: '"will"den sonra yalin "be" gelir.',
        dogruBicim: 'There will be many people there.', hataTuru: 'GRAMER_HATASI', altKonu: kGelecek),
      OrnekCumle(ingilizce: 'There will be are a meeting.', turkce: 'Bir toplanti olacak.', dogruMu: false,
        neden: 'Iki be fiili birden olmaz.', dogruBicim: 'There will be a meeting.',
        hataTuru: 'FAZLA_KELIME', altKonu: kGelecek),
      OrnekCumle(ingilizce: 'There wills be a meeting.', turkce: 'Bir toplanti olacak.', dogruMu: false,
        neden: '"will" hicbir zaman -s almaz.', dogruBicim: 'There will be a meeting.',
        hataTuru: 'GRAMER_HATASI', altKonu: kGelecek),
      OrnekCumle(ingilizce: 'Do there will be enough time?', turkce: 'Yeterli zaman olacak mi?', dogruMu: false,
        neden: 'Soruda "will" basa gecer; do kullanilmaz.',
        dogruBicim: 'Will there be enough time?', hataTuru: 'GRAMER_HATASI', altKonu: kGelecek),
      OrnekCumle(ingilizce: 'There are any books here. (olumlu)', turkce: 'Burada birkac kitap var.', dogruMu: false,
        neden: 'Olumlu cumlede "some" kullanilir.',
        dogruBicim: 'There are some books here.', hataTuru: 'KELIME_SECIMI', altKonu: kMiktar),
      OrnekCumle(ingilizce: "There aren't some books here.", turkce: 'Burada hic kitap yok.', dogruMu: false,
        neden: 'Olumsuzda "any" kullanilir.', dogruBicim: "There aren't any books here.",
        hataTuru: 'KELIME_SECIMI', altKonu: kMiktar),
      OrnekCumle(ingilizce: "There isn't many time.", turkce: 'Fazla zaman yok.', dogruMu: false,
        neden: '"time" sayilamaz -> much.', dogruBicim: "There isn't much time.",
        hataTuru: 'KELIME_SECIMI', altKonu: kMiktar),
      OrnekCumle(ingilizce: 'How much books are there?', turkce: 'Kac kitap var?', dogruMu: false,
        neden: 'Sayilabilir -> How many.', dogruBicim: 'How many books are there?',
        hataTuru: 'KELIME_SECIMI', altKonu: kMiktar),
      OrnekCumle(ingilizce: 'How many books there are?', turkce: 'Kac kitap var?', dogruMu: false,
        neden: 'Soruda sira degisir: "are there".',
        dogruBicim: 'How many books are there?', hataTuru: 'KELIME_SIRASI', altKonu: kMiktar),
      OrnekCumle(ingilizce: 'There is cold today.', turkce: 'Bugun hava soguk.', dogruMu: false,
        neden: 'Hava durumu icin "it is" kullanilir; "there is" varlik '
            'bildirir.', dogruBicim: 'It is cold today.',
        hataTuru: 'KELIME_SECIMI', altKonu: kThereIt),
      OrnekCumle(ingilizce: 'There is five o\u2019clock.', turkce: 'Saat bes.', dogruMu: false,
        neden: 'Saat icin "it is" kullanilir.', dogruBicim: 'It is five o\u2019clock.',
        hataTuru: 'KELIME_SECIMI', altKonu: kThereIt),
      OrnekCumle(ingilizce: 'It is a problem in the system. (ilk kez)', turkce: 'Sistemde bir sorun var.', dogruMu: false,
        neden: 'Ilk kez soz ediliyorsa "there is" kullanilir.',
        dogruBicim: 'There is a problem in the system.', hataTuru: 'KELIME_SECIMI', altKonu: kThereIt),
      OrnekCumle(ingilizce: 'There might is a problem.', turkce: 'Bir sorun olabilir.', dogruMu: false,
        neden: 'Modal\u2019den sonra yalin "be" gelir.',
        dogruBicim: 'There might be a problem.', hataTuru: 'GRAMER_HATASI', altKonu: kModal),
      OrnekCumle(ingilizce: 'There should are a solution.', turkce: 'Bir cozum olmali.', dogruMu: false,
        neden: 'Modal + yalin be: should be.', dogruBicim: 'There should be a solution.',
        hataTuru: 'GRAMER_HATASI', altKonu: kModal),
      OrnekCumle(ingilizce: 'There are a book and two pens.', turkce: 'Bir kitap ve iki kalem var.', dogruMu: false,
        neden: 'Listede ILK ogeye bakilir; ilk oge tekil -> is.',
        dogruBicim: 'There is a book and two pens.', hataTuru: 'GRAMER_HATASI', altKonu: kUyum),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kGecmis,
        soru: 'There ___ three books on the table.',
        secenekler: <String>['was', 'were', 'had'],
        kabuller: <String>['were'], geriDonusKodu: 'Y2'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kGelecek,
        soru: 'There ___ a meeting tomorrow.',
        secenekler: <String>['will are', 'will be', 'wills be'],
        kabuller: <String>['will be'], geriDonusKodu: 'Y3'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kThereIt,
        soru: '"Bugun hava soguk." hangisi?',
        secenekler: <String>['There is cold today.', 'It is cold today.', 'There has cold today.'],
        kabuller: <String>['It is cold today.'], geriDonusKodu: 'Y5'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kModal,
        soru: 'There might ___ a problem.',
        secenekler: <String>['is', 'be', 'are'],
        kabuller: <String>['be'], geriDonusKodu: 'Y6'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kMiktar,
        soru: '___ books are there?',
        secenekler: <String>['How much', 'How many', 'How few'],
        kabuller: <String>['How many'], geriDonusKodu: 'Y4'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kGecmis,
        soru: 'There ___ a car in the garden.', kabuller: <String>['was']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kGecmis,
        soru: 'There ___ many people at the party.', kabuller: <String>['were']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kGelecek,
        soru: 'There will ___ many people there.', kabuller: <String>['be']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kMiktar,
        soru: "There isn't ___ time. (sayilamaz)", kabuller: <String>['much']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kModal,
        soru: 'There should ___ a solution.', kabuller: <String>['be']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kThereIt,
        soru: '"Saat bes." hangisi?',
        secenekler: <String>['There is five.', "It is five o'clock.", 'There has five.'],
        kabuller: <String>["It is five o'clock."]),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kGecmis,
        soru: '"Bir sorun var miydi?" hangisi?',
        secenekler: <String>['Did there be a problem?', 'Was there a problem?', 'There was a problem?'],
        kabuller: <String>['Was there a problem?']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kGelecek,
        soru: 'Dizin: tomorrow / be / There / meeting / will / a',
        kabuller: <String>['There will be a meeting tomorrow.',
            'There will be a meeting tomorrow']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kMiktar,
        soru: 'Dizin: there / books / How / are / many',
        kabuller: <String>['How many books are there?', 'How many books are there']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kThereIt,
        soru: '"There is cold today." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kGecmis, turkce: 'Masada uc kitap vardi.',
        kabuller: <String>['There were three books on the table.']),
      SerbestGorev(kod: 'SU-2', altKonu: kGelecek, turkce: 'Yarin bir toplanti olacak.',
        kabuller: <String>['There will be a meeting tomorrow.']),
      SerbestGorev(kod: 'SU-3', altKonu: kThereIt, turkce: 'Bugun hava soguk.',
        kabuller: <String>['It is cold today.', "It's cold today."]),
      SerbestGorev(kod: 'SU-4', altKonu: kModal, turkce: 'Bir sorun olabilir.',
        kabuller: <String>['There might be a problem.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kGecmis,
        soru: 'There ___ water in the glass.', kabuller: <String>['was']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kGelecek,
        soru: '___ there be enough time?', kabuller: <String>['Will', 'will']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kMiktar,
        soru: 'Are there ___ questions?', kabuller: <String>['any']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.boslukDoldurma, altKonu: kModal,
        soru: 'There must ___ a mistake.', kabuller: <String>['be']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.coktanSecmeli, altKonu: kUyum,
        soru: 'Hangisi dogru?',
        secenekler: <String>['There are a book and two pens.', 'There is a book and two pens.', 'There be a book and two pens.'],
        kabuller: <String>['There is a book and two pens.']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kGecmis,
        soru: '"There had a car in the garden." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kGecmis,
        soru: 'Dizin: party / were / at / There / many people / the',
        kabuller: <String>['There were many people at the party.',
            'There were many people at the party']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kThereIt,
        soru: '___ is a problem in the system. (ilk kez)',
        kabuller: <String>['There', 'there']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kGecmis,
        soru: 'There ___ a car in the garden.',
        secenekler: <String>['was', 'were', 'had'], kabuller: <String>['was']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kGecmis,
        soru: 'There ___ many people at the party.',
        secenekler: <String>['was', 'were', 'is'], kabuller: <String>['were']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kGelecek,
        soru: 'There ___ many people there tomorrow.',
        secenekler: <String>['will are', 'will be', 'will is'],
        kabuller: <String>['will be']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kThereIt,
        soru: '"Saat bes." hangisi?',
        secenekler: <String>['There is five.', "It is five o'clock.", 'There are five.'],
        kabuller: <String>["It is five o'clock."]),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kModal,
        soru: 'There should ___ a solution.',
        secenekler: <String>['is', 'be', 'are'], kabuller: <String>['be']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kGecmis,
        soru: '___ there a problem? (gecmis)', kabuller: <String>['Was', 'was']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kMiktar,
        soru: "There isn't ___ time.", kabuller: <String>['much']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kMiktar,
        soru: 'How ___ books are there?', kabuller: <String>['many']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kGelecek,
        soru: '"There will are a meeting." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kThereIt,
        soru: '"There is cold today." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kGecmis,
        soru: '"There was three books." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kModal,
        soru: 'Dizin: problem / might / a / There / be',
        kabuller: <String>['There might be a problem.', 'There might be a problem']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kGecmis,
        soru: 'Ingilizceye cevirin: Bahcede bir araba vardi.',
        kabuller: <String>['There was a car in the garden.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kGelecek,
        soru: 'Ingilizceye cevirin: Yarin bir toplanti olacak.',
        kabuller: <String>['There will be a meeting tomorrow.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kThereIt,
        soru: 'Ingilizceye cevirin: Bugun hava soguk.',
        kabuller: <String>['It is cold today.', "It's cold today."]),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Sabit "there", degisken "be"',
        aciklama: 'Turkcede "var" ek alir; Ingilizcede be fiili degisir.',
        ornek: 'there is · there was · there will be'),
      OzetMaddesi(baslik: 'Gecmis: was / were',
        aciklama: 'Tekil ve sayilamaz -> was · Cogul -> were.',
        ornek: 'There was water. · There were three books.'),
      OzetMaddesi(baslik: 'Gelecek: tek bicim',
        aciklama: '"will be" — tekil-cogul ayrimi YOK. Daha kolay.',
        ornek: 'There will be a meeting. · There will be many people.'),
      OzetMaddesi(baslik: 'Miktar kelimeleriyle',
        aciklama: 'some/any/much/many kurallari aynen isler.',
        ornek: "There aren't any books. · There isn't much time."),
      OzetMaddesi(baslik: 'there is / it is',
        aciklama: 'Ilk kez soz -> there is · Bilinen sey, hava, saat -> it is.',
        ornek: 'There is a problem. · It is cold today.'),
      OzetMaddesi(baslik: 'Modal + yalin be',
        aciklama: 'Modal\u2019den sonra is/are gelmez, yalin "be" gelir.',
        ornek: 'There might be · There should be · There must be'),
    ],
  );
}
