import 'package:flutter/material.dart';

import '../../shared_ui/bolum_basligi.dart';
import '../../shared_ui/gelistirme_notu.dart';

/// Akilli Tekrar — iskelet ekrani.
class TekrarEkrani extends StatelessWidget {
  const TekrarEkrani({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData t = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Akilli Tekrar')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              const GelistirmeNotu(
                calisan: 'tanitim ve tekrar mantiginin aciklamasi',
                bekleyen: 'SRS kart motoru, vade hesabi, gunluk tekrar '
                    'listesi, borc sikistirma',
              ),
              const BolumBasligi('Aralikli tekrar nasil calisir?',
                  ikon: Icons.repeat_outlined),
              const Text(
                'Ogrendiginiz her kelime ve yapi, unutmaya baslamadan hemen '
                'once tekrar karsiniza cikar. Dogru cevapladikca aralik uzar; '
                'yanlis cevapladikca kisalir.\n\n'
                'Boylece az tekrarla kalici ogrenme saglanir.',
                style: TextStyle(height: 1.5),
              ),
              const SizedBox(height: 16),
              Card(
                color: t.colorScheme.surfaceContainerHighest,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'ORNEK TEKRAR PLANI\n\n'
                    '1. dogru  ->  1 gun sonra\n'
                    '2. dogru  ->  3 gun sonra\n'
                    '3. dogru  ->  7 gun sonra\n'
                    '4. dogru  ->  17 gun sonra\n\n'
                    'Yanlis  ->  aralik 1 gune duser',
                    style: TextStyle(fontFamily: 'monospace', height: 1.6),
                  ),
                ),
              ),
              const BolumBasligi('Bugun tekrar edilecekler',
                  ikon: Icons.today_outlined),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.inbox_outlined),
                  title: Text('Tekrar kuyrugu bos'),
                  subtitle: Text('Ders ve kelime calistikca kartlar burada '
                      'birikecek.'),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
