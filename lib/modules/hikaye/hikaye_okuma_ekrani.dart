import 'package:flutter/material.dart';

import '../../core/db/app_database.dart';
import '../../core/engine/hikaye_motoru.dart';
import '../../core/model/hikaye.dart';
import '../../data/hikaye_repo.dart';
import '../../shared_ui/akis_kontrolcusu.dart';
import '../../shared_ui/bolum_basligi.dart';
import '../../shared_ui/secenek_satiri.dart';

enum OkumaAsamasi { okuma, test, ozet, sonuc }

/// Hikaye okuma akisi: paragraf -> test -> ozet -> sonuc.
///
/// Bu bir "hikaye okuyucu" degildir: kelime tanima, dinleme, okudugunu
/// anlama ve yazili uretim ayni akista birlesir.
class HikayeOkumaEkrani extends StatefulWidget {
  final String hikayeKod;
  const HikayeOkumaEkrani({super.key, required this.hikayeKod});
  @override
  State<HikayeOkumaEkrani> createState() => _HikayeOkumaEkraniState();
}

class _HikayeOkumaEkraniState extends State<HikayeOkumaEkrani> {
  HikayeRepo? _repo;
  Hikaye? _hikaye;
  Map<String, SozlukGirdisi> _sozluk = <String, SozlukGirdisi>{};
  Set<String> _bilinenler = <String>{};
  Set<String> _sozlukKelimeleri = <String>{};

  OkumaAsamasi _asama = OkumaAsamasi.okuma;
  int _paragrafIndeks = 0;
  bool _ceviriAcik = false;
  bool _yukleniyor = true;
  String? _hata;

  // test
  int _soruIndeks = 0;
  final Map<int, String> _cevaplar = <int, String>{};
  String? _secilen;
  bool? _sonDogruMu;
  final AkisKontrolcusu _akis = AkisKontrolcusu();
  final List<String> _siralamaSecimi = <String>[];

  // ozet
  final AkisKontrolcusu _ozetAkis = AkisKontrolcusu();
  OzetSonucu? _ozetSonucu;

  // istatistik
  DateTime _baslangic = DateTime.now();
  int _dogru = 0;
  int _yanlis = 0;
  final Set<String> _eklenenKelimeler = <String>{};

  static const Duration gecisSuresi = Duration(milliseconds: 400);

  @override
  void initState() {
    super.initState();
    _yukle();
  }

  @override
  void dispose() {
    _akis.dispose();
    _ozetAkis.dispose();
    super.dispose();
  }

  Future<void> _yukle() async {
    try {
      final HikayeRepo r = HikayeRepo(AppDatabase.instance.db);
      final Hikaye? h = await r.hikayeGetir(widget.hikayeKod);
      final Map<String, SozlukGirdisi> sz = await r.sozluk();
      final Set<String> bl = await r.bilinenKelimeler();
      final HikayeIlerleme il = await r.ilerlemeGetir(widget.hikayeKod);
      if (!mounted) return;
      setState(() {
        _repo = r;
        _hikaye = h;
        _sozluk = sz;
        _sozlukKelimeleri = sz.keys.toSet();
        _bilinenler = bl;
        // Kaldigi yerden devam: tamamlanmissa bastan basla.
        _paragrafIndeks =
            il.durum == 'tamamlandi' ? 0 : il.sonParagraf.clamp(0, 1000);
        if (h != null && _paragrafIndeks >= h.paragraflar.length) {
          _paragrafIndeks = 0;
        }
        _baslangic = DateTime.now();
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

  void _sesUyarisi() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Ses altyapisi henuz baglanmadi. Cihaz TTS '
            'dogrulamasi (TB-03) tamamlaninca bu dugme calisacak.'),
      ),
    );
  }

  // ------------------------------------------------------------- okuma
  Future<void> _paragrafIleri() async {
    final Hikaye h = _hikaye!;
    final int okunan = _paragrafIndeks + 1;
    await _repo?.ilerlemeKaydet(
      kod: h.kod,
      okunanParagraf: okunan,
      toplamParagraf: h.paragraflar.length,
      ekSureMs: 0,
    );
    if (!mounted) return;
    if (okunan >= h.paragraflar.length) {
      setState(() {
        _asama = OkumaAsamasi.test;
        _soruIndeks = 0;
      });
      _akis.yeniSoru();
    } else {
      setState(() => _paragrafIndeks = okunan);
    }
  }

  Future<void> _kelimeyeTikla(String sade) async {
    final SozlukGirdisi? g = _sozluk[sade];
    if (g == null) return;
    final bool bilinen = _bilinenler.contains(sade);

    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (BuildContext ctx) {
        final ThemeData t = Theme.of(ctx);
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(g.kelime, style: t.textTheme.headlineSmall),
                  ),
                  IconButton(
                    tooltip: 'Dinle',
                    onPressed: _sesUyarisi,
                    icon: const Icon(Icons.volume_up_outlined),
                  ),
                ],
              ),
              Text('Okunus: ${g.okunus}', style: t.textTheme.bodyMedium),
              const SizedBox(height: 10),
              Text(g.trAnlam,
                  style: t.textTheme.titleMedium
                      ?.copyWith(color: t.colorScheme.primary)),
              const SizedBox(height: 12),
              Text('Ornek: ${g.ornekCumle}',
                  style: const TextStyle(fontStyle: FontStyle.italic)),
              const SizedBox(height: 18),
              if (bilinen)
                Row(children: <Widget>[
                  const Icon(Icons.check_circle,
                      size: 18, color: Colors.green),
                  const SizedBox(width: 8),
                  Text('Bu kelimeyi zaten ogrendin.',
                      style: t.textTheme.bodyMedium),
                ])
              else
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    icon: Icon(_eklenenKelimeler.contains(sade)
                        ? Icons.check
                        : Icons.add),
                    label: Text(_eklenenKelimeler.contains(sade)
                        ? 'Eklendi'
                        : 'Ogrenilecek Kelimelere Ekle'),
                    onPressed: _eklenenKelimeler.contains(sade)
                        ? null
                        : () async {
                            await _repo?.bilinmeyenKelimeEkle(
                              hikayeKod: widget.hikayeKod,
                              kelime: sade,
                              okunus: g.okunus,
                              trAnlam: g.trAnlam,
                            );
                            if (!ctx.mounted) return;
                            Navigator.of(ctx).pop();
                            if (!mounted) return;
                            setState(() => _eklenenKelimeler.add(sade));
                          },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  // -------------------------------------------------------------- test
  HikayeSorusu get _soru => _hikaye!.sorular[_soruIndeks];

  Future<void> cevabiKontrolEt([String? gelen]) async {
    final HikayeSorusu s = _soru;
    final bool secmeli = s.tip == SoruTipi.dogruYanlis ||
        s.tip == SoruTipi.coktanSecmeli;
    final bool siralama = s.tip == SoruTipi.siralama;

    final String cevap = secmeli
        ? (_secilen ?? '')
        : (siralama
            ? _siralamaSecimi.join(', ')
            : (gelen ?? _akis.giris.text));

    if (secmeli || siralama) {
      if (cevap.trim().isEmpty || _akis.kilitli || _akis.dogruVerildi) return;
    } else if (!_akis.islenmeliMi(cevap)) {
      return;
    }
    _akis.gonderildi(cevap);

    final bool dogru = HikayeMotoru.cevapDogruMu(s, cevap);
    if (!mounted) return;
    setState(() {
      _cevaplar[_soruIndeks] = cevap;
      _sonDogruMu = dogru;
      if (dogru) {
        _dogru++;
      } else {
        _yanlis++;
      }
    });

    if (dogru) {
      _akis.gecikmeliGec(gecisSuresi, _soruIleri, hala: () => mounted);
    } else if (!secmeli && !siralama) {
      _akis.hepsiniSec();
    }
  }

  void _soruIleri() {
    if (!mounted) return;
    setState(() {
      _sonDogruMu = null;
      _secilen = null;
      _siralamaSecimi.clear();
      if (_soruIndeks < _hikaye!.sorular.length - 1) {
        _soruIndeks++;
      } else {
        _asama = OkumaAsamasi.ozet;
      }
    });
    _akis.yeniSoru();
    if (_asama == OkumaAsamasi.ozet) _ozetAkis.yeniSoru();
  }

  // -------------------------------------------------------------- ozet
  Future<void> _ozetDegerlendir() async {
    final String metin = _ozetAkis.giris.text;
    if (metin.trim().isEmpty) return;
    final OzetSonucu s = OzetDegerlendirici.degerlendir(metin, _hikaye!);
    if (!mounted) return;
    setState(() => _ozetSonucu = s);
  }

  Future<void> _bitir() async {
    final Hikaye h = _hikaye!;
    final ({int bilinen, int bilinmeyen}) sayim = HikayeMotoru.kelimeSayimi(
      h,
      bilinenler: _bilinenler,
      sozluk: _sozlukKelimeleri,
    );
    await _repo?.istatistikKaydet(HikayeIstatistik(
      hikayeKod: h.kod,
      tarih: DateTime.now().toUtc().toIso8601String(),
      okumaSuresiMs: DateTime.now().difference(_baslangic).inMilliseconds,
      yeniKelime: sayim.bilinmeyen,
      bilinenKelime: sayim.bilinen,
      dogru: _dogru,
      yanlis: _yanlis,
      basariYuzdesi: HikayeMotoru.basariYuzdesi(_dogru, _yanlis),
    ));
    if (!mounted) return;
    setState(() => _asama = OkumaAsamasi.sonuc);
  }

  // ------------------------------------------------------------- build
  @override
  Widget build(BuildContext context) {
    if (_yukleniyor) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (_hata != null || _hikaye == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Hikaye')),
        body: Center(child: Text('Hikaye acilamadi: ${_hata ?? 'bulunamadi'}')),
      );
    }
    final Hikaye h = _hikaye!;
    final double ilerleme = switch (_asama) {
      OkumaAsamasi.okuma =>
        HikayeMotoru.okumaYuzdesi(_paragrafIndeks, h.paragraflar.length) * 0.6,
      OkumaAsamasi.test => 0.6 +
          (h.sorular.isEmpty ? 0 : _soruIndeks / h.sorular.length) * 0.3,
      OkumaAsamasi.ozet => 0.92,
      OkumaAsamasi.sonuc => 1.0,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(h.baslik),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(value: ilerleme),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: switch (_asama) {
              OkumaAsamasi.okuma => _okumaAsamasi(h),
              OkumaAsamasi.test => _testAsamasi(h),
              OkumaAsamasi.ozet => _ozetAsamasi(h),
              OkumaAsamasi.sonuc => _sonucAsamasi(h),
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _okumaAsamasi(Hikaye h) {
    final ThemeData t = Theme.of(context);
    final HikayeParagraf p = h.paragraflar[_paragrafIndeks];
    return <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            child: Text(
              'Paragraf ${_paragrafIndeks + 1} / ${h.paragraflar.length}',
              style: t.textTheme.labelMedium,
            ),
          ),
          IconButton.filledTonal(
            tooltip: 'Bu paragrafi dinle',
            onPressed: _sesUyarisi,
            icon: const Icon(Icons.volume_up_outlined),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: _vurguluMetin(p.metinEn),
        ),
      ),
      const SizedBox(height: 10),
      Row(
        children: <Widget>[
          FilterChip(
            label: const Text('Turkce ceviri'),
            selected: _ceviriAcik,
            onSelected: (bool v) => setState(() => _ceviriAcik = v),
          ),
        ],
      ),
      if (_ceviriAcik)
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Card(
            color: t.colorScheme.surfaceContainerHighest,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(p.metinTr, style: t.textTheme.bodyMedium),
            ),
          ),
        ),
      const SizedBox(height: 12),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(children: <Widget>[
            _renkKutu(t.colorScheme.primary),
            const SizedBox(width: 6),
            const Text('Yeni kelime'),
            const SizedBox(width: 16),
            _renkKutu(Colors.green),
            const SizedBox(width: 6),
            const Text('Bildigin kelime'),
          ]),
        ),
      ),
      const SizedBox(height: 18),
      FilledButton.icon(
        onPressed: _paragrafIleri,
        icon: const Icon(Icons.arrow_forward),
        label: Text(_paragrafIndeks + 1 >= h.paragraflar.length
            ? 'Teste gec'
            : 'Devam Et'),
      ),
      const SizedBox(height: 24),
    ];
  }

  Widget _renkKutu(Color c) => Container(
        width: 14,
        height: 14,
        decoration: BoxDecoration(
          color: c.withValues(alpha: 0.25),
          border: Border.all(color: c),
          borderRadius: BorderRadius.circular(3),
        ),
      );

  Widget _vurguluMetin(String metin) {
    final ThemeData t = Theme.of(context);
    final List<MetinJetonu> jetonlar = HikayeMotoru.jetonla(
      metin,
      bilinenler: _bilinenler,
      sozluk: _sozlukKelimeleri,
    );
    return Wrap(
      spacing: 0,
      runSpacing: 4,
      children: jetonlar.map((MetinJetonu j) {
        final bool tiklanir = j.durum == KelimeDurumu.bilinmeyen;
        final Color? renk = switch (j.durum) {
          KelimeDurumu.bilinen => Colors.green,
          KelimeDurumu.bilinmeyen => t.colorScheme.primary,
          KelimeDurumu.notr => null,
        };
        final Widget metinW = Text(
          '${j.metin} ',
          style: TextStyle(
            fontSize: 16,
            height: 1.7,
            color: renk,
            fontWeight: renk == null ? FontWeight.normal : FontWeight.w600,
            backgroundColor: renk?.withValues(alpha: 0.12),
            decoration: tiklanir ? TextDecoration.underline : null,
            decorationStyle: TextDecorationStyle.dotted,
          ),
        );
        if (!tiklanir) return metinW;
        return InkWell(onTap: () => _kelimeyeTikla(j.sade), child: metinW);
      }).toList(),
    );
  }

  List<Widget> _testAsamasi(Hikaye h) {
    final ThemeData t = Theme.of(context);
    if (h.sorular.isEmpty) {
      return <Widget>[
        const Text('Bu hikaye icin soru bulunmuyor.'),
        const SizedBox(height: 16),
        FilledButton(
            onPressed: () => setState(() => _asama = OkumaAsamasi.ozet),
            child: const Text('Devam')),
      ];
    }
    final HikayeSorusu s = _soru;
    final bool secmeli = s.tip == SoruTipi.dogruYanlis ||
        s.tip == SoruTipi.coktanSecmeli;
    final bool siralama = s.tip == SoruTipi.siralama;
    final bool cevaplandi = _sonDogruMu != null;

    return <Widget>[
      BolumBasligi('Okudugunu anlama', ikon: Icons.quiz_outlined,
          altBaslik: '${s.tip.ad}  ·  soru ${_soruIndeks + 1} / '
              '${h.sorular.length}'),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SelectableText(s.soru,
                  style: const TextStyle(fontSize: 16, height: 1.5)),
              const SizedBox(height: 14),
              if (secmeli)
                ...s.secenekler.map((String o) => SecenekSatiri(
                      metin: o,
                      secili: _secilen == o,
                      onSecildi: _akis.dogruVerildi
                          ? () {}
                          : () => setState(() => _secilen = o),
                    ))
              else if (siralama) ...<Widget>[
                Text('Siraya tiklayarak dizin:',
                    style: t.textTheme.bodySmall),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: s.secenekler.map((String o) {
                    final int i = _siralamaSecimi.indexOf(o);
                    return ActionChip(
                      avatar: i >= 0
                          ? CircleAvatar(
                              radius: 10,
                              child: Text('${i + 1}',
                                  style: const TextStyle(fontSize: 10)))
                          : null,
                      label: Text(o),
                      onPressed: _akis.dogruVerildi
                          ? null
                          : () => setState(() {
                                if (i >= 0) {
                                  _siralamaSecimi.remove(o);
                                } else {
                                  _siralamaSecimi.add(o);
                                }
                              }),
                    );
                  }).toList(),
                ),
              ] else
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
        Card(
          color: (_sonDogruMu ?? false)
              ? Colors.green.withValues(alpha: 0.12)
              : Colors.orange.withValues(alpha: 0.12),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text((_sonDogruMu ?? false) ? 'Dogru.' : 'Yanlis.',
                    style: t.textTheme.titleSmall),
                if (!(_sonDogruMu ?? false)) ...<Widget>[
                  const SizedBox(height: 6),
                  Text('Dogru cevap: ${s.kanonikCevap}'),
                  if (s.aciklama != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(s.aciklama!, style: t.textTheme.bodySmall),
                    ),
                ],
              ],
            ),
          ),
        ),
      if (!_akis.dogruVerildi) ...<Widget>[
        const SizedBox(height: 12),
        FilledButton(
            onPressed: cevabiKontrolEt, child: const Text('Kontrol Et')),
      ] else if (_sonDogruMu == false) ...<Widget>[
        const SizedBox(height: 12),
        FilledButton(onPressed: _soruIleri, child: const Text('Devam')),
      ],
      if (_sonDogruMu == false && (secmeli || siralama)) ...<Widget>[
        const SizedBox(height: 12),
        FilledButton(onPressed: _soruIleri, child: const Text('Devam')),
      ],
      const SizedBox(height: 24),
    ];
  }

  List<Widget> _ozetAsamasi(Hikaye h) {
    final ThemeData t = Theme.of(context);
    final OzetSonucu? s = _ozetSonucu;
    return <Widget>[
      const BolumBasligi('Hikaye ozeti', ikon: Icons.edit_note_outlined,
          altBaslik: 'Hikayeyi 2-3 cumleyle kendi cumlelerinle anlat'),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: _ozetAkis.giris,
                focusNode: _ozetAkis.odak,
                maxLines: 4,
                autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ozetin',
                  helperText: 'Turkce veya Ingilizce yazabilirsin',
                ),
              ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: _ozetDegerlendir,
                child: const Text('Ozeti degerlendir'),
              ),
            ],
          ),
        ),
      ),
      if (s != null) ...<Widget>[
        const SizedBox(height: 14),
        Card(
          color: s.yeterli
              ? Colors.green.withValues(alpha: 0.12)
              : Colors.orange.withValues(alpha: 0.12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(s.yeterli ? 'Ozet yeterli.' : 'Ozet gelistirilebilir.',
                    style: t.textTheme.titleSmall),
                const SizedBox(height: 8),
                Text('${s.cumleSayisi} cumle · ${s.kelimeSayisi} kelime · '
                    'kapsama %${(s.kapsama * 100).round()}'),
                if (s.bulunanKavramlar.isNotEmpty) ...<Widget>[
                  const SizedBox(height: 8),
                  Text('Yakalanan: ${s.bulunanKavramlar.join(', ')}',
                      style: t.textTheme.bodySmall),
                ],
                if (s.eksikKavramlar.isNotEmpty)
                  Text('Eksik kalan: ${s.eksikKavramlar.join(', ')}',
                      style: t.textTheme.bodySmall),
                ...s.notlar.map((String n) => Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text('· $n'),
                    )),
                const SizedBox(height: 10),
                Text(
                  'Not: Bu degerlendirme anahtar kavram kapsamasi ve uzunluk '
                  'olcer; anlam cozumlemesi YAPMAZ.',
                  style: t.textTheme.labelSmall?.copyWith(color: t.hintColor),
                ),
              ],
            ),
          ),
        ),
      ],
      const SizedBox(height: 16),
      FilledButton.icon(
        onPressed: _bitir,
        icon: const Icon(Icons.flag_outlined),
        label: const Text('Hikayeyi bitir'),
      ),
      const SizedBox(height: 24),
    ];
  }

  List<Widget> _sonucAsamasi(Hikaye h) {
    final ThemeData t = Theme.of(context);
    final ({int bilinen, int bilinmeyen}) sayim = HikayeMotoru.kelimeSayimi(
      h,
      bilinenler: _bilinenler,
      sozluk: _sozlukKelimeleri,
    );
    final int dk = DateTime.now().difference(_baslangic).inMinutes;
    final double basari = HikayeMotoru.basariYuzdesi(_dogru, _yanlis);

    Widget satir(String ad, String deger) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(children: <Widget>[
            Expanded(child: Text(ad)),
            Text(deger, style: const TextStyle(fontWeight: FontWeight.w600)),
          ]),
        );

    return <Widget>[
      const SizedBox(height: 10),
      Icon(Icons.check_circle_outline,
          size: 56, color: t.colorScheme.primary),
      const SizedBox(height: 12),
      Center(child: Text('Hikaye tamamlandi', style: t.textTheme.titleLarge)),
      const SizedBox(height: 20),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: <Widget>[
              satir('Okuma suresi', '${dk < 1 ? 1 : dk} dk'),
              satir('Yeni kelime', '${sayim.bilinmeyen}'),
              satir('Bilinen kelime', '${sayim.bilinen}'),
              satir('Ogrenmeye eklenen', '${_eklenenKelimeler.length}'),
              const Divider(),
              satir('Dogru cevap', '$_dogru'),
              satir('Yanlis cevap', '$_yanlis'),
              satir('Basari', '%${(basari * 100).round()}'),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20),
      FilledButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text('Kutuphaneye don'),
      ),
      const SizedBox(height: 24),
    ];
  }
}
