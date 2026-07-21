import 'package:english_coach/shared_ui/basit_markdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// BasitMarkdown cizici testleri.
/// EN-A1-001'deki 70 tablo satiri artik ham '|' olarak gorunmemeli.
void main() {
  Widget sar(String m) => MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(child: BasitMarkdown(m)),
        ),
      );

  testWidgets('Tablo gercek Table widget olarak cizilir',
      (WidgetTester tester) async {
    await tester.pumpWidget(sar('''
| Cumle | Anlam |
|---|---|
| The dog bit the man. | Kopek adami isirdi. |
| The man bit the dog. | Adam kopegi isirdi. |
'''));
    await tester.pumpAndSettle();

    expect(find.byType(Table), findsOneWidget);
    // Basliklar ve hucreler AYRI metin olarak bulunmali
    expect(find.text('Cumle'), findsOneWidget);
    expect(find.text('The dog bit the man.'), findsOneWidget);
    expect(find.text('Kopek adami isirdi.'), findsOneWidget);
    // Ham boru isareti EKRANDA OLMAMALI
    expect(find.textContaining('|'), findsNothing);
    // Ayirici satir hucre olarak cizilmemeli
    expect(find.text('---'), findsNothing);
  });

  testWidgets('Basliklar ham # ile gorunmez', (WidgetTester tester) async {
    await tester.pumpWidget(sar('# Birinci\n\n## Ikinci\n\nDuz metin.'));
    await tester.pumpAndSettle();
    expect(find.text('Birinci'), findsOneWidget);
    expect(find.text('Ikinci'), findsOneWidget);
    expect(find.textContaining('#'), findsNothing);
  });

  testWidgets('**kalin** yildizsiz ve kalin cizilir',
      (WidgetTester tester) async {
    await tester.pumpWidget(sar('Bu **onemli** bir nokta.'));
    await tester.pumpAndSettle();
    expect(find.textContaining('*'), findsNothing);
    final SelectableText st =
        tester.widget<SelectableText>(find.byType(SelectableText).first);
    final List<InlineSpan> cocuklar = st.textSpan!.children!;
    expect(cocuklar.length, 3);
    expect((cocuklar[1] as TextSpan).text, 'onemli');
    expect((cocuklar[1] as TextSpan).style!.fontWeight, FontWeight.w700);
  });

  testWidgets('Alinti ve madde isaretleri cizilir',
      (WidgetTester tester) async {
    await tester.pumpWidget(sar('> Bu bir alinti\n\n- birinci\n- ikinci'));
    await tester.pumpAndSettle();
    expect(find.text('Bu bir alinti'), findsOneWidget);
    expect(find.text('birinci'), findsOneWidget);
    expect(find.text('ikinci'), findsOneWidget);
    expect(find.textContaining('> '), findsNothing);
    expect(find.text('•  '), findsNWidgets(2));
  });

  testWidgets('Desteklenmeyen bicim METIN OLARAK korunur',
      (WidgetTester tester) async {
    await tester.pumpWidget(sar('Normal satir [link](x) ve `kod`.'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Normal satir'), findsOneWidget);
  });

  testWidgets('Bos girdi cokmez', (WidgetTester tester) async {
    await tester.pumpWidget(sar(''));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });

  testWidgets('Duzensiz tablo (eksik hucre) cokmez',
      (WidgetTester tester) async {
    await tester.pumpWidget(sar('| a | b | c |\n|---|---|---|\n| tek |'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.byType(Table), findsOneWidget);
  });
}
