import '../core/db/app_database.dart';
import '../core/engine/tani_motoru.dart';
import '../core/model/models.dart';

/// user.db yazma/okuma. Her gorev sonucu ANINDA yazilir
/// (ANDROID_WINDOWS_BUILD_PLAN.md sec.7 yasam dongusu kurali).
class IlerlemeRepo {
  final _db = AppDatabase.instance;

  String get _simdi => DateTime.now().toUtc().toIso8601String();

  Future<KonuIlerleme> konuIlerlemesi(String konuKod) async {
    final r = await _db.db.query('kullanici_konu',
        where: 'konu_kod = ?', whereArgs: [konuKod]);
    if (r.isNotEmpty) return KonuIlerleme.fromRow(r.first);

    await _db.db.insert('kullanici_konu', {
      'konu_kod': konuKod,
      'durum': 'BELIRSIZ',
      'ilerleme_durumu': 'acik',
      'gramer_ustaligi': 0.0,
      'dinleme_durumu': 'olculmedi',
      'kanit_sayisi': 0,
      'uretim_kaniti_var_mi': 0,
      'guncelleme_zamani': _simdi,
    });
    final r2 = await _db.db.query('kullanici_konu',
        where: 'konu_kod = ?', whereArgs: [konuKod]);
    return KonuIlerleme.fromRow(r2.first);
  }

  /// Bir gorev sonucunu ve varsa hata kaydini yazar, ilerlemeyi gunceller.
  Future<void> gorevSonucuKaydet({
    required Gorev gorev,
    required String kullaniciCevabi,
    required TaniSonucu tani,
    required int sureMs,
    required int toplamGorevSayisi,
  }) async {
    await _db.db.transaction((txn) async {
      final sonucId = await txn.insert('gorev_sonucu', {
        'tarih': _simdi,
        'gorev_kod': gorev.kod,
        'gorev_tipi': gorev.tip,
        'konu_kod': gorev.konuKod,
        'kullanici_cevabi': kullaniciCevabi,
        'dogru_mu': tani.dogru ? 1 : 0,
        'sure_ms': sureMs,
      });

      if (!tani.dogru) {
        await txn.insert('hata_kaydi', {
          'gorev_sonucu_id': sonucId,
          'kod': tani.hataKodu ?? 'LEX-99',
          'konu_kod': gorev.konuKod,
          'kullanici_cumlesi': kullaniciCevabi,
          'dogru_cumle': tani.dogruForm,
          'tani_guveni': tani.guven.dbDegeri,
          'kok_neden': tani.kokNeden,
          'kok_neden_carpani': tani.kokNedenCarpani,
          // D-4: yalnizca KESIN tani tam agirlikla ustaliga yazilir
          'ustaliga_yazildi_mi': tani.guven == TaniGuveni.kesin ? 1 : 0,
          'tarih': _simdi,
        });
      }

      // --- gramer_ustaligi yeniden hesapla ---
      // Faz 1B-1 basit modeli: bu konudaki BENZERSIZ gorevlerden
      // dogru tamamlananlarin orani. D-5: dinleme durumuna DOKUNULMAZ.
      final d = await txn.rawQuery('''
        SELECT COUNT(DISTINCT gorev_kod) AS n FROM gorev_sonucu
        WHERE konu_kod = ? AND dogru_mu = 1
      ''', [gorev.konuKod]);
      final dogruSayisi = (d.first['n'] as num).toInt();
      final ustalik = toplamGorevSayisi == 0
          ? 0.0
          : (dogruSayisi / toplamGorevSayisi).clamp(0.0, 1.0);

      // uretim kaniti: G-CT dogru cevaplandi mi
      final u = await txn.rawQuery('''
        SELECT COUNT(*) AS n FROM gorev_sonucu
        WHERE konu_kod = ? AND dogru_mu = 1 AND gorev_tipi = ?
      ''', [gorev.konuKod, GorevTipi.cevirTrEn]);
      final uretimKaniti = (u.first['n'] as num).toInt() > 0 ? 1 : 0;

      final durum = ustalik >= 0.999
          ? 'ustalasildi'
          : (ustalik > 0 ? 'ogreniliyor' : 'acik');

      await txn.update(
        'kullanici_konu',
        {
          'gramer_ustaligi': ustalik,
          'kanit_sayisi': dogruSayisi,
          'uretim_kaniti_var_mi': uretimKaniti,
          'ilerleme_durumu': durum,
          'son_calisma': _simdi,
          'guncelleme_zamani': _simdi,
        },
        where: 'konu_kod = ?',
        whereArgs: [gorev.konuKod],
      );
    });
  }

  /// Bu konuda daha once DOGRU cevaplanmis gorev kodlari.
  Future<Set<String>> tamamlananGorevler(String konuKod) async {
    final r = await _db.db.rawQuery('''
      SELECT DISTINCT gorev_kod FROM gorev_sonucu
      WHERE konu_kod = ? AND dogru_mu = 1
    ''', [konuKod]);
    return r.map((e) => e['gorev_kod'] as String).toSet();
  }

  Future<int> toplamGorevSonucu() async {
    final r = await _db.db.rawQuery('SELECT COUNT(*) AS n FROM gorev_sonucu');
    return (r.first['n'] as num).toInt();
  }

  Future<List<Map<String, Object?>>> sonHatalar({int limit = 20}) async {
    return _db.db.rawQuery('''
      SELECT kod, tani_guveni, kullanici_cumlesi, dogru_cumle, tarih
      FROM hata_kaydi ORDER BY id DESC LIMIT ?
    ''', [limit]);
  }
}
