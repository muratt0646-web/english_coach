/// Hikaye modulu alan modelleri.
///
/// core/ katmanindadir: hem HikayeMotoru (core/engine) hem HikayeRepo (data)
/// hem de hikaye modulu kullanir. VERI core/content/ altindadir.
library;

/// Okuduğunu anlama soru tipleri.
enum SoruTipi { dogruYanlis, coktanSecmeli, boslukDoldurma, siralama, yazili }

extension SoruTipiAd on SoruTipi {
  String get kod => switch (this) {
        SoruTipi.dogruYanlis => 'DY',
        SoruTipi.coktanSecmeli => 'CS',
        SoruTipi.boslukDoldurma => 'BD',
        SoruTipi.siralama => 'SR',
        SoruTipi.yazili => 'YZ',
      };

  String get ad => switch (this) {
        SoruTipi.dogruYanlis => 'Dogru / Yanlis',
        SoruTipi.coktanSecmeli => 'Coktan secmeli',
        SoruTipi.boslukDoldurma => 'Bosluk doldurma',
        SoruTipi.siralama => 'Siralama',
        SoruTipi.yazili => 'Cevabi yaz',
      };

  static SoruTipi koddan(String k) => switch (k) {
        'DY' => SoruTipi.dogruYanlis,
        'CS' => SoruTipi.coktanSecmeli,
        'BD' => SoruTipi.boslukDoldurma,
        'SR' => SoruTipi.siralama,
        _ => SoruTipi.yazili,
      };
}

/// Bir kelimenin okuyucuya gore durumu.
enum KelimeDurumu {
  bilinen,      // kullanici ogrenmis
  bilinmeyen,   // sozlukte var, henuz ogrenilmemis
  notr,         // dilbilgisi kelimesi veya sozlukte yok
}

class HikayeParagraf {
  final int sira;
  final String metinEn;
  final String metinTr;
  const HikayeParagraf({
    required this.sira,
    required this.metinEn,
    required this.metinTr,
  });
}

class HikayeSorusu {
  final int sira;
  final SoruTipi tip;
  final String soru;

  /// Coktan secmeli / dogru-yanlis / siralama icin secenekler.
  final List<String> secenekler;

  /// Kabul edilen cevaplar. Siralamada tek dogru dizilim beklenir.
  final List<String> kabulEdilenler;

  final String? aciklama;

  const HikayeSorusu({
    required this.sira,
    required this.tip,
    required this.soru,
    required this.secenekler,
    required this.kabulEdilenler,
    this.aciklama,
  });

  String get kanonikCevap =>
      kabulEdilenler.isEmpty ? '' : kabulEdilenler.first;
}

class Hikaye {
  final String kod;
  final String baslik;
  final String seviye;
  final String konuEtiketi;
  final int kelimeSayisi;
  final int tahminiDk;
  final String ozetTr;

  final List<HikayeParagraf> paragraflar;
  final List<HikayeSorusu> sorular;

  /// Ozet degerlendirmesinde aranan anahtar kavramlar.
  final List<String> anahtarKavramlar;

  const Hikaye({
    required this.kod,
    required this.baslik,
    required this.seviye,
    required this.konuEtiketi,
    required this.kelimeSayisi,
    required this.tahminiDk,
    required this.ozetTr,
    required this.paragraflar,
    required this.sorular,
    required this.anahtarKavramlar,
  });
}

/// Hikayelerde gecen kelimelerin ortak sozlugu.
class SozlukGirdisi {
  final String kelime;
  final String okunus;
  final String trAnlam;
  final String ornekCumle;
  const SozlukGirdisi({
    required this.kelime,
    required this.okunus,
    required this.trAnlam,
    required this.ornekCumle,
  });
}

/// Kullanicinin bir hikayedeki ilerlemesi.
class HikayeIlerleme {
  final String hikayeKod;
  final int sonParagraf;
  final double okumaYuzdesi;
  final String durum; // baslanmadi | devam | tamamlandi
  final bool favori;
  final String? baslamaTarihi;
  final String? sonOkumaTarihi;
  final int toplamSureMs;

  const HikayeIlerleme({
    required this.hikayeKod,
    required this.sonParagraf,
    required this.okumaYuzdesi,
    required this.durum,
    required this.favori,
    required this.toplamSureMs,
    this.baslamaTarihi,
    this.sonOkumaTarihi,
  });

  factory HikayeIlerleme.bos(String kod) => HikayeIlerleme(
        hikayeKod: kod,
        sonParagraf: 0,
        okumaYuzdesi: 0,
        durum: 'baslanmadi',
        favori: false,
        toplamSureMs: 0,
      );

  factory HikayeIlerleme.fromRow(Map<String, Object?> r) => HikayeIlerleme(
        hikayeKod: r['hikaye_kod'] as String,
        sonParagraf: (r['son_paragraf'] as num).toInt(),
        okumaYuzdesi: (r['okuma_yuzdesi'] as num).toDouble(),
        durum: r['durum'] as String,
        favori: (r['favori'] as num).toInt() == 1,
        baslamaTarihi: r['baslama_tarihi'] as String?,
        sonOkumaTarihi: r['son_okuma_tarihi'] as String?,
        toplamSureMs: (r['toplam_sure_ms'] as num).toInt(),
      );
}

/// Bir okuma oturumunun istatistigi.
class HikayeIstatistik {
  final String hikayeKod;
  final String tarih;
  final int okumaSuresiMs;
  final int yeniKelime;
  final int bilinenKelime;
  final int dogru;
  final int yanlis;
  final double basariYuzdesi;

  const HikayeIstatistik({
    required this.hikayeKod,
    required this.tarih,
    required this.okumaSuresiMs,
    required this.yeniKelime,
    required this.bilinenKelime,
    required this.dogru,
    required this.yanlis,
    required this.basariYuzdesi,
  });

  factory HikayeIstatistik.fromRow(Map<String, Object?> r) => HikayeIstatistik(
        hikayeKod: r['hikaye_kod'] as String,
        tarih: r['tarih'] as String,
        okumaSuresiMs: (r['okuma_suresi_ms'] as num).toInt(),
        yeniKelime: (r['yeni_kelime'] as num).toInt(),
        bilinenKelime: (r['bilinen_kelime'] as num).toInt(),
        dogru: (r['dogru'] as num).toInt(),
        yanlis: (r['yanlis'] as num).toInt(),
        basariYuzdesi: (r['basari_yuzdesi'] as num).toDouble(),
      );
}

/// Metindeki tek bir jeton ve durumu.
class MetinJetonu {
  final String metin;
  final String sade;
  final KelimeDurumu durum;
  const MetinJetonu(this.metin, this.sade, this.durum);
}
