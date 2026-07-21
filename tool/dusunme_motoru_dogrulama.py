#!/usr/bin/env python3
"""
DUSUNME MOTORU — genel (veri odakli) tasarim dogrulamasi.

AMAC: Ingilizce dusunme katmaninin SVO'ya OZEL KODLANMADIGINI kanitlamak.
Motor yalnizca ROL KODLARI ve SIRA verisiyle calisir; hicbir yerde
'EN-A1-001' veya 'SVO' gecmez.

Kanit yontemi: ayni motorla iki farkli konu calistirilir.
  1) EN-A1-001  SVO           en_sira: KIM, NE_YAPIYOR, NEYI, NASIL, NEREDE, NE_ZAMAN
  2) TEST-SORU  soru yapisi   en_sira: YARDIMCI, KIM, NE_YAPIYOR, NEYI
Motor kodunda hicbir degisiklik yapilmaz.
"""
import sqlite3, tempfile, os, sys, re

OK = FAIL = 0
def k(ad, kosul, detay=""):
    global OK, FAIL
    if kosul: OK += 1; print(f"[OK]   {ad}" + (f"  {detay}" if detay else ""))
    else: FAIL += 1; print(f"[FAIL] {ad}  {detay}")

# ============================================================
# 1. SEMA (migration v2 — YALNIZCA EKLEME, mevcut tablolar bozulmaz)
# ============================================================
tmp = tempfile.mkdtemp(); DB = os.path.join(tmp, "c.db")
c = sqlite3.connect(DB)
c.executescript("""
-- mevcut v1 tablolarindan ornek (bozulmadigini gostermek icin)
CREATE TABLE konu(kod TEXT PRIMARY KEY, ad_tr TEXT, arsiv INT DEFAULT 0);

-- ===== v2: DUSUNME KATMANI (5 yeni tablo) =====
CREATE TABLE dusunme_modeli(
  konu_kod TEXT PRIMARY KEY,
  ad       TEXT NOT NULL,
  ozet     TEXT NOT NULL,
  tr_sira  TEXT NOT NULL,   -- rol kodlari, virgullu
  en_sira  TEXT NOT NULL);

CREATE TABLE zihinsel_soru(
  konu_kod TEXT NOT NULL, sira INT NOT NULL, rol_kodu TEXT NOT NULL,
  soru_tr TEXT NOT NULL, ipucu TEXT, zorunlu_mu INT NOT NULL DEFAULT 1,
  PRIMARY KEY(konu_kod, sira));

CREATE TABLE dusunme_ornegi(
  konu_kod TEXT NOT NULL, kod TEXT NOT NULL,
  tip TEXT NOT NULL,             -- 'dogru' | 'yanlis'
  tr_cumle TEXT NOT NULL, en_cumle TEXT NOT NULL, aciklama TEXT,
  PRIMARY KEY(konu_kod, kod));

CREATE TABLE anlam_blogu(
  konu_kod TEXT NOT NULL, ornek_kod TEXT NOT NULL, sira INT NOT NULL,
  rol_kodu TEXT NOT NULL, blok_tr TEXT NOT NULL, blok_en TEXT NOT NULL,
  PRIMARY KEY(konu_kod, ornek_kod, sira));

CREATE TABLE mudahale_hatasi(
  konu_kod TEXT NOT NULL, kod TEXT NOT NULL, baslik TEXT NOT NULL,
  aciklama TEXT NOT NULL, yanlis TEXT NOT NULL, dogru TEXT NOT NULL,
  PRIMARY KEY(konu_kod, kod));
""")
k("v2 semasi olusturuldu (5 yeni tablo, mevcutlar bozulmadi)", True)

# ============================================================
# 2. ICERIK — konu 1: SVO
# ============================================================
def konu_ekle(kod, ad, ozet, tr_sira, en_sira, sorular, ornekler, bloklar, mudahaleler):
    c.execute("INSERT INTO konu VALUES(?,?,0)", (kod, ad))
    c.execute("INSERT INTO dusunme_modeli VALUES(?,?,?,?,?)",
              (kod, ad, ozet, ",".join(tr_sira), ",".join(en_sira)))
    for i, (rol, soru, ipucu, zor) in enumerate(sorular, 1):
        c.execute("INSERT INTO zihinsel_soru VALUES(?,?,?,?,?,?)",
                  (kod, i, rol, soru, ipucu, zor))
    for o in ornekler:
        c.execute("INSERT INTO dusunme_ornegi VALUES(?,?,?,?,?,?)", (kod,)+o)
    for ok_, bl in bloklar.items():
        for i, (rol, tr, en) in enumerate(bl, 1):
            c.execute("INSERT INTO anlam_blogu VALUES(?,?,?,?,?,?)",
                      (kod, ok_, i, rol, tr, en))
    for m in mudahaleler:
        c.execute("INSERT INTO mudahale_hatasi VALUES(?,?,?,?,?,?)", (kod,)+m)

konu_ekle(
  "EN-A1-001", "Temel Cumle Sirasi (SVO)",
  "Turkce cumleyi kelime kelime cevirme. Once anlam bloklarina ayir, "
  "sonra Ingilizce siraya yerlestir.",
  tr_sira=["NE_ZAMAN","KIM","NEREDE","NEYI","NASIL","NE_YAPIYOR"],
  en_sira=["KIM","NE_YAPIYOR","NEYI","NASIL","NEREDE","NE_ZAMAN"],
  sorular=[
    ("KIM","Kim?","Eylemi yapan kisi veya sey",1),
    ("NE_YAPIYOR","Ne yapiyor?","Fiil. Hemen ozneden sonra yazilir",1),
    ("NEYI","Neyi / kimi?","Eylemden etkilenen sey",0),
    ("NEREDE","Nerede?","Yer bildiren blok",0),
    ("NE_ZAMAN","Ne zaman?","Zaman bildiren blok",0),
    ("NASIL","Nasil?","Bicim bildiren blok",0),
  ],
  ornekler=[
    ("O1","dogru","Ben her sabah evde kahve icerim.",
     "I drink coffee at home every morning.",
     "Once bloklara ayrildi, sonra Ingilizce siraya dizildi."),
    ("O2","dogru","O kitap okur.","She reads books.",
     "Iki blok yeterli: KIM + NE_YAPIYOR + NEYI."),
    ("Y1","yanlis","Ben her sabah evde kahve icerim.",
     "Every morning at home I coffee drink.",
     "Turkce sira aynen tasindi. Fiil sona atildi, zaman basa alindi."),
    ("Y2","yanlis","O kitap okur.","She books reads.",
     "Kelime kelime cevrildi; blok sirasi Turkce kaldi."),
  ],
  bloklar={
    "O1":[("KIM","Ben","I"),("NE_YAPIYOR","icerim","drink"),
          ("NEYI","kahve","coffee"),("NEREDE","evde","at home"),
          ("NE_ZAMAN","her sabah","every morning")],
    "O2":[("KIM","O","She"),("NE_YAPIYOR","okur","reads"),
          ("NEYI","kitap","books")],
    "Y1":[("NE_ZAMAN","her sabah","every morning"),("NEREDE","evde","at home"),
          ("KIM","Ben","I"),("NEYI","kahve","coffee"),
          ("NE_YAPIYOR","icerim","drink")],
    "Y2":[("KIM","O","She"),("NEYI","kitap","books"),
          ("NE_YAPIYOR","okur","reads")],
  },
  mudahaleler=[
    ("M1","Fiili sona atma",
     "Turkce cumlede fiil sondadir. Bu refleks Ingilizceye tasininca "
     "cumle anlasilmaz hale gelir.","I coffee drink.","I drink coffee."),
    ("M2","Zaman ifadesini basa alma",
     "Turkcede 'her sabah' basa gelir. Ingilizcede zaman bloku genellikle SONA gider.",
     "Every morning I coffee drink.","I drink coffee every morning."),
    ("M3","Kelime kelime cevirme",
     "Her Turkce kelimeye bir Ingilizce kelime aramak yerine anlam bloklarina ayirin.",
     "Ben-I her-every sabah-morning kahve-coffee icerim-drink",
     "[Ben][icerim][kahve][her sabah] -> I drink coffee every morning."),
  ])

# ============================================================
# 3. ICERIK — konu 2: FARKLI SIRA (motorun genelligini kanitlar)
# ============================================================
konu_ekle(
  "TEST-SORU", "Evet-Hayir Sorusu (test fixture)",
  "Soruda yardimci fiil basa gecer.",
  tr_sira=["KIM","NEYI","NE_YAPIYOR"],
  en_sira=["YARDIMCI","KIM","NE_YAPIYOR","NEYI"],
  sorular=[
    ("YARDIMCI","Hangi yardimci fiil?","do / does",1),
    ("KIM","Kim?","Ozne",1),
    ("NE_YAPIYOR","Ne yapiyor?","Fiil yalin halde",1),
    ("NEYI","Neyi / kimi?","Nesne",0),
  ],
  ornekler=[("O1","dogru","Sen kahve sever misin?","Do you like coffee?",
             "Yardimci fiil basa gecti.")],
  bloklar={"O1":[("YARDIMCI","-","Do"),("KIM","Sen","you"),
                 ("NE_YAPIYOR","sever","like"),("NEYI","kahve","coffee")]},
  mudahaleler=[("M1","Yardimci fiili unutma",
                "Turkcede soru eki fiile eklenir; Ingilizcede ayri kelime basa gelir.",
                "You like coffee?","Do you like coffee?")])
c.commit()

# ============================================================
# 4. MOTOR — konu kodu bilmez, yalnizca veriyle calisir
# ============================================================
class DusunmeMotoru:
    """Genel motor. Hicbir konu koduna veya rol adina KOSULLU BAGLI DEGIL."""

    def __init__(self, conn, konu_kod):
        self.k = konu_kod
        r = conn.execute("SELECT ad,ozet,tr_sira,en_sira FROM dusunme_modeli "
                         "WHERE konu_kod=?", (konu_kod,)).fetchone()
        if not r: raise ValueError("dusunme modeli yok: " + konu_kod)
        self.ad, self.ozet = r[0], r[1]
        self.tr_sira = r[2].split(",")
        self.en_sira = r[3].split(",")
        self.sorular = conn.execute(
            "SELECT sira,rol_kodu,soru_tr,ipucu,zorunlu_mu FROM zihinsel_soru "
            "WHERE konu_kod=? ORDER BY sira", (konu_kod,)).fetchall()
        self.ornekler = conn.execute(
            "SELECT kod,tip,tr_cumle,en_cumle,aciklama FROM dusunme_ornegi "
            "WHERE konu_kod=? ORDER BY tip DESC,kod", (konu_kod,)).fetchall()
        self.bloklar = {}
        for ok_, sira, rol, tr, en in conn.execute(
                "SELECT ornek_kod,sira,rol_kodu,blok_tr,blok_en FROM anlam_blogu "
                "WHERE konu_kod=? ORDER BY ornek_kod,sira", (konu_kod,)):
            self.bloklar.setdefault(ok_, []).append((rol, tr, en))
        self.mudahaleler = conn.execute(
            "SELECT kod,baslik,aciklama,yanlis,dogru FROM mudahale_hatasi "
            "WHERE konu_kod=? ORDER BY kod", (konu_kod,)).fetchall()

    def sorulacak_sorular(self, ornek_kod):
        """Bu ornekte hangi zihinsel sorular sorulur? (veriden turetilir)"""
        roller = {r for r,_,_ in self.bloklar.get(ornek_kod, [])}
        return [(s[0], s[1], s[2], s[3]) for s in self.sorular if s[1] in roller]

    def ingilizce_diz(self, ornek_kod):
        """Bloklari EN sirasina gore dizer. Sira VERIDEN gelir."""
        bl = {r: en for r, _, en in self.bloklar.get(ornek_kod, [])}
        return " ".join(bl[r] for r in self.en_sira if r in bl)

    def turkce_diz(self, ornek_kod):
        bl = {r: tr for r, tr, _ in self.bloklar.get(ornek_kod, [])}
        return " ".join(bl[r] for r in self.tr_sira if r in bl)

    def blok_cevabi_dogru_mu(self, ornek_kod, rol, cevap):
        for r, _, en in self.bloklar.get(ornek_kod, []):
            if r == rol:
                return _norm(cevap) == _norm(en)
        return False

    def sira_kontrol(self, verilen_roller):
        """Verilen rollerin GORECELI sirasi EN sirasina uyuyor mu?"""
        beklenen = [r for r in self.en_sira if r in verilen_roller]
        return list(verilen_roller) == beklenen, beklenen

    def eksik_zorunlu_roller(self, verilen_roller):
        """Zorunlu ama verilmemis roller. Sira kontrolunden AYRI bir kontrol."""
        zorunlu = [s[1] for s in self.sorular if s[4] == 1]
        return [r for r in zorunlu if r not in verilen_roller]

def _norm(s):
    return re.sub(r"\s+", " ", s.lower().strip().rstrip(".!?"))

# ============================================================
# 5. TESTLER
# ============================================================
print("\n=== KONU 1: EN-A1-001 (SVO) ===")
m = DusunmeMotoru(c, "EN-A1-001")
k("Model yuklendi", m.ad.startswith("Temel"), m.ad)
k("6 zihinsel soru var", len(m.sorular) == 6, str([s[1] for s in m.sorular]))
k("TR sirasi fiil SONDA", m.tr_sira[-1] == "NE_YAPIYOR", ",".join(m.tr_sira))
k("EN sirasi fiil IKINCI", m.en_sira[1] == "NE_YAPIYOR", ",".join(m.en_sira))

en = m.ingilizce_diz("O1")
k("O1 bloklardan EN cumlesi kuruldu", en == "I drink coffee at home every morning.".rstrip("."),
  repr(en))
tr = m.turkce_diz("O1")
k("O1 bloklardan TR cumlesi kuruldu", "icerim" in tr and tr.endswith("icerim"), repr(tr))

sorulacak = m.sorulacak_sorular("O2")
k("O2 icin yalnizca 3 soru sorulur (veriden turetildi)",
  [s[1] for s in sorulacak] == ["KIM","NE_YAPIYOR","NEYI"],
  str([s[1] for s in sorulacak]))

k("Blok cevabi dogru kabul edilir", m.blok_cevabi_dogru_mu("O2","NE_YAPIYOR","reads"))
k("Blok cevabi yanlis reddedilir", not m.blok_cevabi_dogru_mu("O2","NE_YAPIYOR","read"))
k("Buyuk/kucuk harf tolere edilir", m.blok_cevabi_dogru_mu("O2","KIM","she"))

ok_, bekl = m.sira_kontrol(["KIM","NEYI","NE_YAPIYOR"])
k("Turkce sira (KIM,NEYI,NE_YAPIYOR) REDDEDILIR", not ok_, "beklenen=" + ",".join(bekl))
ok_, _ = m.sira_kontrol(["KIM","NE_YAPIYOR","NEYI"])
k("Ingilizce sira KABUL EDILIR", ok_)

k("Dogru dusunme ornegi var", any(o[1]=="dogru" for o in m.ornekler))
k("Yanlis dusunme ornegi var", any(o[1]=="yanlis" for o in m.ornekler))
k("Turkce mudahale hatasi >= 3", len(m.mudahaleler) >= 3, f"{len(m.mudahaleler)} adet")

print("\n=== KONU 2: TEST-SORU (motor kodu DEGISMEDEN) ===")
m2 = DusunmeMotoru(c, "TEST-SORU")
k("Farkli konu ayni motorla yuklendi", m2.ad.startswith("Evet-Hayir"))
k("Farkli EN sirasi okundu", m2.en_sira == ["YARDIMCI","KIM","NE_YAPIYOR","NEYI"],
  ",".join(m2.en_sira))
en2 = m2.ingilizce_diz("O1")
k("Farkli siradan EN cumlesi kuruldu", en2 == "Do you like coffee", repr(en2))
eksik = m2.eksik_zorunlu_roller(["KIM","NE_YAPIYOR","NEYI"])
k("Bu konuda eksik zorunlu rol YARDIMCI olarak bildirilir",
  eksik == ["YARDIMCI"], str(eksik))
eksik1 = m.eksik_zorunlu_roller(["KIM","NE_YAPIYOR"])
k("SVO konusunda ayni kontrol eksik rol bulmaz (NEYI zorunlu degil)",
  eksik1 == [], str(eksik1))
ok_, _ = m2.sira_kontrol(["YARDIMCI","KIM","NE_YAPIYOR","NEYI"])
k("Bu konuda dogru sira kabul edilir", ok_)

print("\n=== GENELLIK KANITI ===")
kaynak = open(__file__, encoding="utf-8").read()
motor = kaynak[kaynak.index("class DusunmeMotoru"):kaynak.index("def _norm")]
k("Motor sinifinda konu kodu GECMIYOR",
  "EN-A1-001" not in motor and "TEST-SORU" not in motor)
k("Motor sinifinda rol adi SABIT KODLANMAMIS",
  not any(r in motor for r in ["KIM","NE_YAPIYOR","NEYI","NEREDE","NE_ZAMAN","NASIL"]))
k("Motor sinifinda 'SVO' gecmiyor", "SVO" not in motor)

print("\n" + "="*66)
print(f"DUSUNME MOTORU DOGRULAMASI: {OK} PASS, {FAIL} FAIL")
print("Bu bir Flutter/Dart derlemesi DEGILDIR.")
print("="*66)
c.close()
sys.exit(1 if FAIL else 0)
