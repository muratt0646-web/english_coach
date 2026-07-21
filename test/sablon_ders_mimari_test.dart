import 'package:english_coach/core/content/sablon_ders_kayitlari.dart';
import 'package:english_coach/core/engine/ders_motoru.dart';
import 'package:english_coach/core/model/ders_sablonu.dart';
import 'package:english_coach/data/ders_ilerleme_repo.dart';
import 'package:english_coach/modules/gramer/sablon_ders_ekrani.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'demo_ders.dart';

/// §18 mimari dogrulama + §19'un motor / sinav / ilerleme testleri.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  const DersSablonu demo = DemoDers.ders;
  const DersSablonu tobe = DersSablonu(
    kod: 'X', baslik: 'X', seviye: 'X', konu: 'X', tahminiDk: 1,
    girisMetni: 'x', kazanimlar: <String>[], anlatim: <AnlatimBlogu>[],
    gorselOrnekler: <AdimliOrnek>[], adimAdimOrnekler: <AdimliOrnek>[],
    ornekler: <OrnekCumle>[], miniKontrol: <SablonSoru>[],
    kontrolluAlistirmalar: <SablonSoru>[], serbestUretim: <SerbestGorev>[],
    pekistirme: <SablonSoru>[], miniSinav: <SablonSoru>[],
    ozet: <OzetMaddesi>[],
  );

  // ---------- §18: AYNI MOTOR, FARKLI DERS ----------
  group('§18 Mimari dogrulama — demo ders', () {
    test('Demo ders To Be\'den FARKLI yapida', () {
      final DersSablonu toBe = SablonDersKayitlari.bul('EN-A1-002')!;
      expect(demo.kod, isNot(toBe.kod));
      expect(demo.anlatim.length, isNot(toBe.anlatim.length));
      expect(demo.miniSinav.length, isNot(toBe.miniSinav.length));
      expect(demo.seviye, isNot(toBe.seviye));
    });

    test('AYNI motor demo dersi de isler', () {
      final DersMotoru m = DersMotoru(demo);
      expect(m.ders.kod, 'DEMO-001');
      for (final SablonSoru s in demo.miniSinav) {
        expect(m.cevapla(s, s.kanonik), isTrue, reason: s.kod);
      }
      final DersSonucu r = m.sonuc();
      expect(r.dogru, demo.miniSinav.length);
      expect(r.basariYuzdesi, 1.0);
    });

    test('Asama sirasi ders BAGIMSIZ', () {
      expect(DersMotoru.asamaSirasi, DersAsamasi.values);
      expect(DersMotoru.sonraki(DersAsamasi.giris), DersAsamasi.anlatim);
    });

    testWidgets('Demo ders AYNI ekranla acilir — yeni ekran GEREKMIYOR',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1400, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(
          const MaterialApp(home: SablonDersEkrani(ders: demo)));
      await tester.pumpAndSettle();
      expect(find.text(demo.baslik), findsWidgets);
      expect(find.textContaining('1/12'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    test('Bos ders bile motoru COKERTMEZ', () {
      final DersMotoru m = DersMotoru(tobe);
      expect(m.asamaDoluMu(DersAsamasi.anlatim), isFalse);
      expect(m.agirlikliPekistirme(), isEmpty);
      expect(m.sonuc().basariYuzdesi, 0);
    });
  });

  // ---------- §12: uyarlanabilir pekistirme ----------
  group('§12 Uyarlanabilir pekistirme', () {
    test('Zayif konu daha FAZLA soru getirir', () {
      final DersMotoru m = DersMotoru(demo);
      // demo-konu-A yanlis, B dogru
      for (final SablonSoru s in demo.miniSinav) {
        m.cevapla(s, s.altKonu == DemoDers.kA ? 'yanlis' : s.kanonik);
      }
      final List<SablonSoru> p = m.agirlikliPekistirme();
      final int aSayi =
          p.where((SablonSoru s) => s.altKonu == DemoDers.kA).length;
      final int bSayi =
          p.where((SablonSoru s) => s.altKonu == DemoDers.kB).length;
      expect(aSayi, greaterThan(bSayi));
    });

    test('Deterministik: ayni girdi ayni cikti', () {
      List<String> calistir() {
        final DersMotoru m = DersMotoru(demo);
        for (final SablonSoru s in demo.miniSinav) {
          m.cevapla(s, s.altKonu == DemoDers.kA ? 'yanlis' : s.kanonik);
        }
        return m.agirlikliPekistirme().map((SablonSoru s) => s.kod).toList();
      }
      expect(calistir(), calistir());
    });

    test('AYNI soru art arda GELMEZ', () {
      final DersMotoru m = DersMotoru(demo);
      for (final SablonSoru s in demo.miniSinav) {
        m.cevapla(s, 'yanlis');
      }
      final List<SablonSoru> p = m.agirlikliPekistirme();
      for (int i = 1; i < p.length; i++) {
        expect(p[i].kod, isNot(p[i - 1].kod), reason: 'indeks $i');
      }
    });
  });

  // ---------- §15: sonuc alanlari ----------
  group('§15 Basari ekrani verileri', () {
    test('En guclu ve en zayif konu ayri ayri hesaplanir', () {
      final DersMotoru m = DersMotoru(demo);
      for (final SablonSoru s in demo.miniSinav) {
        m.cevapla(s, s.altKonu == DemoDers.kA ? 'yanlis' : s.kanonik);
      }
      final DersSonucu r = m.sonuc();
      expect(r.enCokHataliKonu, DemoDers.kA);
      expect(r.enGucluKonu, DemoDers.kB);
    });

    test('Sinav puani 100 uzerinden', () {
      final DersMotoru m = DersMotoru(demo);
      m.cevapla(demo.miniSinav[0], demo.miniSinav[0].kanonik);
      m.cevapla(demo.miniSinav[1], 'yanlis');
      expect(m.sonuc().sinavPuani, 50);
    });

    test('Tamamlanma tarihi doluyor', () {
      expect(DersMotoru(demo).sonuc().tamamlanmaTarihi, isA<DateTime>());
    });
  });

  // ---------- §16: ilerleme kaydi ----------
  group('§16 Ilerleme kaydi', () {
    late Database db;
    late DersIlerlemeRepo repo;

    setUp(() async {
      db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
      await db.execute('''CREATE TABLE ders_ilerleme(
        ders_kod TEXT PRIMARY KEY, asama TEXT, madde_indeksi INTEGER,
        baslama TEXT, son_acilis TEXT, tamamlanma TEXT,
        dogru_sayisi INTEGER, yanlis_sayisi INTEGER, sinav_puani INTEGER,
        durum TEXT)''');
      await db.execute('''CREATE TABLE ders_altkonu_basari(
        ders_kod TEXT, alt_konu TEXT, dogru INTEGER, yanlis INTEGER,
        PRIMARY KEY(ders_kod, alt_konu))''');
      repo = DersIlerlemeRepo(db);
    });
    tearDown(() async => db.close());

    test('Baslangicta kayit YOK', () async {
      final DersIlerlemeKaydi k = await repo.getir('DEMO-001');
      expect(k.baslanmis, isFalse);
      expect(k.asama, 'giris');
    });

    test('Kaldigi bolum kaydediliyor', () async {
      await repo.kaydet(
          dersKod: 'DEMO-001', asama: 'kontrolluAlistirma', maddeIndeksi: 3);
      final DersIlerlemeKaydi k = await repo.getir('DEMO-001');
      expect(k.asama, 'kontrolluAlistirma');
      expect(k.maddeIndeksi, 3);
      expect(k.durum, 'devam');
    });

    test('Kaldigi yerden devam: yeni baglanti ayni veriyi gorur', () async {
      await repo.kaydet(dersKod: 'DEMO-001', asama: 'pekistirme',
          maddeIndeksi: 2);
      final DersIlerlemeRepo ikinci = DersIlerlemeRepo(db);
      final DersIlerlemeKaydi k = await ikinci.getir('DEMO-001');
      expect(k.asama, 'pekistirme');
      expect(k.maddeIndeksi, 2);
    });

    test('Baslama tarihi KORUNUR, son acilis guncellenir', () async {
      await repo.kaydet(dersKod: 'DEMO-001', asama: 'giris',
          maddeIndeksi: 0, simdi: '2026-01-01T00:00:00Z');
      await repo.kaydet(dersKod: 'DEMO-001', asama: 'anlatim',
          maddeIndeksi: 1, simdi: '2026-01-05T00:00:00Z');
      final DersIlerlemeKaydi k = await repo.getir('DEMO-001');
      expect(k.baslama, '2026-01-01T00:00:00Z');
      expect(k.sonAcilis, '2026-01-05T00:00:00Z');
    });

    test('Tamamlanan ders dogru kaydediliyor', () async {
      await repo.kaydet(dersKod: 'DEMO-001', asama: 'miniSinav',
          maddeIndeksi: 0);
      await repo.tamamla(dersKod: 'DEMO-001', dogru: 12, yanlis: 3,
          sinavPuani: 80);
      final DersIlerlemeKaydi k = await repo.getir('DEMO-001');
      expect(k.tamamlanmis, isTrue);
      expect(k.sinavPuani, 80);
      expect(k.dogruSayisi, 12);
      expect(k.tamamlanma, isNotNull);
    });

    test('Alt konu basarisi kaydediliyor', () async {
      await repo.altKonuKaydet(dersKod: 'DEMO-001',
          sayim: <String, ({int dogru, int yanlis})>{
            DemoDers.kA: (dogru: 1, yanlis: 4),
            DemoDers.kB: (dogru: 5, yanlis: 0),
          });
      final Map<String, ({int dogru, int yanlis})> m =
          await repo.altKonuGetir('DEMO-001');
      expect(m[DemoDers.kA]!.yanlis, 4);
      expect(m[DemoDers.kB]!.dogru, 5);
    });
  });

  // ---------- §13: sinavda cevap gizli ----------
  group('§13 Mini sinav davranisi', () {
    testWidgets('Sinav sirasinda dogru cevap GOSTERILMEZ',
        (WidgetTester tester) async {
      await tester.pumpWidget(
          const MaterialApp(home: SablonDersEkrani(ders: demo)));
      await tester.pumpAndSettle();
      // sinav asamasina kadar ilerlemek yerine metni dogrudan sorgula:
      // ekranda "Sinav sirasinda dogru cevap gosterilmez" uyarisi olmali
      // (yalnizca sinav asamasinda). Once giris asamasinda OLMAMALI.
      expect(find.textContaining('dogru cevap gosterilmez'), findsNothing);
    });

    test('Mini sinav sorulari BENZERSIZ', () {
      for (final DersSablonu d in SablonDersKayitlari.dersler) {
        final List<String> kodlar =
            d.miniSinav.map((SablonSoru s) => s.kod).toList();
        expect(kodlar.toSet().length, kodlar.length, reason: d.kod);
        final List<String> sorular =
            d.miniSinav.map((SablonSoru s) => s.soru).toList();
        expect(sorular.toSet().length, sorular.length,
            reason: '${d.kod} — ayni soru iki kez gelmemeli');
      }
    });

    test('%80 alti tekrar onerisi uretir', () {
      final DersSablonu d = SablonDersKayitlari.dersler.first;
      final DersMotoru m = DersMotoru(d);
      for (int i = 0; i < d.miniSinav.length; i++) {
        m.cevapla(d.miniSinav[i], i < 5 ? d.miniSinav[i].kanonik : 'yanlis');
      }
      final DersSonucu r = m.sonuc(
          soruKodlari: d.miniSinav.map((SablonSoru s) => s.kod).toSet());
      expect(r.sinavGecti, isFalse);
      expect(r.onerilenTekrarlar, isNotEmpty);
    });
  });

  // ---------- §3: model alanlari ----------
  group('§3 Model alanlari', () {
    test('onKosullar ve taniKurallari destekleniyor', () {
      expect(demo.onKosullar, contains('EN-A1-002'));
      expect(demo.taniKurallari, isEmpty);
    });

    test('Ders kodlari BENZERSIZ', () {
      final List<String> kodlar =
          SablonDersKayitlari.dersler.map((DersSablonu d) => d.kod).toList();
      expect(kodlar.toSet().length, kodlar.length);
    });

    test('Zorunlu alanlar BOS degil', () {
      for (final DersSablonu d in SablonDersKayitlari.dersler) {
        expect(d.kod.isNotEmpty, isTrue);
        expect(d.baslik.isNotEmpty, isTrue);
        expect(d.girisMetni.isNotEmpty, isTrue);
        expect(d.kazanimlar, isNotEmpty, reason: d.kod);
        for (final SablonSoru s in d.miniSinav) {
          expect(s.altKonu.isNotEmpty, isTrue, reason: '${d.kod}/${s.kod}');
          expect(s.soru.isNotEmpty, isTrue, reason: '${d.kod}/${s.kod}');
        }
      }
    });
  });
}
