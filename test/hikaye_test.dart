import 'package:english_coach/core/content/hikaye_icerik.dart';
import 'package:english_coach/core/content/hikaye_sozluk.dart';
import 'package:english_coach/core/engine/hikaye_motoru.dart';
import 'package:english_coach/core/model/hikaye.dart';
import 'package:english_coach/data/hikaye_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

/// Faz 3A hikaye modulu testleri.
/// Bellek ici SQLite; gercek kullanici verisine DOKUNULMAZ.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  late Database db;
  late HikayeRepo repo;

  Future<Database> kur() async {
    final Database d =
        await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    // icerik tablolari (testte ATTACH yok, on ek bos)
    await d.execute('''CREATE TABLE stories(
      kod TEXT PRIMARY KEY, baslik TEXT, seviye TEXT, konu_etiketi TEXT,
      kelime_sayisi INTEGER, tahmini_dk INTEGER, ozet_tr TEXT,
      anahtar_kavramlar TEXT, arsiv INTEGER DEFAULT 0)''');
    await d.execute('''CREATE TABLE story_paragraph(
      hikaye_kod TEXT, sira INTEGER, metin_en TEXT, metin_tr TEXT,
      PRIMARY KEY(hikaye_kod, sira))''');
    await d.execute('''CREATE TABLE story_questions(
      hikaye_kod TEXT, sira INTEGER, tip TEXT, soru TEXT, secenekler TEXT,
      kabul TEXT, aciklama TEXT, PRIMARY KEY(hikaye_kod, sira))''');
    await d.execute('''CREATE TABLE hikaye_sozluk(
      kelime TEXT PRIMARY KEY, okunus TEXT, tr_anlam TEXT, ornek_cumle TEXT)''');
    // kullanici tablolari
    await d.execute('''CREATE TABLE story_progress(
      hikaye_kod TEXT PRIMARY KEY, son_paragraf INTEGER DEFAULT 0,
      okuma_yuzdesi REAL DEFAULT 0, durum TEXT DEFAULT 'baslanmadi',
      favori INTEGER DEFAULT 0, baslama_tarihi TEXT, son_okuma_tarihi TEXT,
      toplam_sure_ms INTEGER DEFAULT 0)''');
    await d.execute('''CREATE TABLE story_unknown_words(
      id INTEGER PRIMARY KEY AUTOINCREMENT, hikaye_kod TEXT, kelime TEXT,
      okunus TEXT, tr_anlam TEXT, eklenme_tarihi TEXT,
      ogrenmeye_eklendi INTEGER DEFAULT 0)''');
    await d.execute('''CREATE TABLE story_statistics(
      id INTEGER PRIMARY KEY AUTOINCREMENT, hikaye_kod TEXT, tarih TEXT,
      okuma_suresi_ms INTEGER, yeni_kelime INTEGER, bilinen_kelime INTEGER,
      dogru INTEGER, yanlis INTEGER, basari_yuzdesi REAL)''');
    await d.execute('''CREATE TABLE ogrenilen_kelime(
      kelime_id TEXT PRIMARY KEY, ingilizce TEXT)''');

    for (final SozlukGirdisi g in HikayeSozluk.girdiler) {
      await d.insert('hikaye_sozluk', <String, Object?>{
        'kelime': g.kelime.toLowerCase(), 'okunus': g.okunus,
        'tr_anlam': g.trAnlam, 'ornek_cumle': g.ornekCumle,
      });
    }
    for (final Hikaye h in HikayeIcerik.hikayeler) {
      await d.insert('stories', <String, Object?>{
        'kod': h.kod, 'baslik': h.baslik, 'seviye': h.seviye,
        'konu_etiketi': h.konuEtiketi, 'kelime_sayisi': h.kelimeSayisi,
        'tahmini_dk': h.tahminiDk, 'ozet_tr': h.ozetTr,
        'anahtar_kavramlar': h.anahtarKavramlar.join('|'), 'arsiv': 0,
      });
      for (final HikayeParagraf p in h.paragraflar) {
        await d.insert('story_paragraph', <String, Object?>{
          'hikaye_kod': h.kod, 'sira': p.sira,
          'metin_en': p.metinEn, 'metin_tr': p.metinTr,
        });
      }
      for (final HikayeSorusu q in h.sorular) {
        await d.insert('story_questions', <String, Object?>{
          'hikaye_kod': h.kod, 'sira': q.sira, 'tip': q.tip.kod,
          'soru': q.soru, 'secenekler': q.secenekler.join('|'),
          'kabul': q.kabulEdilenler.join('|'), 'aciklama': q.aciklama,
        });
      }
    }
    return d;
  }

  setUp(() async {
    db = await kur();
    repo = HikayeRepo(db, icerikOnEki: '');
  });
  tearDown(() async => db.close());

  // ---------- 1. Hikaye listeleniyor ----------
  test('3A-1 Hikayeler listeleniyor', () async {
    final List<Hikaye> l = await repo.tumHikayeler();
    expect(l.length, HikayeIcerik.hikayeler.length);
    expect(l.length, greaterThanOrEqualTo(10));
    expect(l.first.baslik.isNotEmpty, isTrue);
  });

  test('3A-1b Tum hikayeler A1 kelime araliginda (250-400)', () {
    for (final Hikaye h in HikayeIcerik.hikayeler) {
      expect(h.kelimeSayisi, inInclusiveRange(250, 400), reason: h.kod);
    }
  });

  test('3A-1c Konu etiketleri birbirini tekrar etmiyor', () {
    final Set<String> konular = HikayeIcerik.hikayeler
        .map((Hikaye h) => h.konuEtiketi)
        .toSet();
    expect(konular.length, greaterThanOrEqualTo(8),
        reason: 'farkli temalarda olmali');
  });

  // ---------- 2. Hikaye aciliyor ----------
  test('3A-2 Hikaye acilir, paragraf ve sorulari gelir', () async {
    final Hikaye? h = await repo.hikayeGetir('H-A1-001');
    expect(h, isNotNull);
    expect(h!.paragraflar.length, greaterThanOrEqualTo(4));
    expect(h.sorular.length, 5);
    expect(h.sorular.map((HikayeSorusu s) => s.tip).toSet().length, 5,
        reason: 'bes soru tipi de bulunmali');
  });

  // ---------- 3 & 4. Paragraf ilerliyor, ilerleme kaydediliyor ----------
  test('3A-3 Paragraf ilerliyor ve ilerleme kaydediliyor', () async {
    final Hikaye h = (await repo.hikayeGetir('H-A1-001'))!;
    final int toplam = h.paragraflar.length;

    expect((await repo.ilerlemeGetir(h.kod)).durum, 'baslanmadi');

    await repo.ilerlemeKaydet(
        kod: h.kod, okunanParagraf: 2, toplamParagraf: toplam,
        ekSureMs: 5000);
    HikayeIlerleme il = await repo.ilerlemeGetir(h.kod);
    expect(il.sonParagraf, 2);
    expect(il.durum, 'devam');
    expect(il.okumaYuzdesi, closeTo(2 / toplam, 0.001));
    expect(il.toplamSureMs, 5000);

    await repo.ilerlemeKaydet(
        kod: h.kod, okunanParagraf: 4, toplamParagraf: toplam,
        ekSureMs: 3000);
    il = await repo.ilerlemeGetir(h.kod);
    expect(il.sonParagraf, 4);
    expect(il.toplamSureMs, 8000, reason: 'sure birikmeli');
  });

  // ---------- 5. Devam et calisiyor ----------
  test('3A-4 Devam et: kaldigi paragraftan surer', () async {
    final Hikaye h = (await repo.hikayeGetir('H-A1-002'))!;
    await repo.ilerlemeKaydet(
        kod: h.kod, okunanParagraf: 3,
        toplamParagraf: h.paragraflar.length);

    // yeni baglanti = uygulama yeniden acildi
    final HikayeRepo yeni = HikayeRepo(db, icerikOnEki: '');
    final HikayeIlerleme il = await yeni.ilerlemeGetir(h.kod);
    expect(il.sonParagraf, 3);
    expect(il.durum, 'devam');
  });

  // ---------- 6. Bilinen kelime vurgulaniyor ----------
  group('3A-5 Kelime siniflandirma', () {
    test('Bilinen kelime BILINEN olarak isaretlenir', () {
      final KelimeDurumu d = HikayeMotoru.kelimeDurumu('coffee',
          bilinenler: <String>{'coffee'}, sozluk: <String>{'kitchen'});
      expect(d, KelimeDurumu.bilinen);
    });

    test('Sozlukteki ogrenilmemis kelime BILINMEYEN olur', () {
      final KelimeDurumu d = HikayeMotoru.kelimeDurumu('kitchen',
          bilinenler: <String>{'coffee'}, sozluk: <String>{'kitchen'});
      expect(d, KelimeDurumu.bilinmeyen);
    });

    test('Dilbilgisi kelimesi NOTR kalir', () {
      final KelimeDurumu d = HikayeMotoru.kelimeDurumu('the',
          bilinenler: <String>{'the'}, sozluk: <String>{'the'});
      expect(d, KelimeDurumu.notr);
    });

    test('Cogul bicim kok uzerinden eslesir', () {
      expect(HikayeMotoru.kokBul('books'), 'book');
      expect(HikayeMotoru.kokBul('studies'), 'study');
      expect(HikayeMotoru.kokBul('watches'), 'watch');
      final KelimeDurumu d = HikayeMotoru.kelimeDurumu('books',
          bilinenler: <String>{'book'}, sozluk: <String>{});
      expect(d, KelimeDurumu.bilinen);
    });

    test('Paragraf jetonlanir, metin bozulmaz', () {
      final List<MetinJetonu> j = HikayeMotoru.jetonla(
          'Ali drinks coffee.',
          bilinenler: <String>{'coffee'}, sozluk: <String>{});
      expect(j.length, 3);
      expect(j.map((MetinJetonu x) => x.metin).join(' '),
          'Ali drinks coffee.');
      expect(j.last.durum, KelimeDurumu.bilinen);
    });

    test('Bilinen/bilinmeyen sayimi BENZERSIZ yapilir', () async {
      final Hikaye h = (await repo.hikayeGetir('H-A1-001'))!;
      final ({int bilinen, int bilinmeyen}) s = HikayeMotoru.kelimeSayimi(
          h, bilinenler: <String>{'coffee', 'morning'},
          sozluk: HikayeSozluk.kelimeler);
      expect(s.bilinen, 2, reason: 'tekrar edenler bir kez sayilir');
      expect(s.bilinmeyen, greaterThan(0));
    });
  });

  // ---------- 7. Bilinmeyen kelime aciklamasi ----------
  test('3A-6 Bilinmeyen kelime sozlukten aciklanir ve kaydedilir', () async {
    final Map<String, SozlukGirdisi> sozluk = await repo.sozluk();
    expect(sozluk.containsKey('kitchen'), isTrue);
    expect(sozluk['kitchen']!.trAnlam, 'mutfak');
    expect(sozluk['kitchen']!.okunus.isNotEmpty, isTrue);
    expect(sozluk['kitchen']!.ornekCumle.isNotEmpty, isTrue);

    expect(
        await repo.bilinmeyenKelimeEkle(
            hikayeKod: 'H-A1-001', kelime: 'kitchen',
            okunus: 'ki-cin', trAnlam: 'mutfak'),
        isTrue);
    // ayni kelime IKINCI kez eklenmez
    expect(
        await repo.bilinmeyenKelimeEkle(
            hikayeKod: 'H-A1-001', kelime: 'kitchen'),
        isFalse);
    expect(await repo.bilinmeyenKelimeler('H-A1-001'), <String>['kitchen']);
  });

  // ---------- 8. Hikaye tamamlaniyor ----------
  test('3A-7 Son paragrafta hikaye TAMAMLANDI olur', () async {
    final Hikaye h = (await repo.hikayeGetir('H-A1-003'))!;
    await repo.ilerlemeKaydet(
        kod: h.kod,
        okunanParagraf: h.paragraflar.length,
        toplamParagraf: h.paragraflar.length);
    final HikayeIlerleme il = await repo.ilerlemeGetir(h.kod);
    expect(il.durum, 'tamamlandi');
    expect(il.okumaYuzdesi, 1.0);
  });

  // ---------- 9. Test sonuclari kaydediliyor ----------
  test('3A-8 Anlama testi sonuclari kaydediliyor', () async {
    final Hikaye h = (await repo.hikayeGetir('H-A1-001'))!;
    int dogru = 0, yanlis = 0;
    for (final HikayeSorusu s in h.sorular) {
      if (HikayeMotoru.cevapDogruMu(s, s.kanonikCevap)) {
        dogru++;
      } else {
        yanlis++;
      }
    }
    expect(dogru, 5, reason: 'kanonik cevaplar dogru kabul edilmeli');
    expect(yanlis, 0);

    await repo.istatistikKaydet(HikayeIstatistik(
      hikayeKod: h.kod, tarih: HikayeRepo.bugun(),
      okumaSuresiMs: 120000, yeniKelime: 6, bilinenKelime: 12,
      dogru: dogru, yanlis: yanlis,
      basariYuzdesi: HikayeMotoru.basariYuzdesi(dogru, yanlis),
    ));

    final List<HikayeIstatistik> l = await repo.istatistikler(h.kod);
    expect(l.length, 1);
    expect(l.first.dogru, 5);
    expect(l.first.basariYuzdesi, 1.0);
    expect(l.first.okumaSuresiMs, 120000);
  });

  test('3A-8b Yanlis cevap dogru sayilmaz', () async {
    final Hikaye h = (await repo.hikayeGetir('H-A1-001'))!;
    final HikayeSorusu s = h.sorular.first;
    expect(HikayeMotoru.cevapDogruMu(s, 'tamamen alakasiz'), isFalse);
    expect(HikayeMotoru.cevapDogruMu(s, ''), isFalse);
  });

  // ---------- 10. Kutuphane filtreleri ----------
  group('3A-9 Kutuphane', () {
    test('Arama baslik ve konuda calisir', () async {
      final List<HikayeOzet> a =
          await repo.kutuphane(filtre: const HikayeFiltre(arama: 'morning'));
      expect(a.length, greaterThanOrEqualTo(1));
      expect(a.first.hikaye.baslik.toLowerCase(), contains('morning'));
    });

    test('Seviye filtresi', () async {
      expect((await repo.kutuphane(filtre: const HikayeFiltre(seviye: 'A1'))).length,
          HikayeIcerik.hikayeler.length);
      expect((await repo.kutuphane(filtre: const HikayeFiltre(seviye: 'B2'))), isEmpty);
    });

    test('Devam edenler ve tamamlananlar ayrilir', () async {
      final Hikaye h1 = HikayeIcerik.hikayeler[0];
      final Hikaye h2 = HikayeIcerik.hikayeler[1];
      await repo.ilerlemeKaydet(
          kod: h1.kod, okunanParagraf: 2,
          toplamParagraf: h1.paragraflar.length);
      await repo.ilerlemeKaydet(
          kod: h2.kod, okunanParagraf: h2.paragraflar.length,
          toplamParagraf: h2.paragraflar.length);

      final List<HikayeOzet> devam = await repo
          .kutuphane(filtre: const HikayeFiltre(sadeceDevamEdenler: true));
      final List<HikayeOzet> bitti = await repo
          .kutuphane(filtre: const HikayeFiltre(sadeceTamamlananlar: true));
      expect(devam.map((HikayeOzet o) => o.hikaye.kod), <String>[h1.kod]);
      expect(bitti.map((HikayeOzet o) => o.hikaye.kod), <String>[h2.kod]);
    });

    test('Favori isaretlenir ve filtrelenir', () async {
      final String kod = HikayeIcerik.hikayeler.first.kod;
      expect(await repo.kutuphane(filtre: const HikayeFiltre(sadeceFavoriler: true)),
          isEmpty);
      await repo.favoriDegistir(kod);
      final List<HikayeOzet> f =
          await repo.kutuphane(filtre: const HikayeFiltre(sadeceFavoriler: true));
      expect(f.length, 1);
      expect(f.first.hikaye.kod, kod);
      await repo.favoriDegistir(kod);
      expect(await repo.kutuphane(filtre: const HikayeFiltre(sadeceFavoriler: true)),
          isEmpty);
    });

    test('Konu etiketleri listelenir', () async {
      final List<String> k = await repo.konuEtiketleri();
      expect(k.length, greaterThanOrEqualTo(8));
    });
  });

  // ---------- Ozet degerlendirme ----------
  group('3A-10 Ozet degerlendirme', () {
    test('Yeterli ozet kabul edilir', () async {
      final Hikaye h = (await repo.hikayeGetir('H-A1-001'))!;
      final OzetSonucu s = OzetDegerlendirici.degerlendir(
          'Ali wakes up in the morning and drinks coffee. '
          'Then he takes the bus to work.', h);
      expect(s.cumleSayisi, 2);
      expect(s.uzunlukUygun, isTrue);
      expect(s.kapsama, greaterThanOrEqualTo(0.5));
      expect(s.yeterli, isTrue);
    });

    test('Cok kisa ozet uyarilir', () async {
      final Hikaye h = (await repo.hikayeGetir('H-A1-001'))!;
      final OzetSonucu s = OzetDegerlendirici.degerlendir('Coffee.', h);
      expect(s.uzunlukUygun, isFalse);
      expect(s.yeterli, isFalse);
      expect(s.notlar, isNotEmpty);
    });

    test('Eksik kavramlar bildirilir', () async {
      final Hikaye h = (await repo.hikayeGetir('H-A1-001'))!;
      final OzetSonucu s = OzetDegerlendirici.degerlendir(
          'A man does something. He is happy about it.', h);
      expect(s.eksikKavramlar, isNotEmpty);
      expect(s.kapsama, lessThan(0.5));
    });
  });
}
