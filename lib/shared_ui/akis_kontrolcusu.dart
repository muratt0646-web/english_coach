import 'dart:async';

import 'package:flutter/material.dart';

/// Yazili cevap alanlarinin ODAK ve KILIT yasam dongusu.
///
/// Flow Mode kurallari (Faz 2F):
///  - Her yeni soruda odak cevap alanina DONER.
///  - Enter tek merkezi kontrol fonksiyonunu cagirir.
///  - Dogru cevaptan sonraki gecis sirasinda Enter YUTULUR (cift gecis yok).
///  - Ayni cevap iki kez kaydedilmez.
///  - Yanlis cevapta metin SECILI kalir, odak alanda kalir.
///
/// Iki ekranda da (ders, pekistirme) ayni mantik kullanilir; kopyalanmaz.
class AkisKontrolcusu {
  final TextEditingController giris = TextEditingController();
  final FocusNode odak = FocusNode();

  /// Gecis sirasinda true. Enter bu sirada islenmez.
  bool kilitli = false;

  /// Bu soruda en son gonderilen cevap. Ayni cevap tekrar islenmez.
  String? sonGonderilen;

  /// Bu soruda dogru cevap verildi mi? Verildiyse yeni gonderim islenmez.
  bool dogruVerildi = false;

  Timer? _zamanlayici;
  bool _atildi = false;

  /// Gonderilen cevap islenmeli mi?
  ///
  /// [cevap] bos ise, kilit acikken, ayni cevap tekrarlandiginda veya
  /// dogru cevap zaten verilmisken false doner.
  bool islenmeliMi(String cevap) {
    if (_atildi || kilitli || dogruVerildi) return false;
    final String t = cevap.trim();
    if (t.isEmpty) return false;
    if (sonGonderilen != null && sonGonderilen == t) return false;
    return true;
  }

  /// Cevap islendikten sonra cagrilir.
  void gonderildi(String cevap) {
    sonGonderilen = cevap.trim();
  }

  /// Odagi cevap alanina dondurur. Cerceve cizildikten SONRA calisir.
  void odakla() {
    if (_atildi) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_atildi) return;
      if (odak.canRequestFocus) odak.requestFocus();
    });
  }

  /// Metni tamamen secer. Yanlis cevaptan sonra kullanilir:
  /// kullanici yazmaya basladiginda eski cevap dogrudan degisir.
  void hepsiniSec() {
    if (_atildi) return;
    giris.selection = TextSelection(
      baseOffset: 0,
      extentOffset: giris.text.length,
    );
    odakla();
  }

  /// Yeni soruya gecerken: alani temizle, kilidi ac, odagi geri ver.
  void yeniSoru() {
    if (_atildi) return;
    _zamanlayici?.cancel();
    _zamanlayici = null;
    giris.clear();
    kilitli = false;
    sonGonderilen = null;
    dogruVerildi = false;
    odakla();
  }

  /// Dogru cevaptan sonra otomatik gecis.
  /// Gecis suresince [kilitli] true kalir; Enter yutulur.
  void gecikmeliGec(
    Duration sure,
    VoidCallback devam, {
    required bool Function() hala,
  }) {
    if (_atildi) return;
    kilitli = true;
    dogruVerildi = true;
    _zamanlayici?.cancel();
    _zamanlayici = Timer(sure, () {
      if (_atildi || !hala()) return;
      devam();
    });
  }

  /// Bekleyen gecisi iptal eder (ornegin ekran kapanirken).
  void gecisiIptalEt() {
    _zamanlayici?.cancel();
    _zamanlayici = null;
    kilitli = false;
  }

  void dispose() {
    _atildi = true;
    _zamanlayici?.cancel();
    _zamanlayici = null;
    giris.dispose();
    odak.dispose();
  }
}

/// Flow Mode cevap alani. Tek satir, Enter gonderir.
///
/// Butonla Enter AYNI fonksiyonu cagirir: [onGonder].
class CevapAlani extends StatelessWidget {
  final AkisKontrolcusu akis;
  final String etiket;
  final bool etkin;

  /// null: henuz cevaplanmadi · true: dogru · false: yanlis
  final bool? sonucDogruMu;

  final void Function(String cevap) onGonder;

  const CevapAlani({
    super.key,
    required this.akis,
    required this.onGonder,
    this.etiket = 'Cevabin',
    this.etkin = true,
    this.sonucDogruMu,
  });

  @override
  Widget build(BuildContext context) {
    final Color? cerceve = switch (sonucDogruMu) {
      true => Colors.green,
      false => Colors.redAccent,
      null => null,
    };

    return TextField(
      controller: akis.giris,
      focusNode: akis.odak,
      enabled: etkin,
      // Tek satir: Enter yeni satir ACMAZ, gonderir.
      maxLines: 1,
      textInputAction: TextInputAction.done,
      autofocus: true,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: etiket,
        enabledBorder: cerceve == null
            ? null
            : OutlineInputBorder(
                borderSide: BorderSide(color: cerceve, width: 2)),
        focusedBorder: cerceve == null
            ? null
            : OutlineInputBorder(
                borderSide: BorderSide(color: cerceve, width: 2)),
        suffixIcon: switch (sonucDogruMu) {
          true => const Icon(Icons.check_circle, color: Colors.green),
          false => const Icon(Icons.cancel, color: Colors.redAccent),
          null => null,
        },
      ),
      onSubmitted: onGonder,
    );
  }
}
