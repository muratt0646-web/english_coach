import 'package:flutter/material.dart';

import '../../shared_ui/bolum_basligi.dart';
import '../../shared_ui/gelistirme_notu.dart';

/// Konusma — iskelet ekrani.
/// PRODUCT_RULES S-2: v1 DEGERLENDIRMESIZDIR.
/// Otomatik telaffuz puani verilmez; kullanici kendini degerlendirir.
class KonusmaEkrani extends StatefulWidget {
  const KonusmaEkrani({super.key});
  @override
  State<KonusmaEkrani> createState() => _KonusmaEkraniState();
}

class _KonusmaEkraniState extends State<KonusmaEkrani> {
  static const List<String> _cumleler = <String>[
    'I drink coffee every morning.',
    'She reads books in the evening.',
    'We buy bread from a small shop.',
  ];

  int _aktif = 0;
  int? _ozDegerlendirme;
  final Map<int, int> _puanlar = <int, int>{};

  void _sesUyarisi(String ne) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$ne henuz baglanmadi. Cihaz ses altyapisi '
            'dogrulamasi (TB-03 / SP-01) tamamlaninca calisacak.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData t = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Konusma')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              const GelistirmeNotu(
                calisan: 'cumle akisi, oz-degerlendirme, ilerleme takibi',
                bekleyen: 'model sesi, kayit ve kaydi dinleme '
                    '(cihaz ses altyapisi)',
              ),
              Card(
                color: t.colorScheme.secondaryContainer,
                child: const Padding(
                  padding: EdgeInsets.all(14),
                  child: Text(
                    'Bu surumde otomatik telaffuz puani VERILMEZ. '
                    'Kendinizi siz degerlendirirsiniz. Bu bilincli bir '
                    'karardir: guvenilmeyen bir puan, puan olmamasindan '
                    'daha zararlidir.',
                  ),
                ),
              ),
              const BolumBasligi('Alistirma', ikon: Icons.mic_none_outlined),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Cumle ${_aktif + 1} / ${_cumleler.length}',
                          style: t.textTheme.labelMedium),
                      const SizedBox(height: 10),
                      Text(_cumleler[_aktif],
                          style: t.textTheme.headlineSmall),
                      const SizedBox(height: 18),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: <Widget>[
                          FilledButton.tonalIcon(
                            onPressed: () => _sesUyarisi('Model sesi'),
                            icon: const Icon(Icons.volume_up_outlined),
                            label: const Text('Ornek cumleyi dinle'),
                          ),
                          OutlinedButton.icon(
                            onPressed: () => _sesUyarisi('Kayit'),
                            icon: const Icon(Icons.fiber_manual_record),
                            label: const Text('Kendini kaydet'),
                          ),
                          OutlinedButton.icon(
                            onPressed: () => _sesUyarisi('Kaydi dinleme'),
                            icon: const Icon(Icons.play_circle_outline),
                            label: const Text('Kaydi dinle'),
                          ),
                        ],
                      ),
                      const Divider(height: 30),
                      Text('Yuksek sesle tekrar ettikten sonra kendini '
                          'degerlendir:', style: t.textTheme.bodyMedium),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        children: <Widget>[
                          for (int i = 1; i <= 3; i++)
                            ChoiceChip(
                              label: Text(<String>[
                                'Zorlandim',
                                'Idare eder',
                                'Rahat soyledim'
                              ][i - 1]),
                              selected: _ozDegerlendirme == i,
                              onSelected: (bool v) => setState(() {
                                _ozDegerlendirme = v ? i : null;
                              }),
                            ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: <Widget>[
                          if (_aktif > 0)
                            OutlinedButton(
                              onPressed: () => setState(() {
                                _aktif--;
                                _ozDegerlendirme = _puanlar[_aktif];
                              }),
                              child: const Text('Onceki'),
                            ),
                          const Spacer(),
                          FilledButton(
                            onPressed: _ozDegerlendirme == null
                                ? null
                                : () => setState(() {
                                      _puanlar[_aktif] = _ozDegerlendirme!;
                                      if (_aktif < _cumleler.length - 1) {
                                        _aktif++;
                                        _ozDegerlendirme = _puanlar[_aktif];
                                      }
                                    }),
                            child: Text(_aktif < _cumleler.length - 1
                                ? 'Sonraki'
                                : 'Kaydet'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (_puanlar.isNotEmpty) ...<Widget>[
                const BolumBasligi('Oz-degerlendirmelerin',
                    ikon: Icons.how_to_reg_outlined),
                ..._puanlar.entries.map((MapEntry<int, int> e) => ListTile(
                      dense: true,
                      leading: Text('${e.key + 1}.'),
                      title: Text(_cumleler[e.key]),
                      trailing: Text(<String>[
                        'Zorlandim',
                        'Idare eder',
                        'Rahat soyledim'
                      ][e.value - 1]),
                    )),
              ],
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
