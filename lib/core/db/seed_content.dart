import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../content/ders_en_a1_001.dart';
import '../content/dusunme_en_a1_001.dart';
import '../content/hikaye_icerik.dart';
import '../content/hikaye_sozluk.dart';
import '../model/hikaye.dart';

/// Faz 2A: EN-A1-001 dersinin tam icerigi content.db'ye yazilir.
/// SEMA DEGISMEDI — yalnizca satir sayisi artti.
class SeedContent {
  static const konuKod = DersEnA1001.konuKod;

  /// Beklenen icerik surumu. Bu sabit degistiginde content.db
  /// GUVENLI bicimde yeniden olusturulur (user.db'ye dokunulmaz).
  static const icerikSurumu = '0.4.0';

  static Future<void> doldur(Database db) async {
    await db.transaction((txn) async {
      await txn.insert('icerik_surum', {
        'paket_id': 'core-a1-vs',
        'surum': icerikSurumu,
        'sema_surumu': 1,
        'olusturma': DateTime.now().toUtc().toIso8601String(),
      });

      await txn.insert('konu', {
        'kod': konuKod,
        'seviye': 'A1',
        'alan': 'SOZ',
        'ad_tr': 'Temel Cumle Sirasi (SVO)',
        'ogretim_amaci':
            'Ingilizcede anlamin kelime sirasindan dogdugunu kavratmak; '
            'Turkce SOV refleksinin yerine SVO kalibini oturtmak.',
        'tahmini_sure_dk': 50,
        'icerik_durumu': 'onayli',
        'surum': icerikSurumu,
        'arsiv': 0,
      });

      // --- ders adimlari ---
      for (final a in DersEnA1001.adimlar) {
        await txn.insert('ders_adim', {
          'konu_kod': konuKod,
          'adim_no': int.parse(a[0]),
          'tip': a[1],
          'govde_md': a[2].trim(),
        });
      }

      // --- gorevler + kabul cevaplari ---
      for (final g in DersEnA1001.gorevler) {
        final kod = '$konuKod-${g['kod']}';
        await txn.insert('gorev', {
          'kod': kod,
          'konu_kod': konuKod,
          'adim_no': g['adim'] as int,
          'tip': g['tip'] as String,
          'govde': g['govde'] as String,
          'ipucu': g['ipucu'] as String?,
          'zorluk': g['zorluk'] as int,
          'hedef_yapi': 'SVO',
          'arsiv': 0,
        });
        final kabuller = g['kabul'] as List<Object?>;
        final tipler = g['kabul_tip'] as List<Object?>?;
        final notlar = g['kabul_not'] as List<Object?>?;
        for (var i = 0; i < kabuller.length; i++) {
          await txn.insert('gorev_kabul', {
            'gorev_kod': kod,
            'sira': i,
            'cevap': kabuller[i] as String,
            // 1=ana/tam kabul · 0=kabul+not · -1=gramer dogru anlam farkli
            'esdeger_mi':
                (tipler != null && i < tipler.length) ? tipler[i] as int : 1,
            'not_tr':
                (notlar != null && i < notlar.length) ? notlar[i] as String? : null,
          });
        }
      }


      // ===== v2: Ingilizce dusunme katmani =====
      await txn.insert('dusunme_modeli', {
        'konu_kod': DusunmeEnA1001.konuKod,
        'ad': DusunmeEnA1001.ad,
        'ozet': DusunmeEnA1001.ozet,
        'tr_sira': DusunmeEnA1001.trSira.join(','),
        'en_sira': DusunmeEnA1001.enSira.join(','),
      });
      for (final s in DusunmeEnA1001.sorular) {
        await txn.insert('zihinsel_soru', {
          'konu_kod': DusunmeEnA1001.konuKod,
          'sira': int.parse(s[0]),
          'rol_kodu': s[1],
          'soru_tr': s[2],
          'ipucu': s[3],
          'zorunlu_mu': int.parse(s[4]),
        });
      }
      for (final o in DusunmeEnA1001.ornekler) {
        await txn.insert('dusunme_ornegi', {
          'konu_kod': DusunmeEnA1001.konuKod,
          'kod': o[0], 'tip': o[1], 'tr_cumle': o[2],
          'en_cumle': o[3], 'aciklama': o[4],
        });
      }
      for (final e in DusunmeEnA1001.bloklar.entries) {
        for (final b in e.value) {
          await txn.insert('anlam_blogu', {
            'konu_kod': DusunmeEnA1001.konuKod,
            'ornek_kod': e.key,
            'sira': int.parse(b[0]),
            'rol_kodu': b[1], 'blok_tr': b[2], 'blok_en': b[3],
          });
        }
      }
      for (final m in DusunmeEnA1001.mudahaleler) {
        await txn.insert('mudahale_hatasi', {
          'konu_kod': DusunmeEnA1001.konuKod,
          'kod': m[0], 'baslik': m[1], 'aciklama': m[2],
          'yanlis': m[3], 'dogru': m[4],
        });
      }
      // ===== v3: hikaye icerigi =====
      for (final SozlukGirdisi g in HikayeSozluk.girdiler) {
        await txn.insert('hikaye_sozluk', <String, Object?>{
          'kelime': g.kelime.toLowerCase(),
          'okunus': g.okunus,
          'tr_anlam': g.trAnlam,
          'ornek_cumle': g.ornekCumle,
        });
      }
      for (final Hikaye h in HikayeIcerik.hikayeler) {
        await txn.insert('stories', <String, Object?>{
          'kod': h.kod,
          'baslik': h.baslik,
          'seviye': h.seviye,
          'konu_etiketi': h.konuEtiketi,
          'kelime_sayisi': h.kelimeSayisi,
          'tahmini_dk': h.tahminiDk,
          'ozet_tr': h.ozetTr,
          'anahtar_kavramlar': h.anahtarKavramlar.join('|'),
          'arsiv': 0,
        });
        for (final HikayeParagraf p in h.paragraflar) {
          await txn.insert('story_paragraph', <String, Object?>{
            'hikaye_kod': h.kod,
            'sira': p.sira,
            'metin_en': p.metinEn,
            'metin_tr': p.metinTr,
          });
        }
        for (final HikayeSorusu q in h.sorular) {
          await txn.insert('story_questions', <String, Object?>{
            'hikaye_kod': h.kod,
            'sira': q.sira,
            'tip': q.tip.kod,
            'soru': q.soru,
            'secenekler': q.secenekler.join('|'),
            'kabul': q.kabulEdilenler.join('|'),
            'aciklama': q.aciklama,
          });
        }
      }

      // --- kelimeler ---
      for (var i = 0; i < DersEnA1001.kelimeler.length; i++) {
        final k = DersEnA1001.kelimeler[i];
        await txn.insert('kelime', {
          'kod': k[0], 'yazilis': k[1], 'ipa': k[2], 'tr_okunus': k[3],
          'tur': k[4], 'seviye': 'A1', 'frekans_sirasi': i + 1, 'arsiv': 0,
        });
        await txn.insert('kelime_anlam', {
          'kelime_kod': k[0], 'sira': 0, 'tr_anlam': k[5],
        });
      }
    });
  }
}
