#!/usr/bin/env python3
"""
migrations.dart ve seed_content.dart icindeki DDL/DML ifadelerinin
SQL sozdizimi dogrulamasi + repo sorgularinin calistirilmasi.

AMAC: Dart derlenmeden once SQL hatalarini yakalamak.
BU BIR FLUTTER TESTI DEGILDIR.
"""
import sqlite3, os, tempfile, sys

OK, FAIL = 0, 0
def kontrol(ad, kosul, detay=""):
    global OK, FAIL
    if kosul:
        OK += 1; print(f"[PASS] {ad}" + (f"  {detay}" if detay else ""))
    else:
        FAIL += 1; print(f"[FAIL] {ad}  {detay}")

tmp = tempfile.mkdtemp()
CONTENT = os.path.join(tmp, "content.db")
USER = os.path.join(tmp, "user.db")

# ============ content.db semasi (migrations.dart uygulaContent) ============
c = sqlite3.connect(CONTENT)
c.executescript("""
CREATE TABLE konu (
  kod TEXT PRIMARY KEY, seviye TEXT NOT NULL, alan TEXT NOT NULL,
  ad_tr TEXT NOT NULL, ogretim_amaci TEXT NOT NULL,
  tahmini_sure_dk INTEGER NOT NULL, icerik_durumu TEXT NOT NULL,
  surum TEXT NOT NULL, arsiv INTEGER NOT NULL DEFAULT 0);
CREATE TABLE ders_adim (
  konu_kod TEXT NOT NULL, adim_no INTEGER NOT NULL, tip TEXT NOT NULL,
  govde_md TEXT NOT NULL, PRIMARY KEY (konu_kod, adim_no));
CREATE TABLE gorev (
  kod TEXT PRIMARY KEY, konu_kod TEXT NOT NULL, adim_no INTEGER NOT NULL,
  tip TEXT NOT NULL, govde TEXT NOT NULL, ipucu TEXT,
  zorluk INTEGER NOT NULL DEFAULT 1, hedef_yapi TEXT,
  arsiv INTEGER NOT NULL DEFAULT 0);
CREATE TABLE gorev_kabul (
  gorev_kod TEXT NOT NULL, sira INTEGER NOT NULL, cevap TEXT NOT NULL,
  esdeger_mi INTEGER NOT NULL DEFAULT 1, not_tr TEXT,
  PRIMARY KEY (gorev_kod, sira));
CREATE TABLE kelime (
  kod TEXT PRIMARY KEY, yazilis TEXT NOT NULL UNIQUE, ipa TEXT,
  tr_okunus TEXT, tur TEXT NOT NULL, seviye TEXT NOT NULL,
  frekans_sirasi INTEGER, arsiv INTEGER NOT NULL DEFAULT 0);
CREATE TABLE kelime_anlam (
  kelime_kod TEXT NOT NULL, sira INTEGER NOT NULL, tr_anlam TEXT NOT NULL,
  PRIMARY KEY (kelime_kod, sira));
CREATE TABLE icerik_surum (
  paket_id TEXT PRIMARY KEY, surum TEXT NOT NULL,
  sema_surumu INTEGER NOT NULL, olusturma TEXT NOT NULL);
""")
kontrol("content.db semasi olusturuluyor", True)

# ============ seed (seed_content.dart) ============
c.execute("INSERT INTO icerik_surum VALUES('core-a1-vs','0.1.0',1,'2026-07-19')")
c.execute("""INSERT INTO konu VALUES('EN-A1-001','A1','SOZ',
  'Temel cumle sirasi (SVO)','Ingilizcede anlamin kelime sirasindan
  dogdugunu kavratmak.',12,'onayli','0.1.0',0)""")
for i in range(1, 6):
    c.execute("INSERT INTO ders_adim VALUES(?,?,?,?)",
              ('EN-A1-001', i, 'sunum', f'## Adim {i} govdesi'))
gorevler = [
    ('G-A1001-BD-001', 14, 'G-BD', 'Bosluga dogru kelimeyi yaz', 1),
    ('G-A1001-SR-001', 15, 'G-SR', 'Kelimeleri dogru siraya diz', 1),
    ('G-A1001-CT-001', 17, 'G-CT', 'Bu cumleyi Ingilizceye cevir', 2),
]
for kod, adim, tip, govde, zor in gorevler:
    c.execute("INSERT INTO gorev VALUES(?,?,?,?,?,?,?,?,0)",
              (kod, 'EN-A1-001', adim, tip, govde, 'ipucu', zor, 'SVO'))
kabuller = {
    'G-A1001-BD-001': ['read'],
    'G-A1001-SR-001': ['I drink coffee.'],
    'G-A1001-CT-001': ['I drink coffee every morning.',
                       'Every morning I drink coffee.',
                       'I drink coffee in the morning.'],
}
for gk, cevaplar in kabuller.items():
    for i, cv in enumerate(cevaplar):
        c.execute("INSERT INTO gorev_kabul VALUES(?,?,?,1,NULL)", (gk, i, cv))
kelimeler = [('W-%04d' % i, w, '/x/', 'x', t, m) for i, (w, t, m) in enumerate(
    [('read','fiil','okumak'),('book','isim','kitap'),('drink','fiil','icmek'),
     ('coffee','isim','kahve'),('morning','isim','sabah'),('water','isim','su'),
     ('eat','fiil','yemek'),('bread','isim','ekmek'),('every','sifat','her'),
     ('write','fiil','yazmak')], 1)]
for kod, yaz, ipa, tro, tur, anlam in kelimeler:
    c.execute("INSERT INTO kelime VALUES(?,?,?,?,?,'A1',?,0)",
              (kod, yaz, ipa, tro, tur, int(kod[2:])))
    c.execute("INSERT INTO kelime_anlam VALUES(?,0,?)", (kod, anlam))
c.commit()

kontrol("1 konu eklendi", c.execute("SELECT count(*) FROM konu").fetchone()[0] == 1)
kontrol("5 ders adimi eklendi", c.execute("SELECT count(*) FROM ders_adim").fetchone()[0] == 5)
kontrol("3 gorev eklendi", c.execute("SELECT count(*) FROM gorev").fetchone()[0] == 3)
kontrol("10 kelime eklendi", c.execute("SELECT count(*) FROM kelime").fetchone()[0] == 10)
n_kabul = c.execute("SELECT count(*) FROM gorev_kabul WHERE gorev_kod='G-A1001-CT-001'").fetchone()[0]
kontrol("TR->EN gorevi 3 kabul cevabi tasiyor", n_kabul == 3, f"({n_kabul})")
c.close()

# ============ user.db semasi (migrations.dart uygulaUser, surum 1) ============
u = sqlite3.connect(USER)
u.execute("PRAGMA journal_mode=WAL")
u.execute("PRAGMA foreign_keys=ON")
u.executescript("""
CREATE TABLE kullanici_konu (
  konu_kod TEXT PRIMARY KEY, durum TEXT NOT NULL DEFAULT 'BELIRSIZ',
  ilerleme_durumu TEXT NOT NULL DEFAULT 'acik',
  gramer_ustaligi REAL NOT NULL DEFAULT 0,
  dinleme_durumu TEXT NOT NULL DEFAULT 'olculmedi',
  kanit_sayisi INTEGER NOT NULL DEFAULT 0,
  uretim_kaniti_var_mi INTEGER NOT NULL DEFAULT 0,
  son_calisma TEXT, guncelleme_zamani TEXT NOT NULL);
CREATE TABLE kullanici_kelime (
  kelime_kod TEXT PRIMARY KEY, durum TEXT NOT NULL DEFAULT 'yeni',
  dogru_sayisi INTEGER NOT NULL DEFAULT 0,
  yanlis_sayisi INTEGER NOT NULL DEFAULT 0, guncelleme_zamani TEXT NOT NULL);
CREATE TABLE gorev_sonucu (
  id INTEGER PRIMARY KEY AUTOINCREMENT, tarih TEXT NOT NULL,
  gorev_kod TEXT NOT NULL, gorev_tipi TEXT NOT NULL, konu_kod TEXT NOT NULL,
  kullanici_cevabi TEXT, dogru_mu INTEGER NOT NULL, sure_ms INTEGER);
CREATE INDEX ix_gs_konu ON gorev_sonucu(konu_kod, tarih);
CREATE TABLE hata_kaydi (
  id INTEGER PRIMARY KEY AUTOINCREMENT, gorev_sonucu_id INTEGER,
  kod TEXT NOT NULL, konu_kod TEXT NOT NULL, kullanici_cumlesi TEXT NOT NULL,
  dogru_cumle TEXT NOT NULL, tani_guveni TEXT NOT NULL,
  kok_neden TEXT NOT NULL, kok_neden_carpani REAL NOT NULL,
  ustaliga_yazildi_mi INTEGER NOT NULL, tarih TEXT NOT NULL);
CREATE INDEX ix_hata_tani ON hata_kaydi(tani_guveni, tarih);
CREATE TABLE sema_gocu (surum INTEGER PRIMARY KEY, uygulama_zamani TEXT NOT NULL);
""")
u.execute("INSERT INTO sema_gocu VALUES(1,'2026-07-19')")
u.commit()
kontrol("user.db semasi olusturuluyor (surum 1)", True)
kontrol("WAL modu", u.execute("PRAGMA journal_mode").fetchone()[0].lower() == "wal")

# ============ ATTACH + repo sorgulari ============
u.execute("ATTACH DATABASE ? AS icerik", (CONTENT,))
kontrol("ATTACH content.db", True)

r = u.execute("SELECT * FROM icerik.konu WHERE arsiv = 0 ORDER BY kod").fetchall()
kontrol("IcerikRepo.tumKonular()", len(r) == 1)
r = u.execute("SELECT * FROM icerik.ders_adim WHERE konu_kod=? ORDER BY adim_no",
              ('EN-A1-001',)).fetchall()
kontrol("IcerikRepo.dersAdimlari()", len(r) == 5)
r = u.execute("SELECT * FROM icerik.gorev WHERE konu_kod=? AND arsiv=0 "
              "ORDER BY adim_no, kod", ('EN-A1-001',)).fetchall()
kontrol("IcerikRepo.gorevler()", len(r) == 3)
r = u.execute("SELECT cevap FROM icerik.gorev_kabul WHERE gorev_kod=? ORDER BY sira",
              ('G-A1001-CT-001',)).fetchall()
kontrol("gorev_kabul coklu cevap okunuyor", len(r) == 3, str([x[0] for x in r]))

# ============ IlerlemeRepo.gorevSonucuKaydet() akisi ============
u.execute("""INSERT INTO kullanici_konu
  (konu_kod,durum,ilerleme_durumu,gramer_ustaligi,dinleme_durumu,
   kanit_sayisi,uretim_kaniti_var_mi,guncelleme_zamani)
  VALUES('EN-A1-001','BELIRSIZ','acik',0,'olculmedi',0,0,'2026-07-19')""")
u.commit()

def gorev_sonucu_kaydet(gorev_kod, tip, cevap, dogru, tani_guveni, kod,
                        kok_neden, carpan, toplam=3):
    cur = u.cursor()
    cur.execute("BEGIN")
    cur.execute("""INSERT INTO gorev_sonucu
      (tarih,gorev_kod,gorev_tipi,konu_kod,kullanici_cevabi,dogru_mu,sure_ms)
      VALUES('2026-07-19',?,?,'EN-A1-001',?,?,1000)""",
      (gorev_kod, tip, cevap, 1 if dogru else 0))
    sid = cur.lastrowid
    if not dogru:
        cur.execute("""INSERT INTO hata_kaydi
          (gorev_sonucu_id,kod,konu_kod,kullanici_cumlesi,dogru_cumle,
           tani_guveni,kok_neden,kok_neden_carpani,ustaliga_yazildi_mi,tarih)
          VALUES(?,?,'EN-A1-001',?,'dogru form',?,?,?,?, '2026-07-19')""",
          (sid, kod, cevap, tani_guveni, kok_neden, carpan,
           1 if tani_guveni == 'KESIN' else 0))
    d = cur.execute("""SELECT COUNT(DISTINCT gorev_kod) FROM gorev_sonucu
                       WHERE konu_kod='EN-A1-001' AND dogru_mu=1""").fetchone()[0]
    ustalik = min(1.0, d / toplam)
    up = cur.execute("""SELECT COUNT(*) FROM gorev_sonucu
                        WHERE konu_kod='EN-A1-001' AND dogru_mu=1
                        AND gorev_tipi='G-CT'""").fetchone()[0]
    durum = 'ustalasildi' if ustalik >= 0.999 else ('ogreniliyor' if ustalik > 0 else 'acik')
    cur.execute("""UPDATE kullanici_konu SET gramer_ustaligi=?, kanit_sayisi=?,
                   uretim_kaniti_var_mi=?, ilerleme_durumu=?, son_calisma='2026-07-19',
                   guncelleme_zamani='2026-07-19' WHERE konu_kod='EN-A1-001'""",
                (ustalik, d, 1 if up > 0 else 0, durum))
    cur.execute("COMMIT")

# senaryo: 1 yanlis (KESIN), sonra 3 dogru
gorev_sonucu_kaydet('G-A1001-CT-001','G-CT','I coffee drink', False,'KESIN','WO-01','L1_transfer',1.0)
r = u.execute("SELECT gramer_ustaligi, ilerleme_durumu FROM kullanici_konu").fetchone()
kontrol("Yanlis cevap sonrasi ustalik 0 kaliyor", r[0] == 0.0 and r[1] == 'acik', str(r))

gorev_sonucu_kaydet('G-A1001-BD-001','G-BD','read', True,'KESIN',None,'-',0)
gorev_sonucu_kaydet('G-A1001-SR-001','G-SR','I drink coffee.', True,'KESIN',None,'-',0)
r = u.execute("SELECT gramer_ustaligi, ilerleme_durumu, uretim_kaniti_var_mi FROM kullanici_konu").fetchone()
kontrol("2/3 dogru -> ustalik 0.67, ogreniliyor", abs(r[0]-2/3) < 0.01 and r[1]=='ogreniliyor', str(r))
kontrol("Uretim kaniti henuz yok", r[2] == 0)

gorev_sonucu_kaydet('G-A1001-CT-001','G-CT','I drink coffee every morning.', True,'KESIN',None,'-',0)
r = u.execute("SELECT gramer_ustaligi, ilerleme_durumu, uretim_kaniti_var_mi, dinleme_durumu FROM kullanici_konu").fetchone()
kontrol("3/3 dogru -> ustalik 1.0, ustalasildi", abs(r[0]-1.0) < 0.001 and r[1]=='ustalasildi', str(r))
kontrol("Uretim kaniti (G-CT) olustu", r[2] == 1)
kontrol("D-5: dinleme_durumu ETKILENMEDI", r[3] == 'olculmedi', f"({r[3]})")

# hata kaydi tani_guveni
h = u.execute("SELECT kod, tani_guveni, ustaliga_yazildi_mi FROM hata_kaydi").fetchall()
kontrol("Hata kaydi tani_guveni ile yazildi", h == [('WO-01','KESIN',1)], str(h))

# ============ Kalicilik: kapat/ac ============
u.execute("PRAGMA wal_checkpoint(TRUNCATE)")
u.commit(); u.close()
u2 = sqlite3.connect(USER)
n = u2.execute("SELECT COUNT(*) FROM gorev_sonucu").fetchone()[0]
r = u2.execute("SELECT gramer_ustaligi FROM kullanici_konu").fetchone()
kontrol("Kapat/ac sonrasi gorev_sonucu korunuyor", n == 4, f"({n} kayit)")
kontrol("Kapat/ac sonrasi ustalik korunuyor", abs(r[0]-1.0) < 0.001, str(r))
u2.close()

print("\n" + "="*60)
print(f"SEMA + SORGU DOGRULAMASI: {OK} PASS, {FAIL} FAIL")
print("!!! Bu bir Flutter/Dart testi DEGILDIR. Yalnizca SQL dogrulamasidir.")
print("="*60)
sys.exit(0 if FAIL == 0 else 1)
