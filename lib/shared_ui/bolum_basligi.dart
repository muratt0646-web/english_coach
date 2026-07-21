import 'package:flutter/material.dart';

/// Modul ekranlarinda kullanilan ortak bolum basligi.
class BolumBasligi extends StatelessWidget {
  final String baslik;
  final String? altBaslik;
  final IconData? ikon;

  const BolumBasligi(this.baslik, {super.key, this.altBaslik, this.ikon});

  @override
  Widget build(BuildContext context) {
    final ThemeData t = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (ikon != null) ...<Widget>[
            Icon(ikon, size: 20, color: t.colorScheme.primary),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(baslik, style: t.textTheme.titleMedium),
                if (altBaslik != null)
                  Text(altBaslik!,
                      style:
                          t.textTheme.bodySmall?.copyWith(color: t.hintColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
