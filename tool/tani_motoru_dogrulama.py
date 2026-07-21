#!/usr/bin/env python3
"""
tani_motoru.dart ALGORITMASININ birebir Python portu ve testi.

AMAC: Dart derlenemeden once kural kaskadinin mantigini dogrulamak.
BU BIR DART TESTI DEGILDIR. Dart tarafinda ayni vakalar
test/tani_motoru_test.dart ile kosulacaktir.
"""
import re, sys

KISALTMALAR = {
    "i'm": "i am", "you're": "you are", "he's": "he is", "she's": "she is",
    "it's": "it is", "we're": "we are", "they're": "they are",
    "don't": "do not", "doesn't": "does not", "isn't": "is not",
    "aren't": "are not", "can't": "can not",
}

def normalize(s):
    s = s.lower().strip().replace("\u2019", "'").replace("\u2018", "'")
    for k, v in KISALTMALAR.items():
        s = s.replace(k, v)
    s = re.sub(r"[.!?,;:]", " ", s)
    s = re.sub(r"\s+", " ", s).strip()
    return s

def tokenize(s):
    n = normalize(s)
    return n.split(" ") if n else []

def token_mesafe(a, b):
    m, n = len(a), len(b)
    if m == 0: return n
    if n == 0: return m
    onceki = list(range(n + 1))
    for i in range(1, m + 1):
        simdi = [i] + [0] * n
        for j in range(1, n + 1):
            maliyet = 0 if a[i-1] == b[j-1] else 1
            simdi[j] = min(simdi[j-1] + 1, onceki[j] + 1, onceki[j-1] + maliyet)
        onceki = simdi
    return onceki[n]

def ayni_cokluk(a, b):
    return len(a) == len(b) and sorted(a) == sorted(b)

BE = {"am", "is", "are"}
OZNE = {"i", "you", "he", "she", "it", "we", "they"}
ARTIKEL = {"a", "an", "the"}
FIILLER = {"am","is","are","drink","drinks","read","reads","eat","eats","like",
           "likes","work","works","live","lives","go","goes","see","sees",
           "want","wants","have","has","open","opens","write","writes",
           "speak","speaks"}

def fiil_indeksi(t):
    for i, x in enumerate(t):
        if x in FIILLER: return i
    return -1

# --- kurallar: (sira, ad, hata_kodu, guven, kok_neden, eslesir) ---
def r_wo01(b, v):
    if not ayni_cokluk(b, v): return False
    if len(v) < 3: return False
    bi, vi = fiil_indeksi(b), fiil_indeksi(v)
    if bi < 0 or vi < 0: return False
    return vi > bi and vi >= len(v) - 1

def r_be01(b, v):
    bbe = [t for t in b if t in BE]
    if not bbe: return False
    if any(t in BE for t in v): return False
    kalan = [t for t in b if t not in BE]
    return token_mesafe(kalan, v) == 0

def r_su01(b, v):
    if not b or b[0] not in OZNE: return False
    if v and v[0] in OZNE: return False
    return token_mesafe(b[1:], v) == 0

def r_agr01(b, v):
    if len(b) != len(v): return False
    fark, s_eksik = 0, False
    for i in range(len(b)):
        if b[i] == v[i]: continue
        fark += 1
        if b[i] == v[i] + "s" or b[i] == v[i] + "es": s_eksik = True
    return fark == 1 and s_eksik

def r_art01(b, v):
    ba = len([t for t in b if t in ARTIKEL])
    va = len([t for t in v if t in ARTIKEL])
    if ba <= va: return False
    kalan = [t for t in b if t not in ARTIKEL]
    vkalan = [t for t in v if t not in ARTIKEL]
    return token_mesafe(kalan, vkalan) == 0

KURALLAR = [
    (10, "SOV sirasi",        "WO-01",  "KESIN", "L1_transfer",  r_wo01),
    (20, "be fiili eksik",    "BE-01",  "KESIN", "L1_transfer",  r_be01),
    (30, "Ozne eksik",        "SU-01",  "KESIN", "L1_transfer",  r_su01),
    (40, "3. tekil -s eksik", "AGR-01", "KESIN", "eksik_bilgi",  r_agr01),
    (50, "Artikel eksik",     "ART-01", "KESIN", "L1_transfer",  r_art01),
    (60, "Oge sirasi",        "WO-02",  "OLASI", "bilinmiyor",   lambda b, v: ayni_cokluk(b, v)),
    (70, "Kelime secimi",     "LEX-01", "OLASI", "bilinmiyor",   lambda b, v: token_mesafe(b, v) == 1),
]

def degerlendir(cevap, kabuller):
    v = tokenize(cevap)
    kanonik = kabuller[0] if kabuller else ""
    for k in kabuller:
        if token_mesafe(tokenize(k), v) == 0:
            return {"dogru": True, "guven": "KESIN", "kod": None, "neden": None,
                    "kok_neden": "-", "carpan": 0.0}
    if not v:
        return {"dogru": False, "guven": "YOK", "kod": "LEX-99", "neden": None,
                "kok_neden": "bilinmiyor", "carpan": 0.5}
    en_yakin, en_kucuk = tokenize(kanonik), 1 << 30
    for k in kabuller:
        t = tokenize(k); d = token_mesafe(t, v)
        if d < en_kucuk: en_kucuk, en_yakin = d, t
    eslesen = [k for k in KURALLAR if k[5](en_yakin, v)]
    if not eslesen:
        return {"dogru": False, "guven": "YOK", "kod": "LEX-99", "neden": None,
                "kok_neden": "bilinmiyor", "carpan": 0.5}
    eslesen.sort(key=lambda k: k[0])
    ilk = eslesen[0]
    kesin_sayisi = len([k for k in eslesen if k[3] == "KESIN"])
    guven = "OLASI" if (ilk[3] == "KESIN" and kesin_sayisi > 1) else ilk[3]
    return {"dogru": False, "guven": guven, "kod": ilk[2],
            "neden": ilk[1] if guven != "YOK" else None,
            "kok_neden": ilk[4] if guven == "KESIN" else "bilinmiyor",
            "carpan": 1.0 if guven == "KESIN" else 0.5}

# =====================================================================
# TEST VAKALARI  (Dart tarafinda birebir ayni vakalar kosulacak)
# =====================================================================
KAHVE = ["I drink coffee every morning.",
         "Every morning I drink coffee.",
         "I drink coffee in the morning."]
KITAP = ["I read books."]
MUTLU = ["She is happy."]
GELIYOR = ["I am coming."]
CALISIR = ["He works here."]
KOPEK = ["I saw a dog."]

VAKALAR = [
    # (ad, cevap, kabuller, beklenen_dogru, beklenen_guven, beklenen_kod)
    ("Kanonik cevap",              "I drink coffee every morning.", KAHVE, True,  "KESIN", None),
    ("2. kabul cevabi",            "Every morning I drink coffee.", KAHVE, True,  "KESIN", None),
    ("3. kabul cevabi",            "I drink coffee in the morning.", KAHVE, True, "KESIN", None),
    ("Normalizasyon: kucuk harf",  "i drink coffee every morning",  KAHVE, True,  "KESIN", None),
    ("Normalizasyon: fazla bosluk","I  drink   coffee every morning.", KAHVE, True, "KESIN", None),
    ("SOV sirasi (fiil sonda)",    "I books read.",                 KITAP, False, "KESIN", "WO-01"),
    ("be fiili eksik",             "She happy.",                    MUTLU, False, "KESIN", "BE-01"),
    ("Ozne eksik",                 "Am coming.",                    GELIYOR, False, "KESIN", "SU-01"),
    ("3. tekil -s eksik",          "He work here.",                 CALISIR, False, "KESIN", "AGR-01"),
    ("Artikel eksik",              "I saw dog.",                    KOPEK, False, "KESIN", "ART-01"),
    ("Kelime secimi (zayif)",      "I drink tea every morning.",    KAHVE, False, "OLASI", "LEX-01"),
    ("Oge sirasi (zayif)",         "Coffee I drink every morning.", KAHVE, False, "OLASI", "WO-02"),
    ("Tani konulamadi",            "hello world",                   KAHVE, False, "YOK",   "LEX-99"),
    ("Bos cevap",                  "",                              KAHVE, False, "YOK",   "LEX-99"),
    ("Iki hata ayni anda",         "He teacher.",   ["He is a teacher."], False, "YOK", "LEX-99"),
]

def main():
    gecen = 0
    print(f"{'VAKA':32s} {'DOGRU':6s} {'GUVEN':6s} {'KOD':8s} {'CARPAN':7s} SONUC")
    print("-" * 78)
    for ad, cevap, kabuller, bd, bg, bk in VAKALAR:
        s = degerlendir(cevap, kabuller)
        ok = (s["dogru"] == bd and s["guven"] == bg and s["kod"] == bk)
        gecen += ok
        print(f"{ad:32s} {str(s['dogru']):6s} {s['guven']:6s} "
              f"{str(s['kod'] or '-'):8s} {s['carpan']:<7.1f} "
              f"{'PASS' if ok else 'FAIL beklenen=' + str((bd,bg,bk))}")
    print("-" * 78)
    print(f"ALGORITMA TESTI: {gecen}/{len(VAKALAR)} PASS")
    print()
    print("!!! Bu, Dart kodunun derlendigi anlamina GELMEZ.")
    print("!!! Yalnizca kural kaskadi mantiginin dogru oldugunu gosterir.")
    return 0 if gecen == len(VAKALAR) else 1

if __name__ == "__main__":
    sys.exit(main())
