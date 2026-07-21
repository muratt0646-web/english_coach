import 'package:flutter/material.dart';

import '../../core/db/app_database.dart';
import '../../core/engine/pekistirme_motoru.dart';
import '../../core/engine/yapi_denetcisi.dart';
import '../../core/model/paket_kelime.dart';
import '../../data/kelime_repo.dart';
import '../../shared_ui/bolum_basligi.dart';
import '../../shared_ui/akis_kontrolcusu.dart';
import '../../shared_ui/secenek_satiri.dart';
import 'kelime_ornek_veri.dart';

/// Pekistirme etkinlikleri. Yalnizca 20/20 tamamlandiginda acilir.
/// Sorular YALNIZCA o paketin kelimelerinden uretilir.
class PekistirmeEkrani extends StatefulWidget {
  final int paketId;

  /// 'A1' veya 'A2'. Kelime ekraniyla AYNI havuzu kullanmasi icin gerekli.
  final String seviye;

  const PekistirmeEkrani(
      {super.key, required this.paketId, this.seviye = 'A1'});
  @override
  State<PekistirmeEkrani> createState() => _PekistirmeEkraniState();
}

class _PekistirmeEkraniState extends State<PekistirmeEkrani> {
  static const List<EtkinlikTipi> _sira = EtkinlikTipi.values;

  KelimeRepo? _repo;
  int _etkinlikIndeks = 0;
  int _soruIndeks = 0;
  List<PekistirmeSorusu> _sorular = <PekistirmeSorusu>[];
  final AkisKontrolcusu _akis = AkisKontrolcusu();
  String? _secilen;
  bool? _sonDogruMu;

  /// Dogru cevaptan sonraki otomatik gecis suresi (Faz 2F: 300-500 ms).
  static const Duration gecisSuresi = Duration(milliseconds: 400);

  int _dogru = 0;
  int _yanlis = 0;
  final Set<String> _zorlanilan = <String>{};
  bool _etkinlikBitti = false;

  @override
  void initState() {
    super.initState();
    _repo = _repoAc();
    _etkinligiYukle();
  }

  KelimeRepo? _repoAc() {
    try {
      return KelimeRepo(AppDatabase.instance.db);
    } catch (_) {
      return null;
    }
  }

  @override
  void dispose() {
    _akis.dispose();
    super.dispose();
  }

  void _etkinligiYukle() {
    final List<PaketKelime> paket = KelimeOrnekVeri.paket(widget.paketId, seviye: widget.seviye);
    final PekistirmeMotoru motor =
        PekistirmeMotoru(paket, tohum: 1000 + _etkinlikIndeks);
    setState(() {
      _sorular = motor.etkinlikUret(_sira[_etkinlikIndeks]);
      _soruIndeks = 0;
      _dogru = 0;
      _yanlis = 0;
      _zorlanilan.clear();
      _etkinlikBitti = false;
      _sonDogruMu = null;
      _secilen = null;
    });
    _akis.yeniSoru();
  }

  PekistirmeSorusu get _soru => _sorular[_soruIndeks];

  /// TEK MERKEZI kontrol fonksiyonu.
  /// Hem Enter hem "Kontrol Et" dugmesi BUNU cagirir.
  Future<void> cevabiKontrolEt([String? gelenCevap]) async {
    if (_sorular.isEmpty || _etkinlikBitti) return;
    final PekistirmeSorusu s = _soru;
    final String cevap = s.secmeli
        ? (_secilen ?? '')
        : (gelenCevap ?? _akis.giris.text);

    // Bos cevap, kilit acikken gonderim, ayni cevabin tekrari ve
    // zaten dogru verilmis soru burada elenir.
    if (s.secmeli) {
      if (cevap.trim().isEmpty || _akis.kilitli || _akis.dogruVerildi) return;
    } else if (!_akis.islenmeliMi(cevap)) {
      return;
    }
    _akis.gonderildi(cevap);

    final bool dogru = s.dogruMu(cevap);

    // Istatistik YALNIZCA burada, gonderim basina BIR kez yazilir.
    await _repo?.cevapKaydet(
      kelimeId: s.kelimeKod,
      dogruMu: dogru,
      paketId: widget.paketId,
      etkinlikKodu: s.tip.kod,
    );

    if (!mounted) return;
    setState(() {
      _sonDogruMu = dogru;
      if (dogru) {
        _dogru++;
      } else {
        _yanlis++;
        _zorlanilan.add(s.kelimeKod);
      }
    });

    if (dogru) {
      // Kisa yesil geri bildirim, sonra OTOMATIK gecis.
      // Gecis suresince kilit acik: Enter ikinci soruyu ATLATMAZ.
      _akis.gecikmeliGec(gecisSuresi, _ileri, hala: () => mounted);
    } else {
      // Yanlista otomatik gecis YOK. Metin secili kalir, odak alanda kalir.
      if (!s.secmeli) _akis.hepsiniSec();
    }
  }

  void _ileri() {
    if (!mounted) return;
    setState(() {
      _sonDogruMu = null;
      _secilen = null;
      if (_soruIndeks < _sorular.length - 1) {
        _soruIndeks++;
      } else {
        _etkinlikBitti = true;
      }
    });
    _akis.yeniSoru();
  }

  void _sonrakiEtkinlik() {
    _akis.gecisiIptalEt();
    if (_etkinlikIndeks < _sira.length - 1) {
      setState(() => _etkinlikIndeks++);
      _etkinligiYukle();
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData t = Theme.of(context);
    final EtkinlikTipi tip = _sira[_etkinlikIndeks];

    return Scaffold(
      appBar: AppBar(
        title: Text('Pekistirme ${_etkinlikIndeks + 1}/${_sira.length}'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: _sorular.isEmpty
                ? 0
                : (_soruIndeks + (_etkinlikBitti ? 1 : 0)) / _sorular.length,
          ),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              BolumBasligi(tip.ad, ikon: Icons.fitness_center_outlined),
              if (_sorular.isEmpty)
                const Text('Bu etkinlik icin soru uretilemedi.')
              else if (_etkinlikBitti)
                ..._sonucKarti(t)
              else
                ..._soruKarti(t),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _soruKarti(ThemeData t) {
    final PekistirmeSorusu s = _soru;
    final bool cevaplandi = _sonDogruMu != null;
    return <Widget>[
      Text('Soru ${_soruIndeks + 1} / ${_sorular.length}',
          style: t.textTheme.labelMedium),
      const SizedBox(height: 10),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SelectableText(s.soru,
                  style: const TextStyle(fontSize: 16, height: 1.5)),
              if (s.ipucu != null) ...<Widget>[
                const SizedBox(height: 8),
                Text('Ipucu: ${s.ipucu}',
                    style:
                        t.textTheme.bodySmall?.copyWith(color: t.hintColor)),
              ],
              const SizedBox(height: 16),
              if (s.secmeli)
                ...s.secenekler.map((String o) => SecenekSatiri(
                      metin: o,
                      secili: _secilen == o,
                      onSecildi: _akis.dogruVerildi
                          ? () {}
                          : () => setState(() => _secilen = o),
                    ))
              else
                CevapAlani(
                  akis: _akis,
                  etkin: !_akis.dogruVerildi,
                  sonucDogruMu: _sonDogruMu,
                  onGonder: cevabiKontrolEt,
                ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 14),
      if (cevaplandi)
        _cevapGeriBildirimi(t, s),
      if (!_akis.dogruVerildi) ...<Widget>[
        const SizedBox(height: 12),
        // Erisilebilirlik icin dugme kalir; Enter ile AYNI fonksiyonu cagirir.
        FilledButton(
          onPressed: cevabiKontrolEt,
          child: const Text('Kontrol Et'),
        ),
        const SizedBox(height: 6),
        Text('Ipucu: Enter tusu ile de cevaplayabilirsiniz.',
            style: t.textTheme.labelSmall?.copyWith(color: t.hintColor)),
      ],
    ];
  }

  List<Widget> _sonucKarti(ThemeData t) {
    final List<PaketKelime> paket = KelimeOrnekVeri.paket(widget.paketId, seviye: widget.seviye);
    final List<PaketKelime> zor = paket
        .where((PaketKelime k) => _zorlanilan.contains(k.kod))
        .toList();
    return <Widget>[
      Card(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Etkinlik sonucu', style: t.textTheme.titleMedium),
              const SizedBox(height: 12),
              Row(children: <Widget>[
                Expanded(child: _kutu(t, 'Dogru', '$_dogru')),
                Expanded(child: _kutu(t, 'Yanlis', '$_yanlis')),
                Expanded(
                    child: _kutu(t, 'Zorlanilan', '${_zorlanilan.length}')),
              ]),
              if (zor.isNotEmpty) ...<Widget>[
                const Divider(height: 26),
                Text('Zorlanilan kelimeler', style: t.textTheme.labelLarge),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: zor
                      .map((PaketKelime k) =>
                          Chip(label: Text('${k.yazilis} — ${k.trAnlam}')))
                      .toList(),
                ),
                const SizedBox(height: 12),
                Text(
                  'Bu kelimeler tekrar planinda one alindi; '
                  'daha erken karsiniza cikacaklar.',
                  style: t.textTheme.bodySmall?.copyWith(color: t.hintColor),
                ),
              ],
            ],
          ),
        ),
      ),
      const SizedBox(height: 16),
      FilledButton.icon(
        onPressed: _sonrakiEtkinlik,
        icon: const Icon(Icons.arrow_forward),
        label: Text(_etkinlikIndeks < _sira.length - 1
            ? 'Sonraki etkinlik'
            : 'Pekistirmeyi bitir'),
      ),
    ];
  }

  Widget _kutu(ThemeData t, String baslik, String deger) => Column(
        children: <Widget>[
          Text(deger, style: t.textTheme.headlineSmall),
          Text(baslik, style: t.textTheme.labelSmall),
        ],
      );

  /// Cevap geri bildirimi. Serbest cumlede YAPISAL bulgular da gosterilir.
  Widget _cevapGeriBildirimi(ThemeData t, PekistirmeSorusu s) {
    final bool dogru = _sonDogruMu ?? false;
    final bool serbest = s.dogrulama == DogrulamaTuru.hedefKelimeIceren;

    final ({
      bool gecerli,
      bool kelimeVar,
      int kelimeSayisi,
      String not,
      List<YapiBulgusu> bulgular,
    })? inceleme = serbest
        ? s.kendiCumlesiIncele(_akis.giris.text,
            sozluk: KelimeOrnekVeri.tumKelimeler)
        : null;

    return Card(
      color: (dogru ? Colors.green : Colors.orange).withValues(alpha: 0.12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(dogru ? 'Dogru.' : 'Yanlis.',
                style: t.textTheme.titleSmall),

            // --- serbest cumle: yapisal bulgular ---
            if (inceleme != null) ...<Widget>[
              const SizedBox(height: 6),
              Text(inceleme.not, style: t.textTheme.bodySmall),
              ...inceleme.bulgular.map((YapiBulgusu b) => Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          b.ciddi
                              ? Icons.error_outline
                              : Icons.info_outline,
                          size: 17,
                          color: b.ciddi
                              ? Colors.redAccent
                              : t.hintColor,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('[${b.kod}] ${b.mesaj}',
                                  style: t.textTheme.bodySmall),
                              if (b.oneri != null)
                                Text(b.oneri!,
                                    style: t.textTheme.bodySmall?.copyWith(
                                        fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 8),
              Text('Ornek: ${s.kanonikCevap}',
                  style: t.textTheme.bodySmall
                      ?.copyWith(fontStyle: FontStyle.italic)),
            ]
            // --- normal soru ---
            else if (!dogru) ...<Widget>[
              const SizedBox(height: 6),
              Text('Dogru cevap: ${s.kanonikCevap}'),
              const SizedBox(height: 4),
              Text('Cevabinizi duzeltip Enter\'a basin.',
                  style: t.textTheme.bodySmall),
            ],
          ],
        ),
      ),
    );
  }
}
