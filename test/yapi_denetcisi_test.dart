import 'package:english_coach/core/engine/yapi_denetcisi.dart';
import 'package:english_coach/modules/kelime/kelime_ornek_veri.dart';
import 'package:flutter_test/flutter_test.dart';

/// REFERANSSIZ yapisal denetim testleri.
///
/// EN ONEMLI olcut: DOGRU cumlelerde YANLIS ALARM vermemek.
/// Yanlis bir "hata" uyarisi, hic denetlememekten KOTUDUR.
void main() {
  List<YapiBulgusu> d(String c) =>
      YapiDenetcisi.denetle(c, sozluk: KelimeOrnekVeri.tumKelimeler);

  List<String> ciddiKodlar(String c) => d(c)
      .where((YapiBulgusu b) => b.ciddi)
      .map((YapiBulgusu b) => b.kod)
      .toList();

  // ---------- YANLIS ALARM YOK ----------
  group('Dogru cumlelerde ciddi bulgu OLMAMALI', () {
    const List<String> dogru = <String>[
      'I drink coffee every morning.',
      'She reads books.',
      'They are students.',
      'He is a doctor.',
      'We eat bread.',
      'You are right.',
      'It is cold outside.',
      'My father reads the newspaper.',
      'I am a student.',
      'She studies every evening.',
      'He does not work here.',
      'Do you like coffee?',
      'Are they at home?',
      'The children play outside.',
      'I like coffee very much.',
      'She has a car.',
      'We are not ready.',
      'He never drinks coffee.',
      'I open the window.',
      'The book is new.',
      'They live in the city.',
      'I help my friend.',
      'She is very kind.',
      'We listen to music.',
      'He watches films.',
    ];
    for (final String c in dogru) {
      test('temiz: $c', () => expect(ciddiKodlar(c), isEmpty, reason: c));
    }
  });

  // ---------- HATALAR YAKALANMALI ----------
  group('Yanlis cumleler yakalanir', () {
    void yakala(String cumle, String kod) {
      test('$kod: $cumle', () {
        expect(d(cumle).map((YapiBulgusu b) => b.kod), contains(kod),
            reason: cumle);
      });
    }

    yakala('I are happy.', 'BE-03');
    yakala('He am a doctor.', 'BE-03');
    yakala('They is students.', 'BE-03');
    yakala('He work here.', 'AGR-01');
    yakala('She read books.', 'AGR-01');
    yakala('They studies math.', 'AGR-02');
    yakala('I works every day.', 'AGR-02');
    yakala('I student.', 'BE-01');
    yakala('She teacher.', 'BE-01');
    yakala('I coffee drink.', 'WO-01');
    yakala('She books reads.', 'WO-01');
    yakala('Does he works?', 'AUX-02');
    yakala('He is works.', 'BE-02');
    yakala('Me am happy.', 'PRO-01');
    yakala('Him is a doctor.', 'PRO-01');
  });

  // ---------- ONERI URETIMI ----------
  group('Bulgular ONERI tasir', () {
    test('BE-01 dogru be bicimini onerir', () {
      final YapiBulgusu b =
          d('I student.').firstWhere((YapiBulgusu x) => x.kod == 'BE-01');
      expect(b.oneri, contains('am'));
    });

    test('AGR-01 cekimli bicimi onerir', () {
      final YapiBulgusu b =
          d('He work here.').firstWhere((YapiBulgusu x) => x.kod == 'AGR-01');
      expect(b.oneri, contains('works'));
    });

    test('PRO-01 ozne bicimini onerir', () {
      final YapiBulgusu b =
          d('Me am happy.').firstWhere((YapiBulgusu x) => x.kod == 'PRO-01');
      expect(b.oneri, contains('I'));
    });

    test('WO-01 dogru sirayi onerir', () {
      final YapiBulgusu b =
          d('I coffee drink.').firstWhere((YapiBulgusu x) => x.kod == 'WO-01');
      expect(b.oneri, contains('drink'));
    });
  });

  // ---------- BICIM UYARILARI CIDDI DEGIL ----------
  group('Bicim uyarilari cumleyi gecersiz KILMAZ', () {
    test('Kucuk harf ve noktalama yalnizca UYARI', () {
      final List<YapiBulgusu> b = d('i drink coffee');
      expect(b.map((YapiBulgusu x) => x.kod),
          containsAll(<String>['BUYUK-01', 'NOKTA-01']));
      expect(YapiDenetcisi.yapisalOlarakGecerli(b), isTrue,
          reason: 'bicim uyarisi cumleyi gecersiz kilmamali');
    });

    test('Fiille baslayan cumle UYARI, hata degil', () {
      final List<YapiBulgusu> b = d('Drink coffee.');
      expect(b.map((YapiBulgusu x) => x.kod), contains('SU-01'));
      expect(YapiDenetcisi.yapisalOlarakGecerli(b), isTrue,
          reason: 'emir cumlesi olabilir');
    });

    test('Tekrarlanan kelime UYARI', () {
      expect(d('I I drink coffee.').map((YapiBulgusu x) => x.kod),
          contains('TEK-01'));
    });
  });

  // ---------- SINIR DURUMLARI ----------
  group('Sinir durumlari', () {
    test('Bos girdi bulgu URETMEZ', () {
      expect(d(''), isEmpty);
      expect(d('   '), isEmpty);
    });

    test('Tek kelime cokmez', () {
      expect(() => d('coffee'), returnsNormally);
      expect(() => d('Yes.'), returnsNormally);
    });

    test('Sozluk disi kelimeler cokmez', () {
      expect(() => d('The quokka is nocturnal.'), returnsNormally);
      expect(ciddiKodlar('The quokka is happy.'), isEmpty,
          reason: 'bilinmeyen kelime yanlis alarm URETMEMELI');
    });
  });
}
