/// EN-A2-020 — Zaman Edatlari: in / on / at ve digerleri
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnA2020 {
  const DersEnA2020._();

  static const String kAt = 'at (nokta: saat)';
  static const String kOn = 'on (gun ve tarih)';
  static const String kIn = 'in (uzun dilim)';
  static const String kEdatsiz = 'Edat almayanlar';
  static const String kSure = 'for / during / while';
  static const String kSinir = 'before / after / until';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A2-020',
    baslik: 'Zaman Edatlari — in / on / at',
    seviye: 'A2', konu: 'YAP', tahminiDk: 35,
    onKosullar: <String>['EN-A1-030', 'EN-A2-019'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'Yer edatlarinda gordugunuz mantik zamanda da AYNEN gecerlidir.\n\n'
        'Turkce zamanda yine tek ek kullanir: "-de / -da".\n\n'
        '  bes-TE · pazartesi-DE · mayis-TA · 2020-DE\n'
        '  Hepsi ayni ek.\n\n'
        'Ingilizce ZAMANIN BUYUKLUGUNE gore uce boler:\n\n'
        '  at -> NOKTA gibi kisa   ->  at 5 o\u2019clock · at night\n'
        '  on -> GUN buyuklugunde  ->  on Monday · on July 5\n'
        '  in -> DAHA UZUN dilim   ->  in May · in 2020 · in the morning\n\n'
        'DUSUNME KURALI: Zaman diliminin buyuklugunu dusunun.\n\n'
        '  Kucukten buyuge:  at < on < in\n\n'
        'Yer edatlarinda "at" bir noktaydi, "in" bir hacimdi. Zamanda '
        'da ayni: "at" bir an, "in" bir kusatan dilim.\n\n'
        'Ayni mantik, iki farkli alan. Bu, Ingilizcenin tutarli '
        'yanlarindan biridir.',
    kazanimlar: <String>[
      'Zaman diliminin buyuklugune gore edat secebilmek',
      'at / on / in kullanimlarini ayirt etmek',
      'Edat almayan zaman ifadelerini tanimak',
      'for / during / while farkini bilmek',
      'before / after / until kullanmak',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'AF1', baslik: 'Buyukluk olcegi: at < on < in',
        govde: 'Zaman diliminin buyuklugu edati belirler:\n\n'
            '  AT -> en kucuk, bir NOKTA\n'
            '     at 5 o\u2019clock · at midnight · at noon\n\n'
            '  ON -> bir GUN buyuklugunde\n'
            '     on Monday · on July 5 · on my birthday\n\n'
            '  IN -> gunden BUYUK dilimler\n'
            '     in May · in 2020 · in summer · in the morning\n\n'
            'DUSUNME ALISKANLIGI: Ifadeyi duydugunuzda "bu ne kadar '
            'uzun?" diye sorun. Saat mi, gun mu, ay mi?',
        turkceKarsilastirma: 'Beste  ->  at five\n'
            'Mayista -> in May\n'
            'Ayni ek  ->  farkli edat'),
      AnlatimBlogu(kod: 'AF2', baslik: 'at: nokta gibi zamanlar',
        govde: 'Saatler ve nokta gibi anlar "at" alir:\n\n'
            '  at 5 o\u2019clock · at 7:30 · at midnight · at noon\n'
            '  at night · at the weekend (Ingiliz kullanimi)\n'
            '  at Christmas · at the moment\n\n'
            'DIKKAT: "at night" ama "in the morning / afternoon / '
            'evening". Gecenin nokta gibi dusunulmesi tarihsel bir '
            'kullanimdir; ezberlenir.\n\n'
            '  I get up at seven.\n'
            '  She works at night.',
        turkceKarsilastirma: 'Yedide kalkarim.  ->  I get up at seven.\n'
            'Geceleri calisir. ->  She works at night.'),
      AnlatimBlogu(kod: 'AF3', baslik: 'on: gunler ve tarihler',
        govde: 'Bir GUN belirtiliyorsa "on" gelir:\n\n'
            '  on Monday · on Friday · on Mondays (her pazartesi)\n'
            '  on July 5 · on 12 March\n'
            '  on my birthday · on New Year\u2019s Day\n\n'
            'Gunun bir bolumu belirtilse bile gun varsa "on" kalir:\n\n'
            '  in the morning       (genel)\n'
            '  ON Monday morning    (belirli gun)\n\n'
            'Bu ayrinti sik atlanir: gun adi varsa "on" kazanir.',
        turkceKarsilastirma: 'Pazartesi geliyor.  ->  He is coming on Monday.\n'
            'Pazartesi sabahi   ->  on Monday morning'),
      AnlatimBlogu(kod: 'AF4', baslik: 'in: gunden buyuk dilimler',
        govde: 'Ay, mevsim, yil ve yuzyil "in" alir:\n\n'
            '  in May · in summer · in 2020 · in the 21st century\n'
            '  in the morning · in the afternoon · in the evening\n'
            '  in a week · in two hours (bundan sonra)\n\n'
            'DIKKAT: "in two hours" GELECEK anlami tasir:\n'
            '  I will be there in two hours. (iki saat SONRA)\n\n'
            'Bunu "for two hours" ile karistirmayin:\n'
            '  I waited for two hours. (iki saat BOYUNCA)',
        turkceKarsilastirma: 'Mayista  ->  in May\n'
            'Iki saat sonra -> in two hours'),
      AnlatimBlogu(kod: 'AF5', baslik: 'Edat ALMAYAN ifadeler',
        govde: 'Bazi zaman ifadeleri hicbir edat almaz:\n\n'
            '  today · tomorrow · yesterday\n'
            '  this week · this year · next month · last night\n'
            '  every day · all day\n\n'
            '  I saw him yesterday.     (on yesterday DEGIL)\n'
            '  We are meeting next week. (in next week DEGIL)\n\n'
            'KURAL: "this / next / last / every" varsa edat DUSER.\n\n'
            'Bu, Turkce konusanin sik yaptigi bir fazlalik hatasidir; '
            'Turkcede "gecen hafta-DA" denebildigi icin edat eklenir.',
        turkceKarsilastirma: 'Gecen hafta geldi.  ->  He came last week.\n'
            '(in last week DEGIL)'),
      AnlatimBlogu(kod: 'AF6', baslik: 'Sure ve sinir bildirenler',
        govde: 'SURE:\n'
            '  for + uzunluk       -> I waited for two hours.\n'
            '  during + olay/donem -> during the meeting · during summer\n'
            '  while + cumle       -> while I was working\n\n'
            'FARK: "during" isim alir, "while" cumle alir.\n'
            '  during the film (isim)  ·  while I watched (cumle)\n\n'
            'SINIR:\n'
            '  before -> once     ->  before lunch\n'
            '  after  -> sonra    ->  after work\n'
            '  until  -> -e kadar ->  until Friday\n'
            '  from ... to ...    ->  from 9 to 5',
        turkceKarsilastirma: 'Toplanti sirasinda  ->  during the meeting\n'
            'Ben calisirken      ->  while I was working'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['5 o\u2019clock', 'at 5 o\u2019clock', 'I get up at five.'],
        turkce: 'Beste kalkarim.', not: 'Nokta -> at.'),
      AdimliOrnek(adimlar: <String>['Monday', 'on Monday', 'He is coming on Monday.'],
        turkce: 'Pazartesi geliyor.', not: 'Gun -> on.'),
      AdimliOrnek(adimlar: <String>['May', 'in May', 'We travel in May.'],
        turkce: 'Mayista seyahat ederiz.', not: 'Ay -> in.'),
      AdimliOrnek(adimlar: <String>['yesterday', 'I saw him yesterday.'],
        turkce: 'Dun onu gordum.', not: 'Edat YOK.'),
      AdimliOrnek(adimlar: <String>['in two hours', 'for two hours'],
        turkce: 'iki saat sonra / iki saat boyunca', not: 'Farkli anlam.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Pazartesi sabahi geliyor.', 'Gun var mi? EVET -> on',
        'on Monday morning', 'He is coming on Monday morning.'],
        turkce: 'Gun adi varsa on kazanir.', not: 'in the morning genel.'),
      AdimliOrnek(adimlar: <String>[
        'Gecen hafta geldi.', '"last" var -> edat DUSER',
        'last week', 'He came last week.'],
        turkce: 'this/next/last -> edat yok.', not: 'in last week YANLIS.'),
      AdimliOrnek(adimlar: <String>[
        'Iki saat bekledim.', 'Sure uzunlugu -> for',
        'for two hours', 'I waited for two hours.'],
        turkce: 'Sure -> for.', not: 'in two hours = iki saat SONRA.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I get up at seven.', turkce: 'Yedide kalkarim.', dogruMu: true, altKonu: kAt),
      OrnekCumle(ingilizce: 'The film starts at 7:30.', turkce: 'Film 7:30\u2019da basliyor.', dogruMu: true, altKonu: kAt),
      OrnekCumle(ingilizce: 'She works at night.', turkce: 'Geceleri calisir.', dogruMu: true, altKonu: kAt),
      OrnekCumle(ingilizce: 'We left at midnight.', turkce: 'Gece yarisi ciktik.', dogruMu: true, altKonu: kAt),
      OrnekCumle(ingilizce: 'I am busy at the moment.', turkce: 'Su anda mesgulum.', dogruMu: true, altKonu: kAt),
      OrnekCumle(ingilizce: 'He is coming on Monday.', turkce: 'Pazartesi geliyor.', dogruMu: true, altKonu: kOn),
      OrnekCumle(ingilizce: 'We meet on Fridays.', turkce: 'Cumalari bulusuruz.', dogruMu: true, altKonu: kOn),
      OrnekCumle(ingilizce: 'My birthday is on July 5.', turkce: 'Dogum gunum 5 Temmuz.', dogruMu: true, altKonu: kOn),
      OrnekCumle(ingilizce: 'He is coming on Monday morning.', turkce: 'Pazartesi sabahi geliyor.', dogruMu: true, altKonu: kOn),
      OrnekCumle(ingilizce: 'We travel in May.', turkce: 'Mayista seyahat ederiz.', dogruMu: true, altKonu: kIn),
      OrnekCumle(ingilizce: 'She was born in 2005.', turkce: '2005\u2019te dogdu.', dogruMu: true, altKonu: kIn),
      OrnekCumle(ingilizce: 'It is cold in winter.', turkce: 'Kisin hava soguk.', dogruMu: true, altKonu: kIn),
      OrnekCumle(ingilizce: 'I read in the morning.', turkce: 'Sabahlari okurum.', dogruMu: true, altKonu: kIn),
      OrnekCumle(ingilizce: 'I will be there in two hours.', turkce: 'Iki saat sonra orada olacagim.', dogruMu: true, altKonu: kIn),
      OrnekCumle(ingilizce: 'I saw him yesterday.', turkce: 'Dun onu gordum.', dogruMu: true, altKonu: kEdatsiz),
      OrnekCumle(ingilizce: 'We are meeting next week.', turkce: 'Gelecek hafta bulusuyoruz.', dogruMu: true, altKonu: kEdatsiz),
      OrnekCumle(ingilizce: 'He came last night.', turkce: 'Dun gece geldi.', dogruMu: true, altKonu: kEdatsiz),
      OrnekCumle(ingilizce: 'I go to the gym every day.', turkce: 'Her gun spora giderim.', dogruMu: true, altKonu: kEdatsiz),
      OrnekCumle(ingilizce: 'She is busy this week.', turkce: 'Bu hafta mesgul.', dogruMu: true, altKonu: kEdatsiz),
      OrnekCumle(ingilizce: 'I waited for two hours.', turkce: 'Iki saat bekledim.', dogruMu: true, altKonu: kSure),
      OrnekCumle(ingilizce: 'She slept during the film.', turkce: 'Film sirasinda uyudu.', dogruMu: true, altKonu: kSure),
      OrnekCumle(ingilizce: 'It rained during the night.', turkce: 'Gece boyunca yagmur yagdi.', dogruMu: true, altKonu: kSure),
      OrnekCumle(ingilizce: 'He called while I was working.', turkce: 'Ben calisirken aradi.', dogruMu: true, altKonu: kSure),
      OrnekCumle(ingilizce: 'We talked while we walked.', turkce: 'Yururken konustuk.', dogruMu: true, altKonu: kSure),
      OrnekCumle(ingilizce: 'Wash your hands before lunch.', turkce: 'Ogle yemeginden once ellerini yika.', dogruMu: true, altKonu: kSinir),
      OrnekCumle(ingilizce: 'I go home after work.', turkce: 'Isten sonra eve giderim.', dogruMu: true, altKonu: kSinir),
      OrnekCumle(ingilizce: 'Wait here until Friday.', turkce: 'Cumaya kadar burada bekle.', dogruMu: true, altKonu: kSinir),
      OrnekCumle(ingilizce: 'I work from nine to five.', turkce: 'Dokuzdan bese kadar calisirim.', dogruMu: true, altKonu: kSinir),
      OrnekCumle(ingilizce: 'The shop is open from Monday to Friday.', turkce: 'Dukkan pazartesiden cumaya acik.', dogruMu: true, altKonu: kSinir),
      OrnekCumle(ingilizce: 'She stayed until midnight.', turkce: 'Gece yarisina kadar kaldi.', dogruMu: true, altKonu: kSinir),

      OrnekCumle(ingilizce: 'I get up in seven.', turkce: 'Yedide kalkarim.', dogruMu: false,
        neden: 'Saatler NOKTA gibidir; "at" kullanilir.',
        dogruBicim: 'I get up at seven.', hataTuru: 'KELIME_SECIMI', altKonu: kAt),
      OrnekCumle(ingilizce: 'The film starts on 7:30.', turkce: 'Film 7:30\u2019da basliyor.', dogruMu: false,
        neden: 'Saat -> at.', dogruBicim: 'The film starts at 7:30.',
        hataTuru: 'KELIME_SECIMI', altKonu: kAt),
      OrnekCumle(ingilizce: 'She works in night.', turkce: 'Geceleri calisir.', dogruMu: false,
        neden: 'Kalip "at night"tir. (Ama "in the morning" dogrudur.)',
        dogruBicim: 'She works at night.', hataTuru: 'KELIME_SECIMI', altKonu: kAt),
      OrnekCumle(ingilizce: 'He is coming in Monday.', turkce: 'Pazartesi geliyor.', dogruMu: false,
        neden: 'Gunler "on" alir.', dogruBicim: 'He is coming on Monday.',
        hataTuru: 'KELIME_SECIMI', altKonu: kOn),
      OrnekCumle(ingilizce: 'My birthday is in July 5.', turkce: 'Dogum gunum 5 Temmuz.', dogruMu: false,
        neden: 'Tam tarih -> on. (Yalnizca "in July" dogru olurdu.)',
        dogruBicim: 'My birthday is on July 5.', hataTuru: 'KELIME_SECIMI', altKonu: kOn),
      OrnekCumle(ingilizce: 'We meet at Fridays.', turkce: 'Cumalari bulusuruz.', dogruMu: false,
        neden: 'Gun adlari "on" alir.', dogruBicim: 'We meet on Fridays.',
        hataTuru: 'KELIME_SECIMI', altKonu: kOn),
      OrnekCumle(ingilizce: 'He is coming in Monday morning.', turkce: 'Pazartesi sabahi geliyor.', dogruMu: false,
        neden: 'Gun adi varsa "on" kazanir.',
        dogruBicim: 'He is coming on Monday morning.', hataTuru: 'KELIME_SECIMI', altKonu: kOn),
      OrnekCumle(ingilizce: 'We travel on May.', turkce: 'Mayista seyahat ederiz.', dogruMu: false,
        neden: 'Aylar "in" alir.', dogruBicim: 'We travel in May.',
        hataTuru: 'KELIME_SECIMI', altKonu: kIn),
      OrnekCumle(ingilizce: 'She was born on 2005.', turkce: '2005\u2019te dogdu.', dogruMu: false,
        neden: 'Yillar "in" alir.', dogruBicim: 'She was born in 2005.',
        hataTuru: 'KELIME_SECIMI', altKonu: kIn),
      OrnekCumle(ingilizce: 'It is cold at winter.', turkce: 'Kisin hava soguk.', dogruMu: false,
        neden: 'Mevsimler "in" alir.', dogruBicim: 'It is cold in winter.',
        hataTuru: 'KELIME_SECIMI', altKonu: kIn),
      OrnekCumle(ingilizce: 'I read at the morning.', turkce: 'Sabahlari okurum.', dogruMu: false,
        neden: 'Kalip "in the morning"dur.', dogruBicim: 'I read in the morning.',
        hataTuru: 'KELIME_SECIMI', altKonu: kIn),
      OrnekCumle(ingilizce: 'I saw him on yesterday.', turkce: 'Dun onu gordum.', dogruMu: false,
        neden: '"yesterday" edat ALMAZ.', dogruBicim: 'I saw him yesterday.',
        hataTuru: 'FAZLA_KELIME', altKonu: kEdatsiz),
      OrnekCumle(ingilizce: 'We are meeting in next week.', turkce: 'Gelecek hafta bulusuyoruz.', dogruMu: false,
        neden: '"next" varsa edat duser.', dogruBicim: 'We are meeting next week.',
        hataTuru: 'FAZLA_KELIME', altKonu: kEdatsiz),
      OrnekCumle(ingilizce: 'He came at last night.', turkce: 'Dun gece geldi.', dogruMu: false,
        neden: '"last" varsa edat duser.', dogruBicim: 'He came last night.',
        hataTuru: 'FAZLA_KELIME', altKonu: kEdatsiz),
      OrnekCumle(ingilizce: 'She is busy in this week.', turkce: 'Bu hafta mesgul.', dogruMu: false,
        neden: '"this" varsa edat duser.', dogruBicim: 'She is busy this week.',
        hataTuru: 'FAZLA_KELIME', altKonu: kEdatsiz),
      OrnekCumle(ingilizce: 'I waited during two hours.', turkce: 'Iki saat bekledim.', dogruMu: false,
        neden: 'Sure UZUNLUGU icin "for" kullanilir; "during" olay/donem alir.',
        dogruBicim: 'I waited for two hours.', hataTuru: 'KELIME_SECIMI', altKonu: kSure),
      OrnekCumle(ingilizce: 'She slept for the film.', turkce: 'Film sirasinda uyudu.', dogruMu: false,
        neden: 'Bir olay boyunca ise "during" kullanilir.',
        dogruBicim: 'She slept during the film.', hataTuru: 'KELIME_SECIMI', altKonu: kSure),
      OrnekCumle(ingilizce: 'He called during I was working.', turkce: 'Ben calisirken aradi.', dogruMu: false,
        neden: '"during" ISIM alir; cumle geliyorsa "while" kullanilir.',
        dogruBicim: 'He called while I was working.', hataTuru: 'KELIME_SECIMI', altKonu: kSure),
      OrnekCumle(ingilizce: 'She slept while the film.', turkce: 'Film sirasinda uyudu.', dogruMu: false,
        neden: '"while" CUMLE alir; isim geliyorsa "during" kullanilir.',
        dogruBicim: 'She slept during the film.', hataTuru: 'KELIME_SECIMI', altKonu: kSure),
      OrnekCumle(ingilizce: 'I work from nine until five o\u2019clock to.', turkce: 'Dokuzdan bese calisirim.', dogruMu: false,
        neden: 'Kalip "from ... to ..." seklindedir; fazlalik var.',
        dogruBicim: 'I work from nine to five.', hataTuru: 'FAZLA_KELIME', altKonu: kSinir),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kAt,
        soru: 'I get up ___ seven.',
        secenekler: <String>['in', 'on', 'at'], kabuller: <String>['at'],
        geriDonusKodu: 'AF2'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kOn,
        soru: 'He is coming ___ Monday.',
        secenekler: <String>['in', 'on', 'at'], kabuller: <String>['on'],
        geriDonusKodu: 'AF3'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kIn,
        soru: 'She was born ___ 2005.',
        secenekler: <String>['in', 'on', 'at'], kabuller: <String>['in'],
        geriDonusKodu: 'AF4'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kEdatsiz,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I saw him on yesterday.', 'I saw him yesterday.', 'I saw him in yesterday.'],
        kabuller: <String>['I saw him yesterday.'], geriDonusKodu: 'AF5'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kSure,
        soru: 'He called ___ I was working.',
        secenekler: <String>['during', 'while', 'for'],
        kabuller: <String>['while'], geriDonusKodu: 'AF6'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kAt,
        soru: 'The film starts ___ 7:30.', kabuller: <String>['at']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kOn,
        soru: 'My birthday is ___ July 5.', kabuller: <String>['on']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kIn,
        soru: 'It is cold ___ winter.', kabuller: <String>['in']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kIn,
        soru: 'I read ___ the morning.', kabuller: <String>['in']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kSure,
        soru: 'I waited ___ two hours.', kabuller: <String>['for']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kAt,
        soru: '"gece" icin hangisi?',
        secenekler: <String>['in night', 'at night', 'on night'],
        kabuller: <String>['at night']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kSure,
        soru: '"during" ne alir?',
        secenekler: <String>['Isim', 'Cumle', 'Sayi'], kabuller: <String>['Isim']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kOn,
        soru: 'Dizin: Monday / coming / on / He / is',
        kabuller: <String>['He is coming on Monday.', 'He is coming on Monday']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kSinir,
        soru: 'Dizin: five / from / to / I / nine / work',
        kabuller: <String>['I work from nine to five.',
            'I work from nine to five']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kEdatsiz,
        soru: '"We are meeting in next week." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kAt, turkce: 'Yedide kalkarim.',
        kabuller: <String>['I get up at seven.']),
      SerbestGorev(kod: 'SU-2', altKonu: kOn, turkce: 'Pazartesi geliyor.',
        kabuller: <String>['He is coming on Monday.',
            'She is coming on Monday.']),
      SerbestGorev(kod: 'SU-3', altKonu: kEdatsiz, turkce: 'Dun onu gordum.',
        kabuller: <String>['I saw him yesterday.']),
      SerbestGorev(kod: 'SU-4', altKonu: kSinir, turkce: 'Dokuzdan bese kadar calisirim.',
        kabuller: <String>['I work from nine to five.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kAt,
        soru: 'We left ___ midnight.', kabuller: <String>['at']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kOn,
        soru: 'We meet ___ Fridays.', kabuller: <String>['on']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kIn,
        soru: 'I will be there ___ two hours. (sonra)',
        kabuller: <String>['in']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.boslukDoldurma, altKonu: kSinir,
        soru: 'Wait here ___ Friday. (kadar)', kabuller: <String>['until']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.coktanSecmeli, altKonu: kSure,
        soru: 'She slept ___ the film.',
        secenekler: <String>['for', 'during', 'while'],
        kabuller: <String>['during']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kEdatsiz,
        soru: '"He came at last night." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kIn,
        soru: 'Dizin: May / travel / in / We',
        kabuller: <String>['We travel in May.', 'We travel in May']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kSinir,
        soru: 'I go home ___ work. (sonra)', kabuller: <String>['after']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kAt,
        soru: 'She works ___ night.',
        secenekler: <String>['in', 'on', 'at'], kabuller: <String>['at']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kOn,
        soru: 'We meet ___ Fridays.',
        secenekler: <String>['in', 'on', 'at'], kabuller: <String>['on']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kIn,
        soru: 'I read ___ the morning.',
        secenekler: <String>['in', 'on', 'at'], kabuller: <String>['in']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kOn,
        soru: 'He is coming ___ Monday morning.',
        secenekler: <String>['in', 'on', 'at'], kabuller: <String>['on']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kSure,
        soru: 'He called ___ I was working.',
        secenekler: <String>['during', 'while', 'for'],
        kabuller: <String>['while']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kIn,
        soru: 'She was born ___ 2005.', kabuller: <String>['in']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kSure,
        soru: 'I waited ___ two hours.', kabuller: <String>['for']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kSinir,
        soru: 'Wash your hands ___ lunch. (once)',
        kabuller: <String>['before']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kEdatsiz,
        soru: '"I saw him on yesterday." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kOn,
        soru: '"My birthday is in July 5." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kSure,
        soru: '"I waited during two hours." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kEdatsiz,
        soru: 'Dizin: week / meeting / next / are / We',
        kabuller: <String>['We are meeting next week.',
            'We are meeting next week']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kAt,
        soru: 'Ingilizceye cevirin: Film 7:30\u2019da basliyor.',
        kabuller: <String>['The film starts at 7:30.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kIn,
        soru: 'Ingilizceye cevirin: Kisin hava soguk.',
        kabuller: <String>['It is cold in winter.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kSinir,
        soru: 'Ingilizceye cevirin: Isten sonra eve giderim.',
        kabuller: <String>['I go home after work.']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Buyukluk olcegi: at < on < in',
        aciklama: 'Zaman diliminin buyuklugunu dusunun. Yer edatlariyla AYNI mantik.',
        ornek: 'at 5 · on Monday · in May'),
      OzetMaddesi(baslik: 'at: nokta gibi',
        aciklama: 'Saatler ve anlar. Istisna: at night (ama in the morning).',
        ornek: 'at seven · at midnight · at night'),
      OzetMaddesi(baslik: 'on: gunler ve tarihler',
        aciklama: 'Gun adi varsa "on" KAZANIR.',
        ornek: 'on Monday · on July 5 · on Monday morning'),
      OzetMaddesi(baslik: 'in: gunden buyuk dilimler',
        aciklama: 'Ay, mevsim, yil. "in two hours" = iki saat SONRA.',
        ornek: 'in May · in 2020 · in the morning'),
      OzetMaddesi(baslik: 'Edat ALMAYANLAR',
        aciklama: 'this / next / last / every varsa edat DUSER.',
        ornek: 'yesterday · next week · every day'),
      OzetMaddesi(baslik: 'Sure ve sinir',
        aciklama: 'for + uzunluk · during + isim · while + cumle.',
        ornek: 'for two hours · during the film · while I worked'),
    ],
  );
}
