import 'package:flutter/material.dart';

/// Iskelet modullerde durumu DURUSTCE bildirir.
/// "Yakinda" demez; ne calistigini ve neyin bekledigini yazar.
class GelistirmeNotu extends StatelessWidget {
  final String calisan;
  final String bekleyen;

  const GelistirmeNotu({
    super.key,
    required this.calisan,
    required this.bekleyen,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData t = Theme.of(context);
    return Card(
      color: t.colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.construction_outlined,
                    size: 18, color: t.hintColor),
                const SizedBox(width: 8),
                Text('Bu modul gelistirme asamasinda',
                    style: t.textTheme.labelLarge),
              ],
            ),
            const SizedBox(height: 8),
            Text('Su an calisan: $calisan', style: t.textTheme.bodySmall),
            Text('Bekleyen: $bekleyen',
                style: t.textTheme.bodySmall?.copyWith(color: t.hintColor)),
          ],
        ),
      ),
    );
  }
}
