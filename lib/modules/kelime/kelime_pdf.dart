import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../data/kelime_repo.dart';

/// PDF'e yazilacak TEK satir. Sartname geregi YALNIZCA UC SUTUN.
class PdfSatir {
  final String ingilizce;
  final String okunus;
  final String turkce;
  const PdfSatir(this.ingilizce, this.okunus, this.turkce);
}

/// Ogrenilen kelimelerin PDF ciktisi.
///
/// CEVRIMDISI: 'pdf' paketi saf Dart'tir, ag kullanmaz.
/// Dosya yazimi dart:io + path_provider ile yapilir; 'printing' paketi
/// KULLANILMAZ (platform eklentisi getirir).
class KelimePdf {
  const KelimePdf._();

  /// Sartname: PDF'de yalnizca Ingilizce, okunus ve Turkce anlam bulunur.
  static List<PdfSatir> satirlariHazirla(List<OgrenilenKelime> kelimeler) {
    return kelimeler
        .map((OgrenilenKelime k) =>
            PdfSatir(k.ingilizce, k.okunus, k.turkceAnlam))
        .toList(growable: false);
  }

  /// Varsayilan PDF fontlari Turkce karakterleri tasimaz.
  /// Font gomulene kadar guvenli ASCII karsiligina cevrilir.
  static String asciiye(String s) {
    const Map<String, String> harita = <String, String>{
      'ç': 'c', 'Ç': 'C', 'ğ': 'g', 'Ğ': 'G', 'ı': 'i', 'İ': 'I',
      'ö': 'o', 'Ö': 'O', 'ş': 's', 'Ş': 'S', 'ü': 'u', 'Ü': 'U',
      'â': 'a', 'î': 'i', 'û': 'u',
    };
    final StringBuffer b = StringBuffer();
    for (final int rune in s.runes) {
      final String c = String.fromCharCode(rune);
      b.write(harita[c] ?? (rune > 127 ? '?' : c));
    }
    return b.toString();
  }

  static String dosyaAdi({DateTime? simdi}) {
    final DateTime t = simdi ?? DateTime.now();
    final String g = '${t.year.toString().padLeft(4, '0')}-'
        '${t.month.toString().padLeft(2, '0')}-'
        '${t.day.toString().padLeft(2, '0')}';
    return 'english_coach_kelimeler_$g.pdf';
  }

  /// PDF baytlarini uretir. Sade ve yazdirilabilir.
  static Future<Uint8List> uret(
    List<PdfSatir> satirlar, {
    String baslik = 'Ogrendigim Kelimeler',
    String? altBaslik,
  }) async {
    final pw.Document belge = pw.Document();

    pw.Widget hucre(String metin, {bool baslikMi = false}) => pw.Padding(
          padding: const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 5),
          child: pw.Text(
            asciiye(metin),
            style: pw.TextStyle(
              fontSize: baslikMi ? 11 : 10,
              fontWeight: baslikMi ? pw.FontWeight.bold : pw.FontWeight.normal,
            ),
          ),
        );

    final List<pw.TableRow> satirWidgetlari = <pw.TableRow>[
      pw.TableRow(
        decoration: const pw.BoxDecoration(color: PdfColors.grey300),
        children: <pw.Widget>[
          hucre('Ingilizce', baslikMi: true),
          hucre('Okunus', baslikMi: true),
          hucre('Turkce', baslikMi: true),
        ],
      ),
      ...satirlar.map((PdfSatir s) => pw.TableRow(
            children: <pw.Widget>[
              hucre(s.ingilizce),
              hucre(s.okunus),
              hucre(s.turkce),
            ],
          )),
    ];

    belge.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context ctx) => <pw.Widget>[
          pw.Text(asciiye(baslik),
              style: const pw.TextStyle(
                  fontSize: 18, fontWeight: pw.FontWeight.bold)),
          if (altBaslik != null)
            pw.Padding(
              padding: const pw.EdgeInsets.only(top: 4),
              child: pw.Text(asciiye(altBaslik),
                  style: const pw.TextStyle(fontSize: 10)),
            ),
          pw.SizedBox(height: 14),
          pw.Table(
            border: pw.TableBorder.all(width: 0.5, color: PdfColors.grey600),
            columnWidths: const <int, pw.TableColumnWidth>{
              0: pw.FlexColumnWidth(3),
              1: pw.FlexColumnWidth(3),
              2: pw.FlexColumnWidth(4),
            },
            children: satirWidgetlari,
          ),
          pw.SizedBox(height: 10),
          pw.Text('Toplam ${satirlar.length} kelime',
              style: const pw.TextStyle(fontSize: 9)),
        ],
      ),
    );

    return belge.save();
  }

  /// PDF'i belgeler dizinine yazar ve tam yolu doner.
  static Future<String> kaydet(
    List<PdfSatir> satirlar, {
    String baslik = 'Ogrendigim Kelimeler',
    String? altBaslik,
    DateTime? simdi,
  }) async {
    final Uint8List baytlar =
        await uret(satirlar, baslik: baslik, altBaslik: altBaslik);
    final Directory dizin = await getApplicationDocumentsDirectory();
    final String yol = p.join(dizin.path, dosyaAdi(simdi: simdi));
    final File dosya = File(yol);
    await dosya.writeAsBytes(baytlar, flush: true);
    return yol;
  }
}
