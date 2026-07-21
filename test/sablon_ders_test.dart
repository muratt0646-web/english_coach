import 'package:english_coach/core/content/ders_en_a1_002.dart';
import 'package:english_coach/core/content/sablon_ders_kayitlari.dart';
import 'package:english_coach/core/engine/ders_motoru.dart';
import 'package:english_coach/core/model/ders_sablonu.dart';
import 'package:english_coach/modules/gramer/sablon_ders_ekrani.dart';
import 'package:english_coach/shared_ui/ornek_karti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Faz 4A.0 — sablon ders motoru ve To Be dersi testleri.
/// Veritabani GEREKTIRMEZ.
void main() {
  const DersSablonu tobe = DersEnA1002.ders;

  Widget sar(Widget c) => MaterialApp(home: c);

  /// Ders icerigi UZUNDUR ve ListView TEMBELDIR: kucuk test alaninda
  /// alttaki dugmeler hic KURULMAZ. Gercek uygulamada kullanici kaydirir;
  /// testte gorunum alani buyutulur.
  Future<void> genisEkran(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1400, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
  }

  // ---------- SABLON YAPISI ----------
  group('4A-1 Sablon yapisi', () {
    test('12 asama tanimli ve sirasi sabit', () {
      expect(DersAsamasi.values.length, 12);
      expect(DersAsamasi.values.first, DersAsamasi.giris);
      expect(DersAsamasi.values.last, DersAsamasi.basari);
      expect(DersMotoru.asamaSirasi, DersAsamasi.values);
    });

    test('Asama gecisleri dogru sirada', () {
      expect(DersMotoru.sonraki(DersAsamasi.giris), DersAsamasi.anlatim);
      expect(DersMotoru.sonraki(DersAsamasi.serbestUretim),
          DersAsamasi.hataAnalizi);
      expect(DersMotoru.sonraki(DersAsamasi.ozet), DersAsamasi.basari);
      expect(DersMotoru.sonraki(DersAsamasi.basari), isNull);
      expect(DersMotoru.onceki(DersAsamasi.giris), isNull);
    });

    test('To Be dersinin butun asamalari dolu', () {
      final DersMotoru m = DersMotoru(tobe);
      for (final DersAsamasi a in DersAsamasi.values) {
        expect(m.asamaDoluMu(a), isTrue, reason: a.ad);
      }
    });
  });

  // ---------- ICERIK SARTLARI (TUM KAYITLI DERSLER) ----------
  // Yeni ders eklendiginde bu testler OTOMATIK olarak onu da kapsar.
  for (final DersSablonu d in SablonDersKayitlari.dersler) {
    group('4A-2 Icerik sartlari — ${d.kod}', () {
      test('En az 30 dogru ornek', () =>
          expect(d.dogruOrnekler.length, greaterThanOrEqualTo(30)));
      test('En az 20 yanlis ornek', () =>
          expect(d.yanlisOrnekler.length, greaterThanOrEqualTo(20)));
      test('Her yanlis ornekte NEDEN ve DOGRU BICIM var', () {
        for (final OrnekCumle o in d.yanlisOrnekler) {
          expect(o.neden, isNotNull, reason: o.ingilizce);
          expect(o.neden!.length, greaterThan(15), reason: o.ingilizce);
          expect(o.dogruBicim, isNotNull, reason: o.ingilizce);
        }
      });
      test('Mini kontrol 3-5 soru, geri donus kodu anlatimda var', () {
        expect(d.miniKontrol.length, inInclusiveRange(3, 5));
        for (final SablonSoru s in d.miniKontrol) {
          expect(s.geriDonusKodu, isNotNull, reason: s.kod);
          expect(d.anlatim.any((AnlatimBlogu b) => b.kod == s.geriDonusKodu),
              isTrue, reason: '${d.kod}/${s.kod}');
        }
      });
      test('Mini sinav tam 15 soru', () => expect(d.miniSinav.length, 15));
      test('Kontrollu alistirmalar KARISIK turde', () {
        expect(d.kontrolluAlistirmalar.map((SablonSoru s) => s.tur).toSet().length,
            greaterThanOrEqualTo(4));
      });
      test('Her sorunun kanonik cevabi kendi kabulunu gecer', () {
        for (final SablonSoru s in <SablonSoru>[
          ...d.miniKontrol, ...d.kontrolluAlistirmalar,
          ...d.pekistirme, ...d.miniSinav,
        ]) {
          expect(DersMotoru.dogruMu(s.kabuller, s.kanonik), isTrue,
              reason: '${d.kod}/${s.kod}');
        }
      });
      test('Serbest uretim kabulleri gecerli', () {
        for (final SerbestGorev g in d.serbestUretim) {
          expect(g.kabuller, isNotEmpty, reason: g.kod);
          expect(DersMotoru.dogruMu(g.kabuller, g.kabuller.first), isTrue,
              reason: '${d.kod}/${g.kod}');
        }
      });
      test('Ozet en az alti madde', () =>
          expect(d.ozet.length, greaterThanOrEqualTo(6)));
      test('Anlatim Turkce karsilastirma iceriyor', () {
        expect(
            d.anlatim.where((AnlatimBlogu b) => b.turkceKarsilastirma != null).length,
            greaterThanOrEqualTo(4));
      });
      test('Soru kodlari ders icinde benzersiz', () {
        final List<String> kodlar = <String>[
          ...d.miniKontrol.map((SablonSoru s) => s.kod),
          ...d.kontrolluAlistirmalar.map((SablonSoru s) => s.kod),
          ...d.pekistirme.map((SablonSoru s) => s.kod),
          ...d.miniSinav.map((SablonSoru s) => s.kod),
        ];
        expect(kodlar.toSet().length, kodlar.length, reason: d.kod);
      });
    });
  }

  // ---------- MOTOR ----------
  group('4A-3 Ders motoru', () {
    test('Dogru ve yanlis cevaplar kaydedilir', () {
      final DersMotoru m = DersMotoru(tobe);
      final SablonSoru s = tobe.miniSinav.first;
      expect(m.cevapla(s, s.kanonik), isTrue);
      expect(m.cevapla(s, 'kesinlikle yanlis'), isFalse);
      expect(m.kayitlar.length, 2);
    });

    test('Zayif konu tespiti', () {
      final DersMotoru m = DersMotoru(tobe);
      for (final SablonSoru s in tobe.miniSinav) {
        m.cevapla(s, s.altKonu == DersEnA1002.kSoru ? 'yanlis' : s.kanonik);
      }
      expect(m.zayifKonular(), contains(DersEnA1002.kSoru));
    });

    test('Pekistirme zayif konulari ONE alir ve TEKRARLAR', () {
      final DersMotoru m = DersMotoru(tobe);
      for (final SablonSoru s in tobe.miniSinav) {
        m.cevapla(s, s.altKonu == DersEnA1002.kAm ? 'yanlis' : s.kanonik);
      }
      final List<SablonSoru> p = m.agirlikliPekistirme();
      expect(p.first.altKonu, DersEnA1002.kAm);
      expect(p.length, greaterThan(tobe.pekistirme.length),
          reason: 'zayif konu sorulari tekrarlanmali');
    });

    test('Zayif konu yoksa pekistirme degismez', () {
      final DersMotoru m = DersMotoru(tobe);
      for (final SablonSoru s in tobe.miniSinav) {
        m.cevapla(s, s.kanonik);
      }
      expect(m.agirlikliPekistirme().length, tobe.pekistirme.length);
    });

    test('Basari %80 esigi', () {
      final DersMotoru m = DersMotoru(tobe);
      for (int i = 0; i < tobe.miniSinav.length; i++) {
        final SablonSoru s = tobe.miniSinav[i];
        m.cevapla(s, i < 12 ? s.kanonik : 'yanlis');
      }
      final DersSonucu r = m.sonuc(
          soruKodlari: tobe.miniSinav.map((SablonSoru s) => s.kod).toSet());
      expect(r.dogru, 12);
      expect(r.yanlis, 3);
      expect(r.basariYuzdesi, closeTo(0.8, 0.001));
      expect(r.sinavGecti, isTrue);
      expect(r.enCokHataliKonu, isNotNull);
    });

    test('%80 altinda kalirsa gecmez ve tekrar onerilir', () {
      final DersMotoru m = DersMotoru(tobe);
      for (int i = 0; i < tobe.miniSinav.length; i++) {
        final SablonSoru s = tobe.miniSinav[i];
        m.cevapla(s, i < 5 ? s.kanonik : 'yanlis');
      }
      final DersSonucu r = m.sonuc(
          soruKodlari: tobe.miniSinav.map((SablonSoru s) => s.kod).toSet());
      expect(r.sinavGecti, isFalse);
      expect(r.onerilenTekrarlar, isNotEmpty);
    });
  });

  // ---------- KAYIT DEFTERI (ileriye uyumluluk) ----------
  group('4A-4 Kayit defteri', () {
    test('To Be kayitli ve koddan bulunur', () {
      expect(SablonDersKayitlari.dersler, isNotEmpty);
      expect(SablonDersKayitlari.bul('EN-A1-002'), isNotNull);
      expect(SablonDersKayitlari.bul('YOK'), isNull);
    });
    test('Kayitli her ders 12 asamayi doldurur', () {
      for (final DersSablonu d in SablonDersKayitlari.dersler) {
        final DersMotoru m = DersMotoru(d);
        for (final DersAsamasi a in DersAsamasi.values) {
          expect(m.asamaDoluMu(a), isTrue, reason: '${d.kod} / ${a.ad}');
        }
      }
    });
  });

  // ---------- WIDGET TESTLERI ----------
  group('4A-5 Widget akisi', () {
    testWidgets('Ders acilir ve GIRIS asamasi gorunur',
        (WidgetTester tester) async {
      await genisEkran(tester);
      await tester.pumpWidget(sar(const SablonDersEkrani(ders: tobe)));
      await tester.pumpAndSettle();
      expect(find.text(tobe.baslik), findsWidgets);
      expect(find.textContaining('1/12'), findsOneWidget);
      expect(find.text('Basla'), findsOneWidget);
    });

    testWidgets('Akis sirasi bozulmuyor: giris -> anlatim',
        (WidgetTester tester) async {
      await genisEkran(tester);
      await tester.pumpWidget(sar(const SablonDersEkrani(ders: tobe)));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Basla'));
      await tester.pumpAndSettle();
      expect(find.textContaining('2/12'), findsOneWidget);
      expect(find.text(tobe.anlatim.first.baslik), findsOneWidget);
    });

    testWidgets('Anlatim bloklari sirayla ilerler',
        (WidgetTester tester) async {
      await genisEkran(tester);
      await tester.pumpWidget(sar(const SablonDersEkrani(ders: tobe)));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Basla'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Devam'));
      await tester.pumpAndSettle();
      expect(find.text(tobe.anlatim[1].baslik), findsOneWidget);
    });

    testWidgets('Gorsel ornekler adim adim acilir',
        (WidgetTester tester) async {
      await genisEkran(tester);
      await tester.pumpWidget(sar(const SablonDersEkrani(ders: tobe)));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Basla'));
      await tester.pumpAndSettle();
      // anlatim bloklarini gec
      for (int i = 0; i < tobe.anlatim.length - 1; i++) {
        await tester.tap(find.text('Devam'));
        await tester.pumpAndSettle();
      }
      await tester.tap(find.text('Orneklere gec'));
      await tester.pumpAndSettle();
      expect(find.textContaining('3/12'), findsOneWidget);

      final AdimliOrnek ilk = tobe.gorselOrnekler.first;
      // ilk adim gorunur, son adim HENUZ gorunmez
      expect(find.text(ilk.adimlar.first), findsOneWidget);
      expect(find.text(ilk.adimlar.last), findsNothing);

      await tester.tap(find.text('Sonraki adim'));
      await tester.pumpAndSettle();
      expect(find.text(ilk.adimlar[1]), findsOneWidget);
    });

    testWidgets('DOGRU ornekler ekranda gosteriliyor',
        (WidgetTester tester) async {
      await genisEkran(tester);
      await tester.pumpWidget(sar(const SablonDersEkrani(ders: tobe)));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Basla'));
      await tester.pumpAndSettle();
      for (int i = 0; i < tobe.anlatim.length - 1; i++) {
        await tester.tap(find.text('Devam'));
        await tester.pumpAndSettle();
      }
      await tester.tap(find.text('Orneklere gec'));
      await tester.pumpAndSettle();

      // adimli ornekleri bitir
      while (find.text('Sonraki adim').evaluate().isNotEmpty ||
          find.text('Sonraki ornek').evaluate().isNotEmpty) {
        await tester.tap(find.text('Sonraki adim').evaluate().isNotEmpty
            ? find.text('Sonraki adim')
            : find.text('Sonraki ornek'));
        await tester.pumpAndSettle();
      }
      await tester.tap(find.text('Ornek listesine gec'));
      await tester.pumpAndSettle();

      // 30 dogru ornek karti cizilmeli
      expect(find.byType(DogruOrnekKarti),
          findsNWidgets(tobe.dogruOrnekler.length));
      expect(find.text(tobe.dogruOrnekler.first.ingilizce), findsOneWidget);
    });

    testWidgets('Ilerleme cubugu asamayla birlikte artar',
        (WidgetTester tester) async {
      await genisEkran(tester);
      await tester.pumpWidget(sar(const SablonDersEkrani(ders: tobe)));
      await tester.pumpAndSettle();
      LinearProgressIndicator p = tester.widget<LinearProgressIndicator>(
          find.byType(LinearProgressIndicator).first);
      expect(p.value, closeTo(1 / 12, 0.001));

      await tester.tap(find.text('Basla'));
      await tester.pumpAndSettle();
      p = tester.widget<LinearProgressIndicator>(
          find.byType(LinearProgressIndicator).first);
      expect(p.value, closeTo(2 / 12, 0.001));
    });
  });
}

