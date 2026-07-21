import 'package:flutter/material.dart';

import '../../shared_ui/bolum_basligi.dart';
import '../../shared_ui/gelistirme_notu.dart';
import '../../shared_ui/secenek_satiri.dart';
import 'hikaye_ornek_veri.dart';

/// Hikayeler — iskelet ekrani.
/// PRODUCT_RULES K9: hikaye erisimi ders tamamlamaya BAGLI DEGILDIR.
class HikayeEkrani extends StatefulWidget {
  const HikayeEkrani({super.key});
  @override
  State<HikayeEkrani> createState() => _HikayeEkraniState();
}

class _HikayeEkraniState extends State<HikayeEkrani> {
  bool _ceviriAcik = false;
  bool _kelimeleriGoster = true;
  final Map<int, int> _cevaplar = <int, int>{};

  void _sesUyarisi() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Ses altyapisi henuz baglanmadi. Cihaz TTS dogrulamasi (TB-03) '
          'tamamlaninca dinleme calisacak.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Hikaye h = HikayeOrnekVeri.baslangic;
    final ThemeData t = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Hikayeler')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              const GelistirmeNotu(
                calisan: 'hikaye metni, Turkce ceviri ac/kapat, hedef kelime '
                    'vurgusu, anlama sorulari',
                bekleyen: 'hikaye havuzu, seslendirme, seviyeye gore secim, '
                    'okunan kelimelerin tekrara aktarilmasi',
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(h.baslik, style: t.textTheme.headlineSmall),
                        Text('Seviye ${h.seviye}  ·  ${h.kod}',
                            style: t.textTheme.bodySmall),
                      ],
                    ),
                  ),
                  IconButton.filledTonal(
                    tooltip: 'Dinle',
                    onPressed: _sesUyarisi,
                    icon: const Icon(Icons.play_arrow),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: <Widget>[
                  FilterChip(
                    label: const Text('Turkce ceviri'),
                    selected: _ceviriAcik,
                    onSelected: (bool v) => setState(() => _ceviriAcik = v),
                  ),
                  FilterChip(
                    label: const Text('Kelimeleri goster'),
                    selected: _kelimeleriGoster,
                    onSelected: (bool v) =>
                        setState(() => _kelimeleriGoster = v),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              for (int i = 0; i < h.paragraflarEn.length; i++)
                Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _vurgulu(h.paragraflarEn[i], h.hedefKelimeler),
                        if (_ceviriAcik) ...<Widget>[
                          const Divider(height: 20),
                          Text(h.paragraflarTr[i],
                              style: t.textTheme.bodyMedium
                                  ?.copyWith(color: t.hintColor)),
                        ],
                      ],
                    ),
                  ),
                ),
              if (_kelimeleriGoster) ...<Widget>[
                const BolumBasligi('Bu hikayedeki ogrenilecek kelimeler',
                    ikon: Icons.style_outlined),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: h.hedefKelimeler.entries
                      .map((MapEntry<String, String> e) => Chip(
                            label: Text('${e.key} — ${e.value}'),
                          ))
                      .toList(),
                ),
              ],
              const BolumBasligi('Anlama sorulari',
                  ikon: Icons.quiz_outlined),
              for (int i = 0; i < h.sorular.length; i++)
                _soruKarti(i, h.sorular[i]),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  /// Hedef kelimeleri metin icinde vurgular.
  Widget _vurgulu(String metin, Map<String, String> hedefler) {
    final List<TextSpan> parcalar = <TextSpan>[];
    final ThemeData t = Theme.of(context);
    for (final String kelime in metin.split(' ')) {
      final String sade =
          kelime.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');
      final bool hedef = hedefler.containsKey(sade);
      parcalar.add(TextSpan(
        text: '$kelime ',
        style: hedef
            ? TextStyle(
                fontWeight: FontWeight.w700,
                color: t.colorScheme.primary,
              )
            : null,
      ));
    }
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context)
            .style
            .copyWith(fontSize: 15, height: 1.6),
        children: parcalar,
      ),
    );
  }

  Widget _soruKarti(int indeks, HikayeSorusu s) {
    final int? secilen = _cevaplar[indeks];
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${indeks + 1}. ${s.soru}',
                style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            for (int i = 0; i < s.secenekler.length; i++)
              SecenekSatiri(
                metin: s.secenekler[i],
                secili: secilen == i,
                onSecildi: () => setState(() => _cevaplar[indeks] = i),
              ),
            if (secilen != null)
              Text(
                secilen == s.dogruIndeks
                    ? 'Dogru.'
                    : 'Dogru cevap: ${s.secenekler[s.dogruIndeks]}',
                style: TextStyle(
                  color: secilen == s.dogruIndeks
                      ? Colors.green
                      : Colors.redAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
