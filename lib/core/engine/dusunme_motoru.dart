import '../model/dusunme.dart';

/// Ingilizce dusunme motoru — GENEL.
///
/// Bu sinifta hicbir konu kodu, rol adi ('KIM', 'NE_YAPIYOR' ...) veya
/// dilbilgisi terimi ('SVO') SABIT KODLANMAZ. Motor yalnizca
/// [DusunmeModeli] verisiyle calisir. Yeni konu eklemek icin
/// yalnizca VERI eklenir; bu dosya degismez.
class DusunmeMotoru {
  final DusunmeModeli model;
  const DusunmeMotoru(this.model);

  static String norm(String s) {
    var t = s.toLowerCase().trim();
    t = t.replaceAll(RegExp(r'[.!?]+$'), '');
    t = t.replaceAll(RegExp(r'\s+'), ' ');
    return t.trim();
  }

  /// Bu ornekte hangi zihinsel sorular sorulur? Ornegin bloklarindan turetilir.
  List<ZihinselSoru> sorulacakSorular(DusunmeOrnegi ornek) {
    final roller = ornek.bloklar.map((b) => b.rolKodu).toSet();
    return model.sorular.where((s) => roller.contains(s.rolKodu)).toList()
      ..sort((a, b) => a.sira.compareTo(b.sira));
  }

  /// Bloklari Ingilizce sirasina gore dizer. Sira VERIDEN gelir.
  String ingilizceDiz(DusunmeOrnegi ornek) {
    final harita = {for (final b in ornek.bloklar) b.rolKodu: b.blokEn};
    return model.enSira
        .where(harita.containsKey)
        .map((r) => harita[r]!)
        .join(' ');
  }

  /// Bloklari Turkce sirasina gore dizer.
  String turkceDiz(DusunmeOrnegi ornek) {
    final harita = {for (final b in ornek.bloklar) b.rolKodu: b.blokTr};
    return model.trSira
        .where(harita.containsKey)
        .map((r) => harita[r]!)
        .join(' ');
  }

  /// Ogrencinin bir blok cevabi dogru mu?
  bool blokCevabiDogruMu(DusunmeOrnegi ornek, String rolKodu, String cevap) {
    for (final b in ornek.bloklar) {
      if (b.rolKodu == rolKodu) return norm(cevap) == norm(b.blokEn);
    }
    return false;
  }

  /// Bir rolun beklenen Ingilizce blogu.
  String? beklenenBlok(DusunmeOrnegi ornek, String rolKodu) {
    for (final b in ornek.bloklar) {
      if (b.rolKodu == rolKodu) return b.blokEn;
    }
    return null;
  }

  /// Ogrencinin dizdigi rollerin GORECELI sirasi dogru mu?
  /// Eksik rol kontrolu AYRI bir islemdir (bkz. eksikZorunluRoller).
  ({bool dogru, List<String> beklenen}) siraKontrol(List<String> verilen) {
    final beklenen = model.enSira.where(verilen.contains).toList();
    final dogru = verilen.length == beklenen.length &&
        List.generate(verilen.length, (i) => verilen[i] == beklenen[i])
            .every((x) => x);
    return (dogru: dogru, beklenen: beklenen);
  }

  /// Zorunlu ama verilmemis roller.
  List<String> eksikZorunluRoller(List<String> verilen) => model.sorular
      .where((s) => s.zorunlu && !verilen.contains(s.rolKodu))
      .map((s) => s.rolKodu)
      .toList();

  /// Bir rol kodunun zihinsel sorusu.
  ZihinselSoru? soruBul(String rolKodu) {
    for (final s in model.sorular) {
      if (s.rolKodu == rolKodu) return s;
    }
    return null;
  }
}
