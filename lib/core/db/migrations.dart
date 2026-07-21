import 'package:sqflite_common_ffi/sqflite_ffi.dart';

/// Sema gocleri. LOCAL_DATABASE_SCHEMA.md sec.6
///
/// Kural: her goc TEK ISLEM icinde uygulanir; basarisizsa tamami geri alinir.
class Migrations {
  static const int hedefSurum = 4;

  /// user.db semasi (surum 1)
  static Future<void> uygulaUser(Database db, int mevcutSurum) async {
    if (mevcutSurum < 1) {
      await db.transaction((txn) async {
        await txn.execute('''
          CREATE TABLE kullanici_konu (
            konu_kod             TEXT PRIMARY KEY,
            durum                TEXT NOT NULL DEFAULT 'BELIRSIZ',
            ilerleme_durumu      TEXT NOT NULL DEFAULT 'acik',
            gramer_ustaligi      REAL NOT NULL DEFAULT 0,
            dinleme_durumu       TEXT NOT NULL DEFAULT 'olculmedi',
            kanit_sayisi         INTEGER NOT NULL DEFAULT 0,
            uretim_kaniti_var_mi INTEGER NOT NULL DEFAULT 0,
            son_calisma          TEXT,
            guncelleme_zamani    TEXT NOT NULL
          )''');
        await txn.execute('''
          CREATE TABLE kullanici_kelime (
            kelime_kod        TEXT PRIMARY KEY,
            durum             TEXT NOT NULL DEFAULT 'yeni',
            dogru_sayisi      INTEGER NOT NULL DEFAULT 0,
            yanlis_sayisi     INTEGER NOT NULL DEFAULT 0,
            guncelleme_zamani TEXT NOT NULL
          )''');
        await txn.execute('''
          CREATE TABLE gorev_sonucu (
            id               INTEGER PRIMARY KEY AUTOINCREMENT,
            tarih            TEXT NOT NULL,
            gorev_kod        TEXT NOT NULL,
            gorev_tipi       TEXT NOT NULL,
            konu_kod         TEXT NOT NULL,
            kullanici_cevabi TEXT,
            dogru_mu         INTEGER NOT NULL,
            sure_ms          INTEGER
          )''');
        await txn.execute(
            'CREATE INDEX ix_gs_konu ON gorev_sonucu(konu_kod, tarih)');
        await txn.execute('''
          CREATE TABLE hata_kaydi (
            id                  INTEGER PRIMARY KEY AUTOINCREMENT,
            gorev_sonucu_id     INTEGER,
            kod                 TEXT NOT NULL,
            konu_kod            TEXT NOT NULL,
            kullanici_cumlesi   TEXT NOT NULL,
            dogru_cumle         TEXT NOT NULL,
            tani_guveni         TEXT NOT NULL,
            kok_neden           TEXT NOT NULL,
            kok_neden_carpani   REAL NOT NULL,
            ustaliga_yazildi_mi INTEGER NOT NULL,
            tarih               TEXT NOT NULL
          )''');
        await txn.execute(
            'CREATE INDEX ix_hata_tani ON hata_kaydi(tani_guveni, tarih)');
        await txn.execute(
            'CREATE TABLE sema_gocu (surum INTEGER PRIMARY KEY, uygulama_zamani TEXT NOT NULL)');
        await txn.insert('sema_gocu', {
          'surum': 1,
          'uygulama_zamani': DateTime.now().toUtc().toIso8601String(),
        });
      });
    }

    // ---- surum 2: 20 kelimelik ogrenme paketi (Faz 2E) ----
    // YALNIZCA EKLEME. Mevcut tablolara DOKUNULMAZ, veri silinmez.
    if (mevcutSurum < 2) {
      await db.transaction((txn) async {
        await txn.execute('''
          CREATE TABLE IF NOT EXISTS ogrenilen_kelime (
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
            durum                 TEXT NOT NULL DEFAULT 'ogrenildi'
          )''');
        await txn.execute(
            'CREATE INDEX IF NOT EXISTS ix_ok_paket '
            'ON ogrenilen_kelime(paket_id)');
        await txn.execute(
            'CREATE INDEX IF NOT EXISTS ix_ok_tekrar '
            'ON ogrenilen_kelime(sonraki_tekrar_tarihi)');
        await txn.execute('''
          CREATE TABLE IF NOT EXISTS pekistirme_sonucu (
            id            INTEGER PRIMARY KEY AUTOINCREMENT,
            paket_id      INTEGER NOT NULL,
            etkinlik_kodu TEXT NOT NULL,
            kelime_id     TEXT NOT NULL,
            dogru_mu      INTEGER NOT NULL,
            tarih         TEXT NOT NULL
          )''');
        await txn.execute(
            'CREATE INDEX IF NOT EXISTS ix_ps_paket '
            'ON pekistirme_sonucu(paket_id, etkinlik_kodu)');
        await txn.insert('sema_gocu', {
          'surum': 2,
          'uygulama_zamani': DateTime.now().toUtc().toIso8601String(),
        });
      });
    }

    // ---- surum 3: hikaye modulu kullanici verisi (Faz 3A) ----
    // YALNIZCA EKLEME. Mevcut tablolara DOKUNULMAZ.
    if (mevcutSurum < 3) {
      await db.transaction((txn) async {
        await txn.execute('''
          CREATE TABLE IF NOT EXISTS story_progress (
            hikaye_kod        TEXT PRIMARY KEY,
            son_paragraf      INTEGER NOT NULL DEFAULT 0,
            okuma_yuzdesi     REAL NOT NULL DEFAULT 0,
            durum             TEXT NOT NULL DEFAULT 'baslanmadi',
            favori            INTEGER NOT NULL DEFAULT 0,
            baslama_tarihi    TEXT,
            son_okuma_tarihi  TEXT,
            toplam_sure_ms    INTEGER NOT NULL DEFAULT 0
          )''');
        await txn.execute(
            'CREATE INDEX IF NOT EXISTS ix_sp_durum '
            'ON story_progress(durum)');
        await txn.execute('''
          CREATE TABLE IF NOT EXISTS story_unknown_words (
            id                INTEGER PRIMARY KEY AUTOINCREMENT,
            hikaye_kod        TEXT NOT NULL,
            kelime            TEXT NOT NULL,
            okunus            TEXT,
            tr_anlam          TEXT,
            eklenme_tarihi    TEXT NOT NULL,
            ogrenmeye_eklendi INTEGER NOT NULL DEFAULT 0
          )''');
        await txn.execute(
            'CREATE UNIQUE INDEX IF NOT EXISTS ix_suw_kelime '
            'ON story_unknown_words(hikaye_kod, kelime)');
        await txn.execute('''
          CREATE TABLE IF NOT EXISTS story_statistics (
            id              INTEGER PRIMARY KEY AUTOINCREMENT,
            hikaye_kod      TEXT NOT NULL,
            tarih           TEXT NOT NULL,
            okuma_suresi_ms INTEGER NOT NULL DEFAULT 0,
            yeni_kelime     INTEGER NOT NULL DEFAULT 0,
            bilinen_kelime  INTEGER NOT NULL DEFAULT 0,
            dogru           INTEGER NOT NULL DEFAULT 0,
            yanlis          INTEGER NOT NULL DEFAULT 0,
            basari_yuzdesi  REAL NOT NULL DEFAULT 0
          )''');
        await txn.execute(
            'CREATE INDEX IF NOT EXISTS ix_ss_hikaye '
            'ON story_statistics(hikaye_kod, tarih)');
        await txn.insert('sema_gocu', {
          'surum': 3,
          'uygulama_zamani': DateTime.now().toUtc().toIso8601String(),
        });
      });
    }

    // ---- surum 4: sablon ders ilerlemesi (Faz 4A.0) ----
    // YALNIZCA EKLEME. user.db'deki mevcut veriye DOKUNULMAZ.
    if (mevcutSurum < 4) {
      await db.transaction((txn) async {
        await txn.execute('''
          CREATE TABLE IF NOT EXISTS ders_ilerleme (
            ders_kod        TEXT PRIMARY KEY,
            asama           TEXT NOT NULL DEFAULT 'giris',
            madde_indeksi   INTEGER NOT NULL DEFAULT 0,
            baslama         TEXT NOT NULL,
            son_acilis      TEXT NOT NULL,
            tamamlanma      TEXT,
            dogru_sayisi    INTEGER NOT NULL DEFAULT 0,
            yanlis_sayisi   INTEGER NOT NULL DEFAULT 0,
            sinav_puani     INTEGER,
            durum           TEXT NOT NULL DEFAULT 'devam'
          )''');
        await txn.execute('''
          CREATE TABLE IF NOT EXISTS ders_altkonu_basari (
            ders_kod  TEXT NOT NULL,
            alt_konu  TEXT NOT NULL,
            dogru     INTEGER NOT NULL DEFAULT 0,
            yanlis    INTEGER NOT NULL DEFAULT 0,
            PRIMARY KEY (ders_kod, alt_konu)
          )''');
        await txn.insert('sema_gocu', {
          'surum': 4,
          'uygulama_zamani': DateTime.now().toUtc().toIso8601String(),
        });
      });
    }
  }

  /// content.db surum 3: hikaye icerigi (Faz 3A). YALNIZCA EKLEME.
  static Future<void> uygulaContentV3(Database db) async {
    await db.transaction((txn) async {
      await txn.execute('''
        CREATE TABLE IF NOT EXISTS stories (
          kod            TEXT PRIMARY KEY,
          baslik         TEXT NOT NULL,
          seviye         TEXT NOT NULL,
          konu_etiketi   TEXT NOT NULL,
          kelime_sayisi  INTEGER NOT NULL,
          tahmini_dk     INTEGER NOT NULL,
          ozet_tr        TEXT NOT NULL,
          anahtar_kavramlar TEXT NOT NULL,
          arsiv          INTEGER NOT NULL DEFAULT 0
        )''');
      await txn.execute(
          'CREATE INDEX IF NOT EXISTS ix_st_seviye '
          'ON stories(seviye, konu_etiketi)');
      await txn.execute('''
        CREATE TABLE IF NOT EXISTS story_paragraph (
          hikaye_kod TEXT NOT NULL,
          sira       INTEGER NOT NULL,
          metin_en   TEXT NOT NULL,
          metin_tr   TEXT NOT NULL,
          PRIMARY KEY (hikaye_kod, sira)
        )''');
      await txn.execute('''
        CREATE TABLE IF NOT EXISTS story_questions (
          hikaye_kod  TEXT NOT NULL,
          sira        INTEGER NOT NULL,
          tip         TEXT NOT NULL,
          soru        TEXT NOT NULL,
          secenekler  TEXT NOT NULL,
          kabul       TEXT NOT NULL,
          aciklama    TEXT,
          PRIMARY KEY (hikaye_kod, sira)
        )''');
      await txn.execute('''
        CREATE TABLE IF NOT EXISTS hikaye_sozluk (
          kelime      TEXT PRIMARY KEY,
          okunus      TEXT NOT NULL,
          tr_anlam    TEXT NOT NULL,
          ornek_cumle TEXT NOT NULL
        )''');
    });
  }

  /// content.db semasi surum 2: dusunme katmani (YALNIZCA EKLEME).
  /// Mevcut tablolara DOKUNULMAZ.
  static Future<void> uygulaContentV2(Database db) async {
    await db.transaction((txn) async {
      await txn.execute('''
        CREATE TABLE IF NOT EXISTS dusunme_modeli (
          konu_kod TEXT PRIMARY KEY,
          ad       TEXT NOT NULL,
          ozet     TEXT NOT NULL,
          tr_sira  TEXT NOT NULL,
          en_sira  TEXT NOT NULL
        )''');
      await txn.execute('''
        CREATE TABLE IF NOT EXISTS zihinsel_soru (
          konu_kod   TEXT NOT NULL,
          sira       INTEGER NOT NULL,
          rol_kodu   TEXT NOT NULL,
          soru_tr    TEXT NOT NULL,
          ipucu      TEXT,
          zorunlu_mu INTEGER NOT NULL DEFAULT 1,
          PRIMARY KEY (konu_kod, sira)
        )''');
      await txn.execute('''
        CREATE TABLE IF NOT EXISTS dusunme_ornegi (
          konu_kod TEXT NOT NULL,
          kod      TEXT NOT NULL,
          tip      TEXT NOT NULL,
          tr_cumle TEXT NOT NULL,
          en_cumle TEXT NOT NULL,
          aciklama TEXT,
          PRIMARY KEY (konu_kod, kod)
        )''');
      await txn.execute('''
        CREATE TABLE IF NOT EXISTS anlam_blogu (
          konu_kod  TEXT NOT NULL,
          ornek_kod TEXT NOT NULL,
          sira      INTEGER NOT NULL,
          rol_kodu  TEXT NOT NULL,
          blok_tr   TEXT NOT NULL,
          blok_en   TEXT NOT NULL,
          PRIMARY KEY (konu_kod, ornek_kod, sira)
        )''');
      await txn.execute('''
        CREATE TABLE IF NOT EXISTS mudahale_hatasi (
          konu_kod TEXT NOT NULL,
          kod      TEXT NOT NULL,
          baslik   TEXT NOT NULL,
          aciklama TEXT NOT NULL,
          yanlis   TEXT NOT NULL,
          dogru    TEXT NOT NULL,
          PRIMARY KEY (konu_kod, kod)
        )''');
    });
  }

  /// content.db semasi (surum 1) - salt okunur kabul edilir
  static Future<void> uygulaContent(Database db) async {
    await db.transaction((txn) async {
      await txn.execute('''
        CREATE TABLE konu (
          kod             TEXT PRIMARY KEY,
          seviye          TEXT NOT NULL,
          alan            TEXT NOT NULL,
          ad_tr           TEXT NOT NULL,
          ogretim_amaci   TEXT NOT NULL,
          tahmini_sure_dk INTEGER NOT NULL,
          icerik_durumu   TEXT NOT NULL,
          surum           TEXT NOT NULL,
          arsiv           INTEGER NOT NULL DEFAULT 0
        )''');
      await txn.execute('''
        CREATE TABLE ders_adim (
          konu_kod TEXT NOT NULL,
          adim_no  INTEGER NOT NULL,
          tip      TEXT NOT NULL,
          govde_md TEXT NOT NULL,
          PRIMARY KEY (konu_kod, adim_no)
        )''');
      await txn.execute('''
        CREATE TABLE gorev (
          kod        TEXT PRIMARY KEY,
          konu_kod   TEXT NOT NULL,
          adim_no    INTEGER NOT NULL,
          tip        TEXT NOT NULL,
          govde      TEXT NOT NULL,
          ipucu      TEXT,
          zorluk     INTEGER NOT NULL DEFAULT 1,
          hedef_yapi TEXT,
          arsiv      INTEGER NOT NULL DEFAULT 0
        )''');
      await txn.execute('''
        CREATE TABLE gorev_kabul (
          gorev_kod  TEXT NOT NULL,
          sira       INTEGER NOT NULL,
          cevap      TEXT NOT NULL,
          esdeger_mi INTEGER NOT NULL DEFAULT 1,
          not_tr     TEXT,
          PRIMARY KEY (gorev_kod, sira)
        )''');
      await txn.execute('''
        CREATE TABLE kelime (
          kod            TEXT PRIMARY KEY,
          yazilis        TEXT NOT NULL UNIQUE,
          ipa            TEXT,
          tr_okunus      TEXT,
          tur            TEXT NOT NULL,
          seviye         TEXT NOT NULL,
          frekans_sirasi INTEGER,
          arsiv          INTEGER NOT NULL DEFAULT 0
        )''');
      await txn.execute('''
        CREATE TABLE kelime_anlam (
          kelime_kod TEXT NOT NULL,
          sira       INTEGER NOT NULL,
          tr_anlam   TEXT NOT NULL,
          PRIMARY KEY (kelime_kod, sira)
        )''');
      await txn.execute('''
        CREATE TABLE icerik_surum (
          paket_id    TEXT PRIMARY KEY,
          surum       TEXT NOT NULL,
          sema_surumu INTEGER NOT NULL,
          olusturma   TEXT NOT NULL
        )''');
    });
  }

  /// Icerik tablolarini DUSURUR. YALNIZCA content.db uzerinde calisir.
  /// user.db'ye ASLA dokunmaz — kullanici ilerlemesi korunur.
  static Future<void> icerikSifirla(Database db) async {
    const tablolar = [
      // v3 hikaye icerigi
      'hikaye_sozluk', 'story_questions', 'story_paragraph', 'stories',
      // v2 dusunme katmani
      'mudahale_hatasi', 'anlam_blogu', 'dusunme_ornegi', 'zihinsel_soru',
      'dusunme_modeli',
      // v1 icerik
      'kelime_anlam', 'kelime', 'gorev_kabul', 'gorev', 'ders_adim',
      'konu', 'icerik_surum',
    ];
    await db.transaction((txn) async {
      for (final t in tablolar) {
        await txn.execute('DROP TABLE IF EXISTS $t');
      }
    });
  }
}
