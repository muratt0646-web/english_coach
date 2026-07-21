import 'package:flutter/material.dart';

import '../modules/gramer/gramer_ekrani.dart';
import '../modules/hikaye/hikaye_kutuphane_ekrani.dart';
import '../modules/ilerleme/ilerleme_ekrani.dart';
import '../modules/kelime/kelime_ekrani.dart';
import '../modules/konusma/konusma_ekrani.dart';
import '../modules/senaryo/senaryo_ekrani.dart';
import '../modules/seviye/seviye_ekrani.dart';
import '../modules/tekrar/tekrar_ekrani.dart';

/// Modul kodundan ekrana esleme.
///
/// TEK yer moduleri birlikte tanir: burasi. Modullerin KENDISI
/// birbirini import ETMEZ (PRODUCT_RULES K3/K7 mimari garantisi).
class ModulYonlendirme {
  const ModulYonlendirme._();

  static Widget ekranYap(String kod) {
    switch (kod) {
      case 'gramer':
        return const GramerEkrani();
      case 'kelime':
        return const KelimeEkrani(paketId: 1);
      case 'hikaye':
        return const HikayeEkrani();
      case 'konusma':
        return const KonusmaEkrani();
      case 'senaryo':
        return const SenaryoEkrani();
      case 'seviye':
        return const SeviyeEkrani();
      case 'tekrar':
        return const TekrarEkrani();
      case 'ilerleme':
        return const IlerlemeEkrani();
      default:
        return _BilinmeyenModul(kod: kod);
    }
  }

  static Future<void> ac(BuildContext context, String kod) {
    return Navigator.of(context).push<void>(
      MaterialPageRoute<void>(builder: (BuildContext _) => ekranYap(kod)),
    );
  }
}

class _BilinmeyenModul extends StatelessWidget {
  final String kod;
  const _BilinmeyenModul({required this.kod});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modul bulunamadi')),
      body: Center(child: Text('Bilinmeyen modul kodu: $kod')),
    );
  }
}
