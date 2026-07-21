import 'package:flutter/material.dart';

import '../../shared_ui/bolum_basligi.dart';
import '../../shared_ui/gelistirme_notu.dart';

/// Ilerleme Merkezi — iskelet ekrani.
/// PRODUCT_RULES K1 v1.1: yedi beceri AYRI gosterilir.
class IlerlemeEkrani extends StatelessWidget {
  const IlerlemeEkrani({super.key});

  /// K1'in yedi hedefi. Olculmemis beceri "olculmedi" olarak gosterilir.
  static const List<List<String>> _beceriler = <List<String>>[
    <String>['GRAMER', 'Gramer', 'olculuyor'],
    <String>['DUSUNME', 'Ingilizce dusunme', 'olculuyor'],
    <String>['KELIME', 'Kelime', 'olculmedi'],
    <String>['OKUMA', 'Okuma', 'olculmedi'],
    <String>['DINLEME', 'Dinleme', 'olculmedi'],
    <String>['YAZMA', 'Yazma', 'olculmedi'],
    <String>['KONUSMA', 'Konusma', 'olculmedi'],
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData t = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Ilerleme Merkezi')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              const GelistirmeNotu(
                calisan: 'yedi becerinin listesi ve olcum durumu',
                bekleyen: 'olay akisindan beceri skorlari, gunluk/haftalik '
                    'grafik, hata defteri',
              ),
              const BolumBasligi('Yedi beceri',
                  altBaslik: 'Olculmemis beceri, olculmus gibi gosterilmez',
                  ikon: Icons.insights_outlined),
              ..._beceriler.map((List<String> b) {
                final bool olculuyor = b[2] == 'olculuyor';
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Icon(
                      olculuyor
                          ? Icons.check_circle_outline
                          : Icons.remove_circle_outline,
                      color: olculuyor ? t.colorScheme.primary : t.hintColor,
                    ),
                    title: Text(b[1]),
                    subtitle: Text(olculuyor
                        ? 'Bu beceri su an olculuyor'
                        : 'Henuz olculmedi — ilgili modul hazir degil'),
                    trailing: Text(b[0], style: t.textTheme.labelSmall),
                  ),
                );
              }),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
