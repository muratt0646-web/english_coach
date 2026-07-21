#!/usr/bin/env python3
"""
Faz 2A icerik dogrulamasi: ders_en_a1_001.dart -> SQLite'a yuklenebilir mi?
Dart kaynagini ayristirir, sema kurallarina karsi dogrular.
BU BIR FLUTTER TESTI DEGILDIR.
"""
import re, sqlite3, sys, tempfile, os

SRC = 'lib/core/content/ders_en_a1_001.dart'
_ham = open(SRC, encoding='utf-8').read()
# /// dokumantasyon satirlarini cikar: icerik taramasina karismasin
s = re.sub(r'^\s*///.*$', '', _ham, flags=re.M)
OK = FAIL = 0
def k(ad, kosul, detay=""):
    global OK, FAIL
    if kosul: OK += 1; print(f"[OK]   {ad}" + (f"  {detay}" if detay else ""))
    else: FAIL += 1; print(f"[FAIL] {ad}  {detay}")

# --- adimlar ---
adim_blok = s[s.index('adimlar = ['):s.index('static const List<Map<String, Object?>> gorevler')]
adimlar = re.findall(r"\['(\d+)',\s*'([a-z_]+)'", adim_blok)
k("Ders adimi ayristirildi", len(adimlar) > 0, f"{len(adimlar)} adim")
k("Adim numaralari benzersiz", len({a[0] for a in adimlar}) == len(adimlar))
tipler = {a[1] for a in adimlar}
k("Adim tipleri taninir",
  tipler <= {'sunum','svo','ornek_dogru','ornek_yanlis','karsilastirma','ozet','tekrar'},
  str(sorted(tipler)))

# --- SVO bloklari ---
svo = re.findall(r'\[BLOK\](.*?)\[/BLOK\]', s, re.S)
k("Blok kutu blogu var", len(svo) >= 4, f"{len(svo)} kutu")
for i, b in enumerate(svo, 1):
    alan = dict(re.findall(r'^\s*(\w+):\s*(.+)$', b, re.M))
    tam = all(x in alan for x in ('tr','tr_rol','en','en_rol'))
    tr_n = len(alan.get('tr','').split('|')); trr_n = len(alan.get('tr_rol','').split('|'))
    en_n = len(alan.get('en','').split('|')); enr_n = len(alan.get('en_rol','').split('|'))
    k(f"Blok kutu {i}: alanlar tam ve hucre sayilari eslesiyor",
      tam and tr_n == trr_n and en_n == enr_n, f"tr={tr_n}/{trr_n} en={en_n}/{enr_n}")

# --- ornekler ---
dogru_satir = re.findall(r'^\| (\d+) \| ([A-Z][^|]*\.) \| ([^|]+) \|$', s, re.M)
k("En az 25 dogru ornek", len(dogru_satir) >= 25, f"{len(dogru_satir)} ornek")
yanlis_satir = re.findall(r'^\| (\d+) \| \*([^*]+)\* \| ([^|]+) \| ([^|]+) \|$', s, re.M)
k("En az 25 yanlis ornek", len(yanlis_satir) >= 25, f"{len(yanlis_satir)} ornek")
k("Her yanlis ornegin aciklamasi var",
  all(len(y[3].strip()) > 10 for y in yanlis_satir),
  f"en kisa aciklama {min((len(y[3].strip()) for y in yanlis_satir), default=0)} karakter")

# --- gorevler ---
gorev_blok = s[s.index('gorevler = ['):s.index('static const List<List<String>> kelimeler')]
kodlar = re.findall(r"'kod':\s*'([^']+)'", gorev_blok)
adimno = [int(x) for x in re.findall(r"'adim':\s*(\d+)", gorev_blok)]
tipler_g = re.findall(r"'tip':\s*'([^']+)'", gorev_blok)
kabul_bloklari = re.findall(r"'kabul':\s*\[(.*?)\]", gorev_blok, re.S)
k("Gorev kodlari benzersiz", len(set(kodlar)) == len(kodlar), f"{len(kodlar)} gorev")
k("Her gorevin kabul kumesi var", len(kabul_bloklari) == len(kodlar),
  f"{len(kabul_bloklari)}/{len(kodlar)}")
k("Gorev tipleri taninir", set(tipler_g) <= {'G-BD','G-EM','G-SR','G-CE','G-CT'},
  str(sorted(set(tipler_g))))
bos = [kodlar[i] for i,b in enumerate(kabul_bloklari) if not b.strip()]
k("Bos kabul kumesi yok", not bos, str(bos))
ct = [i for i,t in enumerate(tipler_g) if t == 'G-CT']
k("Uretim gorevi (G-CT) sayisi >= 8", len(ct) >= 8, f"{len(ct)} adet")

# --- kelimeler ---
kelimeler = re.findall(r"\['(W-\d{4})',\s*'([^']+)',\s*'([^']*)',\s*'([^']*)',\s*'([^']+)',\s*'([^']+)'\]", s)
k("Kelime sayisi >= 30", len(kelimeler) >= 30, f"{len(kelimeler)} kelime")
k("Kelime kodlari benzersiz", len({x[0] for x in kelimeler}) == len(kelimeler))
k("Kelime yazilislari benzersiz", len({x[1] for x in kelimeler}) == len(kelimeler))
k("Her kelimenin IPA'si var", all(x[2].strip() for x in kelimeler))
k("Her kelimenin Turkce anlami var", all(x[5].strip() for x in kelimeler))

# --- gercek SQLite yuklemesi ---
tmp = tempfile.mkdtemp(); db = os.path.join(tmp, 'c.db')
c = sqlite3.connect(db)
c.executescript("""
CREATE TABLE konu(kod TEXT PRIMARY KEY, seviye TEXT, alan TEXT, ad_tr TEXT,
  ogretim_amaci TEXT, tahmini_sure_dk INT, icerik_durumu TEXT, surum TEXT,
  arsiv INT DEFAULT 0);
CREATE TABLE ders_adim(konu_kod TEXT, adim_no INT, tip TEXT, govde_md TEXT,
  PRIMARY KEY(konu_kod, adim_no));
CREATE TABLE gorev(kod TEXT PRIMARY KEY, konu_kod TEXT, adim_no INT, tip TEXT,
  govde TEXT, ipucu TEXT, zorluk INT, hedef_yapi TEXT, arsiv INT DEFAULT 0);
CREATE TABLE gorev_kabul(gorev_kod TEXT, sira INT, cevap TEXT,
  esdeger_mi INT DEFAULT 1, not_tr TEXT, PRIMARY KEY(gorev_kod, sira));
CREATE TABLE kelime(kod TEXT PRIMARY KEY, yazilis TEXT UNIQUE, ipa TEXT,
  tr_okunus TEXT, tur TEXT, seviye TEXT, frekans_sirasi INT, arsiv INT DEFAULT 0);
CREATE TABLE kelime_anlam(kelime_kod TEXT, sira INT, tr_anlam TEXT,
  PRIMARY KEY(kelime_kod, sira));
""")
c.execute("INSERT INTO konu VALUES('EN-A1-001','A1','SOZ','Temel Cumle Sirasi (SVO)','x',50,'onayli','0.2.0',0)")
for no, tip in adimlar:
    c.execute("INSERT INTO ders_adim VALUES('EN-A1-001',?,?,?)", (int(no), tip, 'govde'))
for i, kod in enumerate(kodlar):
    c.execute("INSERT INTO gorev VALUES(?,'EN-A1-001',?,?,?,NULL,1,'SVO',0)",
              (f'EN-A1-001-{kod}', adimno[i], tipler_g[i], 'govde'))
    cevaplar = re.findall(r"""['"]((?:[^'"\\]|\\.)+)['"]""", kabul_bloklari[i])
    for j, cv in enumerate(cevaplar):
        c.execute("INSERT INTO gorev_kabul VALUES(?,?,?,1,NULL)",
                  (f'EN-A1-001-{kod}', j, cv))
for i, w in enumerate(kelimeler):
    c.execute("INSERT INTO kelime VALUES(?,?,?,?,?,'A1',?,0)", (w[0],w[1],w[2],w[3],w[4],i+1))
    c.execute("INSERT INTO kelime_anlam VALUES(?,0,?)", (w[0], w[5]))
c.commit()
k("SQLite'a yukleme basarili", True)
n_gk = c.execute("SELECT count(*) FROM gorev_kabul").fetchone()[0]
k("gorev_kabul satirlari yazildi", n_gk >= len(kodlar), f"{n_gk} kabul cevabi")
eksik = c.execute("""SELECT g.kod FROM gorev g LEFT JOIN gorev_kabul k
                     ON k.gorev_kod=g.kod WHERE k.gorev_kod IS NULL""").fetchall()
k("Kabul cevabi olmayan gorev yok", not eksik, str(eksik))
c.close()

print("\n" + "="*62)
print(f"ICERIK DOGRULAMASI: {OK} PASS, {FAIL} FAIL")
print("Bu bir Flutter/Dart derlemesi DEGILDIR.")
print("="*62)
sys.exit(1 if FAIL else 0)
