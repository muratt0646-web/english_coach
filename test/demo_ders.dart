/// §18 — MIMARI DOGRULAMA FIXTURE'I.
///
/// Bu SAHTE ders yalnizca testte kullanilir. Amaci tek sey kanitlamaktir:
/// yeni bir ders eklemek icin EKRAN KODU DEGISMEZ.
///
/// Uretim icerigine dahil DEGILDIR (SablonDersKayitlari'na eklenmemistir).
library;

import 'package:english_coach/core/model/ders_sablonu.dart';

class DemoDers {
  const DemoDers._();

  static const String kA = 'demo-konu-A';
  static const String kB = 'demo-konu-B';

  /// To Be'den TAMAMEN farkli: baslik, bolum sayilari, soru sayilari.
  static const DersSablonu ders = DersSablonu(
    kod: 'DEMO-001',
    baslik: 'Demo Ders — mimari dogrulama',
    seviye: 'A2', konu: 'DEMO', tahminiDk: 5,
    onKosullar: <String>['EN-A1-002'],
    girisMetni: 'Bu bir demo derstir. Ayni motorla acilir.',
    kazanimlar: <String>['Motorun veri odakli oldugunu gostermek'],

    // To Be'de 6 anlatim vardi; burada 2
    anlatim: <AnlatimBlogu>[
      AnlatimBlogu(kod: 'D1', baslik: 'Birinci blok', govde: 'Demo anlatim 1.',
          turkceKarsilastirma: 'Demo karsilastirma.'),
      AnlatimBlogu(kod: 'D2', baslik: 'Ikinci blok', govde: 'Demo anlatim 2.'),
    ],
    // To Be'de 5 gorsel ornek vardi; burada 1
    gorselOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['A', 'A B', 'A B C'], turkce: 'Demo.'),
    ],
    adimAdimOrnekler: <AdimliOrnek>[
      AdimliOrnek(adimlar: <String>['X', 'X Y'], turkce: 'Demo adim.'),
    ],
    // To Be'de 50 ornek vardi; burada 3
    ornekler: <OrnekCumle>[
      OrnekCumle(ingilizce: 'Demo correct one.', turkce: 'Demo dogru bir.',
          dogruMu: true, altKonu: kA),
      OrnekCumle(ingilizce: 'Demo correct two.', turkce: 'Demo dogru iki.',
          dogruMu: true, altKonu: kB),
      OrnekCumle(ingilizce: 'Demo wrong one.', turkce: 'Demo yanlis bir.',
          dogruMu: false, neden: 'Demo aciklama, yeterince uzun bir metin.',
          dogruBicim: 'Demo correct one.', hataTuru: 'DEMO', altKonu: kA),
    ],
    // To Be'de 5 mini kontrol vardi; burada 1
    miniKontrol: <SablonSoru>[
      SablonSoru(kod: 'D-MK-1', tur: SoruTuru.coktanSecmeli, altKonu: kA,
          soru: 'Demo mini kontrol?', secenekler: <String>['evet', 'hayir'],
          kabuller: <String>['evet'], geriDonusKodu: 'D1'),
    ],
    kontrolluAlistirmalar: <SablonSoru>[
      SablonSoru(kod: 'D-KA-1', tur: SoruTuru.boslukDoldurma, altKonu: kA,
          soru: 'Demo bosluk ___', kabuller: <String>['demo']),
      SablonSoru(kod: 'D-KA-2', tur: SoruTuru.coktanSecmeli, altKonu: kB,
          soru: 'Demo secmeli?', secenekler: <String>['a', 'b'],
          kabuller: <String>['a']),
    ],
    serbestUretim: <SerbestGorev>[
      SerbestGorev(kod: 'D-SU-1', altKonu: kA, turkce: 'Demo serbest.',
          kabuller: <String>['demo free']),
    ],
    pekistirme: <SablonSoru>[
      SablonSoru(kod: 'D-PK-1', tur: SoruTuru.boslukDoldurma, altKonu: kA,
          soru: 'Demo pekistirme A ___', kabuller: <String>['a']),
      SablonSoru(kod: 'D-PK-2', tur: SoruTuru.boslukDoldurma, altKonu: kB,
          soru: 'Demo pekistirme B ___', kabuller: <String>['b']),
    ],
    // To Be'de 15 sinav sorusu vardi; burada 2
    miniSinav: <SablonSoru>[
      SablonSoru(kod: 'D-MS-1', tur: SoruTuru.coktanSecmeli, altKonu: kA,
          soru: 'Demo sinav bir?', secenekler: <String>['x', 'y'],
          kabuller: <String>['x']),
      SablonSoru(kod: 'D-MS-2', tur: SoruTuru.boslukDoldurma, altKonu: kB,
          soru: 'Demo sinav iki ___', kabuller: <String>['z']),
    ],
    ozet: <OzetMaddesi>[
      OzetMaddesi(baslik: 'Demo', aciklama: 'Demo ozet.', ornek: 'Demo.'),
    ],
  );
}
