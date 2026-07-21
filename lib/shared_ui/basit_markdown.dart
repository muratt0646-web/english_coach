import 'package:flutter/material.dart';

/// Ders icerigindeki SINIRLI markdown alt kumesini cizer.
///
/// Yeni paket EKLENMEDI: `flutter_markdown` surum riski tasir ve
/// ihtiyacimiz olan alt kume kucuk.
///
/// Desteklenen:
///   # ## ###   basliklar
///   **kalin**  vurgu
///   | a | b |  tablo (ayirici satiri --- atlanir)
///   > alinti
///   - madde
///   ---        yatay cizgi
///
/// Desteklenmeyen her sey DUZ METIN olarak cizilir; icerik kaybolmaz.
class BasitMarkdown extends StatelessWidget {
  final String metin;
  const BasitMarkdown(this.metin, {super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData t = Theme.of(context);
    final List<Widget> parcalar = <Widget>[];
    final List<String> satirlar = metin.split('\n');

    int i = 0;
    while (i < satirlar.length) {
      final String s = satirlar[i];
      final String k = s.trim();

      // --- tablo ---
      if (k.startsWith('|') && k.endsWith('|')) {
        final List<List<String>> satirKumesi = <List<String>>[];
        while (i < satirlar.length) {
          final String tk = satirlar[i].trim();
          if (!tk.startsWith('|') || !tk.endsWith('|')) break;
          final List<String> hucreler = tk
              .substring(1, tk.length - 1)
              .split('|')
              .map((String h) => h.trim())
              .toList();
          // ayirici satir: yalnizca ---, :--, --: gibi
          final bool ayirici = hucreler.every((String h) =>
              h.isNotEmpty && RegExp(r'^:?-{2,}:?$').hasMatch(h));
          if (!ayirici) satirKumesi.add(hucreler);
          i++;
        }
        if (satirKumesi.isNotEmpty) parcalar.add(_tablo(t, satirKumesi));
        continue;
      }

      // --- yatay cizgi ---
      if (RegExp(r'^-{3,}$').hasMatch(k)) {
        parcalar.add(const Divider(height: 22));
        i++;
        continue;
      }

      // --- baslik ---
      final RegExpMatch? bas = RegExp(r'^(#{1,3})\s+(.*)$').firstMatch(k);
      if (bas != null) {
        final int duzey = bas.group(1)!.length;
        parcalar.add(Padding(
          padding: EdgeInsets.only(top: duzey == 1 ? 4 : 14, bottom: 8),
          child: _zenginMetin(
            context,
            bas.group(2)!,
            temel: (duzey == 1
                    ? t.textTheme.headlineSmall
                    : duzey == 2
                        ? t.textTheme.titleLarge
                        : t.textTheme.titleMedium)
                ?.copyWith(color: t.colorScheme.primary),
          ),
        ));
        i++;
        continue;
      }

      // --- alinti ---
      if (k.startsWith('> ')) {
        parcalar.add(Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
          decoration: BoxDecoration(
            color: t.colorScheme.surfaceContainerHighest,
            border: Border(
              left: BorderSide(color: t.colorScheme.primary, width: 3),
            ),
          ),
          child: _zenginMetin(context, k.substring(2),
              temel: t.textTheme.bodyMedium),
        ));
        i++;
        continue;
      }

      // --- madde ---
      if (k.startsWith('- ') || k.startsWith('· ')) {
        parcalar.add(Padding(
          padding: const EdgeInsets.only(left: 4, top: 3, bottom: 3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('•  ', style: t.textTheme.bodyMedium),
              Expanded(
                child: _zenginMetin(context, k.substring(2),
                    temel: t.textTheme.bodyMedium),
              ),
            ],
          ),
        ));
        i++;
        continue;
      }

      // --- bos satir ---
      if (k.isEmpty) {
        parcalar.add(const SizedBox(height: 8));
        i++;
        continue;
      }

      // --- duz paragraf ---
      parcalar.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: _zenginMetin(context, s,
            temel: const TextStyle(fontSize: 15, height: 1.55)),
      ));
      i++;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: parcalar,
    );
  }

  /// **kalin** isaretlerini gercek kalin metne cevirir.
  Widget _zenginMetin(BuildContext context, String kaynak,
      {TextStyle? temel}) {
    final TextStyle taban =
        temel ?? DefaultTextStyle.of(context).style;
    final List<TextSpan> parcalar = <TextSpan>[];
    int son = 0;
    for (final RegExpMatch m
        in RegExp(r'\*\*(.+?)\*\*').allMatches(kaynak)) {
      if (m.start > son) {
        parcalar.add(TextSpan(text: kaynak.substring(son, m.start)));
      }
      parcalar.add(TextSpan(
        text: m.group(1),
        style: const TextStyle(fontWeight: FontWeight.w700),
      ));
      son = m.end;
    }
    if (son < kaynak.length) {
      parcalar.add(TextSpan(text: kaynak.substring(son)));
    }
    return SelectableText.rich(
      TextSpan(style: taban, children: parcalar),
    );
  }

  Widget _tablo(ThemeData t, List<List<String>> satirlar) {
    final int sutun =
        satirlar.map((List<String> s) => s.length).reduce((a, b) => a > b ? a : b);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Table(
        border: TableBorder.all(
          color: t.colorScheme.outlineVariant,
          width: 1,
        ),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: <TableRow>[
          for (int r = 0; r < satirlar.length; r++)
            TableRow(
              decoration: BoxDecoration(
                color: r == 0
                    ? t.colorScheme.surfaceContainerHighest
                    : null,
              ),
              children: <Widget>[
                for (int c = 0; c < sutun; c++)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 8),
                    child: _hucre(
                      t,
                      c < satirlar[r].length ? satirlar[r][c] : '',
                      baslikMi: r == 0,
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _hucre(ThemeData t, String metin, {required bool baslikMi}) {
    // Hucre icinde de **kalin** ve *egik* desteklenir.
    final bool egik = metin.startsWith('*') &&
        metin.endsWith('*') &&
        !metin.startsWith('**');
    final String sade = egik ? metin.substring(1, metin.length - 1) : metin;
    final bool kalin = baslikMi || sade.startsWith('**');
    final String son = sade.replaceAll('**', '');
    return Text(
      son,
      style: TextStyle(
        fontSize: 13.5,
        height: 1.4,
        fontWeight: kalin ? FontWeight.w700 : FontWeight.w400,
        fontStyle: egik ? FontStyle.italic : FontStyle.normal,
        color: egik ? t.colorScheme.error : null,
      ),
    );
  }
}
