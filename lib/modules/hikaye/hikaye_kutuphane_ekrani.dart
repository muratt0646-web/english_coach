import 'package:flutter/material.dart';

import '../../core/db/app_database.dart';
import '../../data/hikaye_repo.dart';
import 'hikaye_okuma_ekrani.dart';

/// Hikaye kutuphanesi: arama + filtreler.
/// PRODUCT_RULES K9: hikaye erisimi ders tamamlamaya BAGLI DEGILDIR.
class HikayeEkrani extends StatefulWidget {
  const HikayeEkrani({super.key});
  @override
  State<HikayeEkrani> createState() => _HikayeEkraniState();
}

class _HikayeEkraniState extends State<HikayeEkrani> {
  final TextEditingController _arama = TextEditingController();

  HikayeRepo? _repo;
  List<HikayeOzet> _liste = <HikayeOzet>[];
  List<String> _konular = <String>[];
  bool _yukleniyor = true;
  String? _hata;

  String? _seviye;
  String? _konu;
  int? _enFazlaDk;
  bool _tamamlananlar = false;
  bool _devamEdenler = false;
  bool _favoriler = false;

  @override
  void initState() {
    super.initState();
    _yukle();
  }

  @override
  void dispose() {
    _arama.dispose();
    super.dispose();
  }

  Future<void> _yukle() async {
    setState(() {
      _yukleniyor = true;
      _hata = null;
    });
    try {
      final HikayeRepo r = HikayeRepo(AppDatabase.instance.db);
      final List<HikayeOzet> l = await r.kutuphane(
        filtre: HikayeFiltre(
          arama: _arama.text,
          seviye: _seviye,
          konu: _konu,
          enFazlaDk: _enFazlaDk,
          sadeceTamamlananlar: _tamamlananlar,
          sadeceDevamEdenler: _devamEdenler,
          sadeceFavoriler: _favoriler,
        ),
      );
      final List<String> k = await r.konuEtiketleri();
      if (!mounted) return;
      setState(() {
        _repo = r;
        _liste = l;
        _konular = k;
        _yukleniyor = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _hata = e.toString();
        _yukleniyor = false;
      });
    }
  }

  Future<void> _ac(HikayeOzet o) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext _) => HikayeOkumaEkrani(hikayeKod: o.kod),
      ),
    );
    if (mounted) await _yukle();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData t = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Hikayeler')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 820),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      controller: _arama,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                        labelText: 'Baslik veya konu ara',
                      ),
                      onChanged: (_) => _yukle(),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: <Widget>[
                        for (final String s in <String>['A1', 'A2', 'B1'])
                          FilterChip(
                            label: Text(s),
                            selected: _seviye == s,
                            onSelected: (bool v) {
                              setState(() => _seviye = v ? s : null);
                              _yukle();
                            },
                          ),
                        for (final int dk in <int>[3, 5])
                          FilterChip(
                            label: Text('$dk dk altinda'),
                            selected: _enFazlaDk == dk,
                            onSelected: (bool v) {
                              setState(() => _enFazlaDk = v ? dk : null);
                              _yukle();
                            },
                          ),
                        FilterChip(
                          label: const Text('Devam edenler'),
                          selected: _devamEdenler,
                          onSelected: (bool v) {
                            setState(() => _devamEdenler = v);
                            _yukle();
                          },
                        ),
                        FilterChip(
                          label: const Text('Tamamlananlar'),
                          selected: _tamamlananlar,
                          onSelected: (bool v) {
                            setState(() => _tamamlananlar = v);
                            _yukle();
                          },
                        ),
                        FilterChip(
                          label: const Text('Favoriler'),
                          selected: _favoriler,
                          onSelected: (bool v) {
                            setState(() => _favoriler = v);
                            _yukle();
                          },
                        ),
                      ],
                    ),
                    if (_konular.isNotEmpty) ...<Widget>[
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _konular
                            .map((String k) => ChoiceChip(
                                  label: Text(k),
                                  selected: _konu == k,
                                  onSelected: (bool v) {
                                    setState(() => _konu = v ? k : null);
                                    _yukle();
                                  },
                                ))
                            .toList(),
                      ),
                    ],
                    const SizedBox(height: 6),
                    Text('${_liste.length} hikaye',
                        style: t.textTheme.labelMedium),
                  ],
                ),
              ),
              Expanded(
                child: _yukleniyor
                    ? const Center(child: CircularProgressIndicator())
                    : _hata != null
                        ? Center(child: Text('Icerik acilamadi: $_hata'))
                        : _liste.isEmpty
                            ? const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(30),
                                  child: Text(
                                      'Filtrelere uyan hikaye bulunamadi.'),
                                ),
                              )
                            : ListView.builder(
                                padding: const EdgeInsets.all(20),
                                itemCount: _liste.length,
                                itemBuilder:
                                    (BuildContext c, int i) =>
                                        _kart(t, _liste[i]),
                              ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _kart(ThemeData t, HikayeOzet o) {
    final double y = o.ilerleme.okumaYuzdesi;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 16,
                  child: Text(o.seviye,
                      style: const TextStyle(fontSize: 11)),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(o.baslik, style: t.textTheme.titleMedium),
                      Text(
                        '${o.konuEtiketi}  ·  ${o.kelimeSayisi} kelime  ·  '
                        '${o.tahminiDk} dk',
                        style: t.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: 'Favori',
                  icon: Icon(o.ilerleme.favori
                      ? Icons.star
                      : Icons.star_border),
                  onPressed: () async {
                    await _repo?.favoriDegistir(o.kod);
                    await _yukle();
                  },
                ),
              ],
            ),
            if (y > 0) ...<Widget>[
              const SizedBox(height: 10),
              LinearProgressIndicator(value: y, minHeight: 5),
              const SizedBox(height: 4),
              Text(
                o.ilerleme.durum == 'tamamlandi'
                    ? 'Tamamlandi'
                    : 'Devam ediyor · %${(y * 100).round()}',
                style: t.textTheme.labelSmall,
              ),
            ],
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => _ac(o),
                child: Text(y > 0 && y < 1
                    ? 'Kaldigin yerden devam et'
                    : (y >= 1 ? 'Tekrar oku' : 'Okumaya basla')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
