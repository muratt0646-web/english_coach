import 'package:flutter/material.dart';

import '../core/model/ders_sablonu.dart';

/// Dogru ornek karti: yesil kenar, Ingilizce vurgulu, Turkce soluk.
class DogruOrnekKarti extends StatelessWidget {
  final OrnekCumle ornek;
  final int? sira;
  const DogruOrnekKarti({super.key, required this.ornek, this.sira});

  @override
  Widget build(BuildContext context) {
    final ThemeData t = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.06),
        border: Border(
          left: BorderSide(color: Colors.green.shade400, width: 4),
        ),
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(8)),
      ),
      padding: const EdgeInsets.fromLTRB(14, 10, 12, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (sira != null) ...<Widget>[
            SizedBox(
              width: 24,
              child: Text('$sira.',
                  style: t.textTheme.labelSmall?.copyWith(color: t.hintColor)),
            ),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(ornek.ingilizce,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(ornek.turkce,
                    style: t.textTheme.bodySmall?.copyWith(color: t.hintColor)),
              ],
            ),
          ),
          Icon(Icons.check_circle_outline,
              size: 18, color: Colors.green.shade600),
        ],
      ),
    );
  }
}

/// Yanlis ornek karti: yanlis bicim -> ok -> dogru bicim -> gerekce.
///
/// Ogretim degeri gerekcededir; bu yuzden gerekce AYRI ve GORUNUR bir
/// kutuda gosterilir, kucuk dipnot olarak degil.
class YanlisOrnekKarti extends StatelessWidget {
  final OrnekCumle ornek;
  final int? sira;
  const YanlisOrnekKarti({super.key, required this.ornek, this.sira});

  @override
  Widget build(BuildContext context) {
    final ThemeData t = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: t.colorScheme.surfaceContainerHighest,
        border: Border(
          left: BorderSide(color: Colors.redAccent.shade200, width: 4),
        ),
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(8)),
      ),
      padding: const EdgeInsets.fromLTRB(14, 12, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (sira != null)
                SizedBox(
                  width: 24,
                  child: Text('$sira.',
                      style: t.textTheme.labelSmall
                          ?.copyWith(color: t.hintColor)),
                ),
              Icon(Icons.close, size: 18, color: Colors.redAccent.shade200),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  ornek.ingilizce,
                  style: TextStyle(
                    fontSize: 15,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.redAccent.shade200,
                    color: t.hintColor,
                  ),
                ),
              ),
            ],
          ),
          if (ornek.dogruBicim != null) ...<Widget>[
            const SizedBox(height: 6),
            Row(
              children: <Widget>[
                const SizedBox(width: 24),
                Icon(Icons.check, size: 18, color: Colors.green.shade600),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(ornek.dogruBicim!,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w700)),
                ),
              ],
            ),
          ],
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(ornek.turkce,
                style: t.textTheme.bodySmall?.copyWith(color: t.hintColor)),
          ),
          if (ornek.neden != null) ...<Widget>[
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: t.colorScheme.surface,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.lightbulb_outline, size: 16, color: t.hintColor),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(ornek.neden!,
                        style: t.textTheme.bodySmall?.copyWith(height: 1.45)),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Alt konu basligi — ornekleri gruplamak icin.
class AltKonuSeridi extends StatelessWidget {
  final String baslik;
  final int adet;
  const AltKonuSeridi({super.key, required this.baslik, required this.adet});

  @override
  Widget build(BuildContext context) {
    final ThemeData t = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: t.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(baslik,
                style: t.textTheme.labelMedium
                    ?.copyWith(color: t.colorScheme.onPrimaryContainer)),
          ),
          const SizedBox(width: 8),
          Text('$adet ornek', style: t.textTheme.labelSmall),
          const SizedBox(width: 10),
          Expanded(child: Divider(color: t.dividerColor)),
        ],
      ),
    );
  }
}
