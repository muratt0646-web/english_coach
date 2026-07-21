import 'package:flutter_test/flutter_test.dart';
import 'package:english_coach/core/engine/tani_motoru.dart';
import 'package:english_coach/core/engine/normalizer.dart';

/// tool/tani_motoru_v3_dogrulama.py ile BIREBIR AYNI vakalar.
/// Faz 2C istenen 10 test + onceki surumlerin regresyonu.
void main() {
  const anlamlar = {
    'morning': 'sabah', 'day': 'gun', 'coffee': 'kahve', 'tea': 'cay',
    'water': 'su', 'books': 'kitaplar',
  };

  // Faz 2C sec.5 kabul modeli
  // ders_en_a1_001.dart CT-02 ile AYNI kabul kumesi.
  // Normalizer noktalamayi sildigi icin virgullu bicim ayri kayit DEGILDIR;
  // notu 'Every morning I drink coffee.' kaydina baglidir.
  final kahve = <KabulCevabi>[
    const KabulCevabi('I drink coffee every morning.', KabulTipi.ana),
    const KabulCevabi('Every morning I drink coffee.', KabulTipi.alternatif,
        'Virgul kullanimi da dogrudur; zaman ifadesi basa da alinabilir.'),
    const KabulCevabi('I drink coffee in the morning.', KabulTipi.alternatif,
        'Bu da dogru; "every morning" daha yaygin.'),
    const KabulCevabi('I drink coffee every day.', KabulTipi.anlamFarkli,
        "Dilbilgisi dogru, ancak 'every day' = her gun."),
  ];

  TaniSonucu d(String cevap, [List<KabulCevabi>? k]) =>
      TaniMotoru.degerlendirTipli(
        kullaniciCevabi: cevap,
        kabuller: k ?? kahve,
        kelimeAnlamlari: anlamlar,
      );

  List<KabulCevabi> tek(String c) => [KabulCevabi(c, KabulTipi.ana)];

  // ================= FAZ 2C — ISTENEN 10 TEST =================

  test('2C-1  Tam dogru cevap', () {
    final s = d('I drink coffee every morning.');
    expect(s.dogru, isTrue);
    expect(s.kategori, HataKategorisi.hataYok);
  });

  test('2C-2  Alternatif dogru kelime sirasi', () {
    final s = d('Every morning I drink coffee.');
    expect(s.dogru, isTrue);
    expect(s.kategori, HataKategorisi.kabulEdilebilirAlternatif);
    expect(s.not, isNotNull, reason: 'alternatifin notu tasinmali');
  });

  test('2C-3  day / morning anlam farki — TANI_KONULAMADI DEGIL', () {
    final s = d('Every day I drink coffee');
    expect(s.dogru, isFalse);
    expect(s.guven, TaniGuveni.kesin,
        reason: 'TANI_KONULAMADI uretmemeli');
    expect(s.kategori, HataKategorisi.kelimeSecimi);
    expect(s.gramerDogru, isTrue, reason: 'Gramer yapin dogru');
    expect(s.beklenenIfade, 'every morning', reason: 'IFADE duzeyi');
    expect(s.yazilanIfade, 'every day');
    expect(s.kategoriEtiketi, 'KELIME_SECIMI / ANLAM_FARKI');
    expect(s.neden, contains('sabah'));
    expect(s.neden, contains('gun'));
  });

  test('2C-3b Yazarin isaretledigi anlam farki', () {
    final s = d('I drink coffee every day.');
    expect(s.dogru, isFalse, reason: 'anlam farkli DOGRU sayilmaz');
    expect(s.kategori, HataKategorisi.anlamFarki);
    expect(s.gramerDogru, isTrue);
    expect(s.neden, contains('her gun'));
  });

  test('2C-4  Turkce kelime sirasi etkisi', () {
    final s = d('I coffee drink every morning.');
    expect(s.kategori, HataKategorisi.kelimeSirasi);
    expect(s.gramerDogru, isFalse);
  });

  test('2C-5  Eksik ozne', () {
    final s = d('Am coming.', tek('I am coming.'));
    expect(s.kategori, HataKategorisi.gramerHatasi);
    expect(s.hataKodu, 'SU-01');
    expect(s.beklenenIfade, 'i');
  });

  test('2C-6  Eksik fiil (be)', () {
    final s = d('She happy.', tek('She is happy.'));
    expect(s.kategori, HataKategorisi.gramerHatasi);
    expect(s.hataKodu, 'BE-01');
  });

  test('2C-6b Genel eksik kelime', () {
    final s = d('I drink every morning');
    expect(s.kategori, HataKategorisi.eksikKelime);
    expect(s.hataKodu, 'EKS-01');
  });

  test('2C-7  Fazla kelime', () {
    final s = d('I drink hot coffee every morning');
    expect(s.kategori, HataKategorisi.fazlaKelime);
    expect(s.hataKodu, 'FAZ-01');
    expect(s.yazilanIfade, contains('hot'));
  });

  test('2C-8  Kucuk yazim hatasi', () {
    final s = d('I drink cofee every morning.');
    expect(s.kategori, HataKategorisi.yazimHatasi);
    expect(s.gramerDogru, isTrue);
  });

  test('2C-9  Buyuk harf ve noktalama toleransi', () {
    expect(d('i drink coffee every morning').dogru, isTrue);
    expect(d('I  drink   coffee every morning').dogru, isTrue);
  });

  test('2C-10 Gercekten siniflandirilamayan cevap', () {
    final s = d('hello world');
    expect(s.guven, TaniGuveni.yok);
    expect(s.kategori, HataKategorisi.taniKonulamadi);
    expect(s.neden, isNull, reason: 'aciklama UYDURULMAMALI');
  });

  test('2C-10b Bos cevap', () {
    final s = d('');
    expect(s.kategori, HataKategorisi.taniKonulamadi);
    expect(s.neden, isNull);
  });

  test('2C-11 Kabul edilebilir alternatif + not', () {
    // Virgullu ve virgulsuz bicim AYNI kabul kaydina duser (normalizasyon).
    // Her iki yazimda da nota ulasilmalidir.
    for (final yazim in const [
      'Every morning, I drink coffee.',
      'Every morning I drink coffee.',
    ]) {
      final s = d(yazim);
      expect(s.dogru, isTrue, reason: yazim);
      expect(s.kategori, HataKategorisi.kabulEdilebilirAlternatif,
          reason: yazim);
      expect(s.not, isNotNull, reason: 'not_tr kaybolmamali: $yazim');
      expect(s.not, contains('Virgul'), reason: yazim);
    }
  });

  // ================= REGRESYON (onceki surumler) =================

  group('Regresyon — gramer kurallari', () {
    test('AGR-01 3. tekil -s', () {
      final s = d('He work here.', tek('He works here.'));
      expect(s.kategori, HataKategorisi.gramerHatasi);
      expect(s.hataKodu, 'AGR-01');
    });
    test('ART-01 artikel eksik', () {
      expect(d('I saw dog.', tek('I saw a dog.')).hataKodu, 'ART-01');
    });
    test('ART-02 artikel yanlis', () {
      expect(d('I saw the dog.', tek('I saw a dog.')).hataKodu, 'ART-02');
    });
    test('PREP-01 edat yanlis', () {
      expect(d('I am in the bus.', tek('I am on the bus.')).hataKodu,
          'PREP-01');
    });
    test('AUX-01 do eksik', () {
      expect(d('I not like coffee.', tek('I do not like coffee.')).hataKodu,
          'AUX-01');
    });
    test('WO-01 SOV sirasi', () {
      final s = d('I books read.', tek('I read books.'));
      expect(s.hataKodu, 'WO-01');
      expect(s.kategori, HataKategorisi.kelimeSirasi);
      expect(s.kokNeden, 'L1_transfer');
    });
  });

  group('Regresyon — normalizer', () {
    test('kisaltma acilir',
        () => expect(Normalizer.normalize("I'm coming."), 'i am coming'));
    test('ustalik carpani KESIN=1.0',
        () => expect(d('I books read.', tek('I read books.')).kokNedenCarpani, 1.0));
    test('ustalik carpani YOK=0.5',
        () => expect(d('hello world').kokNedenCarpani, 0.5));
  });

  group('Geriye donuk uyum — duz metin kabul listesi', () {
    test('eski degerlendir() imzasi calisir', () {
      final s = TaniMotoru.degerlendir(
        kullaniciCevabi: 'I read books.',
        kabulCevaplari: const ['I read books.'],
      );
      expect(s.dogru, isTrue);
    });
  });
}
