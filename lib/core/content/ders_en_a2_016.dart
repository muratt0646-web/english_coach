/// EN-A2-016 — Present Perfect: Giris
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnA2016 {
  const DersEnA2016._();

  static const String kYapi = 'Yapi: have/has + 3. bicim';
  static const String kUcuncuBicim = '3. bicim (participle)';
  static const String kDeneyim = 'Deneyim: ever / never';
  static const String kJustAlready = 'just / already / yet';
  static const String kFark = 'Past Simple ile fark';
  static const String kOlumsuzSoru = 'Olumsuz ve soru';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A2-016',
    baslik: 'Present Perfect — Giris',
    seviye: 'A2', konu: 'ZAM', tahminiDk: 45,
    onKosullar: <String>['EN-A2-003', 'EN-A2-004'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'Bu, A2\u2019nin en zor konusudur. Sebebi basit: Turkcede tam '
        'karsiligi YOKTUR.\n\n'
        'Turkcede iki gecmis vardir:\n'
        '  gitti  -> gordugum gecmis\n'
        '  gitmis -> duydugum gecmis\n\n'
        'Ingilizcede ise ayrim BASKA bir eksende yapilir:\n\n'
        '  ZAMAN BITTI MI?\n\n'
        '  Bitti  -> Past Simple:      I went to Paris LAST YEAR.\n'
        '  Bitmedi -> Present Perfect: I HAVE BEEN to Paris.\n\n'
        'Ikinci cumlede zaman soylenmez. Cunku onemli olan ne zaman '
        'oldugu degil, SIMDIYE etkisidir: "Paris deneyimim var."\n\n'
        'DUSUNME KURALI: Present Perfect gecmisi SIMDIYE baglar. '
        'Bir kopru gibidir.\n\n'
        '  I lost my keys.        -> Kaybettim. (olay bitti)\n'
        '  I have lost my keys.   -> Kaybettim ve HALA yok.\n\n'
        'Turkce "-mis" ekiyle karistirmayin: "gitmis" duyuma dayanir, '
        '"has gone" ise simdiye baglantiya.',
    kazanimlar: <String>[
      'have/has + 3. bicim yapisini kurabilmek',
      'Duzenli ve duzensiz 3. bicimleri ayirt etmek',
      'ever / never ile deneyim anlatmak',
      'just / already / yet kullanmak',
      'Past Simple ile Present Perfect arasinda secim yapmak',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'AB1', baslik: 'Turkcede karsiligi YOK',
        govde: 'Bu yapiyi ogrenirken Turkceden ceviri yapmayin; yeni bir '
            'kavram olarak ogrenin.\n\n'
            'Turkce "-mis" eki DUYUMU anlatir:\n'
            '  "Ali gitmis." -> Ben gormedim, birinden duydum.\n\n'
            'Present Perfect ise SIMDIYE BAGLANTIYI anlatir:\n'
            '  "Ali has gone." -> Ali gitti ve SU AN burada degil.\n\n'
            'Ikisi tamamen farkli seylerdir.\n\n'
            'DUSUNME NOTU: Present Perfect kullandiginizda dinleyene sunu '
            'soylersiniz: "Bu gecmiste oldu ama SIMDI de onemli."',
        turkceKarsilastirma: 'Anahtarlarimi kaybettim (hala yok).\n'
            'I have lost my keys.'),
      AnlatimBlogu(kod: 'AB2', baslik: 'Yapi: have/has + 3. bicim',
        govde: 'Iki parca vardir:\n\n'
            '  I / you / we / they  -> HAVE\n'
            '  he / she / it        -> HAS\n\n'
            '  I have finished.\n'
            '  She has arrived.\n'
            '  They have gone.\n\n'
            'Kisaltma: I\u2019ve · she\u2019s · they\u2019ve\n\n'
            'DIKKAT: "have" burada "sahip olmak" DEGIL, yardimci fiildir. '
            'Anlami yoktur; yalnizca yapiyi kurar.\n\n'
            '  I have a car.       -> sahiplik\n'
            '  I have finished.    -> yardimci fiil',
        turkceKarsilastirma: 'Bitirdim.  ->  I have finished.\n'
            'Tek ek     ->  iki parca'),
      AnlatimBlogu(kod: 'AB3', baslik: '3. bicim nedir?',
        govde: 'Fiillerin UC bicimi vardir:\n\n'
            '  1. YALIN   2. GECMIS   3. PARTICIPLE\n'
            '  work       worked      worked\n'
            '  go         went        gone\n'
            '  see        saw         seen\n'
            '  eat        ate         eaten\n'
            '  write      wrote       written\n\n'
            'DUZENLI fiillerde 2. ve 3. bicim AYNIDIR (-ed).\n'
            'DUZENSIZ fiillerde farkli olabilir.\n\n'
            'A2-003\u2019te 2. bicimi ogrendiniz; simdi ucuncuyu ekliyoruz.\n\n'
            'Sik gecenler: been · done · had · made · taken · given · '
            'come · become · known',
        turkceKarsilastirma: 'go · went · gone\n'
            'Ucuncu bicim yalnizca perfect yapilarda kullanilir.'),
      AnlatimBlogu(kod: 'AB4', baslik: 'Deneyim: ever / never',
        govde: 'Hayat boyu deneyim anlatirken zaman soylenmez:\n\n'
            '  I have been to Paris.       (Paris\u2019e gittim, ne zaman '
            'onemli degil)\n'
            '  She has never eaten sushi.\n'
            '  Have you ever seen a lion?\n\n'
            '  ever  -> soruda: hic\n'
            '  never -> olumsuz anlam tasir, "not" ile birlikte KULLANILMAZ\n\n'
            '  I haven\u2019t never been there. -> YANLIS\n'
            '  I have never been there.     -> DOGRU\n\n'
            'DIKKAT: "been" ve "gone" farklidir:\n'
            '  He has BEEN to Paris.  -> Gitti ve DONDU.\n'
            '  He has GONE to Paris.  -> Gitti, HALA orada.',
        turkceKarsilastirma: 'Hic sushi yedin mi?  ->  Have you ever eaten sushi?'),
      AnlatimBlogu(kod: 'AB5', baslik: 'just / already / yet',
        govde: 'Bu uc kelime Present Perfect ile cok sik gecer:\n\n'
            '  JUST    -> az once, yeni\n'
            '     I have just finished. (Az once bitirdim.)\n\n'
            '  ALREADY -> coktan, beklenenden once\n'
            '     She has already left. (Coktan gitti.)\n\n'
            '  YET     -> henuz (olumsuz) / daha (soru)\n'
            '     I haven\u2019t finished yet. (Henuz bitirmedim.)\n'
            '     Have you finished yet?  (Bitirdin mi?)\n\n'
            'YER: just ve already fiilden ONCE, yet cumlenin SONUNDA.\n\n'
            '  I have just eaten. · I haven\u2019t eaten yet.',
        turkceKarsilastirma: 'Az once bitirdim.  ->  I have just finished.\n'
            'Henuz bitirmedim.  ->  I haven\u2019t finished yet.'),
      AnlatimBlogu(kod: 'AB6', baslik: 'Karar sorusu: zaman bitti mi?',
        govde: 'Past Simple mi Present Perfect mi? Tek soru yeter:\n\n'
            '  "Soz edilen zaman dilimi BITTI mi?"\n\n'
            '  BITTI  -> Past Simple\n'
            '     yesterday · last week · in 2020 · two days ago\n'
            '     I saw him yesterday.\n\n'
            '  BITMEDI veya SOYLENMEDI -> Present Perfect\n'
            '     today · this week · ever · never · just · yet\n'
            '     I have seen him today. (gun surerken)\n\n'
            'KESIN KURAL: Bitmis zaman ifadesi varsa Present Perfect '
            'KULLANILMAZ.\n\n'
            '  I have seen him yesterday.  -> YANLIS\n'
            '  I saw him yesterday.        -> DOGRU',
        turkceKarsilastirma: 'Dun gordum.     ->  I saw him yesterday.\n'
            'Bugun gordum.   ->  I have seen him today.'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['finish', 'have finished', 'I have finished.'],
        turkce: 'Bitirdim.', not: 'have + 3. bicim.'),
      AdimliOrnek(adimlar: <String>['go', 'went', 'gone', 'She has gone.'],
        turkce: 'Gitti (hala orada).', not: 'Uc bicim.'),
      AdimliOrnek(adimlar: <String>['I lost my keys.', 'I have lost my keys.'],
        turkce: 'Kaybettim / kaybettim ve hala yok.',
        not: 'Perfect simdiye baglar.'),
      AdimliOrnek(adimlar: <String>['Have you', 'Have you ever', 'Have you ever seen a lion?'],
        turkce: 'Hic aslan gordun mu?', not: 'Deneyim sorusu.'),
      AdimliOrnek(adimlar: <String>['I saw him yesterday.', 'I have seen him today.'],
        turkce: 'Bitmis / suren zaman.', not: 'Zaman bitti mi?'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Anahtarlarimi kaybettim (hala yok).', 'Simdiye baglanti VAR',
        'have + lost', 'I have lost my keys.'],
        turkce: 'Simdiye etkisi varsa Perfect.', not: 'I lost = olay bitti.'),
      AdimliOrnek(adimlar: <String>[
        'Dun onu gordum.', 'yesterday = BITMIS zaman', 'Past Simple',
        'I saw him yesterday.'],
        turkce: 'Bitmis zaman -> Past Simple.',
        not: 'have seen yesterday YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Henuz bitirmedim.', 'yet -> Perfect', "haven't finished",
        "I haven't finished yet."],
        turkce: 'yet cumle sonunda.', not: 'Olumsuz + yet.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I have finished my homework.', turkce: 'Odevimi bitirdim.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'She has arrived.', turkce: 'Geldi.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'They have gone home.', turkce: 'Eve gittiler.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'We have seen that film.', turkce: 'O filmi gorduk.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: "I've lost my keys.", turkce: 'Anahtarlarimi kaybettim.', dogruMu: true, altKonu: kYapi),
      OrnekCumle(ingilizce: 'He has written a letter.', turkce: 'Bir mektup yazdi.', dogruMu: true, altKonu: kUcuncuBicim),
      OrnekCumle(ingilizce: 'She has eaten breakfast.', turkce: 'Kahvalti etti.', dogruMu: true, altKonu: kUcuncuBicim),
      OrnekCumle(ingilizce: 'They have taken the bus.', turkce: 'Otobuse bindiler.', dogruMu: true, altKonu: kUcuncuBicim),
      OrnekCumle(ingilizce: 'I have done my work.', turkce: 'Isimi yaptim.', dogruMu: true, altKonu: kUcuncuBicim),
      OrnekCumle(ingilizce: 'She has given me a book.', turkce: 'Bana bir kitap verdi.', dogruMu: true, altKonu: kUcuncuBicim),
      OrnekCumle(ingilizce: 'I have been to Paris.', turkce: 'Paris\u2019e gittim.', dogruMu: true, altKonu: kDeneyim),
      OrnekCumle(ingilizce: 'She has never eaten sushi.', turkce: 'Hic sushi yemedi.', dogruMu: true, altKonu: kDeneyim),
      OrnekCumle(ingilizce: 'Have you ever seen a lion?', turkce: 'Hic aslan gordun mu?', dogruMu: true, altKonu: kDeneyim),
      OrnekCumle(ingilizce: 'We have never been to Japan.', turkce: 'Hic Japonya\u2019ya gitmedik.', dogruMu: true, altKonu: kDeneyim),
      OrnekCumle(ingilizce: 'He has gone to Paris.', turkce: 'Paris\u2019e gitti (hala orada).', dogruMu: true, altKonu: kDeneyim),
      OrnekCumle(ingilizce: 'I have just finished.', turkce: 'Az once bitirdim.', dogruMu: true, altKonu: kJustAlready),
      OrnekCumle(ingilizce: 'She has already left.', turkce: 'Coktan gitti.', dogruMu: true, altKonu: kJustAlready),
      OrnekCumle(ingilizce: "I haven't finished yet.", turkce: 'Henuz bitirmedim.', dogruMu: true, altKonu: kJustAlready),
      OrnekCumle(ingilizce: 'Have you finished yet?', turkce: 'Bitirdin mi?', dogruMu: true, altKonu: kJustAlready),
      OrnekCumle(ingilizce: 'They have just arrived.', turkce: 'Az once geldiler.', dogruMu: true, altKonu: kJustAlready),
      OrnekCumle(ingilizce: 'I have already eaten.', turkce: 'Coktan yedim.', dogruMu: true, altKonu: kJustAlready),
      OrnekCumle(ingilizce: 'I saw him yesterday.', turkce: 'Dun onu gordum.', dogruMu: true, altKonu: kFark),
      OrnekCumle(ingilizce: 'I have seen him today.', turkce: 'Bugun onu gordum.', dogruMu: true, altKonu: kFark),
      OrnekCumle(ingilizce: 'She went to Paris last year.', turkce: 'Gecen yil Paris\u2019e gitti.', dogruMu: true, altKonu: kFark),
      OrnekCumle(ingilizce: 'She has been to Paris twice.', turkce: 'Iki kez Paris\u2019e gitti.', dogruMu: true, altKonu: kFark),
      OrnekCumle(ingilizce: 'We finished the work in 2020.', turkce: '2020\u2019de isi bitirdik.', dogruMu: true, altKonu: kFark),
      OrnekCumle(ingilizce: "I haven't seen him.", turkce: 'Onu gormedim.', dogruMu: true, altKonu: kOlumsuzSoru),
      OrnekCumle(ingilizce: "She hasn't arrived.", turkce: 'Gelmedi.', dogruMu: true, altKonu: kOlumsuzSoru),
      OrnekCumle(ingilizce: 'Have they gone?', turkce: 'Gittiler mi?', dogruMu: true, altKonu: kOlumsuzSoru),
      OrnekCumle(ingilizce: 'Yes, they have.', turkce: 'Evet, gittiler.', dogruMu: true, altKonu: kOlumsuzSoru),

      OrnekCumle(ingilizce: 'I have finish my homework.', turkce: 'Odevimi bitirdim.', dogruMu: false,
        neden: '"have"den sonra 3. bicim gelir: finished.',
        dogruBicim: 'I have finished my homework.', hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'She have arrived.', turkce: 'Geldi.', dogruMu: false,
        neden: 'Tekil ucuncu kisi "has" alir.', dogruBicim: 'She has arrived.',
        hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'They has gone home.', turkce: 'Eve gittiler.', dogruMu: false,
        neden: 'Cogul ozne "have" alir.', dogruBicim: 'They have gone home.',
        hataTuru: 'GRAMER_HATASI', altKonu: kYapi),
      OrnekCumle(ingilizce: 'I have went to Paris.', turkce: 'Paris\u2019e gittim.', dogruMu: false,
        neden: '"went" 2. bicimdir; perfect yapida 3. bicim gerekir: gone/been.',
        dogruBicim: 'I have been to Paris.', hataTuru: 'GRAMER_HATASI', altKonu: kUcuncuBicim),
      OrnekCumle(ingilizce: 'He has wrote a letter.', turkce: 'Bir mektup yazdi.', dogruMu: false,
        neden: '3. bicim "written"dir.', dogruBicim: 'He has written a letter.',
        hataTuru: 'GRAMER_HATASI', altKonu: kUcuncuBicim),
      OrnekCumle(ingilizce: 'She has ate breakfast.', turkce: 'Kahvalti etti.', dogruMu: false,
        neden: '3. bicim "eaten"dir.', dogruBicim: 'She has eaten breakfast.',
        hataTuru: 'GRAMER_HATASI', altKonu: kUcuncuBicim),
      OrnekCumle(ingilizce: 'They have took the bus.', turkce: 'Otobuse bindiler.', dogruMu: false,
        neden: '3. bicim "taken"dir.', dogruBicim: 'They have taken the bus.',
        hataTuru: 'GRAMER_HATASI', altKonu: kUcuncuBicim),
      OrnekCumle(ingilizce: 'I have did my work.', turkce: 'Isimi yaptim.', dogruMu: false,
        neden: '3. bicim "done"dur.', dogruBicim: 'I have done my work.',
        hataTuru: 'GRAMER_HATASI', altKonu: kUcuncuBicim),
      OrnekCumle(ingilizce: 'She has gave me a book.', turkce: 'Bana bir kitap verdi.', dogruMu: false,
        neden: '3. bicim "given"dir.', dogruBicim: 'She has given me a book.',
        hataTuru: 'GRAMER_HATASI', altKonu: kUcuncuBicim),
      OrnekCumle(ingilizce: 'I have seen him yesterday.', turkce: 'Dun onu gordum.', dogruMu: false,
        neden: '"yesterday" BITMIS bir zamandir; Present Perfect ile '
            'kullanilmaz.', dogruBicim: 'I saw him yesterday.',
        hataTuru: 'ANLAM_FARKI', altKonu: kFark),
      OrnekCumle(ingilizce: 'She has gone to Paris last year.', turkce: 'Gecen yil Paris\u2019e gitti.', dogruMu: false,
        neden: '"last year" bitmis zaman -> Past Simple.',
        dogruBicim: 'She went to Paris last year.', hataTuru: 'ANLAM_FARKI', altKonu: kFark),
      OrnekCumle(ingilizce: 'We have finished the work in 2020.', turkce: '2020\u2019de bitirdik.', dogruMu: false,
        neden: 'Belirli bir yil bitmis zamandir.',
        dogruBicim: 'We finished the work in 2020.', hataTuru: 'ANLAM_FARKI', altKonu: kFark),
      OrnekCumle(ingilizce: "I haven't never been there.", turkce: 'Oraya hic gitmedim.', dogruMu: false,
        neden: '"never" zaten olumsuzdur; "not" ile birlikte kullanilmaz.',
        dogruBicim: 'I have never been there.', hataTuru: 'FAZLA_KELIME', altKonu: kDeneyim),
      OrnekCumle(ingilizce: 'She has never eat sushi.', turkce: 'Hic sushi yemedi.', dogruMu: false,
        neden: '3. bicim gerekir: eaten.', dogruBicim: 'She has never eaten sushi.',
        hataTuru: 'GRAMER_HATASI', altKonu: kDeneyim),
      OrnekCumle(ingilizce: 'Did you ever seen a lion?', turkce: 'Hic aslan gordun mu?', dogruMu: false,
        neden: 'Perfect sorusunda "did" degil "have/has" kullanilir.',
        dogruBicim: 'Have you ever seen a lion?', hataTuru: 'GRAMER_HATASI', altKonu: kDeneyim),
      OrnekCumle(ingilizce: 'I have just finish.', turkce: 'Az once bitirdim.', dogruMu: false,
        neden: '3. bicim gerekir: finished.', dogruBicim: 'I have just finished.',
        hataTuru: 'GRAMER_HATASI', altKonu: kJustAlready),
      OrnekCumle(ingilizce: "I haven't yet finished.", turkce: 'Henuz bitirmedim.', dogruMu: false,
        neden: '"yet" cumlenin SONUNA gelir.', dogruBicim: "I haven't finished yet.",
        hataTuru: 'KELIME_SIRASI', altKonu: kJustAlready),
      OrnekCumle(ingilizce: 'She has left already yesterday.', turkce: 'Dun coktan gitmisti.', dogruMu: false,
        neden: '"yesterday" ile Present Perfect kullanilmaz.',
        dogruBicim: 'She left yesterday.', hataTuru: 'ANLAM_FARKI', altKonu: kJustAlready),
      OrnekCumle(ingilizce: 'I do not have seen him.', turkce: 'Onu gormedim.', dogruMu: false,
        neden: 'Perfect olumsuzunda do/does kullanilmaz; "have not" yeter.',
        dogruBicim: "I haven't seen him.", hataTuru: 'GRAMER_HATASI', altKonu: kOlumsuzSoru),
      OrnekCumle(ingilizce: 'Do they have gone?', turkce: 'Gittiler mi?', dogruMu: false,
        neden: 'Soruda "have" basa gecer; do kullanilmaz.',
        dogruBicim: 'Have they gone?', hataTuru: 'GRAMER_HATASI', altKonu: kOlumsuzSoru),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kYapi,
        soru: 'She ___ arrived.',
        secenekler: <String>['have', 'has', 'is'], kabuller: <String>['has'],
        geriDonusKodu: 'AB2'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kUcuncuBicim,
        soru: 'I have ___ to Paris.',
        secenekler: <String>['went', 'been', 'go'], kabuller: <String>['been'],
        geriDonusKodu: 'AB3'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kDeneyim,
        soru: 'Hangisi dogru?',
        secenekler: <String>["I haven't never been there.", 'I have never been there.', 'I have not never been there.'],
        kabuller: <String>['I have never been there.'], geriDonusKodu: 'AB4'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kFark,
        soru: '"Dun onu gordum." hangisi?',
        secenekler: <String>['I have seen him yesterday.', 'I saw him yesterday.', 'I have saw him yesterday.'],
        kabuller: <String>['I saw him yesterday.'], geriDonusKodu: 'AB6'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kJustAlready,
        soru: 'Hangisi dogru?',
        secenekler: <String>["I haven't yet finished.", "I haven't finished yet.", "I yet haven't finished."],
        kabuller: <String>["I haven't finished yet."], geriDonusKodu: 'AB5'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kYapi,
        soru: 'They ___ gone home.', kabuller: <String>['have']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kUcuncuBicim,
        soru: 'He has ___ a letter. (write)', kabuller: <String>['written']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kUcuncuBicim,
        soru: 'She has ___ breakfast. (eat)', kabuller: <String>['eaten']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kUcuncuBicim,
        soru: 'I have ___ my work. (do)', kabuller: <String>['done']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kDeneyim,
        soru: 'Have you ___ seen a lion?', kabuller: <String>['ever']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kUcuncuBicim,
        soru: '"take" fiilinin 3. bicimi?',
        secenekler: <String>['took', 'taken', 'takes'], kabuller: <String>['taken']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kDeneyim,
        soru: '"He has gone to Paris." ne anlatir?',
        secenekler: <String>['Gitti ve dondu', 'Gitti, hala orada', 'Hic gitmedi'],
        kabuller: <String>['Gitti, hala orada']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kJustAlready,
        soru: 'Dizin: finished / just / I / have',
        kabuller: <String>['I have just finished.', 'I have just finished']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kDeneyim,
        soru: 'Dizin: lion / ever / a / Have / seen / you',
        kabuller: <String>['Have you ever seen a lion?',
            'Have you ever seen a lion']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kFark,
        soru: '"I have seen him yesterday." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kYapi, turkce: 'Odevimi bitirdim.',
        kabuller: <String>['I have finished my homework.',
            "I've finished my homework."]),
      SerbestGorev(kod: 'SU-2', altKonu: kDeneyim, turkce: 'Hic aslan gordun mu?',
        kabuller: <String>['Have you ever seen a lion?']),
      SerbestGorev(kod: 'SU-3', altKonu: kJustAlready, turkce: 'Henuz bitirmedim.',
        kabuller: <String>["I haven't finished yet.",
            'I have not finished yet.']),
      SerbestGorev(kod: 'SU-4', altKonu: kFark, turkce: 'Dun onu gordum.',
        kabuller: <String>['I saw him yesterday.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kYapi,
        soru: 'She ___ already left.', kabuller: <String>['has']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kUcuncuBicim,
        soru: 'They have ___ the bus. (take)', kabuller: <String>['taken']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kUcuncuBicim,
        soru: 'She has ___ me a book. (give)', kabuller: <String>['given']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.coktanSecmeli, altKonu: kFark,
        soru: 'Hangisi dogru?',
        secenekler: <String>['She has gone to Paris last year.', 'She went to Paris last year.', 'She has went to Paris last year.'],
        kabuller: <String>['She went to Paris last year.']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.dogruYanlis, altKonu: kOlumsuzSoru,
        soru: '"Do they have gone?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kDeneyim,
        soru: '"I haven\'t never been there." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kYapi,
        soru: 'Dizin: keys / lost / I / my / have',
        kabuller: <String>['I have lost my keys.', 'I have lost my keys']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kJustAlready,
        soru: "I haven't finished ___. (henuz)", kabuller: <String>['yet']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kYapi,
        soru: 'They ___ gone home.',
        secenekler: <String>['has', 'have', 'is'], kabuller: <String>['have']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kUcuncuBicim,
        soru: 'He has ___ a letter.',
        secenekler: <String>['wrote', 'written', 'write'],
        kabuller: <String>['written']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kUcuncuBicim,
        soru: 'I have ___ my work.',
        secenekler: <String>['did', 'done', 'do'], kabuller: <String>['done']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kFark,
        soru: '"Gecen yil Paris\u2019e gitti." hangisi?',
        secenekler: <String>['She has gone to Paris last year.', 'She went to Paris last year.', 'She has been to Paris last year.'],
        kabuller: <String>['She went to Paris last year.']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kOlumsuzSoru,
        soru: 'Hangisi dogru?',
        secenekler: <String>['Do you have finished?', 'Have you finished?', 'Did you have finished?'],
        kabuller: <String>['Have you finished?']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kUcuncuBicim,
        soru: 'She has ___ breakfast. (eat)', kabuller: <String>['eaten']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kDeneyim,
        soru: 'I have ___ been to Japan. (hic)', kabuller: <String>['never']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kJustAlready,
        soru: 'She has ___ left. (coktan)', kabuller: <String>['already']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kFark,
        soru: '"I have seen him yesterday." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kUcuncuBicim,
        soru: '"I have went to Paris." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kOlumsuzSoru,
        soru: '"I do not have seen him." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kDeneyim,
        soru: 'Dizin: sushi / never / eaten / She / has',
        kabuller: <String>['She has never eaten sushi.',
            'She has never eaten sushi']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kYapi,
        soru: 'Ingilizceye cevirin: Anahtarlarimi kaybettim.',
        kabuller: <String>['I have lost my keys.', "I've lost my keys."]),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kDeneyim,
        soru: 'Ingilizceye cevirin: Hic Japonya\u2019ya gitmedik.',
        kabuller: <String>['We have never been to Japan.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kJustAlready,
        soru: 'Ingilizceye cevirin: Az once bitirdim.',
        kabuller: <String>['I have just finished.', "I've just finished."]),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Turkcede karsiligi YOK',
        aciklama: '"-mis" duyumu anlatir; Present Perfect SIMDIYE baglantiyi.',
        ornek: 'I have lost my keys. (kaybettim ve hala yok)'),
      OzetMaddesi(baslik: 'Yapi: have/has + 3. bicim',
        aciklama: 'he/she/it -> has · digerleri -> have. "have" burada yardimci fiil.',
        ornek: 'She has arrived. · They have gone.'),
      OzetMaddesi(baslik: '3. bicim',
        aciklama: 'Duzenlide 2. ile aynidir (-ed); duzensizde farkli olabilir.',
        ornek: 'go · went · gone   ·   see · saw · seen'),
      OzetMaddesi(baslik: 'ever / never',
        aciklama: 'Deneyim anlatir, zaman soylenmez. "never" ile "not" birlikte olmaz.',
        ornek: 'Have you ever seen...? · I have never been...'),
      OzetMaddesi(baslik: 'just / already / yet',
        aciklama: 'just ve already fiilden ONCE, yet cumle SONUNDA.',
        ornek: "I have just eaten. · I haven't eaten yet."),
      OzetMaddesi(baslik: 'KARAR SORUSU',
        aciklama: 'Zaman dilimi BITTI mi? Bittiyse Past Simple, bitmediyse Perfect.',
        ornek: 'I saw him yesterday. · I have seen him today.'),
    ],
  );
}
