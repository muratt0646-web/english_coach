/// Ingilizce dusunme katmani — GENEL model.
/// Hicbir konuya ozel alan icermez. Konular VERI olarak eklenir.
library;

/// Zihinsel soru: "Kim?", "Ne yapiyor?" ...
/// rol_kodu serbesttir; motor onu yorumlamaz, yalnizca esleme icin kullanir.
class ZihinselSoru {
  final int sira;
  final String rolKodu;
  final String soruTr;
  final String? ipucu;
  final bool zorunlu;

  const ZihinselSoru({
    required this.sira,
    required this.rolKodu,
    required this.soruTr,
    required this.zorunlu,
    this.ipucu,
  });

  factory ZihinselSoru.fromRow(Map<String, Object?> r) => ZihinselSoru(
        sira: (r['sira'] as num).toInt(),
        rolKodu: r['rol_kodu'] as String,
        soruTr: r['soru_tr'] as String,
        ipucu: r['ipucu'] as String?,
        zorunlu: (r['zorunlu_mu'] as num).toInt() == 1,
      );
}

/// Anlam blogu: Turkce cumlenin bir parcasi ve Ingilizce karsiligi.
class AnlamBlogu {
  final int sira;
  final String rolKodu;
  final String blokTr;
  final String blokEn;

  const AnlamBlogu({
    required this.sira,
    required this.rolKodu,
    required this.blokTr,
    required this.blokEn,
  });

  factory AnlamBlogu.fromRow(Map<String, Object?> r) => AnlamBlogu(
        sira: (r['sira'] as num).toInt(),
        rolKodu: r['rol_kodu'] as String,
        blokTr: r['blok_tr'] as String,
        blokEn: r['blok_en'] as String,
      );
}

/// Dogru veya yanlis dusunme ornegi.
class DusunmeOrnegi {
  final String kod;
  final bool dogruMu;
  final String trCumle;
  final String enCumle;
  final String? aciklama;
  final List<AnlamBlogu> bloklar;

  const DusunmeOrnegi({
    required this.kod,
    required this.dogruMu,
    required this.trCumle,
    required this.enCumle,
    required this.bloklar,
    this.aciklama,
  });
}

/// Turkce mudahale hatasi: ana dilin Ingilizceye tasidigi refleks.
class MudahaleHatasi {
  final String kod;
  final String baslik;
  final String aciklama;
  final String yanlis;
  final String dogru;

  const MudahaleHatasi({
    required this.kod,
    required this.baslik,
    required this.aciklama,
    required this.yanlis,
    required this.dogru,
  });

  factory MudahaleHatasi.fromRow(Map<String, Object?> r) => MudahaleHatasi(
        kod: r['kod'] as String,
        baslik: r['baslik'] as String,
        aciklama: r['aciklama'] as String,
        yanlis: r['yanlis'] as String,
        dogru: r['dogru'] as String,
      );
}

/// Bir konunun dusunme modeli. Motor YALNIZCA bunu okur.
class DusunmeModeli {
  final String konuKod;
  final String ad;
  final String ozet;

  /// Rol kodlarinin Turkce cumledeki tipik sirasi.
  final List<String> trSira;

  /// Rol kodlarinin Ingilizce cumledeki sirasi. Motorun dizim kurali budur.
  final List<String> enSira;

  final List<ZihinselSoru> sorular;
  final List<DusunmeOrnegi> ornekler;
  final List<MudahaleHatasi> mudahaleler;

  const DusunmeModeli({
    required this.konuKod,
    required this.ad,
    required this.ozet,
    required this.trSira,
    required this.enSira,
    required this.sorular,
    required this.ornekler,
    required this.mudahaleler,
  });

  List<DusunmeOrnegi> get dogruOrnekler =>
      ornekler.where((o) => o.dogruMu).toList();
  List<DusunmeOrnegi> get yanlisOrnekler =>
      ornekler.where((o) => !o.dogruMu).toList();
}
