import 'package:english_coach/core/engine/ders_motoru.dart';
import 'package:english_coach/core/engine/normalizer.dart';
import 'package:english_coach/core/engine/pekistirme_motoru.dart';
import 'package:english_coach/core/model/paket_kelime.dart';
import 'package:english_coach/modules/kelime/kelime_ornek_veri.dart';
import 'package:flutter_test/flutter_test.dart';

/// Gercek kullanimda bildirilen kusurlarin testleri.
void main() {
  // ---------- 1. Turkce karakter ----------
  group('Turkce karakter kabul edilir', () {
    test('Turkce harfler ASCII karsiligina katlanir', () {
      expect(Normalizer.normalize('çay'), 'cay');
      expect(Normalizer.normalize('öğrenci'), 'ogrenci');
      expect(Normalizer.normalize('ŞİRKET'), 'sirket');
      expect(Normalizer.normalize('Işık'), 'isik');
    });

    test('Turkce ve ASCII yazim AYNI kabul edilir', () {
      expect(Normalizer.normalize('Kopek et yer.'),
          Normalizer.normalize('Köpek et yer.'));
      expect(Normalizer.normalize('Ogrenciyim'),
          Normalizer.normalize('Öğrenciyim'));
    });

    test('Ingilizce metin BOZULMAZ', () {
      expect(Normalizer.normalize('I drink coffee.'), 'i drink coffee');
      expect(Normalizer.normalize("I'm ready"), 'i am ready');
    });

    test('Ders motoru Turkce yazimi kabul eder', () {
      expect(DersMotoru.dogruMu(<String>['Kopek et yer.'], 'Köpek et yer.'),
          isTrue);
    });
  });

  // ---------- 2. he / she ----------
  group('he / she iki bicim de kabul edilir', () {
    test('DersMotoru varyant uretir', () {
      expect(DersMotoru.cinsiyetVaryantlari(<String>['He is a doctor.']),
          containsAll(<String>['He is a doctor.', 'She is a doctor.']));
    });

    test('"O bir doktor." her iki cevirisi de dogru', () {
      const List<String> kabul = <String>['He is a doctor.'];
      expect(DersMotoru.dogruMu(kabul, 'He is a doctor.'), isTrue);
      expect(DersMotoru.dogruMu(kabul, 'She is a doctor.'), isTrue);
      expect(DersMotoru.dogruMu(kabul, 'It is a doctor.'), isFalse);
    });

    test('Ozne "I" olan cumlede varyant URETILMEZ', () {
      expect(DersMotoru.cinsiyetVaryantlari(<String>['I am ready.']).length, 1);
    });

    test('Pekistirme TR->EN her iki cinsiyeti kabul eder', () {
      final PekistirmeMotoru m =
          PekistirmeMotoru(KelimeOrnekVeri.paket(1));
      final List<PekistirmeSorusu> sorular =
          m.etkinlikUret(EtkinlikTipi.trEnCeviri);
      for (final PekistirmeSorusu s in sorular) {
        final String k = s.kanonikCevap;
        if (k.startsWith('He ') || k.startsWith('She ')) {
          final String digeri = k.startsWith('He ')
              ? 'She ${k.substring(3)}'
              : 'He ${k.substring(4)}';
          expect(s.dogruMu(digeri), isTrue, reason: k);
        }
      }
    });
  });

  // ---------- 3. Kendi cumleni yazma ----------
  group('Cumle icinde kullanma: KENDI cumlen kabul edilir', () {
    PekistirmeSorusu soruAl() {
      final PekistirmeMotoru m = PekistirmeMotoru(KelimeOrnekVeri.paket(1));
      return m
          .etkinlikUret(EtkinlikTipi.cumleIcinde)
          .firstWhere((PekistirmeSorusu s) => s.kelimeKod == 'W-1002');
    }

    test('Ornek cumleden FARKLI kendi cumlen kabul edilir', () {
      final PekistirmeSorusu s = soruAl();
      expect(s.dogruMu('I like coffee very much.'), isTrue);
      expect(s.dogruMu('My father drinks coffee.'), isTrue);
    });

    test('Cekimli bicim de sayilir', () {
      final PekistirmeMotoru m = PekistirmeMotoru(KelimeOrnekVeri.paket(1));
      final PekistirmeSorusu s = m
          .etkinlikUret(EtkinlikTipi.cumleIcinde)
          .firstWhere((PekistirmeSorusu x) => x.kelimeKod == 'W-1009');
      expect(s.dogruMu('She drinks tea every day.'), isTrue);
    });

    test('Hedef kelime YOKSA reddedilir', () {
      final PekistirmeSorusu s = soruAl();
      expect(s.dogruMu('I like tea very much.'), isFalse);
      expect(s.kendiCumlesiGecerliMi('I like tea.').kelimeVar, isFalse);
    });

    test('Cok kisa cumle reddedilir ve NEDENI bildirilir', () {
      final PekistirmeSorusu s = soruAl();
      final ({bool gecerli, bool kelimeVar, int kelimeSayisi, String not}) r =
          s.kendiCumlesiGecerliMi('coffee');
      expect(r.gecerli, isFalse);
      expect(r.kelimeVar, isTrue);
      expect(r.not, contains('kisa'));
    });

    test('Gecerli cumlede sinir DURUSTCE bildirilir', () {
      final PekistirmeSorusu s = soruAl();
      expect(s.kendiCumlesiGecerliMi('I drink coffee daily.').not,
          contains('ayrintili denetlenmedi'));
    });
  });

  // ---------- 4. Paket gecisi ----------
  group('Paket gecisi', () {
    test('Iki paket var ve kesismiyor', () {
      expect(KelimeOrnekVeri.paketSayisi, greaterThanOrEqualTo(2));
      final Set<String> p1 = KelimeOrnekVeri.paket(1)
          .map((PaketKelime k) => k.kod)
          .toSet();
      final Set<String> p2 = KelimeOrnekVeri.paket(2)
          .map((PaketKelime k) => k.kod)
          .toSet();
      expect(p1.intersection(p2), isEmpty);
      expect(p1.length, 20);
      expect(p2.length, 20);
    });

    test('Gecersiz paket bos doner, cokmez', () {
      expect(KelimeOrnekVeri.paket(0), isEmpty);
      expect(KelimeOrnekVeri.paket(99), isEmpty);
    });
  });
}
