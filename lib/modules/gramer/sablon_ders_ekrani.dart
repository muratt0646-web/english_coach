import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/db/app_database.dart';
import '../../core/engine/ders_motoru.dart';
import '../../core/engine/tani_motoru.dart';
import '../../core/model/ders_sablonu.dart';
import '../../data/ders_ilerleme_repo.dart';
import '../../shared_ui/akis_kontrolcusu.dart';
import '../../shared_ui/bolum_basligi.dart';
import '../../shared_ui/ornek_karti.dart';
import '../../shared_ui/secenek_satiri.dart';

/// GENEL sablon ders ekrani.
///
/// 12 asamayi VERIDEN cizer. Hicbir derse ozel dal icermez; yeni ders
/// eklemek icin bu dosya DEGISMEZ.
class SablonDersEkrani extends StatefulWidget {
  final DersSablonu ders;
  const SablonDersEkrani({super.key, required this.ders});
  @override
  State<SablonDersEkrani> createState() => _SablonDersEkraniState();
}

class _SablonDersEkraniState extends State<SablonDersEkrani> {
  late final DersMotoru _motor = DersMotoru(widget.ders);
  final AkisKontrolcusu _akis = AkisKontrolcusu();

  static const Duration gecisSuresi = Duration(milliseconds: 400);

  DersAsamasi _asama = DersAsamasi.giris;
  int _indeks = 0;
  String? _secilen;
  bool? _sonDogruMu;

  /// Serbest uretimde yazilan cevaplar (hata analizi asamasi kullanir).
  final Map<String, String> _serbestCevaplar = <String, String>{};

  /// Gorsel orneklerde kac adim acildi.
  int _acikAdim = 1;

  /// Adimli ornekler bitince ORNEK LISTESI acilir (30 dogru / 20 yanlis).
  bool _orneklerAcik = false;

  /// Pekistirme, zayif konulara gore agirliklandirilir.
  List<SablonSoru> _pekistirmeListesi = const <SablonSoru>[];

  /// §13: Mini sinavda dogru cevap ANLIK GOSTERILMEZ.
  /// Sonuclar sinav bitince toplu gosterilir.
  bool get _sinavModu => _asama == DersAsamasi.miniSinav;

  /// Metin girisi olmayan (yalnizca okunan) asamalar.
  /// Bunlarda Enter "devam" gorevini gorur.
  bool get _sunumAsamasi =>
      _asama == DersAsamasi.giris ||
      _asama == DersAsamasi.anlatim ||
      _asama == DersAsamasi.gorselOrnek ||
      _asama == DersAsamasi.adimAdim ||
      _asama == DersAsamasi.hataAnalizi ||
      _asama == DersAsamasi.ozet;

  /// Sunum asamasinda Enter'a basilinca calisir.
  /// Her asamanin kendi "devam" davranisi vardir.
  void _sunumdaEnter() {
    if (!_sunumAsamasi) return;
    switch (_asama) {
      case DersAsamasi.anlatim:
        if (_indeks < widget.ders.anlatim.length - 1) {
          setState(() => _indeks++);
        } else {
          _ileri();
        }
      case DersAsamasi.gorselOrnek:
      case DersAsamasi.adimAdim:
        _adimliIleri();
      default:
        _ileri();
    }
  }

  DersIlerlemeRepo? _ilerleme;
  bool _yukleniyor = true;

  @override
  void initState() {
    super.initState();
    // Veritabani hazir degilse (widget testi) ders YINE calisir.
    // initState icinde setState CAGRILAMAZ; alani dogrudan ayarliyoruz.
    try {
      _ilerleme = DersIlerlemeRepo(AppDatabase.instance.db);
    } catch (_) {
      _ilerleme = null;
      _yukleniyor = false;
      return;
    }
    _ilerlemeYukle();
  }

  /// §16: Kaldigi bolumden devam.
  Future<void> _ilerlemeYukle() async {
    try {
      final DersIlerlemeKaydi k = await _ilerleme!.getir(widget.ders.kod);
      if (!mounted) return;
      setState(() {
        if (k.baslanmis && !k.tamamlanmis) {
          _asama = DersAsamasi.values.firstWhere(
              (DersAsamasi a) => a.name == k.asama,
              orElse: () => DersAsamasi.giris);
          _indeks = k.maddeIndeksi;
        }
        _yukleniyor = false;
      });
    } catch (_) {
      // Veritabani yoksa ders YINE calisir; ilerleme kaydedilmez.
      if (!mounted) return;
      setState(() => _yukleniyor = false);
    }
  }

  Future<void> _ilerlemeKaydet() async {
    final DersSonucu ara = _motor.sonuc();
    await _ilerleme?.kaydet(
      dersKod: widget.ders.kod,
      asama: _asama.name,
      maddeIndeksi: _indeks,
      dogru: ara.dogru,
      yanlis: ara.yanlis,
    );
  }

  @override
  void dispose() {
    _akis.dispose();
    super.dispose();
  }

  // ------------------------------------------------------------ akis
  List<SablonSoru> get _aktifSorular => switch (_asama) {
        DersAsamasi.miniKontrol => widget.ders.miniKontrol,
        DersAsamasi.kontrolluAlistirma => widget.ders.kontrolluAlistirmalar,
        DersAsamasi.pekistirme => _pekistirmeListesi,
        DersAsamasi.miniSinav => widget.ders.miniSinav,
        _ => const <SablonSoru>[],
      };

  void _asamaGec(DersAsamasi hedef) {
    unawaited(_ilerlemeKaydet());
    setState(() {
      _asama = hedef;
      _indeks = 0;
      _acikAdim = 1;
      _orneklerAcik = false;
      _secilen = null;
      _sonDogruMu = null;
      if (hedef == DersAsamasi.pekistirme) {
        _pekistirmeListesi = _motor.agirlikliPekistirme();
      }
    });
    _akis.yeniSoru();
  }

  void _ileri() {
    final DersAsamasi? s = DersMotoru.sonraki(_asama);
    if (s == null) return;
    _asamaGec(s);
  }

  /// TEK MERKEZI kontrol fonksiyonu. Enter ve dugme BUNU cagirir.
  Future<void> cevabiKontrolEt([String? gelen]) async {
    final List<SablonSoru> l = _aktifSorular;
    if (l.isEmpty || _indeks >= l.length) return;
    final SablonSoru s = l[_indeks];
    final String cevap =
        s.tur.secmeli ? (_secilen ?? '') : (gelen ?? _akis.giris.text);

    if (s.tur.secmeli) {
      if (cevap.trim().isEmpty || _akis.kilitli || _akis.dogruVerildi) return;
    } else if (!_akis.islenmeliMi(cevap)) {
      return;
    }
    _akis.gonderildi(cevap);

    final bool dogru = _motor.cevapla(s, cevap);
    if (!mounted) return;

    // SINAV MODU: geri bildirim YOK, dogru/yanlis fark etmeksizin ilerle.
    if (_sinavModu) {
      _akis.gecikmeliGec(
          const Duration(milliseconds: 150), _soruIleri,
          hala: () => mounted);
      return;
    }

    setState(() => _sonDogruMu = dogru);
    if (dogru) {
      _akis.gecikmeliGec(gecisSuresi, _soruIleri, hala: () => mounted);
    } else if (!s.tur.secmeli) {
      _akis.hepsiniSec();
    }
  }

  void _soruIleri() {
    if (!mounted) return;
    final List<SablonSoru> l = _aktifSorular;
    setState(() {
      _secilen = null;
      _sonDogruMu = null;
      if (_indeks < l.length - 1) {
        _indeks++;
      } else {
        final DersAsamasi? s = DersMotoru.sonraki(_asama);
        if (s != null) {
          _asama = s;
          _indeks = 0;
          if (s == DersAsamasi.pekistirme) {
            _pekistirmeListesi = _motor.agirlikliPekistirme();
          }
        }
      }
    });
    _akis.yeniSoru();
  }

  /// Mini kontrolde yanlis: ilgili anlatim blogua GERI DONER.
  void _anlatimaGeriDon(String kod) {
    final int i = _motor.anlatimBlokIndeksi(kod);
    setState(() {
      _asama = DersAsamasi.anlatim;
      _indeks = i < 0 ? 0 : i;
      _secilen = null;
      _sonDogruMu = null;
    });
  }

  Future<void> _serbestKaydet(SerbestGorev g, String cevap) async {
    if (!_akis.islenmeliMi(cevap)) return;
    _akis.gonderildi(cevap);
    final bool dogru = _motor.serbestCevapla(g, cevap);
    if (!mounted) return;
    setState(() {
      _serbestCevaplar[g.kod] = cevap;
      _sonDogruMu = dogru;
    });
    if (dogru) {
      _akis.gecikmeliGec(gecisSuresi, _serbestIleri, hala: () => mounted);
    } else {
      _akis.hepsiniSec();
    }
  }

  void _serbestIleri() {
    if (!mounted) return;
    setState(() {
      _sonDogruMu = null;
      if (_indeks < widget.ders.serbestUretim.length - 1) {
        _indeks++;
      } else {
        _asama = DersAsamasi.hataAnalizi;
        _indeks = 0;
      }
    });
    _akis.yeniSoru();
  }

  // ------------------------------------------------------------ build
  @override
  Widget build(BuildContext context) {
    final ThemeData t = Theme.of(context);
    if (_yukleniyor) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ders.baslik),
        bottom: PreferredSize(
          // 24px sinirdaydi (cubuk 4 + bosluk 8 + etiket ~16).
          // Tasma gozlenmedi ama pay birakildi.
          preferredSize: const Size.fromHeight(38),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              LinearProgressIndicator(
                value: _asama.sira / DersAsamasi.values.length,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text('${_asama.sira}/12 · ${_asama.ad}',
                    style: t.textTheme.labelSmall),
              ),
            ],
          ),
        ),
      ),
      // Sunum asamalarinda ENTER "devam" gorevini gorur.
      // Metin girisi olan asamalarda CevapAlani kendi Enter'ini isler.
      body: Focus(
        autofocus: _sunumAsamasi,
        onKeyEvent: (FocusNode _, KeyEvent olay) {
          if (!_sunumAsamasi) return KeyEventResult.ignored;
          if (olay is! KeyDownEvent) return KeyEventResult.ignored;
          final bool enter =
              olay.logicalKey == LogicalKeyboardKey.enter ||
                  olay.logicalKey == LogicalKeyboardKey.numpadEnter;
          if (!enter) return KeyEventResult.ignored;
          _sunumdaEnter();
          return KeyEventResult.handled;
        },
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: <Widget>[
                ..._asamaIcerigi(t),
                if (_sunumAsamasi) ...<Widget>[
                  const SizedBox(height: 10),
                  Center(
                    child: Text('Enter tusu ile de ilerleyebilirsiniz.',
                        style: t.textTheme.labelSmall
                            ?.copyWith(color: t.hintColor)),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _asamaIcerigi(ThemeData t) => switch (_asama) {
        DersAsamasi.giris => _giris(t),
        DersAsamasi.anlatim => _anlatim(t),
        DersAsamasi.gorselOrnek => _adimliListe(
            t, widget.ders.gorselOrnekler, 'Gorsel ornekler',
            ornekler: widget.ders.dogruOrnekler, dogruMu: true),
        DersAsamasi.adimAdim => _adimliListe(
            t, widget.ders.adimAdimOrnekler, 'Adim adim',
            ornekler: widget.ders.yanlisOrnekler, dogruMu: false),
        DersAsamasi.miniKontrol => _soruAsamasi(t, geriDonusVar: true),
        DersAsamasi.kontrolluAlistirma => _soruAsamasi(t),
        DersAsamasi.serbestUretim => _serbest(t),
        DersAsamasi.hataAnalizi => _hataAnalizi(t),
        DersAsamasi.pekistirme => _soruAsamasi(t),
        DersAsamasi.miniSinav => _soruAsamasi(t),
        DersAsamasi.ozet => _ozet(t),
        DersAsamasi.basari => _basari(t),
      };

  Widget _devamDugmesi(String etiket) => Padding(
        padding: const EdgeInsets.only(top: 18),
        child: SizedBox(
          width: double.infinity,
          child: FilledButton(onPressed: _ileri, child: Text(etiket)),
        ),
      );

  // -------- 1. Giris --------
  List<Widget> _giris(ThemeData t) => <Widget>[
        Text(widget.ders.baslik, style: t.textTheme.headlineSmall),
        Text('${widget.ders.seviye} · ${widget.ders.tahminiDk} dk',
            style: t.textTheme.bodySmall),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Text(widget.ders.girisMetni,
                style: const TextStyle(fontSize: 15, height: 1.6)),
          ),
        ),
        const BolumBasligi('Bu derste ogrenecekleriniz',
            ikon: Icons.flag_outlined),
        ...widget.ders.kazanimlar.map((String k) => ListTile(
              dense: true,
              leading: const Icon(Icons.check_circle_outline, size: 18),
              title: Text(k),
            )),
        _devamDugmesi('Basla'),
      ];

  // -------- 2. Anlatim --------
  List<Widget> _anlatim(ThemeData t) {
    final List<AnlatimBlogu> l = widget.ders.anlatim;
    if (l.isEmpty) return <Widget>[_devamDugmesi('Devam')];
    final AnlatimBlogu b = l[_indeks.clamp(0, l.length - 1)];
    return <Widget>[
      Text('Bolum ${_indeks + 1} / ${l.length}',
          style: t.textTheme.labelMedium),
      const SizedBox(height: 10),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(b.baslik, style: t.textTheme.titleMedium),
              const SizedBox(height: 10),
              Text(b.govde, style: const TextStyle(fontSize: 15, height: 1.6)),
              if (b.turkceKarsilastirma != null) ...<Widget>[
                const SizedBox(height: 14),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: t.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(b.turkceKarsilastirma!,
                      style: const TextStyle(
                          fontFamily: 'monospace', height: 1.6)),
                ),
              ],
            ],
          ),
        ),
      ),
      const SizedBox(height: 16),
      SizedBox(
        width: double.infinity,
        child: FilledButton(
          onPressed: () {
            if (_indeks < l.length - 1) {
              setState(() => _indeks++);
            } else {
              _ileri();
            }
          },
          child: Text(_indeks < l.length - 1 ? 'Devam' : 'Orneklere gec'),
        ),
      ),
    ];
  }

  // -------- 3 & 4. Adimli ornekler --------
  List<Widget> _adimliListe(
    ThemeData t,
    List<AdimliOrnek> l,
    String baslik, {
    List<OrnekCumle> ornekler = const <OrnekCumle>[],
    bool dogruMu = true,
  }) {
    // Adimli ornekler bittikten SONRA ornek listesi acilir.
    if (_orneklerAcik || l.isEmpty) {
      return _ornekListesi(t, ornekler, dogruMu);
    }

    final AdimliOrnek o = l[_indeks.clamp(0, l.length - 1)];
    final int gorunen = _acikAdim.clamp(1, o.adimlar.length);
    final bool sonAdim = gorunen >= o.adimlar.length;
    final bool sonOrnek = _indeks >= l.length - 1;

    return <Widget>[
      BolumBasligi('$baslik (${_indeks + 1}/${l.length})',
          ikon: Icons.animation_outlined),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              for (int i = 0; i < gorunen; i++) ...<Widget>[
                if (i > 0)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Icon(Icons.arrow_downward,
                        size: 18, color: t.hintColor),
                  ),
                _adimKutusu(t, o.adimlar[i],
                    aktif: i == gorunen - 1,
                    son: i == o.adimlar.length - 1),
              ],
              const SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Icon(Icons.translate, size: 16, color: t.hintColor),
                  const SizedBox(width: 6),
                  Expanded(
                      child: Text(o.turkce, style: t.textTheme.bodyMedium)),
                ],
              ),
              if (o.not != null) ...<Widget>[
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: t.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.lightbulb_outline,
                          size: 16, color: t.hintColor),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(o.not!, style: t.textTheme.bodySmall),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
      const SizedBox(height: 16),
      SizedBox(
        width: double.infinity,
        child: FilledButton(
          onPressed: _adimliIleri,
          child: Text(!sonAdim
              ? 'Sonraki adim'
              : (!sonOrnek ? 'Sonraki ornek' : 'Ornek listesine gec')),
        ),
      ),
    ];
  }

  /// Adimli ornek asamalarinda bir sonraki adima/ornege gecer.
  /// Hem dugme hem Enter BUNU cagirir.
  void _adimliIleri() {
    final List<AdimliOrnek> l = _asama == DersAsamasi.gorselOrnek
        ? widget.ders.gorselOrnekler
        : widget.ders.adimAdimOrnekler;
    if (_orneklerAcik || l.isEmpty) {
      _ileri();
      return;
    }
    final AdimliOrnek o = l[_indeks.clamp(0, l.length - 1)];
    final int gorunen = _acikAdim.clamp(1, o.adimlar.length);
    setState(() {
      if (gorunen < o.adimlar.length) {
        _acikAdim = gorunen + 1;
      } else if (_indeks < l.length - 1) {
        _indeks++;
        _acikAdim = 1;
      } else {
        _orneklerAcik = true;
      }
    });
  }

  /// Tek bir adim kutusu. Aktif adim vurgulanir, son adim tam cumledir.
  Widget _adimKutusu(ThemeData t, String metin,
      {required bool aktif, required bool son}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: aktif
            ? t.colorScheme.primaryContainer
            : t.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(10),
        border: aktif
            ? Border.all(color: t.colorScheme.primary, width: 1.5)
            : null,
      ),
      child: Text(
        metin,
        style: TextStyle(
          fontSize: son ? 19 : 16,
          fontWeight: aktif ? FontWeight.w700 : FontWeight.w500,
          color: aktif ? t.colorScheme.onPrimaryContainer : null,
        ),
      ),
    );
  }

  /// 30 dogru / 20 yanlis ornek — ALT KONUYA gore gruplanir.
  List<Widget> _ornekListesi(
      ThemeData t, List<OrnekCumle> ornekler, bool dogruMu) {
    if (ornekler.isEmpty) {
      return <Widget>[_devamDugmesi('Devam')];
    }

    // Gruplama YALNIZCA her ornekte altKonu varsa yapilir; aksi halde
    // yarisi baslikli yarisi basliksiz karisik bir liste olusurdu.
    final bool gruplanabilir = ornekler
        .every((OrnekCumle o) => (o.altKonu ?? '').isNotEmpty);
    final Map<String, List<OrnekCumle>> gruplar =
        <String, List<OrnekCumle>>{};
    for (final OrnekCumle o in ornekler) {
      gruplar
          .putIfAbsent(gruplanabilir ? o.altKonu! : '', () => <OrnekCumle>[])
          .add(o);
    }

    final List<Widget> icerik = <Widget>[
      BolumBasligi(
        dogruMu
            ? 'Dogru ornekler (${ornekler.length})'
            : 'Yanlis ornekler ve nedenleri (${ornekler.length})',
        altBaslik: dogruMu
            ? 'Kalibi bu cumlelerde gorun'
            : 'Her ornekte NEDEN yanlis oldugu yazili',
        ikon: dogruMu ? Icons.check_circle_outline : Icons.error_outline,
      ),
    ];

    int sira = 1;
    gruplar.forEach((String konu, List<OrnekCumle> l) {
      if (gruplanabilir && konu.isNotEmpty && gruplar.length > 1) {
        icerik.add(AltKonuSeridi(baslik: konu, adet: l.length));
      }
      for (final OrnekCumle o in l) {
        icerik.add(dogruMu
            ? DogruOrnekKarti(ornek: o, sira: sira)
            : YanlisOrnekKarti(ornek: o, sira: sira));
        sira++;
      }
    });

    icerik.add(_devamDugmesi('Devam'));
    return icerik;
  }

  // -------- 5, 6, 9, 10. Soru asamalari --------
  List<Widget> _soruAsamasi(ThemeData t, {bool geriDonusVar = false}) {
    final List<SablonSoru> l = _aktifSorular;
    if (l.isEmpty) return <Widget>[_devamDugmesi('Devam')];
    final SablonSoru s = l[_indeks.clamp(0, l.length - 1)];
    final bool cevaplandi = _sonDogruMu != null;

    return <Widget>[
      Row(children: <Widget>[
        Text('Soru ${_indeks + 1} / ${l.length}',
            style: t.textTheme.labelMedium),
        const Spacer(),
        Chip(label: Text(s.tur.ad), visualDensity: VisualDensity.compact),
      ]),
      const SizedBox(height: 12),
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
              const SizedBox(height: 14),
              if (s.tur.secmeli)
                ...s.secenekler.map((String o) => SecenekSatiri(
                      metin: o,
                      secili: _secilen == o,
                      onSecildi: (!_sinavModu && _akis.dogruVerildi)
                          ? () {}
                          : () => setState(() => _secilen = o),
                    ))
              else
                CevapAlani(
                  akis: _akis,
                  etkin: _sinavModu || !_akis.dogruVerildi,
                  sonucDogruMu: _sinavModu ? null : _sonDogruMu,
                  onGonder: cevabiKontrolEt,
                ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 14),
      if (_sinavModu)
        Card(
          color: t.colorScheme.surfaceContainerHighest,
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Text('Sinav sirasinda dogru cevap gosterilmez. '
                'Sonuclar sinav bitince toplu gorunecek.'),
          ),
        )
      else if (cevaplandi)
        _geriBildirim(t, s, geriDonusVar),
      if (_sinavModu || !_akis.dogruVerildi) ...<Widget>[
        const SizedBox(height: 12),
        FilledButton(
            onPressed: cevabiKontrolEt,
            child: Text(_sinavModu ? 'Sonraki soru' : 'Kontrol Et')),
        const SizedBox(height: 6),
        Text('Enter ile de cevaplayabilirsiniz.',
            style: t.textTheme.labelSmall?.copyWith(color: t.hintColor)),
      ],
    ];
  }

  Widget _geriBildirim(ThemeData t, SablonSoru s, bool geriDonusVar) {
    final bool dogru = _sonDogruMu ?? false;
    return Card(
      color: (dogru ? Colors.green : Colors.orange).withValues(alpha: 0.12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(dogru ? 'Dogru.' : 'Yanlis.', style: t.textTheme.titleSmall),
            if (!dogru) ...<Widget>[
              const SizedBox(height: 6),
              Text('Dogru cevap: ${s.kanonik}'),
              if (s.aciklama != null) ...<Widget>[
                const SizedBox(height: 4),
                Text(s.aciklama!, style: t.textTheme.bodySmall),
              ],
              if (geriDonusVar && s.geriDonusKodu != null) ...<Widget>[
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  onPressed: () => _anlatimaGeriDon(s.geriDonusKodu!),
                  icon: const Icon(Icons.replay, size: 18),
                  label: const Text('Ilgili anlatima don'),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }

  // -------- 7. Serbest uretim --------
  List<Widget> _serbest(ThemeData t) {
    final List<SerbestGorev> l = widget.ders.serbestUretim;
    if (l.isEmpty) return <Widget>[_devamDugmesi('Devam')];
    final SerbestGorev g = l[_indeks.clamp(0, l.length - 1)];
    return <Widget>[
      BolumBasligi('Serbest yazma (${_indeks + 1}/${l.length})',
          altBaslik: 'Kendi cumlenizi kurun', ikon: Icons.edit_outlined),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Ingilizceye cevirin:', style: t.textTheme.labelMedium),
              const SizedBox(height: 6),
              Text(g.turkce, style: t.textTheme.titleMedium),
              if (g.ipucu != null) ...<Widget>[
                const SizedBox(height: 8),
                Text('Ipucu: ${g.ipucu}', style: t.textTheme.bodySmall),
              ],
              const SizedBox(height: 14),
              CevapAlani(
                akis: _akis,
                etkin: !_akis.dogruVerildi,
                sonucDogruMu: _sonDogruMu,
                onGonder: (String v) => _serbestKaydet(g, v),
              ),
            ],
          ),
        ),
      ),
      if (_sonDogruMu == false) ...<Widget>[
        const SizedBox(height: 14),
        _taniKarti(t, g),
      ],
      if (!_akis.dogruVerildi) ...<Widget>[
        const SizedBox(height: 12),
        FilledButton(
          onPressed: () => _serbestKaydet(g, _akis.giris.text),
          child: const Text('Kontrol Et'),
        ),
      ],
    ];
  }

  /// Diagnosis Engine (Tani Motoru v3) ciktisi.
  Widget _taniKarti(ThemeData t, SerbestGorev g) {
    final TaniSonucu tani = TaniMotoru.degerlendir(
      kullaniciCevabi: _akis.giris.text,
      kabulCevaplari: g.kabuller,
    );
    return Card(
      color: Colors.orange.withValues(alpha: 0.12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Wrap(spacing: 8, children: <Widget>[
              Text(tani.guven.etiket,
                  style: t.textTheme.labelLarge
                      ?.copyWith(color: Colors.orange.shade800)),
              Chip(
                  label: Text(tani.kategoriEtiketi),
                  visualDensity: VisualDensity.compact),
            ]),
            const SizedBox(height: 10),
            if (tani.gramerDogru == true)
              const Text('Dilbilgisi yapin dogru.')
            else if (tani.gramerDogru == false)
              const Text('Dilbilgisi hatasi var.'),
            if (tani.beklenenIfade != null) ...<Widget>[
              const SizedBox(height: 6),
              Text('Beklenen: ${tani.beklenenIfade}'),
              if (tani.yazilanIfade != null)
                Text('Yazdiginiz: ${tani.yazilanIfade}'),
            ],
            const SizedBox(height: 8),
            Text('Dogru form: ${tani.dogruForm}',
                style: const TextStyle(fontWeight: FontWeight.w600)),
            if (tani.neden != null) ...<Widget>[
              const SizedBox(height: 8),
              Text(tani.neden!),
            ],
          ],
        ),
      ),
    );
  }

  // -------- 8. Hata analizi --------
  List<Widget> _hataAnalizi(ThemeData t) {
    final Map<String, ({int dogru, int yanlis})> sayim = _motor.konuSayimi();
    final List<String> zayif = _motor.zayifKonular();
    return <Widget>[
      const BolumBasligi('Hata analizi',
          altBaslik: 'Buraya kadarki cevaplarin degerlendirmesi',
          ikon: Icons.analytics_outlined),
      if (sayim.isEmpty)
        const Text('Henuz cevap kaydi yok.')
      else
        ...sayim.entries.map((MapEntry<String, ({int dogru, int yanlis})> e) {
          final int toplam = e.value.dogru + e.value.yanlis;
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              title: Text(e.key),
              subtitle: LinearProgressIndicator(
                value: toplam == 0 ? 0 : e.value.dogru / toplam,
                minHeight: 6,
              ),
              trailing: Text('${e.value.dogru}/$toplam'),
            ),
          );
        }),
      if (zayif.isNotEmpty) ...<Widget>[
        const SizedBox(height: 12),
        Card(
          color: t.colorScheme.errorContainer,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Zayif konular', style: t.textTheme.labelLarge),
                const SizedBox(height: 6),
                Text(zayif.join(' · ')),
                const SizedBox(height: 6),
                Text('Pekistirme bu konulari daha SIK getirecek.',
                    style: t.textTheme.bodySmall),
              ],
            ),
          ),
        ),
      ],
      _devamDugmesi('Pekistirmeye gec'),
    ];
  }

  // -------- 11. Ozet --------
  List<Widget> _ozet(ThemeData t) => <Widget>[
        const BolumBasligi('Bugun ogrendiklerin', ikon: Icons.summarize_outlined),
        ...widget.ders.ozet.map((OzetMaddesi o) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(o.baslik,
                        style: t.textTheme.titleMedium
                            ?.copyWith(color: t.colorScheme.primary)),
                    const SizedBox(height: 4),
                    Text(o.aciklama),
                    const SizedBox(height: 6),
                    Text(o.ornek,
                        style: const TextStyle(
                            fontFamily: 'monospace', fontSize: 13)),
                  ],
                ),
              ),
            )),
        _devamDugmesi('Sonuclari gor'),
      ];

  // -------- 12. Basari ekrani --------
  List<Widget> _basari(ThemeData t) {
    final Set<String> sinavKodlari =
        widget.ders.miniSinav.map((SablonSoru s) => s.kod).toSet();
    final DersSonucu sonuc = _motor.sonuc(soruKodlari: sinavKodlari);
    final int yuzde = sonuc.sinavPuani;
    unawaited(_dersiTamamla(sonuc));

    return <Widget>[
      Center(
        child: Icon(
          sonuc.sinavGecti ? Icons.emoji_events : Icons.trending_up,
          size: 56,
          color: sonuc.sinavGecti ? Colors.amber : t.colorScheme.primary,
        ),
      ),
      const SizedBox(height: 12),
      Center(
        child: Text('%$yuzde', style: t.textTheme.displaySmall),
      ),
      Center(
        child: Text(
          sonuc.sinavGecti
              ? 'Mini sinavi gectiniz.'
              : 'Basari %80\'in altinda.',
          style: t.textTheme.bodyMedium,
        ),
      ),
      const SizedBox(height: 20),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Expanded(child: _kutu(t, 'Sure', _sureMetni(sonuc.sure))),
                Expanded(child: _kutu(t, 'Dogru', '${sonuc.dogru}')),
                Expanded(child: _kutu(t, 'Yanlis', '${sonuc.yanlis}')),
              ]),
              const Divider(height: 26),
              ListTile(
                dense: true,
                leading: const Icon(Icons.error_outline),
                title: const Text('En cok hata yapilan konu'),
                subtitle: Text(sonuc.enCokHataliKonu ?? 'Hata yok'),
              ),
              ListTile(
                dense: true,
                leading: const Icon(Icons.replay),
                title: const Text('Onerilen tekrar'),
                subtitle: Text(sonuc.onerilenTekrarlar.isEmpty
                    ? 'Tekrar gerekmiyor'
                    : sonuc.onerilenTekrarlar.join(' · ')),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20),
      SizedBox(
        width: double.infinity,
        child: FilledButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Dersi bitir'),
        ),
      ),
    ];
  }

  Future<void> _dersiTamamla(DersSonucu sonuc) async {
    if (_ilerleme == null || _tamamlandiYazildi) return;
    _tamamlandiYazildi = true;
    await _ilerleme!.tamamla(
      dersKod: widget.ders.kod,
      dogru: sonuc.dogru, yanlis: sonuc.yanlis,
      sinavPuani: sonuc.sinavPuani,
    );
    await _ilerleme!.altKonuKaydet(
        dersKod: widget.ders.kod, sayim: _motor.konuSayimi());
  }

  bool _tamamlandiYazildi = false;

  static String _sureMetni(Duration d) =>
      '${d.inMinutes} dk ${d.inSeconds % 60} sn';

  Widget _kutu(ThemeData t, String baslik, String deger) => Column(
        children: <Widget>[
          Text(deger, style: t.textTheme.titleLarge),
          Text(baslik, style: t.textTheme.labelSmall),
        ],
      );
}
