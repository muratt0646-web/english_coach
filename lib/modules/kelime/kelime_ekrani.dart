import 'package:flutter/material.dart';

import '../../core/db/app_database.dart';
import '../../core/model/paket_kelime.dart';
import '../../data/kelime_repo.dart';
import '../../shared_ui/bolum_basligi.dart';
import 'kelime_ornek_veri.dart';
import 'ogrenilen_kelimeler_ekrani.dart';
import 'pekistirme_ekrani.dart';

/// Kelime Akademisi — 20 kelimelik ogrenme paketi.
///
/// KURAL (Faz 2E): 20 kelimenin TAMAMINA "Ogrendim" denmeden
/// pekistirme etkinlikleri ACILMAZ.
class KelimeEkrani extends StatefulWidget {
  final int paketId;

  /// 'A1' veya 'A2'. Kelime havuzu buna gore filtrelenir.
  final String seviye;

  const KelimeEkrani({super.key, this.paketId = 1, this.seviye = 'A1'});
  @override
  State<KelimeEkrani> createState() => _KelimeEkraniState();
}

class _KelimeEkraniState extends State<KelimeEkrani> {
  KelimeRepo? _repo;
  final Set<String> _ogrenilenler = <String>{};
  final Set<String> _tekrarlar = <String>{};
  bool _yukleniyor = true;
  String? _hata;

  List<PaketKelime> get _paket =>
      KelimeOrnekVeri.paket(widget.paketId, seviye: widget.seviye);

  /// Ilerleme kaydinda KURESEL numara kullanilir.
  /// A1 paketleri 1..N, A2 paketleri 101..10N olarak saklanir; boylece
  /// iki seviyenin sayimlari birbirine karismaz.
  int get _kayitPaketId =>
      (widget.seviye == 'A2' ? 100 : 0) + widget.paketId;

  int get _seviyePaketSayisi =>
      KelimeOrnekVeri.seviyePaketSayisi(widget.seviye);

  /// Bu paketten sonra ogrenilecek kelime kalan ILK paket.
  /// Yoksa null (tum paketler tamamlanmis).
  int? _sonrakiEksikPaket = null;

  bool get _sonPaket => widget.paketId >= _seviyePaketSayisi;

  @override
  void initState() {
    super.initState();
    _yukle();
  }

  Future<void> _yukle() async {
    setState(() {
      _yukleniyor = true;
      _hata = null;
    });
    try {
      final KelimeRepo r = KelimeRepo(AppDatabase.instance.db);
      // KOD bazli: paket numarasi degisse bile dogru calisir.
      final Set<String> ogrenilenKodlar = await r.tumOgrenilenKodlar();

      // Sonraki EKSIK paketi bul: kullanici ayni 20 kelimeye geri donmesin.
      int? sonraki;
      for (int p = 1; p <= _seviyePaketSayisi; p++) {
        if (p == widget.paketId) continue;
        final List<PaketKelime> pk =
            KelimeOrnekVeri.paket(p, seviye: widget.seviye);
        final int n = pk
            .where((PaketKelime k) => ogrenilenKodlar.contains(k.kod))
            .length;
        if (n < pk.length) {
          sonraki = p;
          break;
        }
      }

      if (!mounted) return;
      setState(() {
        _repo = r;
        _sonrakiEksikPaket = sonraki;
        _ogrenilenler
          ..clear()
          ..addAll(_paket
              .map((PaketKelime k) => k.kod)
              .where(ogrenilenKodlar.contains));
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

  Future<void> _ogrendim(PaketKelime k) async {
    final KelimeRepo? r = _repo;
    if (r == null) return;
    await r.ogrendimIsaretle(k, paketId: _kayitPaketId);
    if (!mounted) return;
    setState(() {
      _ogrenilenler.add(k.kod);
      _tekrarlar.remove(k.kod);
    });
  }

  void _tekrarEt(PaketKelime k) {
    setState(() {
      _tekrarlar.add(k.kod);
    });
  }

  void _sesUyarisi() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Ses altyapisi henuz baglanmadi. Cihaz TTS '
            'dogrulamasi (TB-03) tamamlaninca calisacak.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData t = Theme.of(context);
    final List<PaketKelime> paket = _paket;
    final int ogrenilen = _ogrenilenler.length;
    final bool tamam = ogrenilen >= KelimeOrnekVeri.paketBoyu;

    return Scaffold(
      appBar: AppBar(
        title: Text('Kelime · ${widget.seviye} · Paket ${widget.paketId}'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Ogrendigim kelimeler',
            icon: const Icon(Icons.list_alt_outlined),
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext _) => const OgrenilenKelimelerEkrani(),
                ),
              );
              await _yukle();
            },
          ),
        ],
      ),
      body: _yukleniyor
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: <Widget>[
                    if (_hata != null)
                      Card(
                        color: t.colorScheme.errorContainer,
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Text('Kayit acilamadi: $_hata'),
                        ),
                      ),
                    _ilerlemeKarti(t, ogrenilen, tamam),
                    const BolumBasligi('Paketteki kelimeler',
                        ikon: Icons.style_outlined),
                    ...paket.map(_kart),
                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _ilerlemeKarti(ThemeData t, int ogrenilen, bool tamam) {
    const int hedef = KelimeOrnekVeri.paketBoyu;
    return Card(
      color: tamam ? t.colorScheme.primaryContainer : null,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              tamam ? '$hedef / $hedef tamamlandi' : '$ogrenilen / $hedef ogrenildi',
              style: t.textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: hedef == 0 ? 0 : ogrenilen / hedef,
              minHeight: 8,
            ),
            const SizedBox(height: 12),
            Text(
              tamam
                  ? 'Paket tamamlandi. Pekistirme etkinlikleri acildi.'
                  : 'Pekistirme etkinlikleri, 20 kelimenin tamamina '
                      '"Ogrendim" dedikten sonra acilir.',
              style: t.textTheme.bodySmall,
            ),
            const SizedBox(height: 14),
            if (tamam && _sonrakiEksikPaket != null) ...<Widget>[
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                      builder: (BuildContext _) =>
                          KelimeEkrani(paketId: _sonrakiEksikPaket!,
                              seviye: widget.seviye),
                    ),
                  ),
                  icon: const Icon(Icons.skip_next),
                  label: Text('Paket $_sonrakiEksikPaket\'e gec '
                      '(yeni 20 kelime)'),
                ),
              ),
              const SizedBox(height: 8),
            ],
            if (tamam && _sonrakiEksikPaket == null && _sonPaket &&
                widget.seviye == 'A1') ...<Widget>[
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                      builder: (BuildContext _) =>
                          const KelimeEkrani(paketId: 1, seviye: 'A2'),
                    ),
                  ),
                  icon: const Icon(Icons.trending_up),
                  label: const Text('A1 bitti — A2 kelimelerine gec'),
                ),
              ),
              const SizedBox(height: 8),
            ],
            if (tamam && _sonrakiEksikPaket == null && _sonPaket &&
                widget.seviye == 'A2') ...<Widget>[
              Card(
                color: t.colorScheme.secondaryContainer,
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('Butun paketler tamamlandi. Yeni kelime '
                      'paketleri ilerideki fazlarda eklenecek.'),
                ),
              ),
              const SizedBox(height: 8),
            ],
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: tamam
                    ? () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext _) =>
                                PekistirmeEkrani(paketId: widget.paketId,
                                    seviye: widget.seviye),
                          ),
                        );
                        if (mounted) await _yukle();
                      }
                    : null,
                icon: const Icon(Icons.fitness_center_outlined),
                label: const Text('Pekistirmeye Basla'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _kart(PaketKelime k) {
    final ThemeData t = Theme.of(context);
    final bool ogrenildi = _ogrenilenler.contains(k.kod);
    final bool tekrar = _tekrarlar.contains(k.kod);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Text(k.yazilis, style: t.textTheme.headlineSmall),
                        if (ogrenildi) ...<Widget>[
                          const SizedBox(width: 8),
                          const Icon(Icons.check_circle,
                              size: 20, color: Colors.green),
                        ],
                      ]),
                      Text('${k.ipa}   ·   ${k.okunus}',
                          style: t.textTheme.bodySmall),
                    ],
                  ),
                ),
                Chip(
                    label: Text(k.tur),
                    visualDensity: VisualDensity.compact),
                IconButton(
                  tooltip: 'Dinle',
                  onPressed: _sesUyarisi,
                  icon: const Icon(Icons.volume_up_outlined),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(k.trAnlam,
                style: t.textTheme.titleMedium
                    ?.copyWith(color: t.colorScheme.primary)),
            const SizedBox(height: 10),
            Text(k.ornekCumle,
                style: const TextStyle(fontStyle: FontStyle.italic)),
            Text(k.ornekCumleTr, style: t.textTheme.bodySmall),
            if (k.esAnlam.isNotEmpty || k.zitAnlam.isNotEmpty) ...<Widget>[
              const SizedBox(height: 10),
              Wrap(spacing: 6, runSpacing: 6, children: <Widget>[
                if (k.esAnlam.isNotEmpty)
                  Text('Es anlam:', style: t.textTheme.labelMedium),
                ...k.esAnlam.map((String e) => Chip(
                    label: Text(e), visualDensity: VisualDensity.compact)),
                if (k.zitAnlam.isNotEmpty)
                  Text('Zit anlam:', style: t.textTheme.labelMedium),
                ...k.zitAnlam.map((String e) => Chip(
                    label: Text(e), visualDensity: VisualDensity.compact)),
              ]),
            ],
            const SizedBox(height: 12),
            Row(
              children: <Widget>[
                Expanded(
                  child: FilledButton.tonalIcon(
                    onPressed: ogrenildi ? null : () => _ogrendim(k),
                    icon: Icon(ogrenildi
                        ? Icons.check_circle
                        : Icons.check_circle_outline),
                    label: Text(ogrenildi ? 'Ogrenildi' : 'Ogrendim'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _tekrarEt(k),
                    icon: Icon(tekrar ? Icons.repeat_on : Icons.repeat),
                    label: const Text('Tekrar et'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
