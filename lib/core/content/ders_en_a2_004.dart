/// EN-A2-004 — Past Simple: Olumsuz ve Soru (did)
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnA2004 {
  const DersEnA2004._();

  static const String kYalinFiil = 'Fiil YALIN doner';
  static const String kOlumsuz = 'Olumsuz (did not)';
  static const String kSoru = 'Soru (Did ...?)';
  static const String kKisaCevap = 'Kisa cevap';
  static const String kBeFarki = 'was/were ile karistirmama';
  static const String kSoruKelimesi = 'Soru kelimeleri';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A2-004',
    baslik: 'Past Simple — Olumsuz ve Soru (did)',
    seviye: 'A2', konu: 'ZAM', tahminiDk: 35,
    onKosullar: <String>['EN-A2-003', 'EN-A1-012'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'Simdiki zamanda ogrendiginiz kurali hatirlayin (A1-012):\n\n'
        '  He works.  ->  He does not WORK.   (-s "does"a gecti)\n\n'
        'Gecmiste TAM AYNI sey olur:\n\n'
        '  He went.   ->  He did not GO.      (gecmislik "did"e gecti)\n\n'
        'Yani zaman isareti CUMLEDE BIR KEZ tasinir. Yardimci fiil onu '
        'ustlendigi anda ana fiil YALIN hale doner — duzensiz olsa bile.\n\n'
        '  He did not went.  -> YANLIS (iki gecmis isareti)\n'
        '  He did not go.    -> DOGRU\n\n'
        'Bu, "bir kelime bir is" ilkesinin ucuncu goruntusudur:\n'
        '  · kisi bilgisi -> oznede\n'
        '  · zaman bilgisi -> yardimci fiilde\n'
        '  · anlam -> ana fiilde\n\n'
        'IYI HABER: "did" tek bicimdir. "does/do" gibi ozneye gore '
        'degismez. Gecmis zaman burada da daha sadedir.',
    kazanimlar: <String>[
      'Yardimci fiil girince ana fiilin yalin dondugunu icsellestirmek',
      'Olumsuz cumle kurabilmek (did not / didn\u2019t)',
      'Soru cumlesi kurabilmek',
      'Kisa cevap verebilmek',
      'was/were ile did\u2019i karistirmamak',
      'Soru kelimeleriyle gecmis soru kurmak',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'O1', baslik: 'Zaman isareti BIR KEZ tasinir',
        govde: 'Ingilizce cumlede gecmislik yalnizca BIR yerde gorunur.\n\n'
            'Olumlu cumlede fiil tasir:\n'
            '  He WENT to school.\n\n'
            'Olumsuz ve soruda "did" tasir; fiil yukten kurtulur:\n'
            '  He did not GO to school.\n'
            '  DID he GO to school?\n\n'
            'Bu yuzden "did not went" yanlistir: iki kez gecmis isareti.\n\n'
            'A1-012 ile ayni ilke: "does not works" nasil yanlissa, '
            '"did not went" de oyle yanlistir.',
        turkceKarsilastirma: 'Turkcede ek yine fiilde kalir: git-ME-di.\n'
            'Ingilizcede yardimci fiile gecer.'),
      AnlatimBlogu(kod: 'O2', baslik: 'did tek bicimdir',
        govde: 'Simdiki zamanda ozneye gore secim yapiyordunuz:\n\n'
            '  I/you/we/they -> do   ·   he/she/it -> does\n\n'
            'Gecmiste secim YOK:\n\n'
            '  I did · you did · he did · she did · we did · they did\n\n'
            'Tek kelime, butun ozneler icin.\n\n'
            'PRATIK SONUC: Gecmis zamanda olumsuz veya soru kurarken '
            'ozneyi kontrol etmeye hic gerek yok.',
        turkceKarsilastirma: 'O gitmedi.     ->  He did not go.\n'
            'Onlar gitmedi. ->  They did not go.'),
      AnlatimBlogu(kod: 'O3', baslik: 'Olumsuz kurulumu',
        govde: 'Yapi: OZNE + did not + YALIN FIIL\n\n'
            '  I did not work yesterday.\n'
            '  She did not come home.\n'
            '  They did not buy anything.\n\n'
            'Kisaltma: didn\u2019t (butun ozneler icin ayni).\n\n'
            'DIKKAT: Fiil hicbir ek almaz. Ne -ed ne duzensiz bicim.\n'
            '  didn\u2019t worked  -> YANLIS\n'
            '  didn\u2019t went    -> YANLIS\n'
            '  didn\u2019t work / didn\u2019t go  -> DOGRU',
        turkceKarsilastirma: 'Dun calismadim.  ->  I did not work yesterday.'),
      AnlatimBlogu(kod: 'O4', baslik: 'Soru kurulumu',
        govde: 'Yapi: Did + OZNE + YALIN FIIL\n\n'
            '  Did you work yesterday?\n'
            '  Did she come home?\n'
            '  Did they buy a car?\n\n'
            '"did" basa gecer; SIRA degisir, yeni bir ek eklenmez.\n\n'
            'Fiil yine yalindir:\n'
            '  Did she came? -> YANLIS\n'
            '  Did she come? -> DOGRU',
        turkceKarsilastirma: 'Dun calistin mi?  ->  Did you work yesterday?\n'
            'Ek "mi"            ->  basa gelen "Did"'),
      AnlatimBlogu(kod: 'O5', baslik: 'Kisa cevap',
        govde: 'Yardimci fiil tekrarlanir; ana fiil TEKRARLANMAZ:\n\n'
            '  Did you work? -> Yes, I did. / No, I did not.\n'
            '  Did she come? -> Yes, she did. / No, she didn\u2019t.\n\n'
            '"Yes, I worked." yanlis degildir ama kisa cevap kalibi '
            'degildir; dogal olan "Yes, I did."\n\n'
            'DIKKAT: to be sorusuna "did" ile cevap verilmez:\n'
            '  Were you tired? -> Yes, I WAS. (Yes, I did. YANLIS)',
        turkceKarsilastirma: 'Evet, calistim.  ->  Yes, I did.'),
      AnlatimBlogu(kod: 'O6', baslik: 'was/were ile karistirma',
        govde: 'Iki ayri yol vardir ve BIRLESTIRILMEZ:\n\n'
            '  DURUM  -> was / were kendi olumsuzunu yapar\n'
            '     He was not tired.  ·  Were you at home?\n\n'
            '  EYLEM  -> did kullanilir\n'
            '     He did not work.   ·  Did you go home?\n\n'
            'Yanlislar:\n'
            '  He did not was tired.  -> YANLIS\n'
            '  Was he go home?        -> YANLIS\n\n'
            'Kural: Cumlede am/is/are/was/were varsa did GIRMEZ.\n'
            'Bu, A1-004\u2019teki kuralin gecmis karsiligidir.',
        turkceKarsilastirma: 'Yorgun degildi.  ->  He was not tired.\n'
            'Calismadi.       ->  He did not work.'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['He went.', 'He did not', 'He did not go.'],
        turkce: 'O gitmedi.', not: 'Gecmislik "did"e gecti, fiil yalin.'),
      AdimliOrnek(adimlar: <String>['She worked.', 'She did not', 'She did not work.'],
        turkce: 'O calismadi.', not: '-ed duser.'),
      AdimliOrnek(adimlar: <String>['You came.', 'Did you', 'Did you come?'],
        turkce: 'Geldin mi?', not: 'Soruda da fiil yalin.'),
      AdimliOrnek(adimlar: <String>['Did you work?', 'Yes,', 'Yes, I did.'],
        turkce: 'Evet, calistim.', not: 'Ana fiil tekrarlanmaz.'),
      AdimliOrnek(adimlar: <String>['Where', 'Where did', 'Where did you go?'],
        turkce: 'Nereye gittin?', not: 'Soru kelimesi + did + ozne + yalin fiil.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Dun calismadim.', 'Ozne: I', 'Olumsuz -> did not',
        'Fiil YALIN -> work', 'I did not work yesterday.'],
        turkce: 'Olumsuz kurulumu.', not: 'did not worked YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Eve geldi mi?', 'Soru -> Did', 'Ozne: she',
        'Fiil YALIN -> come', 'Did she come home?'],
        turkce: 'Soru kurulumu.', not: 'Did she came YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Yorgun degildi.', 'Bu bir DURUM', 'was kendi olumsuzunu yapar',
        'He was not tired.'],
        turkce: 'did GIRMEZ.', not: 'did not was YANLIS.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I did not work yesterday.', turkce: 'Dun calismadim.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'She did not come home.', turkce: 'Eve gelmedi.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'They did not buy anything.', turkce: 'Hicbir sey almadilar.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'He did not go to school.', turkce: 'Okula gitmedi.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'We did not see the film.', turkce: 'Filmi gormedik.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: "I didn't call her.", turkce: 'Onu aramadim.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: "She didn't study last night.", turkce: 'Dun gece calismadi.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: "They didn't have time.", turkce: 'Zamanlari yoktu.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'Did you work yesterday?', turkce: 'Dun calistin mi?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Did she come home?', turkce: 'Eve geldi mi?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Did they buy a car?', turkce: 'Araba aldilar mi?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Did he go to school?', turkce: 'Okula gitti mi?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Did we meet before?', turkce: 'Daha once tanistik mi?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Did your father call?', turkce: 'Baban aradi mi?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Yes, I did.', turkce: 'Evet, calistim.', dogruMu: true, altKonu: kKisaCevap),
      OrnekCumle(ingilizce: 'No, I did not.', turkce: 'Hayir, calismadim.', dogruMu: true, altKonu: kKisaCevap),
      OrnekCumle(ingilizce: 'Yes, she did.', turkce: 'Evet, geldi.', dogruMu: true, altKonu: kKisaCevap),
      OrnekCumle(ingilizce: "No, they didn't.", turkce: 'Hayir, almadilar.', dogruMu: true, altKonu: kKisaCevap),
      OrnekCumle(ingilizce: 'Where did you go?', turkce: 'Nereye gittin?', dogruMu: true, altKonu: kSoruKelimesi),
      OrnekCumle(ingilizce: 'What did she say?', turkce: 'Ne dedi?', dogruMu: true, altKonu: kSoruKelimesi),
      OrnekCumle(ingilizce: 'When did they arrive?', turkce: 'Ne zaman geldiler?', dogruMu: true, altKonu: kSoruKelimesi),
      OrnekCumle(ingilizce: 'Why did he leave?', turkce: 'Neden gitti?', dogruMu: true, altKonu: kSoruKelimesi),
      OrnekCumle(ingilizce: 'How did you find it?', turkce: 'Onu nasil buldun?', dogruMu: true, altKonu: kSoruKelimesi),
      OrnekCumle(ingilizce: 'He was not tired.', turkce: 'Yorgun degildi.', dogruMu: true, altKonu: kBeFarki),
      OrnekCumle(ingilizce: 'Were you at home?', turkce: 'Evde miydin?', dogruMu: true, altKonu: kBeFarki),
      OrnekCumle(ingilizce: 'He was tired but he did not stop.', turkce: 'Yorgundu ama durmadi.', dogruMu: true, altKonu: kBeFarki),
      OrnekCumle(ingilizce: 'I did not go because I was ill.', turkce: 'Gitmedim cunku hastaydim.', dogruMu: true, altKonu: kBeFarki),
      OrnekCumle(ingilizce: 'She did not read the book.', turkce: 'Kitabi okumadi.', dogruMu: true, altKonu: kYalinFiil),
      OrnekCumle(ingilizce: 'Did you take my pen?', turkce: 'Kalemimi aldin mi?', dogruMu: true, altKonu: kYalinFiil),
      OrnekCumle(ingilizce: 'They did not make a cake.', turkce: 'Kek yapmadilar.', dogruMu: true, altKonu: kYalinFiil),

      OrnekCumle(ingilizce: 'He did not went to school.', turkce: 'Okula gitmedi.', dogruMu: false,
        neden: 'Gecmis isareti "did"e gecti; ana fiil YALIN kalir. Iki kez '
            'gecmis isareti olmaz.', dogruBicim: 'He did not go to school.',
        hataTuru: 'GRAMER_HATASI', altKonu: kYalinFiil),
      OrnekCumle(ingilizce: 'I did not worked yesterday.', turkce: 'Dun calismadim.', dogruMu: false,
        neden: '"did" zaten gecmisi tasiyor; fiil -ed almaz.',
        dogruBicim: 'I did not work yesterday.', hataTuru: 'GRAMER_HATASI', altKonu: kYalinFiil),
      OrnekCumle(ingilizce: 'She did not came home.', turkce: 'Eve gelmedi.', dogruMu: false,
        neden: 'Duzensiz fiil de olsa yalin bicim gelir: come.',
        dogruBicim: 'She did not come home.', hataTuru: 'GRAMER_HATASI', altKonu: kYalinFiil),
      OrnekCumle(ingilizce: 'Did she came home?', turkce: 'Eve geldi mi?', dogruMu: false,
        neden: 'Soruda da fiil yalin kalir.', dogruBicim: 'Did she come home?',
        hataTuru: 'GRAMER_HATASI', altKonu: kYalinFiil),
      OrnekCumle(ingilizce: 'Did you worked yesterday?', turkce: 'Dun calistin mi?', dogruMu: false,
        neden: '"did" varken -ed eklenmez.', dogruBicim: 'Did you work yesterday?',
        hataTuru: 'GRAMER_HATASI', altKonu: kYalinFiil),
      OrnekCumle(ingilizce: 'He not went to school.', turkce: 'Okula gitmedi.', dogruMu: false,
        neden: 'Olumsuzda yardimci fiil ZORUNLUDUR; yalnizca "not" yetmez.',
        dogruBicim: 'He did not go to school.', hataTuru: 'EKSIK_KELIME', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'I not worked yesterday.', turkce: 'Dun calismadim.', dogruMu: false,
        neden: '"did" eksik. Turkcedeki "-me" ekinin karsiligi "did not".',
        dogruBicim: 'I did not work yesterday.', hataTuru: 'EKSIK_KELIME', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'She did not not come.', turkce: 'Gelmedi.', dogruMu: false,
        neden: 'Olumsuzluk bir kez belirtilir.', dogruBicim: 'She did not come.',
        hataTuru: 'FAZLA_KELIME', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'You worked yesterday?', turkce: 'Dun calistin mi?', dogruMu: false,
        neden: 'Soruda "Did" basa gelir; yalnizca soru isareti yetmez.',
        dogruBicim: 'Did you work yesterday?', hataTuru: 'KELIME_SIRASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'Does he go to school yesterday?', turkce: 'Dun okula gitti mi?', dogruMu: false,
        neden: '"yesterday" gecmis zaman ister: Did.',
        dogruBicim: 'Did he go to school yesterday?', hataTuru: 'GRAMER_HATASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'Did they bought a car?', turkce: 'Araba aldilar mi?', dogruMu: false,
        neden: 'Fiil yalin: buy.', dogruBicim: 'Did they buy a car?',
        hataTuru: 'GRAMER_HATASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'Yes, I worked.', turkce: 'Evet, calistim. (kisa cevap)', dogruMu: false,
        neden: 'Kisa cevapta ana fiil tekrarlanmaz; yardimci fiil kullanilir.',
        dogruBicim: 'Yes, I did.', hataTuru: 'GRAMER_HATASI', altKonu: kKisaCevap),
      OrnekCumle(ingilizce: 'Yes, I was. (Did you work?)', turkce: 'Evet, calistim.', dogruMu: false,
        neden: '"did" sorusuna "did" ile cevap verilir.', dogruBicim: 'Yes, I did.',
        hataTuru: 'KELIME_SECIMI', altKonu: kKisaCevap),
      OrnekCumle(ingilizce: 'Yes, I did. (Were you tired?)', turkce: 'Evet, yorgundum.', dogruMu: false,
        neden: 'To be sorusuna to be ile cevap verilir: "Yes, I was."',
        dogruBicim: 'Yes, I was.', hataTuru: 'KELIME_SECIMI', altKonu: kBeFarki),
      OrnekCumle(ingilizce: 'He did not was tired.', turkce: 'Yorgun degildi.', dogruMu: false,
        neden: 'To be kendi olumsuzunu yapar; did GIRMEZ.',
        dogruBicim: 'He was not tired.', hataTuru: 'GRAMER_HATASI', altKonu: kBeFarki),
      OrnekCumle(ingilizce: 'Was he go home?', turkce: 'Eve gitti mi?', dogruMu: false,
        neden: 'Ana fiil varken was/were degil, did kullanilir.',
        dogruBicim: 'Did he go home?', hataTuru: 'GRAMER_HATASI', altKonu: kBeFarki),
      OrnekCumle(ingilizce: 'Did you were at home?', turkce: 'Evde miydin?', dogruMu: false,
        neden: 'To be sorusunda did kullanilmaz.', dogruBicim: 'Were you at home?',
        hataTuru: 'GRAMER_HATASI', altKonu: kBeFarki),
      OrnekCumle(ingilizce: 'Where you did go?', turkce: 'Nereye gittin?', dogruMu: false,
        neden: 'Sira: soru kelimesi + did + ozne + yalin fiil.',
        dogruBicim: 'Where did you go?', hataTuru: 'KELIME_SIRASI', altKonu: kSoruKelimesi),
      OrnekCumle(ingilizce: 'What did she said?', turkce: 'Ne dedi?', dogruMu: false,
        neden: 'Fiil yalin: say.', dogruBicim: 'What did she say?',
        hataTuru: 'GRAMER_HATASI', altKonu: kSoruKelimesi),
      OrnekCumle(ingilizce: 'Why he did leave?', turkce: 'Neden gitti?', dogruMu: false,
        neden: '"did" ozneden ONCE gelir.', dogruBicim: 'Why did he leave?',
        hataTuru: 'KELIME_SIRASI', altKonu: kSoruKelimesi),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kYalinFiil,
        soru: 'Hangisi dogru?',
        secenekler: <String>['He did not went.', 'He did not go.', 'He not went.'],
        kabuller: <String>['He did not go.'], geriDonusKodu: 'O1',
        aciklama: 'Gecmislik "did"te; fiil yalin.'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kOlumsuz,
        soru: 'Gecmiste "they" oznesiyle olumsuz nasil kurulur?',
        secenekler: <String>['they does not', 'they did not', 'they do not'],
        kabuller: <String>['they did not'], geriDonusKodu: 'O2'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kSoru,
        soru: '"You worked." cumlesinin sorusu?',
        secenekler: <String>['You worked?', 'Did you work?', 'Did you worked?'],
        kabuller: <String>['Did you work?'], geriDonusKodu: 'O4'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kKisaCevap,
        soru: '"Did you work?" sorusuna kisa olumlu cevap?',
        secenekler: <String>['Yes, I worked.', 'Yes, I did.', 'Yes, I was.'],
        kabuller: <String>['Yes, I did.'], geriDonusKodu: 'O5'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kBeFarki,
        soru: '"Yorgun degildi." hangisi?',
        secenekler: <String>['He did not was tired.', 'He was not tired.', 'He did not tired.'],
        kabuller: <String>['He was not tired.'], geriDonusKodu: 'O6'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kYalinFiil,
        soru: 'She did not ___ home. (come)', kabuller: <String>['come']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kYalinFiil,
        soru: 'Did you ___ my pen? (take)', kabuller: <String>['take']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kOlumsuz,
        soru: 'They ___ not buy anything.', kabuller: <String>['did']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kSoru,
        soru: '___ he go to school?', kabuller: <String>['Did', 'did']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kSoruKelimesi,
        soru: 'Where ___ you go?', kabuller: <String>['did']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kBeFarki,
        soru: '"Evde miydin?" hangisi?',
        secenekler: <String>['Did you were at home?', 'Were you at home?', 'Did you at home?'],
        kabuller: <String>['Were you at home?']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kKisaCevap,
        soru: '"Did she come?" olumsuz kisa cevap?',
        secenekler: <String>["No, she didn't.", 'No, she was not.', 'No, she came not.'],
        kabuller: <String>["No, she didn't."]),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kOlumsuz,
        soru: 'Dizin: not / work / I / did / yesterday',
        kabuller: <String>['I did not work yesterday.', 'I did not work yesterday']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kSoruKelimesi,
        soru: 'Dizin: go / did / Where / you',
        kabuller: <String>['Where did you go?', 'Where did you go']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kYalinFiil,
        soru: '"Did she came home?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kOlumsuz, turkce: 'Dun calismadim.',
        kabuller: <String>['I did not work yesterday.',
            "I didn't work yesterday."]),
      SerbestGorev(kod: 'SU-2', altKonu: kSoru, turkce: 'Eve geldi mi?',
        kabuller: <String>['Did she come home?', 'Did he come home?']),
      SerbestGorev(kod: 'SU-3', altKonu: kSoruKelimesi, turkce: 'Nereye gittin?',
        kabuller: <String>['Where did you go?']),
      SerbestGorev(kod: 'SU-4', altKonu: kBeFarki, turkce: 'Yorgun degildi.',
        kabuller: <String>['He was not tired.', 'She was not tired.',
            "He wasn't tired.", "She wasn't tired."]),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kYalinFiil,
        soru: 'We did not ___ the film. (see)', kabuller: <String>['see']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kSoru,
        soru: '___ they buy a car?', kabuller: <String>['Did', 'did']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kKisaCevap,
        soru: 'Did you work? — Yes, I ___.', kabuller: <String>['did']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.boslukDoldurma, altKonu: kSoruKelimesi,
        soru: 'What ___ she say?', kabuller: <String>['did']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.coktanSecmeli, altKonu: kBeFarki,
        soru: 'Hangisi dogru?',
        secenekler: <String>['Was he go home?', 'Did he go home?', 'Did he went home?'],
        kabuller: <String>['Did he go home?']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kYalinFiil,
        soru: '"I did not worked." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kSoru,
        soru: 'Dizin: home / Did / come / she',
        kabuller: <String>['Did she come home?', 'Did she come home']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.dogruYanlis, altKonu: kBeFarki,
        soru: '"He did not was tired." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kYalinFiil,
        soru: 'He did not ___ to school.',
        secenekler: <String>['went', 'go', 'goes'], kabuller: <String>['go']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kYalinFiil,
        soru: 'Did she ___ home?',
        secenekler: <String>['came', 'come', 'comes'], kabuller: <String>['come']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kOlumsuz,
        soru: 'They ___ not buy anything.',
        secenekler: <String>['do', 'does', 'did'], kabuller: <String>['did']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kSoru,
        soru: '___ your father call?',
        secenekler: <String>['Do', 'Does', 'Did'], kabuller: <String>['Did']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kBeFarki,
        soru: '"Evde miydin?" hangisi?',
        secenekler: <String>['Did you at home?', 'Were you at home?', 'Did you were at home?'],
        kabuller: <String>['Were you at home?']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kYalinFiil,
        soru: 'They did not ___ a cake. (make)', kabuller: <String>['make']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kSoruKelimesi,
        soru: 'When ___ they arrive?', kabuller: <String>['did']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kKisaCevap,
        soru: 'Did she come? — No, she ___ not.', kabuller: <String>['did']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kYalinFiil,
        soru: '"Did they bought a car?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kOlumsuz,
        soru: '"I not worked yesterday." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kSoruKelimesi,
        soru: '"Where you did go?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kOlumsuz,
        soru: 'Dizin: home / not / come / She / did',
        kabuller: <String>['She did not come home.', 'She did not come home']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kOlumsuz,
        soru: 'Ingilizceye cevirin: Okula gitmedi.',
        kabuller: <String>['He did not go to school.', 'She did not go to school.',
            "He didn't go to school.", "She didn't go to school."]),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kSoru,
        soru: 'Ingilizceye cevirin: Dun calistin mi?',
        kabuller: <String>['Did you work yesterday?']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kSoruKelimesi,
        soru: 'Ingilizceye cevirin: Ne dedi?',
        kabuller: <String>['What did she say?', 'What did he say?']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Zaman isareti BIR KEZ',
        aciklama: '"did" gecmisi ustlenince ana fiil yalin doner.',
        ornek: 'He did not go. (did not went DEGIL)'),
      OzetMaddesi(baslik: 'did tek bicimdir',
        aciklama: 'do/does gibi ozneye gore degismez. Butun ozneler icin ayni.',
        ornek: 'I did · he did · they did'),
      OzetMaddesi(baslik: 'Olumsuz',
        aciklama: 'Ozne + did not + YALIN fiil.',
        ornek: "I did not work. · She didn't come."),
      OzetMaddesi(baslik: 'Soru',
        aciklama: 'Did + ozne + YALIN fiil. Sira degisir.',
        ornek: 'Did you work? · Did she come?'),
      OzetMaddesi(baslik: 'Kisa cevap',
        aciklama: 'Yardimci fiil tekrarlanir, ana fiil tekrarlanmaz.',
        ornek: 'Yes, I did. · No, she didn\u2019t.'),
      OzetMaddesi(baslik: 'was/were ile karistirma',
        aciklama: 'Durum -> was/were kendi olumsuzunu yapar. Eylem -> did.',
        ornek: 'He was not tired. · He did not work.'),
    ],
  );
}
