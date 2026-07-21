/// EN-A1-004 — be: Olumsuz ve Soru
/// SADECE VERI. EN-A1-002'nin derinlestirilmesi.
library;

import '../model/ders_sablonu.dart';

class DersEnA1004 {
  const DersEnA1004._();

  static const String kOlumsuz = 'Olumsuz (not)';
  static const String kKisaltma = 'Kisaltmalar';
  static const String kSoru = 'Soru (sira degisimi)';
  static const String kKisaCevap = 'Kisa cevap';
  static const String kSoruKelimesi = 'Soru kelimeleri';
  static const String kDoFarki = 'do/does ile karistirmama';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A1-004',
    baslik: 'be — Olumsuz ve Soru',
    seviye: 'A1', konu: 'YAP', tahminiDk: 35,
    onKosullar: <String>['EN-A1-002'],
    girisMetni:
        'To Be dersinde am/is/are secmeyi ogrendin. Bu derste ayni fiili '
        'OLUMSUZ ve SORU bicimlerinde kullanacaksin.\n\n'
        'Iyi haber: to be kendi isini kendi gorur. Baska bir yardimci '
        'fiile IHTIYAC DUYMAZ.\n\n'
        '  Olumsuz: not, to be\u2019den HEMEN SONRA gelir.\n'
        '  Soru:    to be cumlenin BASINA gecer.\n\n'
        'En sik hata sudur: "Does she is a doctor?" — to be varken '
        'do/does GIRMEZ. Ikisi ayni gorevi gorur.\n\n'
        'Turkcede olumsuzluk "degil", soru "mi" ile yapilir; ikisi de '
        'ayri kelimedir. Ingilizcede olumsuzluk ayri kelime, soru ise '
        'SIRA degisimidir.',
    kazanimlar: <String>[
      'Olumsuz cumlede not\u2019u dogru yere koymak',
      "isn't / aren't kisaltmalarini kullanmak",
      'Soru cumlesinde sirayi ters cevirmek',
      'Kisa cevap verebilmek (Yes, I am. / No, she is not.)',
      'Soru kelimeleriyle (what, where, who) soru kurmak',
      'To be cumlesinde do/does kullanmamak',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'K1', baslik: 'not nereye gelir?',
        govde: 'Kural tek cumlelik: "not" to be\u2019den HEMEN SONRA gelir.\n\n'
            'I am not tired.\n'
            'He is not a doctor.\n'
            'They are not here.\n\n'
            'Turkcede "degil" cumlenin SONUNA gelir: "O doktor DEGIL."\n'
            'Ingilizcede ortaya girer. Sira farki tam burada.',
        turkceKarsilastirma: 'O doktor degil.  ->  He is not a doctor.\n'
            '"degil" sonda     ->  "not" ortada'),
      AnlatimBlogu(kod: 'K2', baslik: 'Kisaltmalar',
        govde: 'Gunluk dilde kisaltma kullanilir:\n\n'
            'is not   -> isn\u2019t\n'
            'are not  -> aren\u2019t\n\n'
            'DIKKAT: "am not" kisalmaz. "amn\u2019t" diye bir kelime YOKTUR.\n'
            'Yalnizca "I\u2019m not" bicimi vardir.\n\n'
            'Iki kisaltma yolu da dogrudur:\n'
            'She is not here. = She isn\u2019t here. = She\u2019s not here.',
        turkceKarsilastirma: 'O burada degil.  ->  She isn\u2019t here.'),
      AnlatimBlogu(kod: 'K3', baslik: 'Soru: sira ters doner',
        govde: 'Soru sorarken to be cumlenin BASINA gecer. Yeni kelime '
            'EKLENMEZ.\n\n'
            'You are ready.      ->  Are you ready?\n'
            'She is a doctor.    ->  Is she a doctor?\n'
            'They are students.  ->  Are they students?\n\n'
            'Turkcede "mi" eki eklenir ve sira degismez. Ingilizcede tam '
            'tersi: kelime eklenmez, SIRA degisir.\n\n'
            'Yalnizca soru isareti koymak yetmez: "You are ready?" eksiktir.',
        turkceKarsilastirma: 'Hazir misin?  ->  Are you ready?\n'
            'Ek "mi"        ->  SIRA degisimi'),
      AnlatimBlogu(kod: 'K4', baslik: 'Kisa cevap',
        govde: 'Tek basina "Yes" veya "No" kaba durur. To be tekrarlanir:\n\n'
            'Are you ready?     -> Yes, I am. / No, I am not.\n'
            'Is she a doctor?   -> Yes, she is. / No, she is not.\n'
            'Are they students? -> Yes, they are. / No, they are not.\n\n'
            'DIKKAT: Olumlu kisa cevapta KISALTMA olmaz.\n'
            '"Yes, I\u2019m." yanlistir; "Yes, I am." dogrudur.\n'
            'Olumsuzda kisaltma serbesttir: "No, I\u2019m not."',
        turkceKarsilastirma: 'Evet, hazirim.  ->  Yes, I am.'),
      AnlatimBlogu(kod: 'K5', baslik: 'Soru kelimeleriyle',
        govde: 'Soru kelimesi EN BASA gelir, to be ondan sonra:\n\n'
            'SORU KELIMESI + be + ozne\n\n'
            'What is your name?\n'
            'Where are you?\n'
            'Who is that man?\n'
            'How old are you?\n\n'
            'Sira yine ters: "Where you are?" yanlistir.',
        turkceKarsilastirma: 'Adin ne?    ->  What is your name?\n'
            'Neredesin?  ->  Where are you?'),
      AnlatimBlogu(kod: 'K6', baslik: 'do/does GIRMEZ',
        govde: 'To be zaten yardimci fiil gorevini kendisi gorur. Yanina '
            'baska yardimci fiil alinmaz.\n\n'
            'Does she is a doctor?   -> YANLIS\n'
            'Is she a doctor?        -> DOGRU\n\n'
            'She does not is here.   -> YANLIS\n'
            'She is not here.        -> DOGRU\n\n'
            'Kural: Cumlede am/is/are varsa do/does ASLA girmez.\n'
            'do/does yalnizca ana fiilli cumlelerde kullanilir '
            '(A1-012): Does she work here?',
        turkceKarsilastirma: 'O doktor mu?   ->  Is she a doctor?\n'
            'O calisir mi?  ->  Does she work?'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['He is a doctor.', 'He is not', 'He is not a doctor.'],
        turkce: 'O doktor degil.', not: '"not" is\u2019ten hemen sonra.'),
      AdimliOrnek(adimlar: <String>['She is not here.', "She isn't", "She isn't here."],
        turkce: 'O burada degil.', not: 'is not -> isn\u2019t.'),
      AdimliOrnek(adimlar: <String>['You are ready.', 'Are you', 'Are you ready?'],
        turkce: 'Hazir misin?', not: 'To be basa gecti.'),
      AdimliOrnek(adimlar: <String>['Are you ready?', 'Yes,', 'Yes, I am.'],
        turkce: 'Evet, hazirim.', not: 'Kisa cevapta kisaltma YOK.'),
      AdimliOrnek(adimlar: <String>['Where', 'Where are', 'Where are you?'],
        turkce: 'Neredesin?', not: 'Soru kelimesi en basta.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Ben yorgun degilim.', 'Ozne: I -> am', 'not, am\u2019den sonra',
        'I am not tired.'],
        turkce: 'Olumsuz kurulumu.', not: 'I not am YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Onlar ogrenci mi?', 'Duz cumle: They are students.',
        'Ilk iki kelime yer degistirir', 'Are they students?'],
        turkce: 'Soru kurulumu.', not: 'Yeni kelime eklenmez.'),
      AdimliOrnek(adimlar: <String>[
        'Adin ne?', 'Soru kelimesi: What', 'What is', 'What is your name?'],
        turkce: 'Soru kelimesiyle.', not: 'What your name is YANLIS.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I am not tired.', turkce: 'Yorgun degilim.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'He is not a doctor.', turkce: 'O doktor degil.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'She is not at home.', turkce: 'O evde degil.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'They are not here.', turkce: 'Onlar burada degil.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'We are not late.', turkce: 'Gec kalmadik.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'It is not cold today.', turkce: 'Bugun hava soguk degil.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'The shop is not open.', turkce: 'Dukkan acik degil.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: "She isn't here.", turkce: 'O burada degil.', dogruMu: true, altKonu: kKisaltma),
      OrnekCumle(ingilizce: "They aren't students.", turkce: 'Onlar ogrenci degil.', dogruMu: true, altKonu: kKisaltma),
      OrnekCumle(ingilizce: "I'm not ready.", turkce: 'Hazir degilim.', dogruMu: true, altKonu: kKisaltma),
      OrnekCumle(ingilizce: "It isn't expensive.", turkce: 'Pahali degil.', dogruMu: true, altKonu: kKisaltma),
      OrnekCumle(ingilizce: "We aren't hungry.", turkce: 'Ac degiliz.', dogruMu: true, altKonu: kKisaltma),
      OrnekCumle(ingilizce: 'Are you ready?', turkce: 'Hazir misin?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Is she a doctor?', turkce: 'O doktor mu?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Are they students?', turkce: 'Onlar ogrenci mi?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Is it cold outside?', turkce: 'Disarisi soguk mu?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Am I late?', turkce: 'Gec mi kaldim?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Is your father at work?', turkce: 'Baban iste mi?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Yes, I am.', turkce: 'Evet, oyleyim.', dogruMu: true, altKonu: kKisaCevap),
      OrnekCumle(ingilizce: 'No, I am not.', turkce: 'Hayir, degilim.', dogruMu: true, altKonu: kKisaCevap),
      OrnekCumle(ingilizce: 'Yes, she is.', turkce: 'Evet, oyle.', dogruMu: true, altKonu: kKisaCevap),
      OrnekCumle(ingilizce: 'No, they are not.', turkce: 'Hayir, degiller.', dogruMu: true, altKonu: kKisaCevap),
      OrnekCumle(ingilizce: "No, I'm not.", turkce: 'Hayir, degilim.', dogruMu: true, altKonu: kKisaCevap),
      OrnekCumle(ingilizce: 'What is your name?', turkce: 'Adin ne?', dogruMu: true, altKonu: kSoruKelimesi),
      OrnekCumle(ingilizce: 'Where are you?', turkce: 'Neredesin?', dogruMu: true, altKonu: kSoruKelimesi),
      OrnekCumle(ingilizce: 'Who is that man?', turkce: 'Su adam kim?', dogruMu: true, altKonu: kSoruKelimesi),
      OrnekCumle(ingilizce: 'How old are you?', turkce: 'Kac yasindasin?', dogruMu: true, altKonu: kSoruKelimesi),
      OrnekCumle(ingilizce: 'Where is the shop?', turkce: 'Dukkan nerede?', dogruMu: true, altKonu: kSoruKelimesi),
      OrnekCumle(ingilizce: 'Is she a teacher?', turkce: 'O ogretmen mi?', dogruMu: true, altKonu: kDoFarki),
      OrnekCumle(ingilizce: 'Does she work here?', turkce: 'Burada calisir mi?', dogruMu: true, altKonu: kDoFarki),

      OrnekCumle(ingilizce: 'I not am tired.', turkce: 'Yorgun degilim.', dogruMu: false,
        neden: '"not" to be\u2019den SONRA gelir, once degil.',
        dogruBicim: 'I am not tired.', hataTuru: 'KELIME_SIRASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'He is a doctor not.', turkce: 'O doktor degil.', dogruMu: false,
        neden: 'Turkcede "degil" sonda gelir, Ingilizcede "not" ORTADA. '
            'Sira farki burada.', dogruBicim: 'He is not a doctor.',
        hataTuru: 'KELIME_SIRASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'They not are here.', turkce: 'Onlar burada degil.', dogruMu: false,
        neden: '"not" are\u2019dan sonra gelmeli.', dogruBicim: 'They are not here.',
        hataTuru: 'KELIME_SIRASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'She not here.', turkce: 'O burada degil.', dogruMu: false,
        neden: 'To be eksik. Olumsuzda da am/is/are yazilir.',
        dogruBicim: 'She is not here.', hataTuru: 'EKSIK_KELIME', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: "I amn't ready.", turkce: 'Hazir degilim.', dogruMu: false,
        neden: '"am not" KISALMAZ. "amn\u2019t" diye bir kelime yoktur; '
            '"I\u2019m not" kullanilir.', dogruBicim: "I'm not ready.",
        hataTuru: 'YAZIM_HATASI', altKonu: kKisaltma),
      OrnekCumle(ingilizce: "She isnt here.", turkce: 'O burada degil.', dogruMu: false,
        neden: 'Kisaltmada kesme isareti zorunludur: isn\u2019t.',
        dogruBicim: "She isn't here.", hataTuru: 'YAZIM_HATASI', altKonu: kKisaltma),
      OrnekCumle(ingilizce: "They arent't students.", turkce: 'Onlar ogrenci degil.', dogruMu: false,
        neden: 'Kisaltma bicimi yanlis yazilmis: aren\u2019t.',
        dogruBicim: "They aren't students.", hataTuru: 'YAZIM_HATASI', altKonu: kKisaltma),
      OrnekCumle(ingilizce: 'You are ready?', turkce: 'Hazir misin?', dogruMu: false,
        neden: 'Soruda SIRA degisir. Yalnizca soru isareti koymak yetmez.',
        dogruBicim: 'Are you ready?', hataTuru: 'KELIME_SIRASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'She is a doctor?', turkce: 'O doktor mu?', dogruMu: false,
        neden: 'To be basa gecmeli: Is she a doctor?',
        dogruBicim: 'Is she a doctor?', hataTuru: 'KELIME_SIRASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'Are he at home?', turkce: 'O evde mi?', dogruMu: false,
        neden: 'Soruda da ozne-fiil uyumu korunur: he -> is.',
        dogruBicim: 'Is he at home?', hataTuru: 'GRAMER_HATASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'Is they students?', turkce: 'Onlar ogrenci mi?', dogruMu: false,
        neden: '"they" cogul -> are.', dogruBicim: 'Are they students?',
        hataTuru: 'GRAMER_HATASI', altKonu: kSoru),
      OrnekCumle(ingilizce: "Yes, I'm.", turkce: 'Evet, oyleyim.', dogruMu: false,
        neden: 'Olumlu kisa cevapta KISALTMA kullanilmaz. "Yes, I am." '
            'denir.', dogruBicim: 'Yes, I am.', hataTuru: 'GRAMER_HATASI', altKonu: kKisaCevap),
      OrnekCumle(ingilizce: "Yes, she's.", turkce: 'Evet, oyle.', dogruMu: false,
        neden: 'Olumlu kisa cevap kisaltilmaz: "Yes, she is."',
        dogruBicim: 'Yes, she is.', hataTuru: 'GRAMER_HATASI', altKonu: kKisaCevap),
      OrnekCumle(ingilizce: 'Yes, I do.', turkce: 'Evet, oyleyim. (Are you ready?)', dogruMu: false,
        neden: 'To be sorusuna to be ile cevap verilir: "Yes, I am."',
        dogruBicim: 'Yes, I am.', hataTuru: 'KELIME_SECIMI', altKonu: kKisaCevap),
      OrnekCumle(ingilizce: 'What your name is?', turkce: 'Adin ne?', dogruMu: false,
        neden: 'Soru kelimesinden sonra to be gelir: What IS your name?',
        dogruBicim: 'What is your name?', hataTuru: 'KELIME_SIRASI', altKonu: kSoruKelimesi),
      OrnekCumle(ingilizce: 'Where you are?', turkce: 'Neredesin?', dogruMu: false,
        neden: 'Sira ters olmali: Where ARE you?', dogruBicim: 'Where are you?',
        hataTuru: 'KELIME_SIRASI', altKonu: kSoruKelimesi),
      OrnekCumle(ingilizce: 'How old you are?', turkce: 'Kac yasindasin?', dogruMu: false,
        neden: 'Soru kelimesi + be + ozne sirasi korunur.',
        dogruBicim: 'How old are you?', hataTuru: 'KELIME_SIRASI', altKonu: kSoruKelimesi),
      OrnekCumle(ingilizce: 'Does she is a doctor?', turkce: 'O doktor mu?', dogruMu: false,
        neden: 'To be varken do/does GIRMEZ; ikisi ayni gorevi gorur.',
        dogruBicim: 'Is she a doctor?', hataTuru: 'GRAMER_HATASI', altKonu: kDoFarki),
      OrnekCumle(ingilizce: 'She does not is here.', turkce: 'O burada degil.', dogruMu: false,
        neden: 'To be olumsuzu "is not" seklindedir; do/does eklenmez.',
        dogruBicim: 'She is not here.', hataTuru: 'GRAMER_HATASI', altKonu: kDoFarki),
      OrnekCumle(ingilizce: 'Is she work here?', turkce: 'Burada calisir mi?', dogruMu: false,
        neden: 'Ana fiil varken to be degil, do/does kullanilir.',
        dogruBicim: 'Does she work here?', hataTuru: 'GRAMER_HATASI', altKonu: kDoFarki),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kOlumsuz,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I not am tired.', 'I am not tired.', 'I am tired not.'],
        kabuller: <String>['I am not tired.'], geriDonusKodu: 'K1'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kKisaltma,
        soru: '"Hazir degilim." hangisi?',
        secenekler: <String>["I amn't ready.", "I'm not ready.", "I not ready."],
        kabuller: <String>["I'm not ready."], geriDonusKodu: 'K2',
        aciklama: '"am not" kisalmaz.'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kSoru,
        soru: '"You are ready." cumlesinin sorusu?',
        secenekler: <String>['You are ready?', 'Are you ready?', 'Do you are ready?'],
        kabuller: <String>['Are you ready?'], geriDonusKodu: 'K3'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kKisaCevap,
        soru: '"Are you ready?" sorusuna olumlu kisa cevap?',
        secenekler: <String>["Yes, I'm.", 'Yes, I am.', 'Yes, I do.'],
        kabuller: <String>['Yes, I am.'], geriDonusKodu: 'K4'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kDoFarki,
        soru: 'Hangisi dogru?',
        secenekler: <String>['Does she is a doctor?', 'Is she a doctor?', 'Do she is a doctor?'],
        kabuller: <String>['Is she a doctor?'], geriDonusKodu: 'K6'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kOlumsuz,
        soru: 'He is ___ a doctor.', kabuller: <String>['not']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kOlumsuz,
        soru: 'They ___ not here.', kabuller: <String>['are']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kSoru,
        soru: '___ she a teacher?', kabuller: <String>['Is', 'is']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kSoru,
        soru: '___ they students?', kabuller: <String>['Are', 'are']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kSoruKelimesi,
        soru: 'Where ___ you?', kabuller: <String>['are']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kKisaCevap,
        soru: '"Is she a doctor?" olumsuz kisa cevap?',
        secenekler: <String>['No, she does not.', 'No, she is not.', "No, she's."],
        kabuller: <String>['No, she is not.']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kKisaltma,
        soru: '"are not" kisaltmasi?',
        secenekler: <String>["arent", "aren't", "amn't"], kabuller: <String>["aren't"]),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kOlumsuz,
        soru: 'Dizin: not / She / at home / is',
        kabuller: <String>['She is not at home.', 'She is not at home']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kSoruKelimesi,
        soru: 'Dizin: name / What / your / is',
        kabuller: <String>['What is your name?', 'What is your name']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kDoFarki,
        soru: '"She does not is here." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kOlumsuz, turkce: 'O doktor degil.',
        kabuller: <String>['He is not a doctor.', "He isn't a doctor."]),
      SerbestGorev(kod: 'SU-2', altKonu: kSoru, turkce: 'Onlar ogrenci mi?',
        kabuller: <String>['Are they students?']),
      SerbestGorev(kod: 'SU-3', altKonu: kSoruKelimesi, turkce: 'Neredesin?',
        kabuller: <String>['Where are you?']),
      SerbestGorev(kod: 'SU-4', altKonu: kKisaCevap, turkce: 'Evet, hazirim.',
        kabuller: <String>['Yes, I am.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kOlumsuz,
        soru: 'It is ___ cold today.', kabuller: <String>['not']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kSoru,
        soru: '___ it cold outside?', kabuller: <String>['Is', 'is']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kSoruKelimesi,
        soru: 'Who ___ that man?', kabuller: <String>['is']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.boslukDoldurma, altKonu: kKisaCevap,
        soru: 'Are they students? — No, they ___ not.', kabuller: <String>['are']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.coktanSecmeli, altKonu: kKisaltma,
        soru: 'Hangisi dogru?',
        secenekler: <String>["I amn't here.", "I'm not here.", "I aren't here."],
        kabuller: <String>["I'm not here."]),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kKisaCevap,
        soru: '"Yes, I\'m." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kSoru,
        soru: 'Dizin: ready / Are / you',
        kabuller: <String>['Are you ready?', 'Are you ready']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.dogruYanlis, altKonu: kDoFarki,
        soru: '"Does she is a doctor?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kOlumsuz,
        soru: 'Hangisi dogru?',
        secenekler: <String>['They not are here.', 'They are not here.', 'They are here not.'],
        kabuller: <String>['They are not here.']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kKisaltma,
        soru: '"is not" kisaltmasi?',
        secenekler: <String>["isnt", "isn't", "amn't"], kabuller: <String>["isn't"]),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kSoru,
        soru: '___ your father at work?', secenekler: <String>['Is', 'Are', 'Does'],
        kabuller: <String>['Is']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kSoru,
        soru: '___ I late?', secenekler: <String>['Am', 'Is', 'Do'],
        kabuller: <String>['Am']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kDoFarki,
        soru: '"Burada calisir mi?" hangisi?',
        secenekler: <String>['Is she work here?', 'Does she work here?', 'Does she is work here?'],
        kabuller: <String>['Does she work here?']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kOlumsuz,
        soru: 'The shop is ___ open.', kabuller: <String>['not']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kSoruKelimesi,
        soru: 'How old ___ you?', kabuller: <String>['are']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kKisaCevap,
        soru: 'Is she a doctor? — Yes, she ___.', kabuller: <String>['is']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kKisaltma,
        soru: '"I amn\'t ready." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kSoru,
        soru: '"You are ready?" dogru bir soru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kSoruKelimesi,
        soru: '"Where you are?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kSoru,
        soru: 'Dizin: students / they / Are',
        kabuller: <String>['Are they students?', 'Are they students']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kOlumsuz,
        soru: 'Ingilizceye cevirin: O evde degil.',
        kabuller: <String>['She is not at home.', 'He is not at home.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kSoruKelimesi,
        soru: 'Ingilizceye cevirin: Adin ne?',
        kabuller: <String>['What is your name?']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kKisaCevap,
        soru: 'Ingilizceye cevirin: Hayir, degilim.',
        kabuller: <String>['No, I am not.', "No, I'm not."]),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'not nereye gelir',
        aciklama: 'To be\u2019den HEMEN SONRA. Turkcede "degil" sonda, burada ortada.',
        ornek: 'He is not a doctor.'),
      OzetMaddesi(baslik: 'Kisaltmalar',
        aciklama: "isn't · aren't. Ama \"am not\" KISALMAZ — I'm not.",
        ornek: "She isn't here. · I'm not ready."),
      OzetMaddesi(baslik: 'Soru: sira degisir',
        aciklama: 'To be basa gecer. Yeni kelime EKLENMEZ.',
        ornek: 'Are you ready? · Is she a doctor?'),
      OzetMaddesi(baslik: 'Kisa cevap',
        aciklama: 'Olumluda kisaltma YOK, olumsuzda serbest.',
        ornek: "Yes, I am. (Yes, I'm. YANLIS) · No, I'm not."),
      OzetMaddesi(baslik: 'Soru kelimeleri',
        aciklama: 'SORU KELIMESI + be + ozne sirasi.',
        ornek: 'What is your name? · Where are you?'),
      OzetMaddesi(baslik: 'do/does GIRMEZ',
        aciklama: 'To be kendi yardimci gorevini gorur.',
        ornek: 'Is she a doctor? (Does she is? YANLIS)'),
    ],
  );
}
