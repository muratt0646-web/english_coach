import 'package:flutter/material.dart';

import '../core/model/models.dart';
import '../data/icerik_repo.dart';
import '../data/ilerleme_repo.dart';
import '../shared_ui/bolum_basligi.dart';
import '../shared_ui/modul_izgarasi.dart';
import 'gunluk_oneri.dart';
import 'modul_kimlik.dart';
import 'modul_yonlendirme.dart';

/// Ana ekran — modul merkezi.
///
/// PRODUCT_RULES K2: sekiz modul de GORUNUR.
/// PRODUCT_RULES K3/K7: hicbiri kilitli degildir; hepsine dogrudan girilir.
/// PRODUCT_RULES K11: gunluk oneri alani bos kalmaz.
///
/// Veritabani okunamazsa ekran YINE de acilir (ilerlemeler %0 gosterilir).
class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});
  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  final IcerikRepo _icerik = IcerikRepo();
  final IlerlemeRepo _ilerleme = IlerlemeRepo();

  Map<String, double> _ilerlemeler = <String, double>{};
  Map<String, String> _sonIcerikler = <String, String>{};
  List<OneriMaddesi> _oneriler = <OneriMaddesi>[];
  int _toplamGorev = 0;
  double _gramerUstaligi = 0.0;
  bool _yukleniyor = true;

  @override
  void initState() {
    super.initState();
    _yukle();
  }

  Future<void> _yukle() async {
    setState(() => _yukleniyor = true);

    double gramer = 0.0;
    int toplam = 0;
    final Map<String, String> son = <String, String>{};

    try {
      final List<Konu> konular = await _icerik.tumKonular();
      if (konular.isNotEmpty) {
        double birikim = 0.0;
        for (final Konu k in konular) {
          final KonuIlerleme d = await _ilerleme.konuIlerlemesi(k.kod);
          birikim += d.gramerUstaligi;
          if (d.gramerUstaligi > 0) son['gramer'] = k.adTr;
        }
        gramer = birikim / konular.length;
      }
      toplam = await _ilerleme.toplamGorevSonucu();
    } catch (_) {
      // Veritabani okunamazsa ekran yine acilir; degerler 0 kalir.
    }

    if (!mounted) return;
    setState(() {
      _gramerUstaligi = gramer;
      _toplamGorev = toplam;
      _sonIcerikler = son;
      _ilerlemeler = <String, double>{'gramer': gramer};
      _oneriler = GunlukOneri.uret(
        gramerUstaligi: gramer,
        tamamlananGorev: toplam,
      );
      _yukleniyor = false;
    });
  }

  Future<void> _modulAc(String kod) async {
    await ModulYonlendirme.ac(context, kod);
    if (!mounted) return;
    await _yukle();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData t = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('English Coach'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Yenile',
            onPressed: _yukle,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: _yukleniyor
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: <Widget>[
                    _selamlama(t),
                    const SizedBox(height: 16),
                    _gunlukOneri(t),
                    const SizedBox(height: 8),
                    _bugunkuOzet(t),
                    const BolumBasligi('Moduller',
                        altBaslik: 'Istediginiz module dogrudan girebilirsiniz; '
                            'sira zorunlulugu yoktur',
                        ikon: Icons.grid_view_outlined),
                    ModulIzgarasi(
                      moduller: ModulKimlik.tumModuller,
                      ilerlemeler: _ilerlemeler,
                      sonIcerikler: _sonIcerikler,
                      onModulSecildi: (ModulKimlik m) => _modulAc(m.kod),
                    ),
                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _selamlama(ThemeData t) {
    final int saat = DateTime.now().hour;
    final String selam = saat < 12
        ? 'Gunaydin'
        : (saat < 18 ? 'Iyi gunler' : 'Iyi aksamlar');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(selam, style: t.textTheme.headlineSmall),
        Text('Bugun ne calismak istersin?',
            style: t.textTheme.bodyMedium?.copyWith(color: t.hintColor)),
      ],
    );
  }

  Widget _gunlukOneri(ThemeData t) {
    return Card(
      color: t.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.lightbulb_outline,
                    color: t.colorScheme.onPrimaryContainer),
                const SizedBox(width: 8),
                Text('Bugun onerilen',
                    style: t.textTheme.titleMedium?.copyWith(
                        color: t.colorScheme.onPrimaryContainer)),
              ],
            ),
            const SizedBox(height: 4),
            Text('Bunlar oneridir; hicbiri zorunlu degildir.',
                style: t.textTheme.bodySmall?.copyWith(
                    color: t.colorScheme.onPrimaryContainer.withValues(
                        alpha: 0.75))),
            const SizedBox(height: 12),
            ..._oneriler.map((OneriMaddesi o) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: InkWell(
                    onTap: () => _modulAc(o.modulKod),
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.check_box_outline_blank, size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(o.baslik,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600)),
                              Text(o.gerekce,
                                  style: t.textTheme.bodySmall),
                            ],
                          ),
                        ),
                        Text('${o.tahminiDk} dk',
                            style: t.textTheme.labelSmall),
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => _modulAc(
                    _oneriler.isEmpty ? 'gramer' : _oneriler.first.modulKod),
                icon: const Icon(Icons.play_arrow),
                label: const Text('Devam et'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bugunkuOzet(ThemeData t) {
    final int dk = _oneriler.fold<int>(
        0, (int a, OneriMaddesi o) => a + o.tahminiDk);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Expanded(
              child: _ozetKutu(t, 'Tamamlanan gorev', '$_toplamGorev'),
            ),
            Expanded(
              child: _ozetKutu(t, 'Gramer ustaligi',
                  '%${(_gramerUstaligi * 100).round()}'),
            ),
            Expanded(
              child: _ozetKutu(t, 'Onerilen sure', '$dk dk'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ozetKutu(ThemeData t, String baslik, String deger) {
    return Column(
      children: <Widget>[
        Text(deger, style: t.textTheme.headlineSmall),
        Text(baslik,
            style: t.textTheme.labelSmall?.copyWith(color: t.hintColor),
            textAlign: TextAlign.center),
      ],
    );
  }
}
