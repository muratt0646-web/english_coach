import 'package:flutter/material.dart';

import '../../shared_ui/bolum_basligi.dart';
import '../../shared_ui/gelistirme_notu.dart';

/// Seviye Tespit ve Eksik Analizi — iskelet ekrani.
/// PRODUCT_RULES K5/K6/K7: sonuc kullaniciyi KILITLEMEZ.
class SeviyeEkrani extends StatelessWidget {
  const SeviyeEkrani({super.key});

  static const List<List<String>> _seviyeler = <List<String>>[
    <String>['A1', 'Baslangic', 'Basit cumleler kurar, tanidik ifadeleri anlar'],
    <String>['A2', 'Temel', 'Gunluk konularda kisa konusmalar yapar'],
    <String>['B1', 'Orta', 'Tanidik konularda baglantili metin uretir'],
    <String>['B2', 'Orta ustu', 'Soyut konularda akici tartisir'],
    <String>['C1', 'Ileri', 'Karmasik metinleri anlar, esnek kullanir'],
    <String>['C2', 'Ustun', 'Neredeyse anadili duzeyinde'],
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData t = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Seviye Tespit')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              const GelistirmeNotu(
                calisan: 'tanitim, seviye aciklamalari, sonuc ornegi, '
                    'A1\'den baslama secenegi',
                bekleyen: 'uyarlanabilir sinav, beceri bazinda eksik analizi, '
                    'kisisellestirilmis ders sirasi',
              ),
              const BolumBasligi('Seviye tespiti ne yapar?',
                  ikon: Icons.assessment_outlined),
              const Text(
                'Bu test yalnizca bir harf vermez. Yedi beceride nerede '
                'oldugunuzu ayri ayri olcer ve onceki seviyelerden kalan '
                'eksikleri de listeler.\n\n'
                'Sonuc sizi KILITLEMEZ: onerilen bir yol olusur, ama '
                'istediginiz module istediginiz zaman girebilirsiniz.',
                style: TextStyle(height: 1.5),
              ),
              const SizedBox(height: 8),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.schedule_outlined),
                  title: const Text('Tahmini sure'),
                  subtitle: const Text('60–75 dakika · 4 oturuma bolunebilir'),
                  trailing: Text('100 gorev', style: t.textTheme.labelMedium),
                ),
              ),
              const BolumBasligi('Seviyeler', ikon: Icons.stairs_outlined),
              ..._seviyeler.map((List<String> s) => Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: CircleAvatar(child: Text(s[0])),
                      title: Text(s[1]),
                      subtitle: Text(s[2]),
                    ),
                  )),
              const BolumBasligi('Sonuc nasil gorunur?',
                  ikon: Icons.receipt_long_outlined),
              Card(
                color: t.colorScheme.surfaceContainerHighest,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'ORNEK SONUC\n\n'
                    'Tahmini seviye: A2\n\n'
                    'Guclu konular:\n'
                    '  · Temel cumle sirasi (SVO)\n'
                    '  · Present Simple olumlu\n\n'
                    'Zayif konular:\n'
                    '  · Artikel kullanimi (a / an / the)\n'
                    '  · Yer edatlari (in / on / at)\n\n'
                    'Onceki seviyeden kalan eksikler:\n'
                    '  · A1 — be fiili olumsuz ve soru\n\n'
                    'Onerilen baslangic: EN-A1-019 Belirsiz artikel\n\n'
                    'Tekrar edilmesi gerekenler: 24 kelime, 3 konu',
                    style: TextStyle(fontFamily: 'monospace', height: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FilledButton.icon(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Sinav motoru Faz 4B\'de eklenecek. '
                        'Simdilik A1\'den baslayabilirsiniz.'),
                  ),
                ),
                icon: const Icon(Icons.play_arrow),
                label: const Text('Teste basla'),
              ),
              const SizedBox(height: 10),
              OutlinedButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.school_outlined),
                label: const Text('Testi atla, A1\'den basla'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
