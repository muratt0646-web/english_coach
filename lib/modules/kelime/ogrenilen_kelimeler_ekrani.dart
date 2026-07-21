import 'package:flutter/material.dart';

import '../../core/db/app_database.dart';
import '../../data/kelime_repo.dart';
import 'kelime_pdf.dart';

/// "Ogrendigim Kelimeler" — arama, siralama, filtreleme ve PDF disa aktarma.
class OgrenilenKelimelerEkrani extends StatefulWidget {
  const OgrenilenKelimelerEkrani({super.key});
  @override
  State<OgrenilenKelimelerEkrani> createState() =>
      _OgrenilenKelimelerEkraniState();
}

class _OgrenilenKelimelerEkraniState extends State<OgrenilenKelimelerEkrani> {
  final TextEditingController _arama = TextEditingController();
  KelimeSiralama _siralama = KelimeSiralama.alfabetik;
  bool _sadeceTekrar = false;
  int? _paketFiltresi;

  List<OgrenilenKelime> _liste = <OgrenilenKelime>[];
  bool _yukleniyor = true;
  String? _hata;
  String? _pdfYolu;

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
      final KelimeRepo r = KelimeRepo(AppDatabase.instance.db);
      final List<OgrenilenKelime> l = await r.ogrenilenler(
        arama: _arama.text,
        siralama: _siralama,
        sadeceTekrarGerekenler: _sadeceTekrar,
        paketId: _paketFiltresi,
      );
      if (!mounted) return;
      setState(() {
        _liste = l;
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

  Future<void> _pdfKaydet() async {
    try {
      final String altBaslik = <String>[
        if (_paketFiltresi != null) 'Paket $_paketFiltresi',
        if (_sadeceTekrar) 'Yalnizca tekrar gerekenler',
        if (_arama.text.trim().isNotEmpty) 'Arama: ${_arama.text.trim()}',
      ].join(' · ');

      final String yol = await KelimePdf.kaydet(
        KelimePdf.satirlariHazirla(_liste),
        altBaslik: altBaslik.isEmpty ? 'Tum kelimeler' : altBaslik,
      );
      if (!mounted) return;
      setState(() => _pdfYolu = yol);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF kaydedildi: $yol')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF olusturulamadi: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData t = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ogrendigim Kelimeler'),
        actions: <Widget>[
          IconButton(
            tooltip: 'PDF olarak kaydet',
            onPressed: _liste.isEmpty ? null : _pdfKaydet,
            icon: const Icon(Icons.picture_as_pdf_outlined),
          ),
        ],
      ),
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
                        labelText: 'Kelime veya anlam ara',
                      ),
                      onChanged: (_) => _yukle(),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: <Widget>[
                        for (final KelimeSiralama s in KelimeSiralama.values)
                          ChoiceChip(
                            label: Text(switch (s) {
                              KelimeSiralama.alfabetik => 'Alfabetik',
                              KelimeSiralama.tariheGore => 'Tarihe gore',
                              KelimeSiralama.pakete => 'Pakete gore',
                            }),
                            selected: _siralama == s,
                            onSelected: (bool v) {
                              if (!v) return;
                              setState(() => _siralama = s);
                              _yukle();
                            },
                          ),
                        FilterChip(
                          label: const Text('Tekrar gerekenler'),
                          selected: _sadeceTekrar,
                          onSelected: (bool v) {
                            setState(() => _sadeceTekrar = v);
                            _yukle();
                          },
                        ),
                        for (final int p in <int>[1, 2])
                          FilterChip(
                            label: Text('Paket $p'),
                            selected: _paketFiltresi == p,
                            onSelected: (bool v) {
                              setState(() => _paketFiltresi = v ? p : null);
                              _yukle();
                            },
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text('${_liste.length} kelime',
                        style: t.textTheme.labelMedium),
                    if (_pdfYolu != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text('Son PDF: $_pdfYolu',
                            style: t.textTheme.labelSmall
                                ?.copyWith(color: t.hintColor)),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: _yukleniyor
                    ? const Center(child: CircularProgressIndicator())
                    : _hata != null
                        ? Center(child: Text('Kayit acilamadi: $_hata'))
                        : _liste.isEmpty
                            ? const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(30),
                                  child: Text(
                                    'Henuz kelime ogrenilmedi.\n'
                                    'Kelime Akademisi\'nde bir kelimeye '
                                    '"Ogrendim" deyin.',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                padding: const EdgeInsets.all(20),
                                itemCount: _liste.length,
                                itemBuilder:
                                    (BuildContext context, int i) =>
                                        _satir(t, _liste[i]),
                              ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _satir(ThemeData t, OgrenilenKelime k) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text('${k.ingilizce}  ·  ${k.okunus}'),
        subtitle: Text('${k.turkceAnlam}\n'
            'Paket ${k.paketId} · dogru ${k.dogruSayisi} · '
            'yanlis ${k.yanlisSayisi} · sonraki tekrar '
            '${k.sonrakiTekrarTarihi}'),
        isThreeLine: true,
        trailing: Chip(
          label: Text(k.durum),
          visualDensity: VisualDensity.compact,
        ),
      ),
    );
  }
}
