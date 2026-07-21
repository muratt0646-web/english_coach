import 'package:flutter/material.dart';

import '../../core/db/app_database.dart';
import '../../core/model/models.dart';
import '../../data/icerik_repo.dart';
import '../../data/ilerleme_repo.dart';
import '../ders/ders_ekrani.dart';

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});
  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  final _icerik = IcerikRepo();
  final _ilerleme = IlerlemeRepo();

  Konu? _konu;
  KonuIlerleme? _durum;
  int _gorevSayisi = 0;
  int _tamamlanan = 0;
  int _toplamKayit = 0;
  bool _yukleniyor = true;

  @override
  void initState() {
    super.initState();
    _yukle();
  }

  Future<void> _yukle() async {
    setState(() => _yukleniyor = true);
    final konular = await _icerik.tumKonular();
    if (konular.isEmpty) {
      setState(() => _yukleniyor = false);
      return;
    }
    final k = konular.first;
    final gorevler = await _icerik.gorevler(k.kod);
    final durum = await _ilerleme.konuIlerlemesi(k.kod);
    final tamam = await _ilerleme.tamamlananGorevler(k.kod);
    final toplam = await _ilerleme.toplamGorevSonucu();

    if (!mounted) return;
    setState(() {
      _konu = k;
      _durum = durum;
      _gorevSayisi = gorevler.length;
      _tamamlanan = tamam.length;
      _toplamKayit = toplam;
      _yukleniyor = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('English Coach — Faz 1B-1'),
        actions: [
          IconButton(
            tooltip: 'Yenile',
            onPressed: _yukle,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: _yukleniyor
          ? const Center(child: CircularProgressIndicator())
          : _konu == null
              ? const Center(child: Text('Icerik bulunamadi'))
              : Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 620),
                    child: ListView(
                      padding: const EdgeInsets.all(24),
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_konu!.kod,
                                    style: t.textTheme.labelMedium),
                                const SizedBox(height: 6),
                                // --- DERS BASLIGI ---
                                Text(_konu!.adTr,
                                    style: t.textTheme.headlineSmall),
                                const SizedBox(height: 10),
                                Text(_konu!.ogretimAmaci,
                                    style: t.textTheme.bodyMedium),
                                const SizedBox(height: 20),

                                // --- MEVCUT ILERLEME ---
                                Text('Ilerleme', style: t.textTheme.titleSmall),
                                const SizedBox(height: 8),
                                LinearProgressIndicator(
                                  value: _durum!.gramerUstaligi,
                                  minHeight: 10,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Gramer ustaligi: '
                                  '%${(_durum!.gramerUstaligi * 100).round()}'
                                  '   ($_tamamlanan / $_gorevSayisi gorev)',
                                  style: t.textTheme.bodySmall,
                                ),
                                Text('Durum: ${_durum!.ilerlemeDurumu}',
                                    style: t.textTheme.bodySmall),
                                // D-5: dinleme AYRI satirda
                                Text(
                                  'Dinleme: ${_durum!.dinlemeDurumu}'
                                  '  (gramer ustaligini etkilemez)',
                                  style: t.textTheme.bodySmall
                                      ?.copyWith(color: t.hintColor),
                                ),
                                const SizedBox(height: 24),

                                // --- DERSE BASLA ---
                                SizedBox(
                                  width: double.infinity,
                                  child: FilledButton.icon(
                                    icon: const Icon(Icons.play_arrow),
                                    label: const Text('Derse Basla'),
                                    onPressed: () async {
                                      await Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              DersEkrani(konu: _konu!),
                                        ),
                                      );
                                      await _yukle();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Kalicilik dogrulamasi',
                                    style: t.textTheme.titleSmall),
                                const SizedBox(height: 6),
                                Text('Toplam kayitli gorev sonucu: '
                                    '$_toplamKayit'),
                                Text('SQLite: '
                                    '${AppDatabase.instance.sqliteSurumu}',
                                    style: t.textTheme.bodySmall),
                                Text('user.db: '
                                    '${AppDatabase.instance.userDbYolu}',
                                    style: t.textTheme.bodySmall
                                        ?.copyWith(fontSize: 11)),
                                const SizedBox(height: 6),
                                Text(
                                  'Uygulamayi kapatip yeniden acin — '
                                  'bu sayi korunmalidir.',
                                  style: t.textTheme.bodySmall
                                      ?.copyWith(color: t.hintColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
