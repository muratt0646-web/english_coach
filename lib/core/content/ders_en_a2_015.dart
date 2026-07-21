/// EN-A2-015 — should / must / have to: Tavsiye ve Zorunluluk
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnA2015 {
  const DersEnA2015._();

  static const String kModalKural = 'Modal kurallari';
  static const String kShould = 'should (tavsiye)';
  static const String kMust = 'must (zorunluluk)';
  static const String kHaveTo = 'have to (dis zorunluluk)';
  static const String kYasak = "mustn't (yasak)";
  static const String kGereksiz = "don't have to (gereksiz)";

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A2-015',
    baslik: 'should / must / have to — Tavsiye ve Zorunluluk',
    seviye: 'A2', konu: 'YAP', tahminiDk: 40,
    onKosullar: <String>['EN-A2-014'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'Turkce zorunlulugu tek ekle anlatir: "-meli / -mali".\n\n'
        '  git-MELI-sin · calis-MALI-yim · yap-MALI-yiz\n\n'
        'Ama bu ek hem TAVSIYE hem ZORUNLULUK icin kullanilir; ikisi '
        'ayrilmaz:\n\n'
        '  "Doktora gitmelisin."  -> Tavsiye mi, zorunluluk mu?\n'
        '  Tonlamadan anlasilir.\n\n'
        'Ingilizce bunlari AYIRIR:\n\n'
        '  should -> tavsiye, oneri     (bence iyi olur)\n'
        '  must   -> guclu zorunluluk   (baska secenek yok)\n'
        '  have to -> DIS zorunluluk    (kural boyle)\n\n'
        'En kritik ayrim ise olumsuz taraftadir ve TERS anlamlidir:\n\n'
        '  You MUSTN\u2019T go.      -> Gitmen YASAK.\n'
        '  You DON\u2019T HAVE TO go. -> Gitmen GEREKMIYOR (istersen git).\n\n'
        'Bu ikisi Turkcede birbirine yakin durur ama Ingilizcede '
        'ZIT anlamlidir.',
    kazanimlar: <String>[
      'should ile tavsiye verebilmek',
      'must ile guclu zorunluluk anlatmak',
      'have to ile dis zorunlulugu anlatmak',
      "mustn't ile yasak bildirmek",
      "don't have to ile gereksizligi bildirmek",
      'Ikisinin ZIT anlamli oldugunu icsellestirmek',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'AA1', baslik: 'Modal kurallari yine ayni',
        govde: 'should ve must birer MODAL fiildir. A2-014\u2019teki uc kural '
            'aynen gecerlidir:\n\n'
            '  1. Kisiye gore degismez: he should · she must\n'
            '  2. Yalin fiil alir:      should go · must be\n'
            '  3. "to" almaz:           should go (should TO go DEGIL)\n\n'
            'DIKKAT: "have to" bir modal DEGILDIR; normal bir fiildir. '
            'Bu yuzden farkli davranir:\n\n'
            '  he HAS to go     (-s alir)\n'
            '  he doesn\u2019t have to go  (do/does ile olumsuz)\n\n'
            'Bunu ayirt etmek, dersin en pratik faydasidir.',
        turkceKarsilastirma: 'Gitmelisin.  ->  You should go.\n'
            'Ek "-meli"   ->  ayri kelime'),
      AnlatimBlogu(kod: 'AA2', baslik: 'should: tavsiye',
        govde: '"should" bir oneri, tavsiye veya dogru olani bildirir.\n\n'
            '  You should see a doctor.   (Doktora gitsen iyi olur.)\n'
            '  We should leave early.\n'
            '  You shouldn\u2019t eat so much sugar.\n\n'
            'Zorunluluk YOKTUR; konusan yalnizca fikrini soyler.\n\n'
            'Soru: Should I call her?  (Onu arayayim mi?)\n\n'
            'DUSUNME NOTU: "should" duyduginuzda "bence" diye dusunun. '
            'Bu, tavsiye oldugunu hatirlatir.',
        turkceKarsilastirma: 'Doktora gitmelisin.  ->  You should see a doctor.'),
      AnlatimBlogu(kod: 'AA3', baslik: 'must: guclu zorunluluk',
        govde: '"must" baska secenegin olmadigini bildirir. Genellikle '
            'konusanin kendi karari veya inancidir.\n\n'
            '  I must finish this today.  (Bitirmek zorundayim.)\n'
            '  You must be careful.\n'
            '  We must go now.\n\n'
            '"should"tan daha GUCLUDUR:\n\n'
            '  You should study.  -> Iyi olur.\n'
            '  You must study.    -> Baska secenek yok.\n\n'
            'Ayrica "must" kesin tahmin de anlatir:\n'
            '  He must be tired. (Yorgun olmali.)',
        turkceKarsilastirma: 'Bunu bugun bitirmeliyim.\n'
            'I must finish this today.'),
      AnlatimBlogu(kod: 'AA4', baslik: 'have to: DIS zorunluluk',
        govde: '"have to" zorunlulugun DISARIDAN geldigini bildirir: '
            'kural, yasa, program.\n\n'
            '  I have to wear a uniform. (Okul kurali.)\n'
            '  She has to work on Saturdays.\n'
            '  We had to wait an hour.\n\n'
            'FARK:\n'
            '  I must stop smoking.    -> Kendi kararim.\n'
            '  I have to wear glasses. -> Doktor soyledi, mecburum.\n\n'
            'DIKKAT: "have to" modal DEGILDIR:\n'
            '  he HAS to · does he HAVE to? · he doesn\u2019t HAVE to\n\n'
            'Ayrica gecmisi vardir: had to. ("must" gecmiste kullanilmaz.)',
        turkceKarsilastirma: 'Uniforma giymek zorundayim.\n'
            'I have to wear a uniform.'),
      AnlatimBlogu(kod: 'AA5', baslik: 'EN KRITIK: mustn\u2019t / don\u2019t have to',
        govde: 'Bu iki olumsuz bicim ZIT anlamlidir:\n\n'
            '  You MUSTN\u2019T smoke here.\n'
            '     -> Sigara icmek YASAK. (Yapma!)\n\n'
            '  You DON\u2019T HAVE TO come.\n'
            '     -> Gelmen GEREKMIYOR. (Istersen gel.)\n\n'
            'Turkcede ikisi de "-mek zorunda degilsin / yasak" gibi '
            'ifadelerle karsilanabildigi icin karistirilir.\n\n'
            'HATIRLATMA:\n'
            '  mustn\u2019t      = YASAK\n'
            '  don\u2019t have to = SERBEST\n\n'
            'Bir ornekle: "You mustn\u2019t pay." (Odeme yapmak yasak.)\n'
            '             "You don\u2019t have to pay." (Bedava, istersen ode.)',
        turkceKarsilastirma: 'Burada sigara icilmez.  ->  You mustn\u2019t smoke.\n'
            'Gelmek zorunda degilsin. ->  You don\u2019t have to come.'),
      AnlatimBlogu(kod: 'AA6', baslik: 'Ozet karar tablosu',
        govde: 'Hangisini secmeliyim?\n\n'
            '  Fikrimi soyluyorum          -> should\n'
            '  Baska secenek yok (ic)      -> must\n'
            '  Kural boyle (dis)           -> have to\n'
            '  Yasak                       -> mustn\u2019t\n'
            '  Gerekli degil               -> don\u2019t have to\n'
            '  Gecmis zorunluluk           -> had to\n\n'
            'DIKKAT: "must" gecmiste kullanilmaz. Gecmiste her zaman '
            '"had to" gelir:\n'
            '  I musted go.   -> YANLIS\n'
            '  I had to go.   -> DOGRU',
        turkceKarsilastirma: 'Gitmek zorundaydim.  ->  I had to go.'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['see', 'should see', 'You should see a doctor.'],
        turkce: 'Doktora gitmelisin.', not: 'Tavsiye.'),
      AdimliOrnek(adimlar: <String>['finish', 'must finish', 'I must finish this today.'],
        turkce: 'Bugun bitirmeliyim.', not: 'Guclu zorunluluk.'),
      AdimliOrnek(adimlar: <String>['She', 'She has to', 'She has to work on Saturdays.'],
        turkce: 'Cumartesileri calismak zorunda.', not: 'have to -s alir.'),
      AdimliOrnek(adimlar: <String>["You mustn't smoke.", "You don't have to come."],
        turkce: 'YASAK / SERBEST', not: 'Zit anlamli.'),
      AdimliOrnek(adimlar: <String>['must', 'gecmiste yok', 'had to'],
        turkce: 'Gecmiste her zaman had to.', not: 'musted YOK.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Doktora gitmelisin.', 'Bu bir TAVSIYE', 'should + yalin fiil',
        'You should see a doctor.'],
        turkce: 'Fikir bildiriyorum.', not: 'must burada cok sert durur.'),
      AdimliOrnek(adimlar: <String>[
        'Uniforma giymek zorundayim.', 'Zorunluluk DISARIDAN (kural)',
        'have to', 'I have to wear a uniform.'],
        turkce: 'Dis zorunluluk.', not: 'must ic karari anlatir.'),
      AdimliOrnek(adimlar: <String>[
        'Gelmen gerekmiyor.', 'Yasak MI? Hayir, serbest',
        "don't have to", "You don't have to come."],
        turkce: 'Gereksizlik.', not: "mustn't YASAK demektir."),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'You should see a doctor.', turkce: 'Doktora gitmelisin.', dogruMu: true, altKonu: kShould),
      OrnekCumle(ingilizce: 'We should leave early.', turkce: 'Erken cikmaliyiz.', dogruMu: true, altKonu: kShould),
      OrnekCumle(ingilizce: "You shouldn't eat so much sugar.", turkce: 'Bu kadar seker yememelisin.', dogruMu: true, altKonu: kShould),
      OrnekCumle(ingilizce: 'Should I call her?', turkce: 'Onu arayayim mi?', dogruMu: true, altKonu: kShould),
      OrnekCumle(ingilizce: 'He should study more.', turkce: 'Daha cok calismali.', dogruMu: true, altKonu: kShould),
      OrnekCumle(ingilizce: 'You should be careful.', turkce: 'Dikkatli olmalisin.', dogruMu: true, altKonu: kShould),
      OrnekCumle(ingilizce: 'I must finish this today.', turkce: 'Bunu bugun bitirmeliyim.', dogruMu: true, altKonu: kMust),
      OrnekCumle(ingilizce: 'You must be careful.', turkce: 'Dikkatli olmalisin.', dogruMu: true, altKonu: kMust),
      OrnekCumle(ingilizce: 'We must go now.', turkce: 'Simdi gitmeliyiz.', dogruMu: true, altKonu: kMust),
      OrnekCumle(ingilizce: 'He must be tired.', turkce: 'Yorgun olmali.', dogruMu: true, altKonu: kMust),
      OrnekCumle(ingilizce: 'I must stop smoking.', turkce: 'Sigarayi birakmaliyim.', dogruMu: true, altKonu: kMust),
      OrnekCumle(ingilizce: 'I have to wear a uniform.', turkce: 'Uniforma giymek zorundayim.', dogruMu: true, altKonu: kHaveTo),
      OrnekCumle(ingilizce: 'She has to work on Saturdays.', turkce: 'Cumartesileri calismak zorunda.', dogruMu: true, altKonu: kHaveTo),
      OrnekCumle(ingilizce: 'We had to wait an hour.', turkce: 'Bir saat beklemek zorunda kaldik.', dogruMu: true, altKonu: kHaveTo),
      OrnekCumle(ingilizce: 'Do you have to work today?', turkce: 'Bugun calismak zorunda misin?', dogruMu: true, altKonu: kHaveTo),
      OrnekCumle(ingilizce: 'He has to take the bus.', turkce: 'Otobuse binmek zorunda.', dogruMu: true, altKonu: kHaveTo),
      OrnekCumle(ingilizce: 'I had to go home early.', turkce: 'Eve erken gitmek zorunda kaldim.', dogruMu: true, altKonu: kHaveTo),
      OrnekCumle(ingilizce: "You mustn't smoke here.", turkce: 'Burada sigara icemezsin.', dogruMu: true, altKonu: kYasak),
      OrnekCumle(ingilizce: "You mustn't touch that.", turkce: 'Ona dokunmamalisin.', dogruMu: true, altKonu: kYasak),
      OrnekCumle(ingilizce: "Students mustn't use phones in class.", turkce: 'Ogrenciler sinifta telefon kullanamaz.', dogruMu: true, altKonu: kYasak),
      OrnekCumle(ingilizce: "You mustn't be late.", turkce: 'Gec kalmamalisin.', dogruMu: true, altKonu: kYasak),
      OrnekCumle(ingilizce: "You don't have to come.", turkce: 'Gelmen gerekmiyor.', dogruMu: true, altKonu: kGereksiz),
      OrnekCumle(ingilizce: "She doesn't have to work today.", turkce: 'Bugun calismasi gerekmiyor.', dogruMu: true, altKonu: kGereksiz),
      OrnekCumle(ingilizce: "You don't have to pay.", turkce: 'Odeme yapman gerekmiyor.', dogruMu: true, altKonu: kGereksiz),
      OrnekCumle(ingilizce: "We don't have to hurry.", turkce: 'Acele etmemiz gerekmiyor.', dogruMu: true, altKonu: kGereksiz),
      OrnekCumle(ingilizce: "He doesn't have to answer.", turkce: 'Cevap vermesi gerekmiyor.', dogruMu: true, altKonu: kGereksiz),
      OrnekCumle(ingilizce: 'He should go home.', turkce: 'Eve gitmeli.', dogruMu: true, altKonu: kModalKural),
      OrnekCumle(ingilizce: 'She must be at work.', turkce: 'Iste olmali.', dogruMu: true, altKonu: kModalKural),
      OrnekCumle(ingilizce: 'They should not wait.', turkce: 'Beklememeliler.', dogruMu: true, altKonu: kModalKural),
      OrnekCumle(ingilizce: 'Should we start now?', turkce: 'Simdi baslayalim mi?', dogruMu: true, altKonu: kModalKural),

      OrnekCumle(ingilizce: 'He shoulds go home.', turkce: 'Eve gitmeli.', dogruMu: false,
        neden: 'Modal fiiller kisiye gore DEGISMEZ; -s almaz.',
        dogruBicim: 'He should go home.', hataTuru: 'GRAMER_HATASI', altKonu: kModalKural),
      OrnekCumle(ingilizce: 'She must goes now.', turkce: 'Simdi gitmeli.', dogruMu: false,
        neden: 'Modal\u2019den sonra fiil YALIN kalir.', dogruBicim: 'She must go now.',
        hataTuru: 'GRAMER_HATASI', altKonu: kModalKural),
      OrnekCumle(ingilizce: 'You should to see a doctor.', turkce: 'Doktora gitmelisin.', dogruMu: false,
        neden: 'Modal fiillerden sonra "to" GELMEZ.',
        dogruBicim: 'You should see a doctor.', hataTuru: 'FAZLA_KELIME', altKonu: kModalKural),
      OrnekCumle(ingilizce: 'I must to finish this.', turkce: 'Bunu bitirmeliyim.', dogruMu: false,
        neden: '"must" da "to" almaz.', dogruBicim: 'I must finish this.',
        hataTuru: 'FAZLA_KELIME', altKonu: kModalKural),
      OrnekCumle(ingilizce: 'Do you should call her?', turkce: 'Onu aramali misin?', dogruMu: false,
        neden: 'Modal sorusunda "do" kullanilmaz; modal basa gecer.',
        dogruBicim: 'Should you call her?', hataTuru: 'GRAMER_HATASI', altKonu: kModalKural),
      OrnekCumle(ingilizce: 'I do not should go.', turkce: 'Gitmemeliyim.', dogruMu: false,
        neden: 'Modal olumsuzu dogrudan "not" ile yapilir.',
        dogruBicim: 'I should not go.', hataTuru: 'GRAMER_HATASI', altKonu: kModalKural),
      OrnekCumle(ingilizce: 'She have to work on Saturdays.', turkce: 'Cumartesileri calismak zorunda.', dogruMu: false,
        neden: '"have to" modal DEGILDIR; 3. tekil kisi "has to" alir.',
        dogruBicim: 'She has to work on Saturdays.', hataTuru: 'GRAMER_HATASI', altKonu: kHaveTo),
      OrnekCumle(ingilizce: 'He has to takes the bus.', turkce: 'Otobuse binmek zorunda.', dogruMu: false,
        neden: '"to"dan sonra fiil yalin kalir.', dogruBicim: 'He has to take the bus.',
        hataTuru: 'GRAMER_HATASI', altKonu: kHaveTo),
      OrnekCumle(ingilizce: 'Have you to work today?', turkce: 'Bugun calismak zorunda misin?', dogruMu: false,
        neden: '"have to" normal fiil gibi davranir; soruda do/does gerekir.',
        dogruBicim: 'Do you have to work today?', hataTuru: 'GRAMER_HATASI', altKonu: kHaveTo),
      OrnekCumle(ingilizce: 'She has not to work today.', turkce: 'Bugun calismasi gerekmiyor.', dogruMu: false,
        neden: 'Olumsuzda do/does kullanilir.',
        dogruBicim: "She doesn't have to work today.", hataTuru: 'GRAMER_HATASI', altKonu: kGereksiz),
      OrnekCumle(ingilizce: 'I musted go home early.', turkce: 'Eve erken gitmek zorunda kaldim.', dogruMu: false,
        neden: '"must" gecmiste KULLANILMAZ; "had to" gelir.',
        dogruBicim: 'I had to go home early.', hataTuru: 'GRAMER_HATASI', altKonu: kHaveTo),
      OrnekCumle(ingilizce: 'We must waited an hour.', turkce: 'Bir saat beklemek zorunda kaldik.', dogruMu: false,
        neden: 'Gecmis zorunluluk "had to" ile anlatilir.',
        dogruBicim: 'We had to wait an hour.', hataTuru: 'GRAMER_HATASI', altKonu: kHaveTo),
      OrnekCumle(ingilizce: "You don't have to smoke here. (yasak kastediliyor)", turkce: 'Burada sigara icemezsin.', dogruMu: false,
        neden: "\"don't have to\" GEREKMIYOR demektir, yasak degil. Yasak "
            "icin \"mustn't\" kullanilir.", dogruBicim: "You mustn't smoke here.",
        hataTuru: 'ANLAM_FARKI', altKonu: kYasak),
      OrnekCumle(ingilizce: "You mustn't come. (gelmen gerekmiyor kastediliyor)", turkce: 'Gelmen gerekmiyor.', dogruMu: false,
        neden: "\"mustn't\" YASAK demektir. Gereksizlik icin "
            "\"don't have to\" kullanilir.", dogruBicim: "You don't have to come.",
        hataTuru: 'ANLAM_FARKI', altKonu: kGereksiz),
      OrnekCumle(ingilizce: "You mustn't to touch that.", turkce: 'Ona dokunmamalisin.', dogruMu: false,
        neden: 'Modal + yalin fiil; "to" gelmez.', dogruBicim: "You mustn't touch that.",
        hataTuru: 'FAZLA_KELIME', altKonu: kYasak),
      OrnekCumle(ingilizce: "Students don't must use phones.", turkce: 'Ogrenciler telefon kullanamaz.', dogruMu: false,
        neden: 'Modal olumsuzu dogrudan not ile yapilir: mustn\u2019t.',
        dogruBicim: "Students mustn't use phones.", hataTuru: 'GRAMER_HATASI', altKonu: kYasak),
      OrnekCumle(ingilizce: "He doesn't has to answer.", turkce: 'Cevap vermesi gerekmiyor.', dogruMu: false,
        neden: '"does" zaten cekimi tasiyor; "have" yalin kalir.',
        dogruBicim: "He doesn't have to answer.", hataTuru: 'GRAMER_HATASI', altKonu: kGereksiz),
      OrnekCumle(ingilizce: 'You should ate less sugar.', turkce: 'Daha az seker yemelisin.', dogruMu: false,
        neden: 'Modal + yalin fiil; gecmis bicim kullanilmaz.',
        dogruBicim: 'You should eat less sugar.', hataTuru: 'GRAMER_HATASI', altKonu: kShould),
      OrnekCumle(ingilizce: 'Must I to be careful?', turkce: 'Dikkatli olmali miyim?', dogruMu: false,
        neden: '"to" gereksiz.', dogruBicim: 'Must I be careful?',
        hataTuru: 'FAZLA_KELIME', altKonu: kMust),
      OrnekCumle(ingilizce: 'They should not to wait.', turkce: 'Beklememeliler.', dogruMu: false,
        neden: 'Modal olumsuzunda da "to" gelmez.',
        dogruBicim: 'They should not wait.', hataTuru: 'FAZLA_KELIME', altKonu: kModalKural),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kModalKural,
        soru: 'Hangisi dogru?',
        secenekler: <String>['He shoulds go.', 'He should go.', 'He should goes.'],
        kabuller: <String>['He should go.'], geriDonusKodu: 'AA1'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kShould,
        soru: '"Doktora gitsen iyi olur." hangisi?',
        secenekler: <String>['You must see a doctor.', 'You should see a doctor.', 'You have to see a doctor.'],
        kabuller: <String>['You should see a doctor.'], geriDonusKodu: 'AA2'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kHaveTo,
        soru: 'She ___ work on Saturdays. (kural)',
        secenekler: <String>['have to', 'has to', 'must to'],
        kabuller: <String>['has to'], geriDonusKodu: 'AA4'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kYasak,
        soru: '"Burada sigara icmek YASAK." hangisi?',
        secenekler: <String>["You don't have to smoke here.", "You mustn't smoke here.", "You shouldn't smoke here."],
        kabuller: <String>["You mustn't smoke here."], geriDonusKodu: 'AA5'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kGereksiz,
        soru: '"Gelmen gerekmiyor (istersen gel)." hangisi?',
        secenekler: <String>["You mustn't come.", "You don't have to come.", "You shouldn't come."],
        kabuller: <String>["You don't have to come."], geriDonusKodu: 'AA5'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kShould,
        soru: 'You should ___ a doctor. (see)', kabuller: <String>['see']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kHaveTo,
        soru: 'He ___ to take the bus.', kabuller: <String>['has']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kHaveTo,
        soru: 'We ___ to wait an hour yesterday.', kabuller: <String>['had']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kGereksiz,
        soru: "She ___ have to work today. (doesn't / don't)",
        kabuller: <String>["doesn't"]),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kModalKural,
        soru: 'Must I ___ careful? (be)', kabuller: <String>['be']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kYasak,
        soru: '"mustn\'t" ne anlatir?',
        secenekler: <String>['Gerekmiyor', 'Yasak', 'Tavsiye'],
        kabuller: <String>['Yasak']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kGereksiz,
        soru: '"don\'t have to" ne anlatir?',
        secenekler: <String>['Yasak', 'Gerekmiyor', 'Zorunlu'],
        kabuller: <String>['Gerekmiyor']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kShould,
        soru: 'Dizin: doctor / should / You / a / see',
        kabuller: <String>['You should see a doctor.', 'You should see a doctor']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kHaveTo,
        soru: 'Dizin: uniform / to / a / I / wear / have',
        kabuller: <String>['I have to wear a uniform.', 'I have to wear a uniform']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kHaveTo,
        soru: '"I musted go home." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kShould, turkce: 'Doktora gitmelisin.',
        kabuller: <String>['You should see a doctor.',
            'You should go to the doctor.']),
      SerbestGorev(kod: 'SU-2', altKonu: kHaveTo, turkce: 'Uniforma giymek zorundayim.',
        kabuller: <String>['I have to wear a uniform.']),
      SerbestGorev(kod: 'SU-3', altKonu: kYasak, turkce: 'Burada sigara icemezsin.',
        kabuller: <String>["You mustn't smoke here.",
            'You must not smoke here.']),
      SerbestGorev(kod: 'SU-4', altKonu: kGereksiz, turkce: 'Gelmen gerekmiyor.',
        kabuller: <String>["You don't have to come.",
            'You do not have to come.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kShould,
        soru: 'We ___ leave early. (tavsiye)', kabuller: <String>['should']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kMust,
        soru: 'I ___ finish this today. (guclu zorunluluk)',
        kabuller: <String>['must']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kHaveTo,
        soru: 'Do you ___ to work today?', kabuller: <String>['have']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.coktanSecmeli, altKonu: kYasak,
        soru: 'Hangisi YASAK bildirir?',
        secenekler: <String>["You don't have to go.", "You mustn't go.", "You shouldn't go."],
        kabuller: <String>["You mustn't go."]),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.dogruYanlis, altKonu: kModalKural,
        soru: '"You should to see a doctor." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kHaveTo,
        soru: '"She have to work." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kGereksiz,
        soru: "Dizin: come / to / have / don't / You",
        kabuller: <String>["You don't have to come.", "You don't have to come"]),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kHaveTo,
        soru: 'I ___ to go home early yesterday.', kabuller: <String>['had']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kModalKural,
        soru: 'He ___ go home.',
        secenekler: <String>['shoulds', 'should', 'should to'],
        kabuller: <String>['should']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kModalKural,
        soru: 'She must ___ now.',
        secenekler: <String>['goes', 'go', 'to go'], kabuller: <String>['go']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kHaveTo,
        soru: 'She ___ work on Saturdays.',
        secenekler: <String>['have to', 'has to', 'must to'],
        kabuller: <String>['has to']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kYasak,
        soru: '"Sigara icmek YASAK." hangisi?',
        secenekler: <String>["You don't have to smoke.", "You mustn't smoke.", "You shouldn't smoke."],
        kabuller: <String>["You mustn't smoke."]),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kGereksiz,
        soru: '"Odeme yapman gerekmiyor." hangisi?',
        secenekler: <String>["You mustn't pay.", "You don't have to pay.", "You shouldn't pay."],
        kabuller: <String>["You don't have to pay."]),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kHaveTo,
        soru: 'We ___ to wait an hour yesterday.', kabuller: <String>['had']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kGereksiz,
        soru: "He ___ have to answer. (doesn't / don't)",
        kabuller: <String>["doesn't"]),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kShould,
        soru: 'You should ___ careful. (be)', kabuller: <String>['be']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kModalKural,
        soru: '"I must to finish this." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kHaveTo,
        soru: '"I musted go home." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kHaveTo,
        soru: '"Have you to work today?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kYasak,
        soru: "Dizin: here / smoke / mustn't / You",
        kabuller: <String>["You mustn't smoke here.", "You mustn't smoke here"]),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kShould,
        soru: 'Ingilizceye cevirin: Erken cikmaliyiz.',
        kabuller: <String>['We should leave early.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kHaveTo,
        soru: 'Ingilizceye cevirin: Cumartesileri calismak zorunda.',
        kabuller: <String>['She has to work on Saturdays.',
            'He has to work on Saturdays.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kGereksiz,
        soru: 'Ingilizceye cevirin: Acele etmemiz gerekmiyor.',
        kabuller: <String>["We don't have to hurry.",
            'We do not have to hurry.']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Modal kurallari yine ayni',
        aciklama: 'should/must: -s almaz, yalin fiil alir, "to" almaz.',
        ornek: 'he should go (shoulds / should goes / should to go DEGIL)'),
      OzetMaddesi(baslik: 'should: tavsiye',
        aciklama: '"Bence" diye dusunun. Zorunluluk yok.',
        ornek: 'You should see a doctor.'),
      OzetMaddesi(baslik: 'must: guclu zorunluluk',
        aciklama: 'Baska secenek yok; genellikle ic karar. Kesin tahmin de anlatir.',
        ornek: 'I must finish this. · He must be tired.'),
      OzetMaddesi(baslik: 'have to: DIS zorunluluk',
        aciklama: 'Modal DEGIL. has to · do you have to · didn\u2019t have to.',
        ornek: 'She has to work. · I had to go.'),
      OzetMaddesi(baslik: 'EN KRITIK: zit anlamli ikili',
        aciklama: "mustn't = YASAK · don't have to = SERBEST",
        ornek: "You mustn't pay. · You don't have to pay."),
      OzetMaddesi(baslik: 'must gecmiste YOK',
        aciklama: 'Gecmis zorunluluk her zaman "had to" ile anlatilir.',
        ornek: 'I musted go (X) -> I had to go'),
    ],
  );
}
