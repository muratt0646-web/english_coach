import 'package:flutter_test/flutter_test.dart';
import 'package:english_coach/core/engine/dusunme_motoru.dart';
import 'package:english_coach/core/model/dusunme.dart';

/// tool/dusunme_motoru_dogrulama.py ile ayni vakalar.
/// Motorun GENEL oldugunu iki farkli konu verisiyle kanitlar.
void main() {
  ZihinselSoru s(int i, String rol, String soru, bool z) =>
      ZihinselSoru(sira: i, rolKodu: rol, soruTr: soru, zorunlu: z);
  AnlamBlogu b(int i, String rol, String tr, String en) =>
      AnlamBlogu(sira: i, rolKodu: rol, blokTr: tr, blokEn: en);

  // ---------- Konu 1: SVO ----------
  final svo = DusunmeModeli(
    konuKod: 'K1', ad: 'Temel sira', ozet: 'ozet',
    trSira: const ['NE_ZAMAN', 'KIM', 'NEREDE', 'NEYI', 'NE_YAPIYOR'],
    enSira: const ['KIM', 'NE_YAPIYOR', 'NEYI', 'NEREDE', 'NE_ZAMAN'],
    sorular: [
      s(1, 'KIM', 'Kim?', true),
      s(2, 'NE_YAPIYOR', 'Ne yapiyor?', true),
      s(3, 'NEYI', 'Neyi / kimi?', false),
      s(4, 'NEREDE', 'Nerede?', false),
      s(5, 'NE_ZAMAN', 'Ne zaman?', false),
    ],
    ornekler: [
      DusunmeOrnegi(
        kod: 'O1', dogruMu: true,
        trCumle: 'Ben her sabah evde kahve icerim.',
        enCumle: 'I drink coffee at home every morning.',
        bloklar: [
          b(1, 'KIM', 'Ben', 'I'),
          b(2, 'NE_YAPIYOR', 'icerim', 'drink'),
          b(3, 'NEYI', 'kahve', 'coffee'),
          b(4, 'NEREDE', 'evde', 'at home'),
          b(5, 'NE_ZAMAN', 'her sabah', 'every morning'),
        ],
      ),
      DusunmeOrnegi(
        kod: 'O2', dogruMu: true, trCumle: 'O kitap okur.',
        enCumle: 'She reads books.',
        bloklar: [
          b(1, 'KIM', 'O', 'She'),
          b(2, 'NE_YAPIYOR', 'okur', 'reads'),
          b(3, 'NEYI', 'kitap', 'books'),
        ],
      ),
      const DusunmeOrnegi(
        kod: 'Y1', dogruMu: false, trCumle: 'O kitap okur.',
        enCumle: 'She books reads.', bloklar: [],
      ),
    ],
    mudahaleler: const [],
  );

  // ---------- Konu 2: farkli sira (genellik kaniti) ----------
  final soru = DusunmeModeli(
    konuKod: 'K2', ad: 'Soru yapisi', ozet: 'ozet',
    trSira: const ['KIM', 'NEYI', 'NE_YAPIYOR'],
    enSira: const ['YARDIMCI', 'KIM', 'NE_YAPIYOR', 'NEYI'],
    sorular: [
      s(1, 'YARDIMCI', 'Hangi yardimci fiil?', true),
      s(2, 'KIM', 'Kim?', true),
      s(3, 'NE_YAPIYOR', 'Ne yapiyor?', true),
      s(4, 'NEYI', 'Neyi / kimi?', false),
    ],
    ornekler: [
      DusunmeOrnegi(
        kod: 'O1', dogruMu: true, trCumle: 'Sen kahve sever misin?',
        enCumle: 'Do you like coffee?',
        bloklar: [
          b(1, 'YARDIMCI', '-', 'Do'),
          b(2, 'KIM', 'Sen', 'you'),
          b(3, 'NE_YAPIYOR', 'sever', 'like'),
          b(4, 'NEYI', 'kahve', 'coffee'),
        ],
      ),
    ],
    mudahaleler: const [],
  );

  group('Konu 1 — SVO', () {
    final m = DusunmeMotoru(svo);
    final o1 = svo.ornekler[0], o2 = svo.ornekler[1];

    test('Ingilizce dizim veriden gelen siraya uyar', () {
      expect(m.ingilizceDiz(o1), 'I drink coffee at home every morning');
    });
    test('Turkce dizim farklidir (fiil sonda)', () {
      expect(m.turkceDiz(o1), 'her sabah Ben evde kahve icerim');
    });
    test('Sorulacak sorular ornegin bloklarindan turetilir', () {
      expect(m.sorulacakSorular(o2).map((x) => x.rolKodu).toList(),
          ['KIM', 'NE_YAPIYOR', 'NEYI']);
    });
    test('Blok cevabi dogru', () =>
        expect(m.blokCevabiDogruMu(o2, 'NE_YAPIYOR', 'reads'), isTrue));
    test('Blok cevabi yanlis', () =>
        expect(m.blokCevabiDogruMu(o2, 'NE_YAPIYOR', 'read'), isFalse));
    test('Buyuk/kucuk harf tolere edilir', () =>
        expect(m.blokCevabiDogruMu(o2, 'KIM', 'she'), isTrue));
    test('Turkce sira reddedilir', () {
      final r = m.siraKontrol(['KIM', 'NEYI', 'NE_YAPIYOR']);
      expect(r.dogru, isFalse);
      expect(r.beklenen, ['KIM', 'NE_YAPIYOR', 'NEYI']);
    });
    test('Ingilizce sira kabul edilir', () =>
        expect(m.siraKontrol(['KIM', 'NE_YAPIYOR', 'NEYI']).dogru, isTrue));
    test('Eksik zorunlu rol bulunmaz (NEYI zorunlu degil)', () =>
        expect(m.eksikZorunluRoller(['KIM', 'NE_YAPIYOR']), isEmpty));
    test('Yanlis dusunme ornegi ayirt edilir', () {
      expect(svo.dogruOrnekler.length, 2);
      expect(svo.yanlisOrnekler.length, 1);
    });
  });

  group('Konu 2 — farkli sira (MOTOR KODU DEGISMEDEN)', () {
    final m = DusunmeMotoru(soru);
    final o1 = soru.ornekler[0];

    test('Farkli EN sirasindan cumle kurulur', () =>
        expect(m.ingilizceDiz(o1), 'Do you like coffee'));
    test('Eksik zorunlu rol YARDIMCI bildirilir', () =>
        expect(m.eksikZorunluRoller(['KIM', 'NE_YAPIYOR', 'NEYI']),
            ['YARDIMCI']));
    test('Bu konuda dogru sira kabul edilir', () =>
        expect(
            m.siraKontrol(['YARDIMCI', 'KIM', 'NE_YAPIYOR', 'NEYI']).dogru,
            isTrue));
    test('Ayni motor iki farkli modeli de isler', () {
      expect(DusunmeMotoru(svo).model.enSira.first, 'KIM');
      expect(DusunmeMotoru(soru).model.enSira.first, 'YARDIMCI');
    });
  });
}
