import 'package:english_coach/shared_ui/akis_kontrolcusu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Faz 2F — Flow Mode testleri.
/// Odak/kilit mantigi widget'tan bagimsiz sinanir.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AkisKontrolcusu akis;

  setUp(() => akis = AkisKontrolcusu());
  tearDown(() => akis.dispose());

  group('2F-1 Bos ve tekrarlanan cevaplar', () {
    test('Bos cevap islenmez', () {
      expect(akis.islenmeliMi(''), isFalse);
      expect(akis.islenmeliMi('   '), isFalse);
    });

    test('Dolu cevap islenir', () {
      expect(akis.islenmeliMi('coffee'), isTrue);
    });

    test('AYNI cevap ikinci kez islenmez', () {
      expect(akis.islenmeliMi('coffee'), isTrue);
      akis.gonderildi('coffee');
      expect(akis.islenmeliMi('coffee'), isFalse);
      expect(akis.islenmeliMi('  coffee  '), isFalse,
          reason: 'bosluk farki ayni cevaptir');
    });

    test('FARKLI cevap islenir (yanlistan sonra duzeltme)', () {
      akis.gonderildi('cofee');
      expect(akis.islenmeliMi('coffee'), isTrue);
    });
  });

  group('2F-2 Gecis kilidi — cift gecis engellenir', () {
    test('Kilitliyken cevap islenmez', () {
      akis.kilitli = true;
      expect(akis.islenmeliMi('coffee'), isFalse);
    });

    testWidgets('Gecis sirasinda Enter YUTULUR, ikinci soru atlanmaz',
        (WidgetTester tester) async {
      int gecisSayisi = 0;
      akis.gecikmeliGec(
        const Duration(milliseconds: 400),
        () => gecisSayisi++,
        hala: () => true,
      );

      // Gecis suresinde art arda Enter
      expect(akis.islenmeliMi('x'), isFalse);
      expect(akis.islenmeliMi('y'), isFalse);
      expect(akis.islenmeliMi('z'), isFalse);
      expect(gecisSayisi, 0);

      await tester.pump(const Duration(milliseconds: 500));
      expect(gecisSayisi, 1, reason: 'gecis tam BIR kez olmali');
    });

    testWidgets('Ekran kapandiysa gecis calismaz', (WidgetTester tester) async {
      int gecis = 0;
      akis.gecikmeliGec(
        const Duration(milliseconds: 300),
        () => gecis++,
        hala: () => false, // mounted == false
      );
      await tester.pump(const Duration(milliseconds: 400));
      expect(gecis, 0);
    });

    testWidgets('Iptal edilen gecis calismaz', (WidgetTester tester) async {
      int gecis = 0;
      akis.gecikmeliGec(const Duration(milliseconds: 300), () => gecis++,
          hala: () => true);
      akis.gecisiIptalEt();
      await tester.pump(const Duration(milliseconds: 400));
      expect(gecis, 0);
      expect(akis.kilitli, isFalse);
    });
  });

  group('2F-3 Dogru cevap sonrasi', () {
    testWidgets('Dogru verildikten sonra yeni gonderim islenmez',
        (WidgetTester tester) async {
      akis.gecikmeliGec(const Duration(milliseconds: 400), () {},
          hala: () => true);
      expect(akis.dogruVerildi, isTrue);
      await tester.pump(const Duration(milliseconds: 500));
      expect(akis.islenmeliMi('baska bir cevap'), isFalse);
    });
  });

  group('2F-4 Yeni soru sifirlama', () {
    test('yeniSoru butun durumu sifirlar', () {
      akis.giris.text = 'eski cevap';
      akis.gonderildi('eski cevap');
      akis.kilitli = true;
      akis.dogruVerildi = true;

      akis.yeniSoru();

      expect(akis.giris.text, isEmpty);
      expect(akis.kilitli, isFalse);
      expect(akis.dogruVerildi, isFalse);
      expect(akis.sonGonderilen, isNull);
      expect(akis.islenmeliMi('yeni cevap'), isTrue);
    });

    testWidgets('yeniSoru bekleyen gecisi iptal eder',
        (WidgetTester tester) async {
      int gecis = 0;
      akis.gecikmeliGec(const Duration(milliseconds: 300), () => gecis++,
          hala: () => true);
      akis.yeniSoru();
      await tester.pump(const Duration(milliseconds: 400));
      expect(gecis, 0);
    });
  });

  group('2F-5 Yanlis cevapta metin secili kalir', () {
    testWidgets('hepsiniSec metnin tamamini secer',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CevapAlani(akis: akis, onGonder: (_) {}),
        ),
      ));
      await tester.pumpAndSettle();

      akis.giris.text = 'cofee';
      akis.hepsiniSec();
      await tester.pump();

      expect(akis.giris.selection.baseOffset, 0);
      expect(akis.giris.selection.extentOffset, 'cofee'.length);
    });
  });

  group('2F-6 CevapAlani widget davranisi', () {
    testWidgets('Tek satirlidir ve Enter gonderir',
        (WidgetTester tester) async {
      final List<String> gonderilenler = <String>[];
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CevapAlani(akis: akis, onGonder: gonderilenler.add),
        ),
      ));
      await tester.pumpAndSettle();

      final TextField alan = tester.widget<TextField>(find.byType(TextField));
      expect(alan.maxLines, 1, reason: 'tek satir olmali');

      await tester.enterText(find.byType(TextField), 'coffee');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(gonderilenler, <String>['coffee']);
    });

    testWidgets('Acilista odak cevap alanindadir',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CevapAlani(akis: akis, onGonder: (_) {}),
        ),
      ));
      await tester.pumpAndSettle();
      expect(akis.odak.hasFocus, isTrue);
    });

    testWidgets('Dogru/yanlis gorsel geri bildirimi farklidir',
        (WidgetTester tester) async {
      Widget yap(bool? sonuc) => MaterialApp(
            home: Scaffold(
              body: CevapAlani(
                akis: akis,
                onGonder: (_) {},
                sonucDogruMu: sonuc,
              ),
            ),
          );

      await tester.pumpWidget(yap(null));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.check_circle), findsNothing);
      expect(find.byIcon(Icons.cancel), findsNothing);

      await tester.pumpWidget(yap(true));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.check_circle), findsOneWidget);

      await tester.pumpWidget(yap(false));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.cancel), findsOneWidget);
    });
  });

  group('2F-7 Yasam dongusu', () {
    test('dispose sonrasi hicbir islem yapilmaz', () {
      final AkisKontrolcusu a = AkisKontrolcusu();
      a.dispose();
      expect(a.islenmeliMi('coffee'), isFalse);
      // Asagidakiler istisna FIRLATMAMALI:
      a.odakla();
      a.hepsiniSec();
      a.yeniSoru();
      a.gecikmeliGec(const Duration(milliseconds: 10), () {}, hala: () => true);
    });
  });
}
