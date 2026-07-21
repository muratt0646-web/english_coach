/// EN-A1-012 — Present Simple: Olumsuz ve Soru (do / does)
/// SADECE VERI. Hedef hata kodu: AUX-01.
library;

import '../model/ders_sablonu.dart';

class DersEnA1012 {
  const DersEnA1012._();

  static const String kOlumsuz = 'Olumsuz (do/does not)';
  static const String kSoru = 'Soru (Do/Does ...?)';
  static const String kYalinFiil = 'Fiil yalin kalir';
  static const String kKisaCevap = 'Kisa cevap';
  static const String kBeFarki = 'be ile karistirmama';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A1-012',
    baslik: 'Present Simple — Olumsuz ve Soru (do / does)',
    seviye: 'A1', konu: 'ZAM', tahminiDk: 35,
    onKosullar: <String>['EN-A1-010', 'EN-A1-011'],
    girisMetni:
        'Turkcede olumsuzluk fiilin ICINE girer: gel-ME-m, calis-MA-z.\n\n'
        'Soru da ekle olur: geliyor MU-sun?\n\n'
        'Ingilizcede ikisi de AYRI bir kelimeyle yapilir: do / does.\n'
        'Bu kelime cumleye girdigi anda ana fiil YALIN kalir.\n\n'
        'En sik hata sudur: "He does not works." Cekim iki yerde birden '
        'olamaz — ya "does" tasir ya fiil.',
    kazanimlar: <String>[
      'do ve does arasindaki secimi yapabilmek',
      'Olumsuz cumle kurabilmek',
      'Soru cumlesi kurabilmek',
      'Yardimci fiil varken ana fiili YALIN birakmak',
      'Kisa cevap verebilmek (Yes, I do. / No, he does not.)',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'D1', baslik: 'Neden ayri bir kelime?',
        govde: 'Turkcede olumsuzluk ve soru EK ile yapilir; fiil sekil '
            'degistirir.\n\n'
            'Ingilizce fiil bu isi yapamaz. Yardimci bir kelime cagrilir: '
            'do (veya does).\n\n'
            'Bu kelime cumlenin "tasiyicisi" olur; ana fiil isini ona birakir.',
        turkceKarsilastirma: 'Calismam.      ->  I do not work.\n'
            'Ek "-ma"       ->  ayri kelime "do not"'),
      AnlatimBlogu(kod: 'D2', baslik: 'do mu does mu?',
        govde: 'Secim ozneye gore yapilir — tam olarak -s kuralindaki gibi:\n\n'
            'he / she / it  ->  DOES\n'
            'I / you / we / they  ->  DO\n\n'
            'Tekil isimler does alir: The shop does not open early.\n'
            'Cogul isimler do alir: The shops do not open early.',
        turkceKarsilastirma: 'O calismaz.     ->  He does not work.\n'
            'Onlar calismaz. ->  They do not work.'),
      AnlatimBlogu(kod: 'D3', baslik: 'Ana fiil YALIN kalir',
        govde: 'En kritik kural budur.\n\n'
            'Olumlu cumlede -s fiildedir:  He workS.\n'
            'Olumsuzda -s "does"a gecer:   He doeS not work.\n\n'
            'Cekim IKI yerde birden olamaz. "does not works" yanlistir.\n\n'
            'Ayni kural soruda da gecerlidir: "Does he work?"',
        turkceKarsilastirma: 'O calismaz.\n'
            'He does not work.   (works DEGIL)'),
      AnlatimBlogu(kod: 'D4', baslik: 'Soruda sira degisir',
        govde: 'Yardimci fiil cumlenin BASINA gecer:\n\n'
            'You like coffee.  ->  Do you like coffee?\n'
            'She reads books.  ->  Does she read books?\n\n'
            'Dikkat: "reads" -> "read" oldu. Cekim "does"a gecti.\n\n'
            'Turkcede yalnizca ek eklenir, sira degismez. Ingilizcede SIRA '
            'degisir.',
        turkceKarsilastirma: 'Kahve sever misin?  ->  Do you like coffee?'),
      AnlatimBlogu(kod: 'D5', baslik: 'Kisa cevap',
        govde: 'Ingilizcede "Evet" veya "Hayir" tek basina kaba durur. '
            'Yardimci fiil tekrarlanir:\n\n'
            'Do you like coffee?   ->  Yes, I do. / No, I do not.\n'
            'Does he work here?    ->  Yes, he does. / No, he does not.\n\n'
            'Kisa cevapta ana fiil TEKRARLANMAZ: "Yes, I like." yanlistir.',
        turkceKarsilastirma: 'Evet, severim.  ->  Yes, I do.'),
      AnlatimBlogu(kod: 'D6', baslik: 'be ile karistirma',
        govde: 'To be cumlelerinde do/does KULLANILMAZ. To be zaten kendi '
            'yardimci gorevini gorur.\n\n'
            'She is a doctor.  ->  Is she a doctor?    (Does she is? YANLIS)\n'
            'She works here.   ->  Does she work here?  (Is she work? YANLIS)\n\n'
            'Kural: Cumlede am/is/are varsa do/does GIRMEZ.',
        turkceKarsilastirma: 'O doktor mu?   ->  Is she a doctor?\n'
            'O calisir mi?  ->  Does she work?'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['He works.', 'He does not', 'He does not work.'],
        turkce: 'O calismaz.', not: '-s fiilden "does"a gecti.'),
      AdimliOrnek(adimlar: <String>['They like it.', 'They do not', 'They do not like it.'],
        turkce: 'Onlar sevmez.', not: 'Cogul ozne -> do.'),
      AdimliOrnek(adimlar: <String>['She reads.', 'Does she', 'Does she read?'],
        turkce: 'O okur mu?', not: 'Soruda "does" basa gecti, fiil yalin kaldi.'),
      AdimliOrnek(adimlar: <String>['Do you like coffee?', 'Yes,', 'Yes, I do.'],
        turkce: 'Evet, severim.', not: 'Kisa cevapta yardimci fiil tekrarlanir.'),
      AdimliOrnek(adimlar: <String>['She is a doctor.', 'Is she', 'Is she a doctor?'],
        turkce: 'O doktor mu?', not: 'To be cumlesinde do/does YOK.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Ali kahve icmez.', 'Ali = he -> does', 'does not', 'Ali does not drink coffee.'],
        turkce: 'Ozel isim -> does.', not: 'Fiil yalin: drink.'),
      AdimliOrnek(adimlar: <String>[
        'Onlar burada calisir mi?', 'They -> do', 'Do they', 'Do they work here?'],
        turkce: 'Cogul ozne -> do.', not: 'Soruda do basa gecer.'),
      AdimliOrnek(adimlar: <String>[
        'Hayir, calismaz.', 'Ozne he -> does', 'No, he does not.', 'No, he does not.'],
        turkce: 'Kisa olumsuz cevap.', not: 'Ana fiil tekrarlanmaz.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I do not like tea.', turkce: 'Cay sevmem.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'You do not work here.', turkce: 'Burada calismazsin.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'We do not eat meat.', turkce: 'Et yemeyiz.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'They do not live here.', turkce: 'Burada yasamazlar.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'He does not drink coffee.', turkce: 'Kahve icmez.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'She does not read books.', turkce: 'Kitap okumaz.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'It does not rain in summer.', turkce: 'Yazin yagmur yagmaz.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'Ali does not speak French.', turkce: 'Ali Fransizca konusmaz.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'The shop does not open early.', turkce: 'Dukkan erken acilmaz.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'The children do not play here.', turkce: 'Cocuklar burada oynamaz.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: "I don't want it.", turkce: 'Onu istemiyorum.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: "She doesn't help me.", turkce: 'Bana yardim etmez.', dogruMu: true, altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'Do you like coffee?', turkce: 'Kahve sever misin?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Do they study English?', turkce: 'Ingilizce calisirlar mi?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Do we need bread?', turkce: 'Ekmege ihtiyacimiz var mi?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Does he work here?', turkce: 'Burada calisir mi?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Does she speak English?', turkce: 'Ingilizce konusur mu?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Does it help?', turkce: 'Yardimi olur mu?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Does your father read the newspaper?', turkce: 'Baban gazete okur mu?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Do the students listen?', turkce: 'Ogrenciler dinler mi?', dogruMu: true, altKonu: kSoru),
      OrnekCumle(ingilizce: 'Yes, I do.', turkce: 'Evet, severim.', dogruMu: true, altKonu: kKisaCevap),
      OrnekCumle(ingilizce: 'No, I do not.', turkce: 'Hayir, sevmem.', dogruMu: true, altKonu: kKisaCevap),
      OrnekCumle(ingilizce: 'Yes, he does.', turkce: 'Evet, calisir.', dogruMu: true, altKonu: kKisaCevap),
      OrnekCumle(ingilizce: 'No, she does not.', turkce: 'Hayir, konusmaz.', dogruMu: true, altKonu: kKisaCevap),
      OrnekCumle(ingilizce: 'Yes, they do.', turkce: 'Evet, calisirlar.', dogruMu: true, altKonu: kKisaCevap),
      OrnekCumle(ingilizce: 'Is she a doctor?', turkce: 'O doktor mu?', dogruMu: true, altKonu: kBeFarki),
      OrnekCumle(ingilizce: 'She is not a teacher.', turkce: 'O ogretmen degil.', dogruMu: true, altKonu: kBeFarki),
      OrnekCumle(ingilizce: 'Are they students?', turkce: 'Onlar ogrenci mi?', dogruMu: true, altKonu: kBeFarki),
      OrnekCumle(ingilizce: 'He does not go to school.', turkce: 'Okula gitmez.', dogruMu: true, altKonu: kYalinFiil),
      OrnekCumle(ingilizce: 'Does she study math?', turkce: 'Matematik calisir mi?', dogruMu: true, altKonu: kYalinFiil),

      OrnekCumle(ingilizce: 'He does not works here.', turkce: 'Burada calismaz.', dogruMu: false,
        neden: 'Cekim IKI yerde birden olamaz. "does" zaten -s tasiyor; '
            'ana fiil yalin kalir.', dogruBicim: 'He does not work here.',
        hataTuru: 'GRAMER_HATASI', altKonu: kYalinFiil),
      OrnekCumle(ingilizce: 'Does she reads books?', turkce: 'Kitap okur mu?', dogruMu: false,
        neden: 'Soruda da -s "does"tadir; ana fiil yalin kalir.',
        dogruBicim: 'Does she read books?', hataTuru: 'GRAMER_HATASI', altKonu: kYalinFiil),
      OrnekCumle(ingilizce: 'She do not read books.', turkce: 'Kitap okumaz.', dogruMu: false,
        neden: 'Ozne "she" tekil ucuncu kisidir; "does" alir.',
        dogruBicim: 'She does not read books.', hataTuru: 'GRAMER_HATASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'They does not work.', turkce: 'Calismazlar.', dogruMu: false,
        neden: '"they" cogul; "do" alir.', dogruBicim: 'They do not work.',
        hataTuru: 'GRAMER_HATASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'I does not like tea.', turkce: 'Cay sevmem.', dogruMu: false,
        neden: '"does" yalnizca he/she/it icindir. "I" -> do.',
        dogruBicim: 'I do not like tea.', hataTuru: 'GRAMER_HATASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'He not work here.', turkce: 'Burada calismaz.', dogruMu: false,
        neden: 'Olumsuzda yardimci fiil ZORUNLUDUR. Yalnizca "not" yetmez.',
        dogruBicim: 'He does not work here.', hataTuru: 'GRAMER_HATASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'I not like tea.', turkce: 'Cay sevmem.', dogruMu: false,
        neden: '"do" eksik. Turkcedeki "-me" ekinin karsiligi "do not".',
        dogruBicim: 'I do not like tea.', hataTuru: 'GRAMER_HATASI', altKonu: kOlumsuz),
      OrnekCumle(ingilizce: 'You like coffee?', turkce: 'Kahve sever misin?', dogruMu: false,
        neden: 'Soruda sira degisir; basa "Do" gelir. Yalnizca soru isareti '
            'yetmez.', dogruBicim: 'Do you like coffee?',
        hataTuru: 'KELIME_SIRASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'He works here?', turkce: 'Burada calisir mi?', dogruMu: false,
        neden: 'Soru yapisi kurulmamis. "Does" basa gelmeli, fiil yalin olmali.',
        dogruBicim: 'Does he work here?', hataTuru: 'KELIME_SIRASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'Do he work here?', turkce: 'Burada calisir mi?', dogruMu: false,
        neden: 'Ozne "he" -> "Does". Soruda da uyum korunur.',
        dogruBicim: 'Does he work here?', hataTuru: 'GRAMER_HATASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'Does they study English?', turkce: 'Ingilizce calisirlar mi?', dogruMu: false,
        neden: '"they" cogul -> "Do".', dogruBicim: 'Do they study English?',
        hataTuru: 'GRAMER_HATASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'Yes, I like.', turkce: 'Evet, severim.', dogruMu: false,
        neden: 'Kisa cevapta ana fiil tekrarlanmaz; yardimci fiil kullanilir.',
        dogruBicim: 'Yes, I do.', hataTuru: 'GRAMER_HATASI', altKonu: kKisaCevap),
      OrnekCumle(ingilizce: 'Yes, he do.', turkce: 'Evet, calisir.', dogruMu: false,
        neden: 'Ozne "he" -> "does".', dogruBicim: 'Yes, he does.',
        hataTuru: 'GRAMER_HATASI', altKonu: kKisaCevap),
      OrnekCumle(ingilizce: 'No, she doesn.', turkce: 'Hayir, konusmaz.', dogruMu: false,
        neden: 'Kisaltma yalnizca "not" ile olur: doesn\u2019t. Tek basina '
            '"doesn" diye bir kelime yoktur.', dogruBicim: "No, she doesn't.",
        hataTuru: 'YAZIM_HATASI', altKonu: kKisaCevap),
      OrnekCumle(ingilizce: 'Does she is a doctor?', turkce: 'O doktor mu?', dogruMu: false,
        neden: 'To be cumlesinde do/does KULLANILMAZ. "is" zaten yardimci '
            'gorevi gorur.', dogruBicim: 'Is she a doctor?',
        hataTuru: 'GRAMER_HATASI', altKonu: kBeFarki),
      OrnekCumle(ingilizce: 'She does not is a teacher.', turkce: 'O ogretmen degil.', dogruMu: false,
        neden: 'To be olumsuzu "is not" seklindedir; do/does girmez.',
        dogruBicim: 'She is not a teacher.', hataTuru: 'GRAMER_HATASI', altKonu: kBeFarki),
      OrnekCumle(ingilizce: 'Is she work here?', turkce: 'Burada calisir mi?', dogruMu: false,
        neden: 'Ana fiil varken to be degil, do/does kullanilir.',
        dogruBicim: 'Does she work here?', hataTuru: 'GRAMER_HATASI', altKonu: kBeFarki),
      OrnekCumle(ingilizce: 'He do not goes to school.', turkce: 'Okula gitmez.', dogruMu: false,
        neden: 'Iki hata: ozne "he" -> does, ve ana fiil yalin kalmali.',
        dogruBicim: 'He does not go to school.', hataTuru: 'GRAMER_HATASI', altKonu: kYalinFiil),
      OrnekCumle(ingilizce: 'Does the children play here?', turkce: 'Cocuklar burada oynar mi?', dogruMu: false,
        neden: '"children" cogul bir isimdir -> "Do".',
        dogruBicim: 'Do the children play here?', hataTuru: 'GRAMER_HATASI', altKonu: kSoru),
      OrnekCumle(ingilizce: 'Do the shop open early?', turkce: 'Dukkan erken acilir mi?', dogruMu: false,
        neden: '"the shop" tekil -> "Does".', dogruBicim: 'Does the shop open early?',
        hataTuru: 'GRAMER_HATASI', altKonu: kSoru),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kOlumsuz,
        soru: 'He ___ not work here.', secenekler: <String>['do', 'does', 'is'],
        kabuller: <String>['does'], geriDonusKodu: 'D2', aciklama: 'he -> does.'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kYalinFiil,
        soru: 'Hangisi dogru?',
        secenekler: <String>['She does not works.', 'She does not work.', 'She not works.'],
        kabuller: <String>['She does not work.'], geriDonusKodu: 'D3',
        aciklama: 'Cekim "does"ta; fiil yalin.'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kSoru,
        soru: '"You like coffee." cumlesinin sorusu?',
        secenekler: <String>['You like coffee?', 'Do you like coffee?', 'Does you like coffee?'],
        kabuller: <String>['Do you like coffee?'], geriDonusKodu: 'D4',
        aciklama: 'Do basa gecer.'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kKisaCevap,
        soru: '"Does he work here?" sorusuna kisa olumlu cevap?',
        secenekler: <String>['Yes, he works.', 'Yes, he does.', 'Yes, he do.'],
        kabuller: <String>['Yes, he does.'], geriDonusKodu: 'D5'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kBeFarki,
        soru: '"She is a doctor." cumlesinin sorusu?',
        secenekler: <String>['Does she is a doctor?', 'Is she a doctor?', 'Do she is a doctor?'],
        kabuller: <String>['Is she a doctor?'], geriDonusKodu: 'D6',
        aciklama: 'To be cumlesinde do/does yok.'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kOlumsuz,
        soru: 'They ___ not live here.', kabuller: <String>['do']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kOlumsuz,
        soru: 'She ___ not read books.', kabuller: <String>['does']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kYalinFiil,
        soru: 'He does not ___ coffee. (drink)', kabuller: <String>['drink']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kSoru,
        soru: '___ your father read the newspaper?', kabuller: <String>['Does', 'does']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kSoru,
        soru: '___ the children play here?', kabuller: <String>['Do', 'do']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kKisaCevap,
        soru: '"Do you like tea?" -> kisa olumsuz cevap?',
        secenekler: <String>['No, I do not.', 'No, I not.', 'No, I does not.'],
        kabuller: <String>['No, I do not.']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kBeFarki,
        soru: '"They are students." cumlesinin sorusu?',
        secenekler: <String>['Do they are students?', 'Are they students?', 'Does they students?'],
        kabuller: <String>['Are they students?']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kOlumsuz,
        soru: 'Dizin: not / He / work / does / here',
        kabuller: <String>['He does not work here.', 'He does not work here']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kSoru,
        soru: 'Dizin: she / Does / English / speak',
        kabuller: <String>['Does she speak English?', 'Does she speak English']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kYalinFiil,
        soru: '"Does he works?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis'],
        aciklama: 'Cekim does\u2019ta; fiil yalin olmali.'),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kOlumsuz, turkce: 'O kahve icmez.',
        kabuller: <String>['He does not drink coffee.', "He doesn't drink coffee."]),
      SerbestGorev(kod: 'SU-2', altKonu: kSoru, turkce: 'Ingilizce konusur musun?',
        kabuller: <String>['Do you speak English?']),
      SerbestGorev(kod: 'SU-3', altKonu: kSoru, turkce: 'O burada calisir mi?',
        kabuller: <String>['Does he work here?', 'Does she work here?']),
      SerbestGorev(kod: 'SU-4', altKonu: kKisaCevap, turkce: 'Hayir, sevmem.',
        kabuller: <String>['No, I do not.', "No, I don't."]),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kOlumsuz,
        soru: 'I ___ not want it.', kabuller: <String>['do']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kOlumsuz,
        soru: 'It ___ not rain in summer.', kabuller: <String>['does']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kYalinFiil,
        soru: 'Does she ___ math? (study)', kabuller: <String>['study']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.coktanSecmeli, altKonu: kSoru,
        soru: 'Hangisi dogru?',
        secenekler: <String>['Do the shop open?', 'Does the shop open?', 'Does the shop opens?'],
        kabuller: <String>['Does the shop open?']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.dogruYanlis, altKonu: kBeFarki,
        soru: '"Does she is a doctor?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.kelimeDizme, altKonu: kSoru,
        soru: 'Dizin: they / Do / English / study',
        kabuller: <String>['Do they study English?', 'Do they study English']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.boslukDoldurma, altKonu: kKisaCevap,
        soru: 'Does he work here? — Yes, he ___.', kabuller: <String>['does']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.dogruYanlis, altKonu: kOlumsuz,
        soru: '"He not work here." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kOlumsuz,
        soru: 'She ___ not like tea.', secenekler: <String>['do', 'does', 'is'],
        kabuller: <String>['does']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kOlumsuz,
        soru: 'We ___ not eat meat.', secenekler: <String>['do', 'does', 'are'],
        kabuller: <String>['do']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kSoru,
        soru: '___ he speak French?', secenekler: <String>['Do', 'Does', 'Is'],
        kabuller: <String>['Does']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kSoru,
        soru: '___ the students listen?', secenekler: <String>['Do', 'Does', 'Are'],
        kabuller: <String>['Do']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kBeFarki,
        soru: '___ they students?', secenekler: <String>['Do', 'Does', 'Are'],
        kabuller: <String>['Are']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kYalinFiil,
        soru: 'He does not ___ to school. (go)', kabuller: <String>['go']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kYalinFiil,
        soru: 'Does she ___ books? (read)', kabuller: <String>['read']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kKisaCevap,
        soru: 'Do you like coffee? — No, I ___ not.', kabuller: <String>['do']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kYalinFiil,
        soru: '"He does not works." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kBeFarki,
        soru: '"Is she work here?" dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.kelimeDizme, altKonu: kOlumsuz,
        soru: 'Dizin: not / They / live / do / here',
        kabuller: <String>['They do not live here.', 'They do not live here']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kSoru,
        soru: 'Dizin: coffee / Do / like / you',
        kabuller: <String>['Do you like coffee?', 'Do you like coffee']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kOlumsuz,
        soru: 'Ingilizceye cevirin: O kitap okumaz.',
        kabuller: <String>['She does not read books.', 'He does not read books.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kSoru,
        soru: 'Ingilizceye cevirin: Burada calisir misin?',
        kabuller: <String>['Do you work here?']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kKisaCevap,
        soru: 'Ingilizceye cevirin: Evet, calisir. (o)',
        kabuller: <String>['Yes, he does.', 'Yes, she does.']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'do / does secimi',
        aciklama: 'he/she/it -> does · I/you/we/they -> do. -s kuralinin aynisi.',
        ornek: 'He does not work. · They do not work.'),
      OzetMaddesi(baslik: 'Ana fiil YALIN kalir',
        aciklama: 'Cekim ya "does"ta olur ya fiilde; ikisinde birden asla.',
        ornek: 'He does not work. (works DEGIL)'),
      OzetMaddesi(baslik: 'Olumsuz cumle',
        aciklama: 'Ozne + do/does + not + yalin fiil.',
        ornek: 'I do not like tea.'),
      OzetMaddesi(baslik: 'Soru cumlesi',
        aciklama: 'Yardimci fiil BASA gecer; sira degisir.',
        ornek: 'Do you like coffee? · Does she read books?'),
      OzetMaddesi(baslik: 'Kisa cevap',
        aciklama: 'Ana fiil tekrarlanmaz, yardimci fiil kullanilir.',
        ornek: 'Yes, I do. · No, he does not.'),
      OzetMaddesi(baslik: 'be ile karistirma',
        aciklama: 'Cumlede am/is/are varsa do/does GIRMEZ.',
        ornek: 'Is she a doctor? (Does she is? YANLIS)'),
    ],
  );
}
