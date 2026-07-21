import 'package:flutter/material.dart';

import '../app/modul_kimlik.dart';

/// Tek bir modul karti. Saf sunum widget'i: veri disaridan gelir.
class ModulKarti extends StatelessWidget {
  final ModulKimlik modul;

  /// 0.0 - 1.0 arasi ilerleme.
  final double ilerleme;

  /// Son calisilan icerik basligi. Yoksa null.
  final String? sonIcerik;

  final VoidCallback onGir;

  const ModulKarti({
    super.key,
    required this.modul,
    required this.ilerleme,
    required this.onGir,
    this.sonIcerik,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData t = Theme.of(context);
    final int yuzde = (ilerleme.clamp(0.0, 1.0) * 100).round();

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onGir,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(modul.ikon, size: 26, color: t.colorScheme.primary),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      modul.ad,
                      style: t.textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (modul.durum == ModulDurumu.iskelet)
                    Tooltip(
                      message: 'Temel iskelet hazir, gelistirme suruyor',
                      child: Icon(Icons.construction_outlined,
                          size: 18, color: t.hintColor),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              // Expanded: kalan bosluğu emer. Sabit yukseklikli izgarada
              // yazi tipi olculeri degisse bile TASMA olusmaz.
              Expanded(
                child: Text(
                  modul.aciklama,
                  style: t.textTheme.bodySmall,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 10),
              LinearProgressIndicator(
                value: ilerleme.clamp(0.0, 1.0),
                minHeight: 6,
              ),
              const SizedBox(height: 6),
              Text('Ilerleme: %$yuzde', style: t.textTheme.labelSmall),
              Text(
                sonIcerik == null
                    ? 'Henuz calisilmadi'
                    : 'Son: ${sonIcerik!}',
                style: t.textTheme.labelSmall?.copyWith(color: t.hintColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: FilledButton.tonal(
                  onPressed: onGir,
                  child: Text(ilerleme > 0 ? 'Devam et' : 'Basla'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
