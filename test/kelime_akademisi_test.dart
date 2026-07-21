import 'package:english_coach/core/engine/pekistirme_motoru.dart';
import 'package:english_coach/core/model/paket_kelime.dart';
import 'package:english_coach/data/kelime_repo.dart';
import 'package:english_coach/modules/kelime/kelime_ornek_veri.dart';
import 'package:english_coach/modules/kelime/kelime_pdf.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

/// Faz 2E testleri. Veritabani BELLEK ICI acilir; gercek kullanici
/// verisine DOKUNULMAZ.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  late Database db;
  late KelimeRepo repo;

  Future<Database> bellekVeritabani() async {
    final Database d = await databaseFactoryFfi.openDatabase(
      inMemoryDatabasePath,
    );
    await d.execute('''
      CREATE TABLE ogrenilen_kelime (
        kelime_id             TEXT PRIMARY KEY,
        ingilizce             TEXT NOT NULL,
        okunus                TEXT NOT NULL,
        turkce_anlam          TEXT NOT NULL,
        paket_id              INTEGER NOT NULL,
        ogrenilme_tarihi      TEXT NOT NULL,
        son_tekrar_tarihi     TEXT,
        sonraki_tekrar_tarihi TEXT NOT NULL,
        tekrar_sayisi         INTEGER NOT NULL DEFAULT 0,
        dogru_sayisi          INTEGER NOT NULL DEFAULT 0,
        yanlis_sayisi         INTEGER NOT NULL DEFAULT 0,
        durum                 TEXT NOT NULL DEFAULT 'ogrenildi')''');
    await d.execute('''
      CREATE TABLE pekistirme_sonucu (
        id            INTEGER PRIMARY KEY AUTOINCREMENT,
        paket_id      INTEGER NOT NULL,
        etkinlik_kodu TEXT NOT NULL,
        kelime_id     TEXT NOT NULL,
        dogru_mu      INTEGER NOT NULL,
        tarih         TEXT NOT NULL)''');
    return d;
  }

  setUp(() async {
    db = await bellekVeritabani();
    repo = KelimeRepo(db);
  });

  tearDown(() async => db.close());

  Future<void> paketiOgren(int paketId, {int adet = 20}) async {
    final List<PaketKelime> paket = KelimeOrnekVeri.paket(paketId);
    for (final PaketKelime k in paket.take(adet)) {
      await repo.ogrendimIsaretle(k, paketId: paketId);
    }
  }

  // ---------- 1. Paket tam 20 kelime ----------
  test('2E-1 Her paket tam 20 kelime icerir', () {
    expect(KelimeOrnekVeri.paketBoyu, 20);
    expect(KelimeOrnekVeri.paketSayisi, greaterThanOrEqualTo(2));
    for (int p = 1; p <= KelimeOrnekVeri.paketSayisi; p++) {
      expect(KelimeOrnekVeri.paket(p).length, 20, reason: 'paket $p');
    }
  });

  // ---------- 2. Ogrendim -> SQLite ----------
  test('2E-2 "Ogrendim" kelimeyi SQLite\'a yazar', () async {
    final PaketKelime k = KelimeOrnekVeri.paket(1).first;
    expect(await repo.ogrenildiMi(k.kod), isFalse);
    final bool yeni = await repo.ogrendimIsaretle(k, paketId: 1);
    expect(yeni, isTrue);
    expect(await repo.ogrenildiMi(k.kod), isTrue);
    expect(await repo.toplamOgrenilen(), 1);

    final List<OgrenilenKelime> l = await repo.ogrenilenler();
    expect(l.first.ingilizce, k.yazilis);
    expect(l.first.okunus, k.okunus);
    expect(l.first.turkceAnlam, k.trAnlam);
  });

  // ---------- 3. Ayni kelime iki kez eklenmez ----------
  test('2E-3 Ayni kelime iki kez EKLENMEZ', () async {
    final PaketKelime k = KelimeOrnekVeri.paket(1).first;
    expect(await repo.ogrendimIsaretle(k, paketId: 1), isTrue);
    expect(await repo.ogrendimIsaretle(k, paketId: 1), isFalse);
    expect(await repo.ogrendimIsaretle(k, paketId: 1), isFalse);
    expect(await repo.toplamOgrenilen(), 1);
  });

  // ---------- 4. 20/20 olmadan pekistirme acilmaz ----------
  test('2E-4 19/20 iken pekistirme KAPALI, 20/20 iken ACIK', () async {
    await paketiOgren(1, adet: 19);
    expect(await repo.paketOgrenilenSayisi(1), 19);
    expect(await repo.pekistirmeAcikMi(1), isFalse);

    await paketiOgren(1);
    expect(await repo.paketOgrenilenSayisi(1), 20);
    expect(await repo.pekistirmeAcikMi(1), isTrue);
  });

  // ---------- 5. Sekiz etkinlik calisir ----------
  test('2E-5 Sekiz etkinligin tamami soru uretir', () {
    final PekistirmeMotoru m = PekistirmeMotoru(KelimeOrnekVeri.paket(1));
    expect(EtkinlikTipi.values.length, 8);
    for (final EtkinlikTipi tip in EtkinlikTipi.values) {
      final List<PekistirmeSorusu> sorular = m.etkinlikUret(tip);
      expect(sorular, isNotEmpty, reason: tip.kod);
      for (final PekistirmeSorusu s in sorular) {
        expect(s.soru.isNotEmpty, isTrue, reason: tip.kod);
        expect(s.kabulEdilenler, isNotEmpty, reason: tip.kod);
        expect(s.dogruMu(s.kanonikCevap), isTrue, reason: tip.kod);
      }
    }
  });

  test('2E-5b Sorular YALNIZCA paketin kelimelerinden uretilir', () {
    final List<PaketKelime> paket = KelimeOrnekVeri.paket(1);
    final Set<String> kodlar =
        paket.map((PaketKelime k) => k.kod).toSet();
    final PekistirmeMotoru m = PekistirmeMotoru(paket);
    for (final EtkinlikTipi tip in EtkinlikTipi.values) {
      for (final PekistirmeSorusu s in m.etkinlikUret(tip)) {
        expect(kodlar.contains(s.kelimeKod), isTrue, reason: tip.kod);
      }
    }
  });

  // ---------- 6. Kelime listesi kalici ----------
  test('2E-6 Kelime listesi kalicidir (yeni baglanti ayni veriyi gorur)',
      () async {
    await paketiOgren(1, adet: 5);
    final KelimeRepo ikinci = KelimeRepo(db);
    expect(await ikinci.toplamOgrenilen(), 5);
  });

  // ---------- 7. Arama / siralama / filtre ----------
  group('2E-7 Arama, siralama ve filtreleme', () {
    setUp(() async {
      await paketiOgren(1);
      await paketiOgren(2);
    });

    test('Arama Ingilizce ve Turkce anlamda calisir', () async {
      final List<OgrenilenKelime> a = await repo.ogrenilenler(arama: 'morning');
      expect(a.length, 1);
      expect(a.first.ingilizce, 'morning');

      final List<OgrenilenKelime> b = await repo.ogrenilenler(arama: 'kahve');
      expect(b.length, 1);
      expect(b.first.ingilizce, 'coffee');
    });

    test('Alfabetik siralama', () async {
      final List<OgrenilenKelime> l =
          await repo.ogrenilenler(siralama: KelimeSiralama.alfabetik);
      final List<String> adlar =
          l.map((OgrenilenKelime k) => k.ingilizce.toLowerCase()).toList();
      final List<String> sirali = List<String>.from(adlar)..sort();
      expect(adlar, sirali);
    });

    test('Paket filtresi', () async {
      expect((await repo.ogrenilenler(paketId: 1)).length, 20);
      expect((await repo.ogrenilenler(paketId: 2)).length, 20);
      expect((await repo.ogrenilenler()).length, 40);
    });
  });

  // ---------- 8. PDF yalnizca uc sutun ----------
  test('2E-8 PDF satirlari YALNIZCA Ingilizce, okunus ve anlam icerir',
      () async {
    await paketiOgren(1, adet: 3);
    final List<OgrenilenKelime> l = await repo.ogrenilenler();
    final List<PdfSatir> satirlar = KelimePdf.satirlariHazirla(l);
    expect(satirlar.length, 3);
    for (int i = 0; i < satirlar.length; i++) {
      expect(satirlar[i].ingilizce, l[i].ingilizce);
      expect(satirlar[i].okunus, l[i].okunus);
      expect(satirlar[i].turkce, l[i].turkceAnlam);
    }
  });

  test('2E-8b PDF Turkce karakterleri guvenli ASCII\'ye cevirir', () {
    expect(KelimePdf.asciiye('ogrenci sirket'), 'ogrenci sirket');
    expect(KelimePdf.asciiye('öğrenci şirket'), 'ogrenci sirket');
    expect(KelimePdf.asciiye('İIıi'), 'IIii');
  });

  // ---------- 9. PDF pakete gore filtrelenir ----------
  test('2E-9 PDF secilen pakete gore filtrelenir', () async {
    await paketiOgren(1);
    await paketiOgren(2);
    final List<PdfSatir> p1 =
        KelimePdf.satirlariHazirla(await repo.ogrenilenler(paketId: 1));
    final List<PdfSatir> p2 =
        KelimePdf.satirlariHazirla(await repo.ogrenilenler(paketId: 2));
    final List<PdfSatir> hepsi =
        KelimePdf.satirlariHazirla(await repo.ogrenilenler());
    expect(p1.length, 20);
    expect(p2.length, 20);
    expect(hepsi.length, 40);
    final Set<String> p1Ad =
        p1.map((PdfSatir s) => s.ingilizce).toSet();
    expect(p1Ad.contains('morning'), isTrue);
    expect(p1Ad.contains('city'), isFalse);
  });

  // ---------- 10. Tekrar tarihleri ----------
  group('2E-10 Aralikli tekrar', () {
    test('Araliklar 1, 3, 7, 14, 30 gundur', () {
      expect(KelimeRepo.tekrarAraliklari, <int>[1, 3, 7, 14, 30]);
    });

    test('Dogru cevap araligi uzatir', () async {
      final DateTime t0 = DateTime.utc(2026, 1, 1);
      final PaketKelime k = KelimeOrnekVeri.paket(1).first;
      await repo.ogrendimIsaretle(k, paketId: 1, simdi: t0);

      List<OgrenilenKelime> l = await repo.ogrenilenler();
      expect(l.first.sonrakiTekrarTarihi, '2026-01-02'); // +1

      await repo.cevapKaydet(
          kelimeId: k.kod, dogruMu: true, paketId: 1,
          etkinlikKodu: 'E1-EN-TR', simdi: t0);
      l = await repo.ogrenilenler();
      expect(l.first.tekrarSayisi, 1);
      expect(l.first.sonrakiTekrarTarihi, '2026-01-04'); // +3

      await repo.cevapKaydet(
          kelimeId: k.kod, dogruMu: true, paketId: 1,
          etkinlikKodu: 'E1-EN-TR', simdi: t0);
      l = await repo.ogrenilenler();
      expect(l.first.sonrakiTekrarTarihi, '2026-01-08'); // +7
    });

    test('Yanlis cevap kelimeyi ERKEN geri getirir', () async {
      final DateTime t0 = DateTime.utc(2026, 1, 1);
      final PaketKelime k = KelimeOrnekVeri.paket(1).first;
      await repo.ogrendimIsaretle(k, paketId: 1, simdi: t0);
      for (int i = 0; i < 3; i++) {
        await repo.cevapKaydet(
            kelimeId: k.kod, dogruMu: true, paketId: 1,
            etkinlikKodu: 'E1-EN-TR', simdi: t0);
      }
      expect((await repo.ogrenilenler()).first.sonrakiTekrarTarihi,
          '2026-01-15'); // +14

      await repo.cevapKaydet(
          kelimeId: k.kod, dogruMu: false, paketId: 1,
          etkinlikKodu: 'E1-EN-TR', simdi: t0);
      final OgrenilenKelime son = (await repo.ogrenilenler()).first;
      expect(son.sonrakiTekrarTarihi, '2026-01-02'); // +1
      expect(son.durum, 'tekrar_gerekli');
      expect(son.yanlisSayisi, 1);
    });

    test('Tekrar gerekenler filtresi calisir', () async {
      final DateTime t0 = DateTime.utc(2026, 1, 1);
      await paketiOgren(1, adet: 3);
      final List<OgrenilenKelime> vadesi = await repo.ogrenilenler(
          sadeceTekrarGerekenler: true,
          simdi: t0.add(const Duration(days: 400)));
      expect(vadesi.length, 3);
      final List<OgrenilenKelime> henuz = await repo.ogrenilenler(
          sadeceTekrarGerekenler: true, simdi: DateTime.utc(2020, 1, 1));
      expect(henuz, isEmpty);
    });

    test('Zorlanilan kelimeler raporlanir', () async {
      final PaketKelime k = KelimeOrnekVeri.paket(1).first;
      await repo.ogrendimIsaretle(k, paketId: 1);
      await repo.cevapKaydet(
          kelimeId: k.kod, dogruMu: false, paketId: 1,
          etkinlikKodu: 'E3-BOSLUK');
      expect(await repo.zorlanilanKelimeler(1), <String>[k.kod]);
    });
  });
}
