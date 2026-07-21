import 'package:flutter/material.dart';

/// Modulun gelistirme durumu.
/// PRODUCT_RULES K2: hazir olmayan modul GIZLENMEZ, iskelet ekrani gosterilir.
enum ModulDurumu { hazir, iskelet }

/// Bir modulun kimlik karti. YALNIZCA VERI.
///
/// PRODUCT_RULES K3/K7: burada 'kilit' veya 'onKosul' alani YOKTUR.
/// Bir modulu kilitlemek icin veri yapisinda yer bulunmamaktadir.
@immutable
class ModulKimlik {
  final String kod;
  final String ad;
  final String aciklama;
  final IconData ikon;
  final ModulDurumu durum;

  const ModulKimlik({
    required this.kod,
    required this.ad,
    required this.aciklama,
    required this.ikon,
    required this.durum,
  });

  /// PRODUCT_RULES K2'deki sekiz modul.
  static const List<ModulKimlik> tumModuller = <ModulKimlik>[
    ModulKimlik(
      kod: 'gramer',
      ad: 'Gramer ve Ingilizce Dusunme',
      aciklama: 'Cumle yapisi, dusunme sirasi ve kural tabanli tani',
      ikon: Icons.account_tree_outlined,
      durum: ModulDurumu.hazir,
    ),
    ModulKimlik(
      kod: 'kelime',
      ad: 'Kelime Akademisi',
      aciklama: 'Kelime, es anlam, zit anlam, telaffuz ve tekrar',
      ikon: Icons.style_outlined,
      durum: ModulDurumu.iskelet,
    ),
    ModulKimlik(
      kod: 'hikaye',
      ad: 'Hikayeler',
      aciklama: 'Seviyene ve ogrendigin kelimelere gore hikayeler',
      ikon: Icons.menu_book_outlined,
      durum: ModulDurumu.iskelet,
    ),
    ModulKimlik(
      kod: 'konusma',
      ad: 'Konusma',
      aciklama: 'Dinle, tekrar et, kendini kaydet ve degerlendir',
      ikon: Icons.record_voice_over_outlined,
      durum: ModulDurumu.iskelet,
    ),
    ModulKimlik(
      kod: 'senaryo',
      ad: 'Gunluk Hayat Senaryolari',
      aciklama: 'Kafe, havaalani, alisveris gibi gercek durumlar',
      ikon: Icons.forum_outlined,
      durum: ModulDurumu.iskelet,
    ),
    ModulKimlik(
      kod: 'seviye',
      ad: 'Seviye Tespit ve Eksik Analizi',
      aciklama: 'Beceri bazinda eksiklerini gorur, yol haritasi onerir',
      ikon: Icons.assessment_outlined,
      durum: ModulDurumu.iskelet,
    ),
    ModulKimlik(
      kod: 'tekrar',
      ad: 'Akilli Tekrar',
      aciklama: 'Unutmadan once tekrar: araliklarla planlanmis calisma',
      ikon: Icons.repeat_outlined,
      durum: ModulDurumu.iskelet,
    ),
    ModulKimlik(
      kod: 'ilerleme',
      ad: 'Ilerleme Merkezi',
      aciklama: 'Yedi beceride nerede oldugunu gosterir',
      ikon: Icons.insights_outlined,
      durum: ModulDurumu.iskelet,
    ),
  ];
}
