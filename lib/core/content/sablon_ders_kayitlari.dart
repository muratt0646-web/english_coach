/// Sablon derslerin KAYIT DEFTERI.
///
/// Yeni ders eklemek icin: iceriği yaz, buraya bir satir ekle. BITTI.
/// Motor, ekran ve testler DEGISMEZ.
library;

import '../model/ders_sablonu.dart';
import 'ders_en_a1_002.dart';
import 'ders_en_a1_003.dart';
import 'ders_en_a1_004.dart';
import 'ders_en_a1_010.dart';
import 'ders_en_a1_011.dart';
import 'ders_en_a1_012.dart';
import 'ders_en_a1_019.dart';
import 'ders_en_a1_020.dart';
import 'ders_en_a1_021.dart';
import 'ders_en_a1_022.dart';
import 'ders_en_a1_023.dart';
import 'ders_en_a1_030.dart';
import 'ders_en_a2_001.dart';
import 'ders_en_a2_002.dart';
import 'ders_en_a2_003.dart';
import 'ders_en_a2_004.dart';
import 'ders_en_a2_005.dart';
import 'ders_en_a2_006.dart';
import 'ders_en_a2_007.dart';
import 'ders_en_a2_008.dart';
import 'ders_en_a2_009.dart';
import 'ders_en_a2_010.dart';
import 'ders_en_a2_011.dart';
import 'ders_en_a2_012.dart';
import 'ders_en_a2_013.dart';
import 'ders_en_a2_014.dart';
import 'ders_en_a2_015.dart';
import 'ders_en_a2_016.dart';
import 'ders_en_a2_017.dart';
import 'ders_en_a2_018.dart';
import 'ders_en_a2_019.dart';
import 'ders_en_a2_020.dart';
import 'ders_en_b1_001.dart';       
import 'ders_en_b1_002.dart';


class SablonDersKayitlari {
  const SablonDersKayitlari._();

  static const List<DersSablonu> dersler = <DersSablonu>[
    DersEnA1002.ders,
    DersEnA1003.ders,
    DersEnA1004.ders,
    DersEnA1010.ders,
    DersEnA1011.ders,
    DersEnA1012.ders,
    DersEnA1019.ders,
    DersEnA1020.ders,
    DersEnA1021.ders,
    DersEnA1022.ders,
    DersEnA1023.ders,
    DersEnA1030.ders,

    // ===== A2 =====
    DersEnA2001.ders,
    DersEnA2002.ders,
    DersEnA2003.ders,
    DersEnA2004.ders,
    DersEnA2005.ders,
    DersEnA2006.ders,
    DersEnA2007.ders,
    DersEnA2008.ders,
    DersEnA2009.ders,
    DersEnA2010.ders,
    DersEnA2011.ders,
    DersEnA2012.ders,
    DersEnA2013.ders,
    DersEnA2014.ders,
    DersEnA2015.ders,
    DersEnA2016.ders,
    DersEnA2017.ders,
    DersEnA2018.ders,
    DersEnA2019.ders,
    DersEnA2020.ders,
      // ===== B1 =====
    DersEnB1001.ders, 
    DersEnB1002.ders,
    // Yeni ders buraya eklenir:
    // DersEnA2001.ders,
  ];

  static DersSablonu? bul(String kod) {
    for (final DersSablonu d in dersler) {
      if (d.kod == kod) return d;
    }
    return null;
  }
}
