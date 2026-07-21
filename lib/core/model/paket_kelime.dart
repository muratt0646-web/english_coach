/// Kelime paketi alan modeli.
///
/// Bu sinif core/ katmanindadir cunku hem PekistirmeMotoru (core/engine)
/// hem KelimeRepo (data) hem de kelime modulu kullanir.
/// VERI (40 kelimelik havuz) modules/kelime/ altindadir; core veriyi bilmez.
library;

class PaketKelime {
  final String kod;
  final String yazilis;
  final String ipa;

  /// PDF ve ekranda gosterilen okunus. Ornek: 'mor-ning'
  final String okunus;
  final String tur;

  /// 'A1' veya 'A2'. Kelime ekrani buna gore filtreler.
  final String seviye;
  final String trAnlam;
  final String ornekCumle;
  final String ornekCumleTr;
  final List<String> esAnlam;
  final List<String> zitAnlam;

  const PaketKelime({
    required this.kod,
    required this.yazilis,
    required this.ipa,
    required this.okunus,
    required this.tur,
    this.seviye = 'A1',
    required this.trAnlam,
    required this.ornekCumle,
    required this.ornekCumleTr,
    required this.esAnlam,
    required this.zitAnlam,
  });
}

/// Bir pakette bulunmasi gereken kelime sayisi (Faz 2E sartnamesi).
const int kPaketBoyu = 20;
