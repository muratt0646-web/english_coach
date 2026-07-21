import 'package:flutter/material.dart';

import '../../core/engine/dusunme_motoru.dart';
import '../../core/engine/tani_motoru.dart';
import '../../core/model/dusunme.dart';
import '../../core/model/models.dart';
import '../../data/icerik_repo.dart';
import '../../data/ilerleme_repo.dart';

/// Ders akisi: sunum adimlari -> gorevler.
/// Faz 2A: Blok kutu gorseli + v2 tani geri bildirimi eklendi.
class DersEkrani extends StatefulWidget {
  final Konu konu;
  const DersEkrani({super.key, required this.konu});
  @override
  State<DersEkrani> createState() => _DersEkraniState();
}

class _DersEkraniState extends State<DersEkrani> {
  final _icerik = IcerikRepo();
  final _ilerleme = IlerlemeRepo();
  final _giris = TextEditingController();
  final _blokGiris = TextEditingController();
  DusunmeModeli? _dusunme;
  final Map<String, Map<String, String>> _blokCevaplari = {};

  List<DersAdim> _adimlar = [];
  List<Gorev> _gorevler = [];
  Map<String, String> _anlamlar = const {};
  int _indeks = 0;
  bool _yukleniyor = true;

  TaniSonucu? _sonTani;
  DateTime _gorevBaslangic = DateTime.now();

  @override
  void initState() {
    super.initState();
    _yukle();
  }

  @override
  void dispose() {
    _giris.dispose();
    _blokGiris.dispose();
    super.dispose();
  }

  Future<void> _yukle() async {
    final a = await _icerik.dersAdimlari(widget.konu.kod);
    final g = await _icerik.gorevler(widget.konu.kod);
    final m = await _icerik.kelimeAnlamHaritasi();
    final dm = await _icerik.dusunmeModeli(widget.konu.kod);
    if (!mounted) return;
    setState(() {
      _adimlar = a;
      _gorevler = g;
      _anlamlar = m;
      _dusunme = dm;
      _yukleniyor = false;
      _gorevBaslangic = DateTime.now();
    });
  }

  int get _toplamAdim =>
      _dusunmeAdimSayisi + _adimlar.length + _gorevler.length;
  bool get _dusunmedeMi => _indeks < _dusunmeAdimSayisi;
  bool get _sunumdaMi =>
      _indeks < _dusunmeAdimSayisi + _adimlar.length;
  Gorev get _aktifGorev =>
      _gorevler[_indeks - _dusunmeAdimSayisi - _adimlar.length];

  void _ileri() {
    setState(() {
      _indeks++;
      _sonTani = null;
      _giris.clear();
      _gorevBaslangic = DateTime.now();
    });
  }

  Future<void> _cevapla() async {
    final gorev = _aktifGorev;
    final cevap = _giris.text;
    if (cevap.trim().isEmpty) return;

    final tani = TaniMotoru.degerlendirTipli(
      kullaniciCevabi: cevap,
      kabuller: gorev.kabuller,
      kelimeAnlamlari: _anlamlar,
    );

    await _ilerleme.gorevSonucuKaydet(
      gorev: gorev,
      kullaniciCevabi: cevap,
      tani: tani,
      sureMs: DateTime.now().difference(_gorevBaslangic).inMilliseconds,
      toplamGorevSayisi: _gorevler.length,
    );

    if (!mounted) return;
    setState(() => _sonTani = tani);
  }

  @override
  Widget build(BuildContext context) {
    if (_yukleniyor) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (_indeks >= _toplamAdim) return _bitisEkrani();

    final t = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.konu.adTr),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(value: _indeks / _toplamAdim),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Text('Adim ${_indeks + 1} / $_toplamAdim',
                  style: t.textTheme.labelMedium),
              const SizedBox(height: 12),
              if (_dusunmedeMi)
                ..._dusunmeAdimi(_indeks)
              else if (_sunumdaMi)
                ..._sunum()
              else
                ..._gorev(),
            ],
          ),
        ),
      ),
    );
  }

  // ------------------------------------------------------ sunum
  List<Widget> _sunum() {
    final a = _adimlar[_indeks - _dusunmeAdimSayisi];
    return [
      ..._govdeParcala(a.govdeMd),
      const SizedBox(height: 20),
      FilledButton(onPressed: _ileri, child: const Text('Anladim')),
    ];
  }

  /// [BLOK] ... [/BLOK] bloklarini kutu gorseline, gerisini metne cevirir.
  List<Widget> _govdeParcala(String govde) {
    final parcalar = <Widget>[];
    final desen = RegExp(r'\[BLOK\](.*?)\[/BLOK\]', dotAll: true);
    var son = 0;
    for (final m in desen.allMatches(govde)) {
      final onceki = govde.substring(son, m.start).trim();
      if (onceki.isNotEmpty) parcalar.add(_metinKarti(onceki));
      parcalar.add(_blokKutu(m.group(1)!));
      son = m.end;
    }
    final kalan = govde.substring(son).trim();
    if (kalan.isNotEmpty) parcalar.add(_metinKarti(kalan));
    return parcalar;
  }

  Widget _metinKarti(String metin) => Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SelectableText(metin,
              style: const TextStyle(fontSize: 15, height: 1.55)),
        ),
      );

  /// Blok kutu gorseli: Turkce satir ustte, ok, Ingilizce satir altta.
  Widget _blokKutu(String govde) {
    final alan = <String, String>{};
    for (final satir in govde.trim().split('\n')) {
      final i = satir.indexOf(':');
      if (i > 0) {
        alan[satir.substring(0, i).trim()] = satir.substring(i + 1).trim();
      }
    }
    List<String> boluk(String? s) =>
        (s ?? '').split('|').map((e) => e.trim()).toList();

    final tr = boluk(alan['tr']), trRol = boluk(alan['tr_rol']);
    final en = boluk(alan['en']), enRol = boluk(alan['en_rol']);
    final t = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: t.colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if ((alan['baslik'] ?? '').isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(alan['baslik']!,
                    style: t.textTheme.titleMedium),
              ),
            _kutuSatiri(tr, trRol, t.colorScheme.tertiaryContainer,
                t.colorScheme.onTertiaryContainer),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Icon(Icons.arrow_downward, size: 22),
            ),
            _kutuSatiri(en, enRol, t.colorScheme.primaryContainer,
                t.colorScheme.onPrimaryContainer),
            if ((alan['not'] ?? '').isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(alan['not']!,
                    style: t.textTheme.bodySmall
                        ?.copyWith(fontStyle: FontStyle.italic)),
              ),
          ],
        ),
      ),
    );
  }

  Widget _kutuSatiri(
      List<String> kelimeler, List<String> roller, Color arka, Color yazi) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (var i = 0; i < kelimeler.length; i++)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: arka,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(kelimeler[i],
                    style: TextStyle(
                        color: yazi,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                if (i < roller.length)
                  Text(roller[i],
                      style: TextStyle(
                          color: yazi.withValues(alpha: 0.75), fontSize: 11)),
              ],
            ),
          ),
      ],
    );
  }

  // ------------------------------------------------------ gorev
  List<Widget> _gorev() {
    final t = Theme.of(context);
    final g = _aktifGorev;
    final tani = _sonTani;

    return [
      Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Chip(
                    label: Text(g.tip),
                    visualDensity: VisualDensity.compact),
                const SizedBox(width: 8),
                Text('zorluk ${g.zorluk}', style: t.textTheme.labelSmall),
              ]),
              const SizedBox(height: 12),
              SelectableText(g.govde,
                  style: const TextStyle(fontSize: 15, height: 1.5)),
              if (g.ipucu != null) ...[
                const SizedBox(height: 10),
                Text('Ipucu: ${g.ipucu}',
                    style:
                        t.textTheme.bodySmall?.copyWith(color: t.hintColor)),
              ],
              const SizedBox(height: 16),
              TextField(
                controller: _giris,
                enabled: tani == null,
                autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Cevabin',
                ),
                onSubmitted: (_) => tani == null ? _cevapla() : _ileri(),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 16),
      if (tani == null)
        FilledButton(onPressed: _cevapla, child: const Text('Cevapla'))
      else ...[
        _geriBildirim(tani),
        const SizedBox(height: 16),
        FilledButton(onPressed: _ileri, child: const Text('Devam')),
      ],
    ];
  }

  /// v2 geri bildirim: GRAMER / SOZCUK / YAZIM / SIRALAMA ayrimi.
  Widget _geriBildirim(TaniSonucu tani) {
    final t = Theme.of(context);

    if (tani.dogru) {
      return Card(
        color: Colors.green.withValues(alpha: 0.12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 10),
                Expanded(child: Text('Dogru.')),
              ]),
              if (tani.kategori ==
                  HataKategorisi.kabulEdilebilirAlternatif) ...[
                const SizedBox(height: 8),
                Text('Kabul edilebilir alternatif',
                    style: t.textTheme.labelMedium),
              ],
              if (tani.not != null) ...[
                const SizedBox(height: 6),
                Text(tani.not!, style: t.textTheme.bodySmall),
              ],
            ],
          ),
        ),
      );
    }

    final (renk, etiket) = switch (tani.guven) {
      TaniGuveni.kesin => (Colors.orange, 'KESIN_TANI'),
      TaniGuveni.olasi => (Colors.amber, 'OLASI_TANI'),
      TaniGuveni.yok => (Colors.blueGrey, 'TANI_KONULAMADI'),
    };

    return Card(
      color: renk.withValues(alpha: 0.12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(spacing: 8, runSpacing: 4, crossAxisAlignment:
                WrapCrossAlignment.center, children: [
              Icon(Icons.info_outline, color: renk, size: 20),
              Text(etiket,
                  style: t.textTheme.labelLarge?.copyWith(color: renk)),
              Chip(
                label: Text(tani.kategoriEtiketi),
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
              ),
              if (tani.hataKodu != null)
                Text('[${tani.hataKodu}]', style: t.textTheme.labelSmall),
            ]),
            const SizedBox(height: 12),

            // v2: gramer dogru mu?
            if (tani.gramerDogru == true)
              Row(children: [
                const Icon(Icons.check, size: 16, color: Colors.green),
                const SizedBox(width: 6),
                Expanded(
                  child: Text('Dilbilgisi dogru.',
                      style: t.textTheme.bodyMedium
                          ?.copyWith(color: Colors.green.shade800)),
                ),
              ])
            else if (tani.gramerDogru == false)
              Row(children: [
                Icon(Icons.close, size: 16, color: renk),
                const SizedBox(width: 6),
                Expanded(
                  child: Text('Dilbilgisi hatasi.',
                      style: t.textTheme.bodyMedium),
                ),
              ]),

            // v2: beklenen / yazilan kelime
            if (tani.beklenenIfade != null) ...[
              const SizedBox(height: 8),
              Text('Beklenen ifade: ${tani.beklenenIfade}',
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              if (tani.yazilanIfade != null)
                Text('Yazdigin ifade: ${tani.yazilanIfade}'),
            ] else if (tani.yazilanIfade != null) ...[
              const SizedBox(height: 8),
              Text('Fazladan yazilan: ${tani.yazilanIfade}',
                  style: const TextStyle(fontWeight: FontWeight.w600)),
            ],

            const SizedBox(height: 10),
            SelectableText('Dogru form: ${tani.dogruForm}',
                style: const TextStyle(fontWeight: FontWeight.w600)),

            if (tani.neden != null) ...[
              const SizedBox(height: 10),
              Text(tani.guven == TaniGuveni.olasi
                  ? 'Bu genellikle sundan olur: ${tani.neden}'
                  : tani.neden!),
            ],
            if (tani.karsitOrnek != null) ...[
              const SizedBox(height: 8),
              Text('Ornek: ${tani.karsitOrnek}', style: t.textTheme.bodySmall),
            ],
            if (tani.guven == TaniGuveni.yok) ...[
              const SizedBox(height: 10),
              Text('Bu farkin nedenini otomatik olarak belirleyemedim.',
                  style: t.textTheme.bodySmall?.copyWith(color: t.hintColor)),
            ],
          ],
        ),
      ),
    );
  }

  Widget _bitisEkrani() {
    return Scaffold(
      appBar: AppBar(title: Text(widget.konu.adTr)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.done_all, size: 56),
            const SizedBox(height: 16),
            const Text('Ders tamamlandi.'),
            const SizedBox(height: 8),
            const Text('Ilerlemen SQLite\'a kaydedildi.'),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Ana ekrana don'),
            ),
          ],
        ),
      ),
    );
  }

  // ================= DUSUNME KATMANI (GENEL) =================
  // Bu bolumdeki hicbir kod konu koduna veya rol adina bagli DEGILDIR.
  // Tum icerik DusunmeModeli verisinden gelir.

  /// Dusunme katmani kac adim surer? (veriden turetilir)
  int get _dusunmeAdimSayisi {
    final m = _dusunme;
    if (m == null) return 0;
    // 1 ozet + 1 soru listesi + dogru ornekler + yanlis ornekler
    // + 1 mudahale + interaktif blok alistirmalari (dogru ornek basina 1)
    return 3 +
        m.dogruOrnekler.length +
        m.yanlisOrnekler.length +
        m.dogruOrnekler.length;
  }

  List<Widget> _dusunmeAdimi(int i) {
    final m = _dusunme!;
    final motor = DusunmeMotoru(m);
    final dogrular = m.dogruOrnekler;
    final yanlislar = m.yanlisOrnekler;

    if (i == 0) return _dusunmeOzet(m);
    if (i == 1) return _zihinselSorular(m);
    var k = i - 2;
    if (k < dogrular.length) return _ornekAdimi(motor, dogrular[k], true);
    k -= dogrular.length;
    if (k < yanlislar.length) return _ornekAdimi(motor, yanlislar[k], false);
    k -= yanlislar.length;
    if (k < dogrular.length) return _blokAlistirmasi(motor, dogrular[k]);
    return _mudahaleAdimi(m);
  }

  List<Widget> _dusunmeOzet(DusunmeModeli m) {
    final t = Theme.of(context);
    return [
      Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('INGILIZCE DUSUNME MODELI',
                  style: t.textTheme.labelMedium
                      ?.copyWith(letterSpacing: 1.2, color: t.colorScheme.primary)),
              const SizedBox(height: 8),
              Text(m.ad, style: t.textTheme.headlineSmall),
              const SizedBox(height: 12),
              Text(m.ozet, style: const TextStyle(fontSize: 15, height: 1.5)),
              const SizedBox(height: 20),
              _siraSeridi('Turkce dusunme sirasi', m.trSira,
                  t.colorScheme.tertiaryContainer, t.colorScheme.onTertiaryContainer, m),
              const SizedBox(height: 10),
              const Icon(Icons.arrow_downward, size: 20),
              const SizedBox(height: 10),
              _siraSeridi('Ingilizce dusunme sirasi', m.enSira,
                  t.colorScheme.primaryContainer, t.colorScheme.onPrimaryContainer, m),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20),
      FilledButton(onPressed: _ileri, child: const Text('Anladim')),
    ];
  }

  Widget _siraSeridi(String baslik, List<String> roller, Color arka,
      Color yazi, DusunmeModeli m) {
    final motor = DusunmeMotoru(m);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(baslik, style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            for (var i = 0; i < roller.length; i++)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                    color: arka, borderRadius: BorderRadius.circular(8)),
                child: Text(
                  '${i + 1}. ${motor.soruBul(roller[i])?.soruTr ?? roller[i]}',
                  style: TextStyle(color: yazi, fontSize: 13),
                ),
              ),
          ],
        ),
      ],
    );
  }

  List<Widget> _zihinselSorular(DusunmeModeli m) {
    final t = Theme.of(context);
    return [
      Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ZIHINSEL SORU SIRASI', style: t.textTheme.labelMedium),
              const SizedBox(height: 12),
              const Text(
                'Ingilizce cumle kurarken kafanizdan su sorulari '
                'BU SIRAYLA gecirin:',
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
              const SizedBox(height: 16),
              for (final s in m.sorular)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 13,
                        child: Text('${s.sira}',
                            style: const TextStyle(fontSize: 12)),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(s.soruTr,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(width: 8),
                              if (s.zorunlu)
                                const Chip(
                                  label: Text('zorunlu'),
                                  visualDensity: VisualDensity.compact,
                                  padding: EdgeInsets.zero,
                                ),
                            ]),
                            if (s.ipucu != null)
                              Text(s.ipucu!,
                                  style: t.textTheme.bodySmall
                                      ?.copyWith(color: t.hintColor)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20),
      FilledButton(onPressed: _ileri, child: const Text('Anladim')),
    ];
  }

  List<Widget> _ornekAdimi(
      DusunmeMotoru motor, DusunmeOrnegi o, bool dogru) {
    final t = Theme.of(context);
    final renk = dogru ? Colors.green : Colors.redAccent;
    return [
      Card(
        color: renk.withValues(alpha: 0.08),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Icon(dogru ? Icons.check_circle : Icons.cancel,
                    color: renk, size: 20),
                const SizedBox(width: 8),
                Text(dogru ? 'DOGRU DUSUNME' : 'YANLIS DUSUNME',
                    style: t.textTheme.labelLarge?.copyWith(color: renk)),
              ]),
              const SizedBox(height: 14),
              Text('Turkce: ${o.trCumle}',
                  style: const TextStyle(fontSize: 15)),
              const SizedBox(height: 14),
              Text('Anlam bloklari:', style: t.textTheme.labelMedium),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final b in o.bloklar)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: t.colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            motor.soruBul(b.rolKodu)?.soruTr ?? b.rolKodu,
                            style: TextStyle(
                                fontSize: 10, color: t.hintColor),
                          ),
                          Text('${b.blokTr}  →  ${b.blokEn}',
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 14),
              Text('Ingilizce: ${o.enCumle}',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: renk)),
              if (o.aciklama != null) ...[
                const SizedBox(height: 12),
                Text(o.aciklama!, style: t.textTheme.bodyMedium),
              ],
            ],
          ),
        ),
      ),
      const SizedBox(height: 20),
      FilledButton(onPressed: _ileri, child: const Text('Devam')),
    ];
  }

  /// Interaktif blok alistirmasi: ogrenci her zihinsel soruyu sirayla cevaplar.
  List<Widget> _blokAlistirmasi(DusunmeMotoru motor, DusunmeOrnegi o) {
    final t = Theme.of(context);
    final sorular = motor.sorulacakSorular(o);
    final cevaplar = _blokCevaplari[o.kod] ??= <String, String>{};
    final aktif = sorular.firstWhere(
        (s) => !cevaplar.containsKey(s.rolKodu),
        orElse: () => sorular.last);
    final bitti = sorular.every((s) => cevaplar.containsKey(s.rolKodu));

    return [
      Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('BLOK ALISTIRMASI', style: t.textTheme.labelMedium),
              const SizedBox(height: 10),
              Text('Turkce: ${o.trCumle}',
                  style: const TextStyle(fontSize: 15)),
              const SizedBox(height: 6),
              Text(
                'Bu cumleyi kelime kelime cevirmeyin. Her soruya '
                'yalnizca ILGILI BLOGU Ingilizce yazin.',
                style: t.textTheme.bodySmall?.copyWith(color: t.hintColor),
              ),
              const Divider(height: 26),
              for (final s in sorular)
                if (cevaplar.containsKey(s.rolKodu))
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(children: [
                      Icon(
                        motor.blokCevabiDogruMu(o, s.rolKodu,
                                cevaplar[s.rolKodu]!)
                            ? Icons.check
                            : Icons.close,
                        size: 18,
                        color: motor.blokCevabiDogruMu(
                                o, s.rolKodu, cevaplar[s.rolKodu]!)
                            ? Colors.green
                            : Colors.redAccent,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${s.soruTr}  →  ${cevaplar[s.rolKodu]}'
                          '${motor.blokCevabiDogruMu(o, s.rolKodu, cevaplar[s.rolKodu]!) ? '' : '   (beklenen: ${motor.beklenenBlok(o, s.rolKodu)})'}',
                        ),
                      ),
                    ]),
                  ),
              if (!bitti) ...[
                const SizedBox(height: 8),
                Text(aktif.soruTr,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w600)),
                if (aktif.ipucu != null)
                  Text(aktif.ipucu!,
                      style: t.textTheme.bodySmall
                          ?.copyWith(color: t.hintColor)),
                const SizedBox(height: 10),
                TextField(
                  controller: _blokGiris,
                  autofocus: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Bu blogun Ingilizcesi',
                  ),
                  onSubmitted: (_) => _blokCevapla(o.kod, aktif.rolKodu),
                ),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: () => _blokCevapla(o.kod, aktif.rolKodu),
                  child: const Text('Cevapla'),
                ),
              ] else ...[
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: t.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bloklari Ingilizce siraya dizince:',
                          style: t.textTheme.labelMedium),
                      const SizedBox(height: 6),
                      Text(motor.ingilizceDiz(o),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
      const SizedBox(height: 16),
      if (bitti)
        FilledButton(onPressed: _ileri, child: const Text('Devam')),
    ];
  }

  void _blokCevapla(String ornekKod, String rolKodu) {
    final v = _blokGiris.text.trim();
    if (v.isEmpty) return;
    setState(() {
      (_blokCevaplari[ornekKod] ??= <String, String>{})[rolKodu] = v;
      _blokGiris.clear();
    });
  }

  List<Widget> _mudahaleAdimi(DusunmeModeli m) {
    final t = Theme.of(context);
    return [
      Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('TURKCE MUDAHALE HATALARI',
                  style: t.textTheme.labelMedium),
              const SizedBox(height: 6),
              Text(
                'Ana dilinizin Ingilizceye tasidigi refleksler:',
                style: t.textTheme.bodySmall?.copyWith(color: t.hintColor),
              ),
              const SizedBox(height: 16),
              for (final md in m.mudahaleler)
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(md.baslik,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Text(md.aciklama),
                      const SizedBox(height: 8),
                      Row(children: [
                        const Icon(Icons.close,
                            size: 16, color: Colors.redAccent),
                        const SizedBox(width: 6),
                        Expanded(
                            child: Text(md.yanlis,
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic))),
                      ]),
                      Row(children: [
                        const Icon(Icons.check,
                            size: 16, color: Colors.green),
                        const SizedBox(width: 6),
                        Expanded(child: Text(md.dogru)),
                      ]),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20),
      FilledButton(onPressed: _ileri, child: const Text('Derse gec')),
    ];
  }
}
