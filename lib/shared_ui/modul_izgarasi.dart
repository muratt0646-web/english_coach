import 'package:flutter/material.dart';

import '../app/modul_kimlik.dart';
import 'modul_karti.dart';

/// Modul kartlarinin izgarasi. Saf sunum: veritabani bilmez.
/// Bu sayede widget testleri veritabani olmadan calisabilir.
class ModulIzgarasi extends StatelessWidget {
  final List<ModulKimlik> moduller;

  /// modul kodu -> 0.0..1.0
  final Map<String, double> ilerlemeler;

  /// modul kodu -> son calisilan icerik
  final Map<String, String> sonIcerikler;

  final void Function(ModulKimlik modul) onModulSecildi;

  const ModulIzgarasi({
    super.key,
    required this.moduller,
    required this.onModulSecildi,
    this.ilerlemeler = const <String, double>{},
    this.sonIcerikler = const <String, String>{},
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints kisit) {
        final int sutun = kisit.maxWidth >= 1000
            ? 3
            : (kisit.maxWidth >= 640 ? 2 : 1);
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: sutun,
            mainAxisExtent: 252,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: moduller.length,
          itemBuilder: (BuildContext context, int i) {
            final ModulKimlik m = moduller[i];
            return ModulKarti(
              modul: m,
              ilerleme: ilerlemeler[m.kod] ?? 0.0,
              sonIcerik: sonIcerikler[m.kod],
              onGir: () => onModulSecildi(m),
            );
          },
        );
      },
    );
  }
}
