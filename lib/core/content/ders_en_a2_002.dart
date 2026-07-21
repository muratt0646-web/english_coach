/// EN-A2-002 — Past Simple: Duzenli Fiiller (-ed)
/// SADECE VERI. Odak: Ingilizce DUSUNME mantigi.
library;

import '../model/ders_sablonu.dart';

class DersEnA2002 {
  const DersEnA2002._();

  static const String kTemel = 'Temel -ed';
  static const String kYazim = 'Yazim degisiklikleri';
  static const String kKisiYok = 'Kisi eki YOK';
  static const String kZaman = 'Zaman ifadeleri';
  static const String kBeFarki = 'was/were ile karistirmama';
  static const String kTelaffuz = 'Telaffuz farki';

  static const DersSablonu ders = DersSablonu(
    kod: 'EN-A2-002',
    baslik: 'Past Simple — Duzenli Fiiller (-ed)',
    seviye: 'A2', konu: 'ZAM', tahminiDk: 35,
    onKosullar: <String>['EN-A2-001', 'EN-A1-011'],
    girisMetni:
        'INGILIZCE DUSUNME NOTU\n\n'
        'Turkcede gecmis zaman kurmak icin IKI sey secersiniz:\n\n'
        '  1. Unlu uyumuna gore ek:  -di / -di / -du / -du\n'
        '  2. Kisiye gore ek:        -m / -n / - / -k / -niz / -ler\n\n'
        '  calis-TI-M · gel-DI-N · otur-DU-K\n\n'
        'Ingilizcede TEK bir sey secersiniz: -ed.\n\n'
        '  I worked · you worked · he worked · we worked · they worked\n\n'
        'Kisi eki YOKTUR. Hicbiri degismez.\n\n'
        'Bu, simdiki zamandan bile KOLAYDIR: orada he/she/it icin -s '
        'eklemeyi hatirlamaniz gerekiyordu. Gecmiste o dert yok.\n\n'
        'Ozetle: Ingilizce gecmis zaman, Turkce gecmis zamandan DAHA '
        'SADEDIR. Zorluk baska yerde — duzensiz fiillerde (sonraki ders).',
    kazanimlar: <String>[
      'Fiile -ed ekleyerek gecmis bicimi kurabilmek',
      'Kisi eki OLMADIGINI icsellestirmek',
      'Yazim degisikliklerini uygulamak (-e, sessiz+y, cift harf)',
      'was/were ile -ed fiillerini karistirmamak',
      'Zaman ifadelerini dogru yere koymak',
      '-ed telaffuzunun uc bicimini tanimak',
    ],

    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'M1', baslik: 'Tek ek, hicbir kisi eki',
        govde: 'Turkcede gecmis zamanda alti farkli bicim vardir:\n\n'
            '  calistim · calistin · calisti · calistik · calistiniz · '
            'calistilar\n\n'
            'Ingilizcede TEK bicim vardir:\n\n'
            '  I worked · you worked · he worked\n'
            '  we worked · you worked · they worked\n\n'
            'DUSUNME NOTU: Ingilizce kisi bilgisini FIILDE degil OZNEDE '
            'tutar. Ozne zaten yazildigi icin fiilin ayrica belirtmesine '
            'gerek yoktur. Bu, "bir kelime bir is" ilkesinin devamidir.',
        turkceKarsilastirma: 'calistim / calistin / calisti\n'
            'I worked / you worked / he worked'),
      AnlatimBlogu(kod: 'M2', baslik: 'Simdiki zamandan daha kolay',
        govde: 'Simdiki zamanda tek bir istisnayi hatirlamaniz gerekiyordu:\n\n'
            '  I work · he workS   -> -s kurali\n\n'
            'Gecmiste o istisna YOK:\n\n'
            '  I worked · he worked  -> ayni\n\n'
            'Yani gecmis zamanda "3. tekil" diye bir dert kalmiyor.\n\n'
            'PRATIK SONUC: Gecmis cumle kurarken ozneyi kontrol etmeye '
            'gerek yok. Yalnizca fiile -ed ekleyin.',
        turkceKarsilastirma: 'O calisir.  ->  He workS.   (-s var)\n'
            'O calisti.  ->  He worked.   (-s yok)'),
      AnlatimBlogu(kod: 'M3', baslik: 'Yazim degisiklikleri',
        govde: 'Ek her zaman -ed\u2019dir ama yazim bazen degisir:\n\n'
            '1. Fiil -e ile bitiyorsa yalnizca -d:\n'
            '   like -> liked · live -> lived · close -> closed\n\n'
            '2. Sessiz harf + y ise y duser, -ied gelir:\n'
            '   study -> studied · try -> tried · carry -> carried\n'
            '   Ama sesli + y degismez: play -> played\n\n'
            '3. Tek heceli, tek sesli + tek sessizle bitiyorsa son harf '
            'ikilenir:\n'
            '   stop -> stopped · plan -> planned\n\n'
            'DIKKAT: Bu kurallar simdiki zamandaki -s ve -ies kurallarinin '
            'AYNI mantigidir. Yeni bir sey ogrenmiyorsunuz.',
        turkceKarsilastirma: 'calisti (ders)  ->  studied\n'
            'oynadi          ->  played'),
      AnlatimBlogu(kod: 'M4', baslik: 'was/were ile karistirma',
        govde: 'Iki ayri sey vardir ve birlikte kullanilmaz:\n\n'
            '  was/were  -> DURUM bildirir (yorgundu, ogretmendi)\n'
            '  -ed fiil  -> EYLEM bildirir (calisti, gitti)\n\n'
            '  He was tired.      (durum)\n'
            '  He worked hard.    (eylem)\n\n'
            '  He was worked.     -> YANLIS. Iki gecmis isareti birden.\n\n'
            'Kural: Cumlede ana fiil varsa was/were GIRMEZ.\n\n'
            'Bu, A1\u2019deki "to be varken do/does girmez" kuralinin '
            'gecmis zamandaki karsiligi.',
        turkceKarsilastirma: 'O yorgundu.  ->  He was tired.\n'
            'O calisti.   ->  He worked.'),
      AnlatimBlogu(kod: 'M5', baslik: 'Zaman ifadeleri gecmisi ISARETLER',
        govde: 'Bu ifadeler cumlenin gecmis oldugunu belli eder:\n\n'
            '  yesterday · last night · last week · last year\n'
            '  two days ago · in 2019 · when I was young\n\n'
            '  I visited my family last week.\n'
            '  She called me two days ago.\n\n'
            'Genellikle cumlenin SONUNA gelirler; vurgu icin basa alinir.\n'
            'Ozne ile fiil arasina GIRMEZLER.\n\n'
            'DUSUNME NOTU: Turkce zamani hem ekle hem kelimeyle iki kez '
            'isaretler ("dun geldim"). Ingilizce de ayni sekilde iki kez '
            'isaretler ("I came yesterday") — bu ortak noktadir.',
        turkceKarsilastirma: 'Gecen hafta ailemi ziyaret ettim.\n'
            'I visited my family last week.'),
      AnlatimBlogu(kod: 'M6', baslik: '-ed nasil okunur?',
        govde: 'Yazim hep -ed ama TELAFFUZ uce ayrilir:\n\n'
            '  /t/  sessiz seslerden sonra:  worked · stopped · watched\n'
            '  /d/  sesli ve yumusak seslerden sonra: played · lived\n'
            '  /id/ yalnizca -t ve -d\u2019den sonra:  wanted · needed\n\n'
            'Yani "worked" iki hecelidir ama "wanted" uc heceli okunur.\n\n'
            'Bu ayrim yazimi DEGISTIRMEZ; yalnizca konusmayi etkiler. '
            'Yazarken hep -ed yazin.',
        turkceKarsilastirma: 'worked -> "vörkt"  (tek hece eklenmez)\n'
            'wanted -> "van-tid" (hece eklenir)'),
    ],

    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['work', 'worked', 'I worked yesterday.'],
        turkce: 'Dun calistim.', not: 'Tek ek, kisi eki yok.'),
      AdimliOrnek(adimlar: <String>['I worked', 'you worked', 'he worked', 'they worked'],
        turkce: 'Hicbiri degismez.', not: 'Kisi bilgisi OZNEDE.'),
      AdimliOrnek(adimlar: <String>['live', 'lived', 'We lived in Ankara.'],
        turkce: 'Ankara\u2019da yasadik.', not: '-e ile bitiyor -> yalnizca -d.'),
      AdimliOrnek(adimlar: <String>['study', 'studied', 'She studied math.'],
        turkce: 'Matematik calisti.', not: 'Sessiz + y -> ied.'),
      AdimliOrnek(adimlar: <String>['stop', 'stopped', 'The bus stopped here.'],
        turkce: 'Otobus burada durdu.', not: 'Son harf ikilendi.'),
    ],

    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>[
        'Dun calistik.', 'Kim? -> We', 'Fiil: work + ed', 'Ne zaman? -> yesterday',
        'We worked yesterday.'],
        turkce: 'Kisi ekini DUSUNMEDIK.', not: 'Ozne yeterli bilgiyi veriyor.'),
      AdimliOrnek(adimlar: <String>[
        'O beni iki gun once aradi.', 'call + ed', 'She called me',
        'She called me two days ago.'],
        turkce: 'Zaman ifadesi sona geldi.', not: 'Ortaya girmez.'),
      AdimliOrnek(adimlar: <String>[
        'O yorgundu ve cok calisti.', 'durum -> was tired',
        'eylem -> worked hard', 'He was tired and worked hard.'],
        turkce: 'Durum ve eylem AYRI.', not: 'He was worked YANLIS.'),
    ],

    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'I worked yesterday.', turkce: 'Dun calistim.', dogruMu: true, altKonu: kTemel),
      OrnekCumle(ingilizce: 'She called me last night.', turkce: 'Dun gece beni aradi.', dogruMu: true, altKonu: kTemel),
      OrnekCumle(ingilizce: 'They watched a film.', turkce: 'Bir film izlediler.', dogruMu: true, altKonu: kTemel),
      OrnekCumle(ingilizce: 'We visited our family.', turkce: 'Ailemizi ziyaret ettik.', dogruMu: true, altKonu: kTemel),
      OrnekCumle(ingilizce: 'He opened the window.', turkce: 'Pencereyi acti.', dogruMu: true, altKonu: kTemel),
      OrnekCumle(ingilizce: 'I helped my friend.', turkce: 'Arkadasima yardim ettim.', dogruMu: true, altKonu: kTemel),
      OrnekCumle(ingilizce: 'The shop closed at six.', turkce: 'Dukkan altida kapandi.', dogruMu: true, altKonu: kYazim),
      OrnekCumle(ingilizce: 'We lived in Ankara.', turkce: 'Ankara\u2019da yasadik.', dogruMu: true, altKonu: kYazim),
      OrnekCumle(ingilizce: 'She liked the book.', turkce: 'Kitabi begendi.', dogruMu: true, altKonu: kYazim),
      OrnekCumle(ingilizce: 'He studied math last year.', turkce: 'Gecen yil matematik calisti.', dogruMu: true, altKonu: kYazim),
      OrnekCumle(ingilizce: 'She tried again.', turkce: 'Tekrar denedi.', dogruMu: true, altKonu: kYazim),
      OrnekCumle(ingilizce: 'They carried the boxes.', turkce: 'Kutulari tasidilar.', dogruMu: true, altKonu: kYazim),
      OrnekCumle(ingilizce: 'The children played outside.', turkce: 'Cocuklar disarida oynadi.', dogruMu: true, altKonu: kYazim),
      OrnekCumle(ingilizce: 'The bus stopped here.', turkce: 'Otobus burada durdu.', dogruMu: true, altKonu: kYazim),
      OrnekCumle(ingilizce: 'We planned a trip.', turkce: 'Bir gezi planladik.', dogruMu: true, altKonu: kYazim),
      OrnekCumle(ingilizce: 'I worked and he worked.', turkce: 'Ben calistim ve o calisti.', dogruMu: true, altKonu: kKisiYok),
      OrnekCumle(ingilizce: 'You worked hard.', turkce: 'Cok calistin.', dogruMu: true, altKonu: kKisiYok),
      OrnekCumle(ingilizce: 'They worked together.', turkce: 'Birlikte calistilar.', dogruMu: true, altKonu: kKisiYok),
      OrnekCumle(ingilizce: 'My sister studied English.', turkce: 'Kiz kardesim Ingilizce calisti.', dogruMu: true, altKonu: kKisiYok),
      OrnekCumle(ingilizce: 'The teacher explained the lesson.', turkce: 'Ogretmen dersi anlatti.', dogruMu: true, altKonu: kKisiYok),
      OrnekCumle(ingilizce: 'I visited my family last week.', turkce: 'Gecen hafta ailemi ziyaret ettim.', dogruMu: true, altKonu: kZaman),
      OrnekCumle(ingilizce: 'She called me two days ago.', turkce: 'Iki gun once beni aradi.', dogruMu: true, altKonu: kZaman),
      OrnekCumle(ingilizce: 'We moved here in 2019.', turkce: '2019\u2019da buraya tasindik.', dogruMu: true, altKonu: kZaman),
      OrnekCumle(ingilizce: 'Yesterday I cleaned the house.', turkce: 'Dun evi temizledim.', dogruMu: true, altKonu: kZaman),
      OrnekCumle(ingilizce: 'They walked in the park last night.', turkce: 'Dun gece parkta yurudular.', dogruMu: true, altKonu: kZaman),
      OrnekCumle(ingilizce: 'He was tired and worked hard.', turkce: 'Yorgundu ve cok calisti.', dogruMu: true, altKonu: kBeFarki),
      OrnekCumle(ingilizce: 'She was a teacher and taught English.', turkce: 'Ogretmendi ve Ingilizce ogretti.', dogruMu: true, altKonu: kBeFarki),
      OrnekCumle(ingilizce: 'The film was long but I liked it.', turkce: 'Film uzundu ama begendim.', dogruMu: true, altKonu: kBeFarki),
      OrnekCumle(ingilizce: 'I wanted a new bag.', turkce: 'Yeni bir canta istedim.', dogruMu: true, altKonu: kTelaffuz),
      OrnekCumle(ingilizce: 'We needed more time.', turkce: 'Daha fazla zamana ihtiyacimiz vardi.', dogruMu: true, altKonu: kTelaffuz),

      OrnekCumle(ingilizce: 'I workeds yesterday.', turkce: 'Dun calistim.', dogruMu: false,
        neden: 'Gecmis zamanda fiile kisi eki EKLENMEZ. Turkcedeki "-m" '
            'ekinin karsiligi yoktur; kisi bilgisi oznededir.',
        dogruBicim: 'I worked yesterday.', hataTuru: 'GRAMER_HATASI', altKonu: kKisiYok),
      OrnekCumle(ingilizce: 'He workeds hard.', turkce: 'Cok calisti.', dogruMu: false,
        neden: '-s yalnizca SIMDIKI zamanda he/she/it icindir. Gecmiste '
            'kullanilmaz.', dogruBicim: 'He worked hard.',
        hataTuru: 'GRAMER_HATASI', altKonu: kKisiYok),
      OrnekCumle(ingilizce: 'She works yesterday.', turkce: 'Dun calisti.', dogruMu: false,
        neden: '"yesterday" gecmis zaman ister; fiil -ed almali.',
        dogruBicim: 'She worked yesterday.', hataTuru: 'GRAMER_HATASI', altKonu: kZaman),
      OrnekCumle(ingilizce: 'I work last week.', turkce: 'Gecen hafta calistim.', dogruMu: false,
        neden: 'Zaman ifadesi gecmis ama fiil simdiki bicimde.',
        dogruBicim: 'I worked last week.', hataTuru: 'GRAMER_HATASI', altKonu: kZaman),
      OrnekCumle(ingilizce: 'We liveed in Ankara.', turkce: 'Ankara\u2019da yasadik.', dogruMu: false,
        neden: 'Fiil zaten -e ile bitiyor; yalnizca -d eklenir.',
        dogruBicim: 'We lived in Ankara.', hataTuru: 'YAZIM_HATASI', altKonu: kYazim),
      OrnekCumle(ingilizce: 'She likeed the book.', turkce: 'Kitabi begendi.', dogruMu: false,
        neden: '-e ile biten fiil yalnizca -d alir.', dogruBicim: 'She liked the book.',
        hataTuru: 'YAZIM_HATASI', altKonu: kYazim),
      OrnekCumle(ingilizce: 'He studyed math.', turkce: 'Matematik calisti.', dogruMu: false,
        neden: 'Sessiz harf + y: y duser, -ied gelir.', dogruBicim: 'He studied math.',
        hataTuru: 'YAZIM_HATASI', altKonu: kYazim),
      OrnekCumle(ingilizce: 'They carryed the boxes.', turkce: 'Kutulari tasidilar.', dogruMu: false,
        neden: 'Sessiz + y -> ied: carried.', dogruBicim: 'They carried the boxes.',
        hataTuru: 'YAZIM_HATASI', altKonu: kYazim),
      OrnekCumle(ingilizce: 'The children plaied outside.', turkce: 'Cocuklar disarida oynadi.', dogruMu: false,
        neden: 'SESLI harf + y ise -ied OLMAZ; yalnizca -ed eklenir.',
        dogruBicim: 'The children played outside.', hataTuru: 'YAZIM_HATASI', altKonu: kYazim),
      OrnekCumle(ingilizce: 'The bus stoped here.', turkce: 'Otobus burada durdu.', dogruMu: false,
        neden: 'Tek heceli, tek sesli + tek sessiz: son harf ikilenir.',
        dogruBicim: 'The bus stopped here.', hataTuru: 'YAZIM_HATASI', altKonu: kYazim),
      OrnekCumle(ingilizce: 'We planed a trip.', turkce: 'Bir gezi planladik.', dogruMu: false,
        neden: 'Son harf ikilenmeli: planned. "planed" baska bir kelimedir.',
        dogruBicim: 'We planned a trip.', hataTuru: 'YAZIM_HATASI', altKonu: kYazim),
      OrnekCumle(ingilizce: 'He was worked hard.', turkce: 'Cok calisti.', dogruMu: false,
        neden: 'Iki gecmis isareti birden olmaz. Ana fiil varsa was/were '
            'GIRMEZ.', dogruBicim: 'He worked hard.',
        hataTuru: 'GRAMER_HATASI', altKonu: kBeFarki),
      OrnekCumle(ingilizce: 'They were played outside.', turkce: 'Disarida oynadilar.', dogruMu: false,
        neden: 'Eylem bildiriliyor; "were" gereksiz.',
        dogruBicim: 'They played outside.', hataTuru: 'FAZLA_KELIME', altKonu: kBeFarki),
      OrnekCumle(ingilizce: 'She was studied math.', turkce: 'Matematik calisti.', dogruMu: false,
        neden: 'Ana fiil varken to be kullanilmaz.', dogruBicim: 'She studied math.',
        hataTuru: 'FAZLA_KELIME', altKonu: kBeFarki),
      OrnekCumle(ingilizce: 'He tired yesterday.', turkce: 'Dun yorgundu.', dogruMu: false,
        neden: '"tired" bir durumdur, eylem degil; "was" gerekir.',
        dogruBicim: 'He was tired yesterday.', hataTuru: 'EKSIK_KELIME', altKonu: kBeFarki),
      OrnekCumle(ingilizce: 'I visited yesterday my family.', turkce: 'Dun ailemi ziyaret ettim.', dogruMu: false,
        neden: 'Zaman ifadesi fiil ile nesne arasina GIRMEZ.',
        dogruBicim: 'I visited my family yesterday.', hataTuru: 'KELIME_SIRASI', altKonu: kZaman),
      OrnekCumle(ingilizce: 'She called two days ago me.', turkce: 'Iki gun once beni aradi.', dogruMu: false,
        neden: 'Nesne fiilden hemen sonra gelir; zaman ifadesi sona.',
        dogruBicim: 'She called me two days ago.', hataTuru: 'KELIME_SIRASI', altKonu: kZaman),
      OrnekCumle(ingilizce: 'We moved here in 2019 last year.', turkce: '2019\u2019da buraya tasindik.', dogruMu: false,
        neden: 'Iki zaman ifadesi celisiyor; biri secilir.',
        dogruBicim: 'We moved here in 2019.', hataTuru: 'FAZLA_KELIME', altKonu: kZaman),
      OrnekCumle(ingilizce: 'I wantd a new bag.', turkce: 'Yeni bir canta istedim.', dogruMu: false,
        neden: 'Fiil -t ile bitiyor; tam ek gerekir: wanted.',
        dogruBicim: 'I wanted a new bag.', hataTuru: 'YAZIM_HATASI', altKonu: kTelaffuz),
      OrnekCumle(ingilizce: 'We needd more time.', turkce: 'Daha fazla zamana ihtiyacimiz vardi.', dogruMu: false,
        neden: 'Fiil -d ile bitse de tam -ed eklenir: needed.',
        dogruBicim: 'We needed more time.', hataTuru: 'YAZIM_HATASI', altKonu: kTelaffuz),
    ],

    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kKisiYok,
        soru: 'Gecmis zamanda "he" oznesiyle fiil nasil olur?',
        secenekler: <String>['he workeds', 'he worked', 'he works'],
        kabuller: <String>['he worked'], geriDonusKodu: 'M1',
        aciklama: 'Kisi eki yok.'),
      SablonSoru(kod: 'MK-2', tur: SoruTuru.coktanSecmeli, altKonu: kYazim,
        soru: '"study" fiilinin gecmis bicimi?',
        secenekler: <String>['studyed', 'studied', 'studed'],
        kabuller: <String>['studied'], geriDonusKodu: 'M3'),
      SablonSoru(kod: 'MK-3', tur: SoruTuru.coktanSecmeli, altKonu: kYazim,
        soru: '"stop" fiilinin gecmis bicimi?',
        secenekler: <String>['stoped', 'stopped', 'stopd'],
        kabuller: <String>['stopped'], geriDonusKodu: 'M3'),
      SablonSoru(kod: 'MK-4', tur: SoruTuru.coktanSecmeli, altKonu: kBeFarki,
        soru: 'Hangisi dogru?',
        secenekler: <String>['He was worked hard.', 'He worked hard.', 'He was work hard.'],
        kabuller: <String>['He worked hard.'], geriDonusKodu: 'M4'),
      SablonSoru(kod: 'MK-5', tur: SoruTuru.coktanSecmeli, altKonu: kZaman,
        soru: 'Hangisi dogru?',
        secenekler: <String>['I visited yesterday my family.', 'I visited my family yesterday.', 'I yesterday visited my family.'],
        kabuller: <String>['I visited my family yesterday.'], geriDonusKodu: 'M5'),
    ],

    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kTemel,
        soru: 'She ___ me last night. (call)', kabuller: <String>['called']),
      SablonSoru(kod: 'KA-2', tur: SoruTuru.boslukDoldurma, altKonu: kYazim,
        soru: 'We ___ in Ankara. (live)', kabuller: <String>['lived']),
      SablonSoru(kod: 'KA-3', tur: SoruTuru.boslukDoldurma, altKonu: kYazim,
        soru: 'He ___ math last year. (study)', kabuller: <String>['studied']),
      SablonSoru(kod: 'KA-4', tur: SoruTuru.boslukDoldurma, altKonu: kYazim,
        soru: 'The children ___ outside. (play)', kabuller: <String>['played']),
      SablonSoru(kod: 'KA-5', tur: SoruTuru.boslukDoldurma, altKonu: kYazim,
        soru: 'The bus ___ here. (stop)', kabuller: <String>['stopped']),
      SablonSoru(kod: 'KA-6', tur: SoruTuru.eslestirme, altKonu: kYazim,
        soru: '"carry" fiilinin gecmis bicimi?',
        secenekler: <String>['carryed', 'carried', 'carryied'],
        kabuller: <String>['carried']),
      SablonSoru(kod: 'KA-7', tur: SoruTuru.eslestirme, altKonu: kKisiYok,
        soru: '"they" ile "she" gecmiste ayni fiil bicimini mi alir?',
        secenekler: <String>['Evet', 'Hayir'], kabuller: <String>['Evet']),
      SablonSoru(kod: 'KA-8', tur: SoruTuru.kelimeDizme, altKonu: kZaman,
        soru: 'Dizin: yesterday / the house / I / cleaned',
        kabuller: <String>['I cleaned the house yesterday.', 'I cleaned the house yesterday']),
      SablonSoru(kod: 'KA-9', tur: SoruTuru.surukleBirak, altKonu: kTemel,
        soru: 'Dizin: film / They / a / watched',
        kabuller: <String>['They watched a film.', 'They watched a film']),
      SablonSoru(kod: 'KA-10', tur: SoruTuru.dogruYanlis, altKonu: kBeFarki,
        soru: '"They were played outside." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
    ],

    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'SU-1', altKonu: kTemel, turkce: 'Dun calistim.',
        kabuller: <String>['I worked yesterday.', 'Yesterday I worked.']),
      SerbestGorev(kod: 'SU-2', altKonu: kYazim, turkce: 'Matematik calisti.',
        kabuller: <String>['He studied math.', 'She studied math.']),
      SerbestGorev(kod: 'SU-3', altKonu: kZaman, turkce: 'Gecen hafta ailemi ziyaret ettim.',
        kabuller: <String>['I visited my family last week.']),
      SerbestGorev(kod: 'SU-4', altKonu: kBeFarki, turkce: 'Yorgundu ve cok calisti.',
        kabuller: <String>['He was tired and worked hard.',
            'She was tired and worked hard.']),
    ],

    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kTemel,
        soru: 'He ___ the window. (open)', kabuller: <String>['opened']),
      SablonSoru(kod: 'PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kYazim,
        soru: 'She ___ the book. (like)', kabuller: <String>['liked']),
      SablonSoru(kod: 'PK-3', tur: SoruTuru.boslukDoldurma, altKonu: kYazim,
        soru: 'We ___ a trip. (plan)', kabuller: <String>['planned']),
      SablonSoru(kod: 'PK-4', tur: SoruTuru.boslukDoldurma, altKonu: kTelaffuz,
        soru: 'I ___ a new bag. (want)', kabuller: <String>['wanted']),
      SablonSoru(kod: 'PK-5', tur: SoruTuru.coktanSecmeli, altKonu: kKisiYok,
        soru: 'Hangisi dogru?',
        secenekler: <String>['He workeds.', 'He worked.', 'He worksed.'],
        kabuller: <String>['He worked.']),
      SablonSoru(kod: 'PK-6', tur: SoruTuru.dogruYanlis, altKonu: kBeFarki,
        soru: '"She was studied math." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'PK-7', tur: SoruTuru.kelimeDizme, altKonu: kZaman,
        soru: 'Dizin: ago / me / two days / called / She',
        kabuller: <String>['She called me two days ago.', 'She called me two days ago']),
      SablonSoru(kod: 'PK-8', tur: SoruTuru.boslukDoldurma, altKonu: kYazim,
        soru: 'He ___ again. (try)', kabuller: <String>['tried']),
    ],

    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kTemel,
        soru: 'They ___ a film last night.',
        secenekler: <String>['watch', 'watched', 'watcheds'],
        kabuller: <String>['watched']),
      SablonSoru(kod: 'MS-2', tur: SoruTuru.coktanSecmeli, altKonu: kYazim,
        soru: 'The shop ___ at six.',
        secenekler: <String>['closeed', 'closed', 'closd'],
        kabuller: <String>['closed']),
      SablonSoru(kod: 'MS-3', tur: SoruTuru.coktanSecmeli, altKonu: kYazim,
        soru: 'They ___ the boxes.',
        secenekler: <String>['carryed', 'carried', 'carrid'],
        kabuller: <String>['carried']),
      SablonSoru(kod: 'MS-4', tur: SoruTuru.coktanSecmeli, altKonu: kYazim,
        soru: 'The children ___ outside.',
        secenekler: <String>['plaied', 'played', 'playd'],
        kabuller: <String>['played']),
      SablonSoru(kod: 'MS-5', tur: SoruTuru.coktanSecmeli, altKonu: kBeFarki,
        soru: 'Hangisi dogru?',
        secenekler: <String>['He was worked.', 'He worked.', 'He was work.'],
        kabuller: <String>['He worked.']),
      SablonSoru(kod: 'MS-6', tur: SoruTuru.boslukDoldurma, altKonu: kTemel,
        soru: 'I ___ my friend. (help)', kabuller: <String>['helped']),
      SablonSoru(kod: 'MS-7', tur: SoruTuru.boslukDoldurma, altKonu: kYazim,
        soru: 'The bus ___ here. (stop)', kabuller: <String>['stopped']),
      SablonSoru(kod: 'MS-8', tur: SoruTuru.boslukDoldurma, altKonu: kTelaffuz,
        soru: 'We ___ more time. (need)', kabuller: <String>['needed']),
      SablonSoru(kod: 'MS-9', tur: SoruTuru.dogruYanlis, altKonu: kKisiYok,
        soru: '"He workeds hard." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-10', tur: SoruTuru.dogruYanlis, altKonu: kZaman,
        soru: '"She works yesterday." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-11', tur: SoruTuru.dogruYanlis, altKonu: kBeFarki,
        soru: '"They were played outside." dogru mu?',
        secenekler: <String>['Dogru', 'Yanlis'], kabuller: <String>['Yanlis']),
      SablonSoru(kod: 'MS-12', tur: SoruTuru.kelimeDizme, altKonu: kZaman,
        soru: 'Dizin: last week / my family / visited / I',
        kabuller: <String>['I visited my family last week.', 'I visited my family last week']),
      SablonSoru(kod: 'MS-13', tur: SoruTuru.serbestYazma, altKonu: kTemel,
        soru: 'Ingilizceye cevirin: Dun calistim.',
        kabuller: <String>['I worked yesterday.', 'Yesterday I worked.']),
      SablonSoru(kod: 'MS-14', tur: SoruTuru.serbestYazma, altKonu: kYazim,
        soru: 'Ingilizceye cevirin: Ankara\u2019da yasadik.',
        kabuller: <String>['We lived in Ankara.']),
      SablonSoru(kod: 'MS-15', tur: SoruTuru.serbestYazma, altKonu: kZaman,
        soru: 'Ingilizceye cevirin: Iki gun once beni aradi.',
        kabuller: <String>['She called me two days ago.', 'He called me two days ago.']),
    ],

    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Tek ek: -ed',
        aciklama: 'Turkcede unlu uyumu + kisi eki; Ingilizcede yalnizca -ed.',
        ornek: 'I worked · you worked · they worked'),
      OzetMaddesi(baslik: 'Kisi eki YOK',
        aciklama: 'Kisi bilgisi oznede durur. Gecmiste hicbir fiil degismez.',
        ornek: 'he worked (workeds DEGIL)'),
      OzetMaddesi(baslik: 'Simdikiden daha kolay',
        aciklama: 'Simdiki zamandaki -s derdi gecmiste YOK.',
        ornek: 'He works. -> He worked.'),
      OzetMaddesi(baslik: 'Yazim degisiklikleri',
        aciklama: '-e -> yalnizca -d · sessiz+y -> ied · tek hece -> harf ikilenir.',
        ornek: 'liked · studied · stopped · played'),
      OzetMaddesi(baslik: 'was/were ile karistirma',
        aciklama: 'Durum -> was/were · Eylem -> -ed. Ikisi bir arada olmaz.',
        ornek: 'He was tired. · He worked. (He was worked DEGIL)'),
      OzetMaddesi(baslik: '-ed telaffuzu',
        aciklama: 'Yazim hep -ed; okunus /t/, /d/ veya /id/ olabilir.',
        ornek: 'worked "vörkt" · wanted "van-tid"'),
    ],
  );
}
