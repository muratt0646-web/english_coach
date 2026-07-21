import 'package:english_coach/app/gunluk_oneri.dart';
import 'package:english_coach/app/modul_kimlik.dart';
import 'package:english_coach/app/modul_yonlendirme.dart';
import 'package:english_coach/modules/hikaye/hikaye_kutuphane_ekrani.dart';
import 'package:english_coach/modules/ilerleme/ilerleme_ekrani.dart';
import 'package:english_coach/modules/kelime/kelime_ekrani.dart';
import 'package:english_coach/modules/konusma/konusma_ekrani.dart';
import 'package:english_coach/modules/senaryo/senaryo_ekrani.dart';
import 'package:english_coach/modules/seviye/seviye_ekrani.dart';
import 'package:english_coach/modules/tekrar/tekrar_ekrani.dart';
import 'package:english_coach/shared_ui/modul_izgarasi.dart';
import 'package:english_coach/shared_ui/modul_karti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Faz 2D widget testleri.
/// Veritabani GEREKTIRMEZ: sunum widget'lari saf veriyle calisir.
void main() {
  Widget sar(Widget cocuk) => MaterialApp(
        home: Scaffold(body: SingleChildScrollView(child: cocuk)),
      );

  /// 8 modul kartinin TAMAMI cizilsin diye buyuk bir gorunum alani.
  /// GridView.builder TEMBELDIR: kucuk alanda yalnizca gorunenleri kurar.
  Future<void> genisEkran(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1400, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
  }

  // ---------- 1. Ana ekranda 8 modulun tamami gorunur ----------
  group('2D-1 Sekiz modul', () {
    test('Kayit defterinde tam olarak 8 modul var', () {
      expect(ModulKimlik.tumModuller.length, 8);
    });

    test('PRODUCT_RULES K2 modul kodlari eksiksiz', () {
      final List<String> kodlar =
          ModulKimlik.tumModuller.map((ModulKimlik m) => m.kod).toList();
      expect(
        kodlar,
        containsAll(<String>[
          'gramer', 'kelime', 'hikaye', 'konusma',
          'senaryo', 'seviye', 'tekrar', 'ilerleme',
        ]),
      );
    });

    testWidgets('Izgara 8 kart cizer', (WidgetTester tester) async {
      await genisEkran(tester);
      await tester.pumpWidget(sar(
        ModulIzgarasi(
          moduller: ModulKimlik.tumModuller,
          onModulSecildi: (ModulKimlik _) {},
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.byType(ModulKarti), findsNWidgets(8));
    });

    testWidgets('Kelime Akademisi ve Hikayeler ana ekranda gorunur',
        (WidgetTester tester) async {
      await genisEkran(tester);
      await tester.pumpWidget(sar(
        ModulIzgarasi(
          moduller: ModulKimlik.tumModuller,
          onModulSecildi: (ModulKimlik _) {},
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Kelime Akademisi'), findsOneWidget);
      expect(find.text('Hikayeler'), findsOneWidget);
    });

    testWidgets('Hazir olmayan moduller GIZLENMEZ',
        (WidgetTester tester) async {
      await genisEkran(tester);
      await tester.pumpWidget(sar(
        ModulIzgarasi(
          moduller: ModulKimlik.tumModuller,
          onModulSecildi: (ModulKimlik _) {},
        ),
      ));
      await tester.pumpAndSettle();
      for (final ModulKimlik m in ModulKimlik.tumModuller) {
        expect(find.text(m.ad), findsOneWidget, reason: m.kod);
      }
    });
  });

  // ---------- 2. Gramer karti dogru modulu tetikler ----------
  group('2D-2 Modul secimi', () {
    testWidgets('Gramer kartina basinca gramer kodu doner',
        (WidgetTester tester) async {
      await genisEkran(tester);
      String? secilen;
      await tester.pumpWidget(sar(
        ModulIzgarasi(
          moduller: ModulKimlik.tumModuller,
          onModulSecildi: (ModulKimlik m) => secilen = m.kod,
        ),
      ));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Gramer ve Ingilizce Dusunme'));
      await tester.pumpAndSettle();
      expect(secilen, 'gramer');
    });

    test('Yonlendirme her modul kodu icin ekran uretir', () {
      for (final ModulKimlik m in ModulKimlik.tumModuller) {
        expect(ModulYonlendirme.ekranYap(m.kod), isA<Widget>(),
            reason: m.kod);
      }
    });

    test('Bilinmeyen kod hata FIRLATMAZ', () {
      expect(ModulYonlendirme.ekranYap('yok-boyle-bir-modul'), isA<Widget>());
    });
  });

  // ---------- 3 & 4. Kelime ve Hikaye ekranlari acilir ----------
  testWidgets('2D-3 Kelime Akademisi acilir ve kelime gosterir',
      (WidgetTester tester) async {
    // Faz 2E: baslik artik paket numarasi tasiyor
    // ('Kelime Akademisi · Paket 1'), bu yuzden TAM eslesme yerine
    // icerik eslesmesi kullaniliyor.
    await tester.pumpWidget(const MaterialApp(home: KelimeEkrani()));
    await tester.pumpAndSettle();
    expect(find.textContaining('Kelime Akademisi'), findsWidgets);
    expect(find.text('morning'), findsOneWidget);
    expect(find.text('sabah'), findsOneWidget);
    expect(find.text('Ogrendim'), findsWidgets);
  });

  testWidgets('2D-4 Hikaye kutuphanesi hatasiz acilir',
      (WidgetTester tester) async {
    // Faz 3A: kutuphane veritabanindan okur. Veritabani yoksa ekran
    // yine acilir ve dusuk profilli bir hata mesaji gosterir.
    await tester.pumpWidget(const MaterialApp(home: HikayeEkrani()));
    await tester.pump();
    expect(find.text('Hikayeler'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  // ---------- 5. Hazir olmayan moduller hata uretmez ----------
  group('2D-5 Iskelet moduller hatasiz acilir', () {
    final Map<String, Widget> ekranlar = <String, Widget>{
      'konusma': const KonusmaEkrani(),
      'senaryo': const SenaryoEkrani(),
      'seviye': const SeviyeEkrani(),
      'tekrar': const TekrarEkrani(),
      'ilerleme': const IlerlemeEkrani(),
    };
    ekranlar.forEach((String kod, Widget ekran) {
      testWidgets('$kod ekrani hatasiz cizilir',
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home: ekran));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      });
    });
  });

  // ---------- 6. Geri navigasyonu ----------
  testWidgets('2D-6 Geri navigasyonu calisir', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (BuildContext context) => TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                  builder: (BuildContext _) => const KelimeEkrani()),
            ),
            child: const Text('Ac'),
          ),
        ),
      ),
    ));
    await tester.tap(find.text('Ac'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Kelime Akademisi'), findsWidgets);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
    expect(find.text('Ac'), findsOneWidget);
    expect(find.textContaining('Kelime Akademisi'), findsNothing);
  });

  // ---------- Gunluk oneri (K11) ----------
  group('2D-7 Gunluk oneri', () {
    test('Soguk baslangicta bile bos donmez', () {
      expect(GunlukOneri.uret().isNotEmpty, isTrue);
    });
    test('Ilerleme arttikca oneri degisir', () {
      final List<OneriMaddesi> bas = GunlukOneri.uret();
      final List<OneriMaddesi> son =
          GunlukOneri.uret(gramerUstaligi: 1.0, tamamlananGorev: 10);
      expect(bas.first.modulKod, 'gramer');
      expect(son.first.modulKod, 'tekrar');
    });
    test('Her onerinin gerekcesi vardir', () {
      for (final OneriMaddesi o in GunlukOneri.uret()) {
        expect(o.gerekce.isNotEmpty, isTrue, reason: o.baslik);
      }
    });
  });

  // ---------- Sozlesme garantisi ----------
  test('2D-8 ModulKimlik veri yapisinda KILIT alani YOKTUR', () {
    final String kaynak = ModulKimlik.tumModuller.first.toString();
    expect(kaynak.contains('kilit'), isFalse);
  });
}
