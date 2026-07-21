import 'package:flutter/material.dart';

import '../../core/content/sablon_ders_kayitlari.dart';
import '../../core/model/ders_sablonu.dart';
import '../../core/model/models.dart';
import '../../data/icerik_repo.dart';
import '../../core/db/app_database.dart';
import '../../data/ders_ilerleme_repo.dart';
import '../../data/ilerleme_repo.dart';
import '../../shared_ui/bolum_basligi.dart';
import 'ders_ekrani.dart';
import 'sablon_ders_ekrani.dart';

/// Gramer ve Ingilizce Dusunme modulu.
/// Mevcut EN-A1-001 dersi buradan erisilir. Ders ekrani DEGISMEDI.
class GramerEkrani extends StatefulWidget {
  const GramerEkrani({super.key});
  @override
  State<GramerEkrani> createState() => _GramerEkraniState();
}

class _GramerEkraniState extends State<GramerEkrani> {
  final IcerikRepo _icerik = IcerikRepo();
  final IlerlemeRepo _ilerleme = IlerlemeRepo();

  List<Konu> _konular = <Konu>[];
  Map<String, double> _ustalik = <String, double>{};
  Map<String, DersIlerlemeKaydi> _sablonIlerleme =
      <String, DersIlerlemeKaydi>{};
  bool _yukleniyor = true;
  String? _hata;

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
      final List<Konu> k = await _icerik.tumKonular();
      final Map<String, double> u = <String, double>{};
      for (final Konu konu in k) {
        final KonuIlerleme d = await _ilerleme.konuIlerlemesi(konu.kod);
        u[konu.kod] = d.gramerUstaligi;
      }
      // Sablon derslerin tamamlanma durumu
      Map<String, DersIlerlemeKaydi> sablon =
          <String, DersIlerlemeKaydi>{};
      try {
        sablon = await DersIlerlemeRepo(AppDatabase.instance.db).tumu();
      } catch (_) {
        // veritabani yoksa ekran yine acilir
      }

      if (!mounted) return;
      setState(() {
        _konular = k;
        _ustalik = u;
        _sablonIlerleme = sablon;
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

  @override
  Widget build(BuildContext context) {
    final ThemeData t = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Gramer ve Ingilizce Dusunme')),
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
                          child: Text('Icerik yuklenemedi: $_hata'),
                        ),
                      ),
                    const BolumBasligi('Dersler',
                        altBaslik:
                            'Istediginiz derse dogrudan girebilirsiniz; '
                            'onceki dersi bitirme zorunlulugu yoktur',
                        ikon: Icons.account_tree_outlined),
                    if (_konular.isEmpty &&
                        SablonDersKayitlari.dersler.isEmpty &&
                        _hata == null)
                      const Text('Henuz ders bulunamadi.'),
                    ..._konular.map(_dersKarti),
                    ...SablonDersKayitlari.dersler.map(_sablonKarti),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _dersKarti(Konu k) {
    final ThemeData t = Theme.of(context);
    final double u = _ustalik[k.kod] ?? 0.0;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(k.kod, style: t.textTheme.labelSmall),
            Text(k.adTr, style: t.textTheme.titleMedium),
            const SizedBox(height: 6),
            Text(k.ogretimAmaci, style: t.textTheme.bodySmall),
            const SizedBox(height: 12),
            LinearProgressIndicator(value: u.clamp(0.0, 1.0), minHeight: 6),
            const SizedBox(height: 6),
            Text('Ustalik: %${(u * 100).round()}  ·  '
                '${k.tahminiSureDk} dk',
                style: t.textTheme.labelSmall),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext _) => DersEkrani(konu: k),
                    ),
                  );
                  await _yukle();
                },
                child: Text(u > 0 ? 'Devam et' : 'Derse basla'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Sablon dersler (12 asamali ortak yapi). Kart icerigi VERIDEN gelir.
  Widget _sablonKarti(DersSablonu d) {
    final ThemeData t = Theme.of(context);
    final DersIlerlemeKaydi? kayit = _sablonIlerleme[d.kod];
    final bool bitti = kayit?.tamamlanmis ?? false;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: bitti ? Colors.green.withValues(alpha: 0.06) : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: <Widget>[
              Text(d.kod, style: t.textTheme.labelSmall),
              const SizedBox(width: 8),
              const Chip(
                label: Text('12 asamali'),
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
              ),
              const Spacer(),
              if (kayit != null && kayit.tamamlanmis)
                Chip(
                  avatar: const Icon(Icons.check_circle,
                      size: 16, color: Colors.green),
                  label: Text('Tamamlandi'
                      '${kayit.sinavPuani != null ? " · %${kayit.sinavPuani}" : ""}'),
                  visualDensity: VisualDensity.compact,
                  backgroundColor: Colors.green.withValues(alpha: 0.12),
                )
              else if (kayit != null && kayit.baslanmis)
                Chip(
                  avatar: const Icon(Icons.pending_outlined, size: 16),
                  label: const Text('Devam ediyor'),
                  visualDensity: VisualDensity.compact,
                ),
            ]),
            Text(d.baslik, style: t.textTheme.titleMedium),
            const SizedBox(height: 6),
            Text('${d.seviye} · ${d.tahminiDk} dk · '
                '${d.dogruOrnekler.length} dogru / '
                '${d.yanlisOrnekler.length} yanlis ornek',
                style: t.textTheme.bodySmall),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext _) => SablonDersEkrani(ders: d),
                  ),
                ),
                child: Text(bitti
                    ? 'Tekrar et'
                    : (kayit?.baslanmis ?? false
                        ? 'Devam et'
                        : 'Derse basla')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
