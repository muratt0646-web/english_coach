#!/usr/bin/env python3
"""
TANI MOTORU v2 — gramer / anlam ayrimi prototipi ve testi.
Dart'a portlanmadan once mantigi dogrular.

v1'in sorunu: "Every day I drink coffee" (beklenen: "Every morning I drink coffee")
  -> LEX-01 / OLASI_TANI / "Yapi dogru gorunuyor; bir kelime farkli"
  Bu cevap ise yaramaz: hangi kelime? gramer dogru mu? ne yapmali?

v2 hedefi:
  -> SOZ-01 / KESIN_TANI / kategori=SOZCUK / gramer_dogru=True
     beklenen_kelime='morning'  yazilan_kelime='day'
"""
import re, sys

# ---------------------------------------------------------------- normalize
KISALTMALAR = {
    "i'm":"i am","you're":"you are","he's":"he is","she's":"she is",
    "it's":"it is","we're":"we are","they're":"they are","don't":"do not",
    "doesn't":"does not","isn't":"is not","aren't":"are not","can't":"can not",
}
def normalize(s):
    s = s.lower().strip().replace("\u2019","'").replace("\u2018","'")
    for k,v in KISALTMALAR.items(): s = s.replace(k,v)
    s = re.sub(r"[.!?,;:]"," ",s)
    return re.sub(r"\s+"," ",s).strip()

def tokenize(s):
    n = normalize(s)
    return n.split(" ") if n else []

def token_mesafe(a,b):
    m,n = len(a),len(b)
    if m==0: return n
    if n==0: return m
    onceki = list(range(n+1))
    for i in range(1,m+1):
        simdi=[i]+[0]*n
        for j in range(1,n+1):
            simdi[j]=min(simdi[j-1]+1, onceki[j]+1,
                         onceki[j-1]+(0 if a[i-1]==b[j-1] else 1))
        onceki=simdi
    return onceki[n]

def karakter_mesafe(a,b):
    m,n=len(a),len(b)
    if m==0: return n
    if n==0: return m
    onceki=list(range(n+1))
    for i in range(1,m+1):
        simdi=[i]+[0]*n
        for j in range(1,n+1):
            simdi[j]=min(simdi[j-1]+1, onceki[j]+1,
                         onceki[j-1]+(0 if a[i-1]==b[j-1] else 1))
        onceki=simdi
    return onceki[n]

# ---------------------------------------------------------------- sozluk
ARTIKEL   = {"a","an","the"}
OZNE      = {"i","you","he","she","it","we","they"}
NESNE_ZAM = {"me","him","her","us","them"}
IYELIK    = {"my","your","his","its","our","their"}
BE        = {"am","is","are","was","were"}
YARDIMCI  = {"do","does","did","have","has","had","will","can"}
EDAT      = {"in","on","at","to","from","for","with","of","about","into"}
BAGLAC    = {"and","but","or","so","because"}
BELIRTEC  = {"every","some","any","many","much","all","this","that","these",
             "those","no","each"}
OLUMSUZ   = {"not","never"}

# Fonksiyon kelimeleri: gramer tasiyicilari
FONKSIYON = (ARTIKEL | OZNE | NESNE_ZAM | IYELIK | BE | YARDIMCI |
             EDAT | BAGLAC | BELIRTEC | OLUMSUZ)

# Ders kapsamindaki fiiller (3. tekil ciftleriyle)
FIIL_CIFT = {
    "drink":"drinks","read":"reads","eat":"eats","like":"likes","work":"works",
    "live":"lives","go":"goes","see":"sees","want":"wants","open":"opens",
    "write":"writes","speak":"speaks","play":"plays","watch":"watches",
    "study":"studies","teach":"teaches","buy":"buys","make":"makes",
}
FIILLER = set(FIIL_CIFT) | set(FIIL_CIFT.values()) | BE | YARDIMCI

def icerik_kelimesi(t):
    return t not in FONKSIYON

def fiil_indeksi(t):
    for i,x in enumerate(t):
        if x in FIILLER: return i
    return -1

def fiil_cekim_cifti(bek, yaz):
    """work/works gibi ayni fiilin farkli cekimi mi?"""
    return (FIIL_CIFT.get(yaz) == bek) or (FIIL_CIFT.get(bek) == yaz)

# ---------------------------------------------------------------- kategoriler
GRAMER, SOZCUK, YAZIM, SIRALAMA, BELIRSIZ = "GRAMER","SOZCUK","YAZIM","SIRALAMA","BELIRSIZ"
KESIN, OLASI, YOK = "KESIN_TANI","OLASI_TANI","TANI_KONULAMADI"

def sonuc(dogru=False, guven=YOK, kod=None, kategori=BELIRSIZ, gramer_dogru=None,
          beklenen_kelime=None, yazilan_kelime=None, neden=None, karsit=None,
          kok_neden="bilinmiyor", dogru_form=""):
    carpan = 1.0 if guven==KESIN else (0.5 if guven==OLASI else 0.5)
    if dogru: carpan = 0.0
    return dict(dogru=dogru, guven=guven, kod=kod, kategori=kategori,
                gramer_dogru=gramer_dogru, beklenen_kelime=beklenen_kelime,
                yazilan_kelime=yazilan_kelime, neden=neden, karsit=karsit,
                kok_neden=kok_neden if not dogru else "-",
                carpan=carpan, dogru_form=dogru_form)

# ---------------------------------------------------------------- v2 kaskadi
def degerlendir(cevap, kabuller, kelime_anlam=None):
    kelime_anlam = kelime_anlam or {}
    v = tokenize(cevap)
    kanonik = kabuller[0] if kabuller else ""

    # [1] tam eslesme
    for k in kabuller:
        if token_mesafe(tokenize(k), v) == 0:
            return sonuc(dogru=True, guven=KESIN, dogru_form=kanonik)
    if not v:
        return sonuc(kod="LEX-99", dogru_form=kanonik)

    # [2] en yakin kabul
    b, en_kucuk = tokenize(kanonik), 1<<30
    for k in kabuller:
        t = tokenize(k); d = token_mesafe(t, v)
        if d < en_kucuk: en_kucuk, b = d, t

    # ============ A0. SIRALAMA (multiset ayni -> kelime degisimi YOK) ============
    # Bu kontrol A'dan ONCE gelir: ayni kelimeler farkli siradaysa
    # sozcuk degisimi degil, siralama hatasi vardir.
    if sorted(b) == sorted(v):
        bi, vi = fiil_indeksi(b), fiil_indeksi(v)
        if bi >= 0 and vi >= 0 and vi > bi and vi >= len(v)-1 and len(v) >= 3:
            return sonuc(guven=KESIN, kod="WO-01", kategori=SIRALAMA,
                gramer_dogru=False,
                neden="Turkcede fiil cumlenin sonunda gelir (Ben su icerim). "
                      "Ingilizcede fiil ozneden hemen sonra gelir: Ozne + Fiil + Nesne.",
                karsit="I read books. (Ben kitap okurum.)",
                kok_neden="L1_transfer", dogru_form=kanonik)
        return sonuc(guven=OLASI, kod="WO-02", kategori=SIRALAMA, gramer_dogru=False,
            neden="Kelimeler dogru ama sira farkli. Ingilizcede oge sirasi anlam tasir.",
            dogru_form=kanonik)

    # ============ A. TEK KONUMDA FARK (ayni uzunluk) ============
    if len(b) == len(v):
        farklar = [(i,b[i],v[i]) for i in range(len(b)) if b[i]!=v[i]]

        if len(farklar) == 1:
            i, bek, yaz = farklar[0]

            # A1. fiil cekimi -> GRAMER (ozne-fiil uyumu)
            if fiil_cekim_cifti(bek, yaz):
                return sonuc(guven=KESIN, kod="AGR-01", kategori=GRAMER,
                    gramer_dogru=False, beklenen_kelime=bek, yazilan_kelime=yaz,
                    neden="Present Simple'da he/she/it oznesiyle fiile -s eklenir.",
                    karsit="He works here. (O burada calisir.)",
                    kok_neden="eksik_bilgi", dogru_form=kanonik)

            # A2. artikel degisimi -> GRAMER
            if bek in ARTIKEL and yaz in ARTIKEL:
                return sonuc(guven=KESIN, kod="ART-02", kategori=GRAMER,
                    gramer_dogru=False, beklenen_kelime=bek, yazilan_kelime=yaz,
                    neden="Artikel secimi yanlis. a/an belirsiz, the belirlidir.",
                    karsit="I saw a dog. The dog was big.",
                    kok_neden="eksik_bilgi", dogru_form=kanonik)

            # A3. edat degisimi -> GRAMER
            if bek in EDAT and yaz in EDAT:
                return sonuc(guven=KESIN, kod="PREP-01", kategori=GRAMER,
                    gramer_dogru=False, beklenen_kelime=bek, yazilan_kelime=yaz,
                    neden="Edat secimi yanlis. Turkcede tek ek (-de) Ingilizcede "
                          "in/on/at olarak ucе ayrilir.",
                    karsit="in the room / on the table / at home",
                    kok_neden="L1_transfer", dogru_form=kanonik)

            # A4. yazim hatasi -> YAZIM  (karakter mesafesi kucuk)
            if karakter_mesafe(bek, yaz) <= 2 and bek[:1] == yaz[:1] \
               and abs(len(bek)-len(yaz)) <= 2:
                return sonuc(guven=KESIN, kod="YAZ-01", kategori=YAZIM,
                    gramer_dogru=True, beklenen_kelime=bek, yazilan_kelime=yaz,
                    neden="Yapi dogru; kelime yanlis yazilmis.",
                    kok_neden="yazim", dogru_form=kanonik)

            # A5. icerik kelimesi degisimi -> SOZCUK (gramer DOGRU)
            if icerik_kelimesi(bek) and icerik_kelimesi(yaz):
                bek_tr = kelime_anlam.get(bek); yaz_tr = kelime_anlam.get(yaz)
                aciklama = "Cumlenin yapisi dogru. Yalnizca kelime secimi farkli."
                if bek_tr and yaz_tr:
                    aciklama = (f"Cumlenin yapisi dogru. '{yaz}' = {yaz_tr}; "
                                f"burada beklenen kelime '{bek}' = {bek_tr}.")
                return sonuc(guven=KESIN, kod="SOZ-01", kategori=SOZCUK,
                    gramer_dogru=True, beklenen_kelime=bek, yazilan_kelime=yaz,
                    neden=aciklama, kok_neden="sozcuk_secimi", dogru_form=kanonik)

            # A6. fonksiyon kelimesi degisimi (kapsanmayan) -> GRAMER, olasi
            return sonuc(guven=OLASI, kod="GRM-99", kategori=GRAMER,
                gramer_dogru=False, beklenen_kelime=bek, yazilan_kelime=yaz,
                neden="Dilbilgisi tasiyici bir kelime beklenenden farkli.",
                dogru_form=kanonik)

        # A7. birden cok konumda fark, ayni uzunluk
        if len(farklar) >= 2:
            hepsi_icerik = all(icerik_kelimesi(x) and icerik_kelimesi(y)
                               for _,x,y in farklar)
            if hepsi_icerik and len(farklar) == 2:
                return sonuc(guven=OLASI, kod="SOZ-02", kategori=SOZCUK,
                    gramer_dogru=True,
                    beklenen_kelime=", ".join(x for _,x,_ in farklar),
                    yazilan_kelime=", ".join(y for _,_,y in farklar),
                    neden="Yapi dogru gorunuyor; birden fazla kelime farkli.",
                    dogru_form=kanonik)

    # ============ B. YAPISAL KURALLAR (uzunluk farkli) ============
    b_be = [t for t in b if t in BE]; v_be = [t for t in v if t in BE]
    if b_be and not v_be and token_mesafe([t for t in b if t not in BE], v)==0:
        return sonuc(guven=KESIN, kod="BE-01", kategori=GRAMER, gramer_dogru=False,
            beklenen_kelime=b_be[0],
            neden="Turkcede 'olmak' gizlidir (O ogretmen). Ingilizcede am/is/are "
                  "yazilmak ZORUNDADIR.",
            karsit="She is a teacher. (O bir ogretmen.)",
            kok_neden="L1_transfer", dogru_form=kanonik)

    if b and b[0] in OZNE and not (v and v[0] in OZNE) \
       and token_mesafe(b[1:], v)==0:
        return sonuc(guven=KESIN, kod="SU-01", kategori=GRAMER, gramer_dogru=False,
            beklenen_kelime=b[0],
            neden="Turkcede ozne dusebilir (Geliyorum). Ingilizcede ozne her zaman yazilir.",
            karsit="I am coming. (Geliyorum.)",
            kok_neden="L1_transfer", dogru_form=kanonik)

    b_art = [t for t in b if t in ARTIKEL]; v_art = [t for t in v if t in ARTIKEL]
    if len(b_art) > len(v_art) and token_mesafe(
            [t for t in b if t not in ARTIKEL],[t for t in v if t not in ARTIKEL])==0:
        return sonuc(guven=KESIN, kod="ART-01", kategori=GRAMER, gramer_dogru=False,
            beklenen_kelime=b_art[0],
            neden="Turkcede artikel yoktur. Ingilizcede tekil sayilabilir isimden "
                  "once a/an veya the gerekir.",
            karsit="I saw a dog. (Bir kopek gordum.)",
            kok_neden="L1_transfer", dogru_form=kanonik)

    b_yrd = [t for t in b if t in YARDIMCI]; v_yrd = [t for t in v if t in YARDIMCI]
    if len(b_yrd) > len(v_yrd) and token_mesafe(
            [t for t in b if t not in YARDIMCI],[t for t in v if t not in YARDIMCI])==0:
        return sonuc(guven=KESIN, kod="AUX-01", kategori=GRAMER, gramer_dogru=False,
            beklenen_kelime=b_yrd[0],
            neden="Olumsuz ve soru cumlelerinde do/does yardimci fiili zorunludur.",
            karsit="I do not like coffee. / Do you like coffee?",
            kok_neden="L1_transfer", dogru_form=kanonik)

    # ============ D. TANI KONULAMADI ============
    return sonuc(kod="LEX-99", dogru_form=kanonik)


# ================================================================== TESTLER
ANLAM = {"morning":"sabah","day":"gun","coffee":"kahve","tea":"cay",
         "water":"su","book":"kitap","books":"kitaplar","bread":"ekmek",
         "milk":"sut","teacher":"ogretmen","student":"ogrenci"}

KAHVE = ["I drink coffee every morning.","Every morning I drink coffee.",
         "I drink coffee in the morning."]

VAKALAR = [
 # (ad, cevap, kabuller, bek_dogru, bek_guven, bek_kod, bek_kategori, bek_gramer_dogru)
 ("Kanonik dogru",        "I drink coffee every morning.", KAHVE, True, KESIN, None, BELIRSIZ, None),
 ("2. kabul dogru",       "Every morning I drink coffee.", KAHVE, True, KESIN, None, BELIRSIZ, None),
 ("*** morning->day",     "Every day I drink coffee",      KAHVE, False, KESIN,"SOZ-01", SOZCUK, True),
 ("coffee->tea",          "I drink tea every morning.",    KAHVE, False, KESIN,"SOZ-01", SOZCUK, True),
 ("yazim: cofee",         "I drink cofee every morning.",  KAHVE, False, KESIN,"YAZ-01", YAZIM,  True),
 ("yazim: mornning",      "I drink coffee every mornning.",KAHVE, False, KESIN,"YAZ-01", YAZIM,  True),
 ("SOV sirasi",           "I books read.",  ["I read books."], False, KESIN,"WO-01", SIRALAMA, False),
 ("oge sirasi",           "Coffee I drink every morning.", KAHVE, False, OLASI,"WO-02", SIRALAMA, False),
 ("be eksik",             "She happy.",     ["She is happy."], False, KESIN,"BE-01", GRAMER, False),
 ("ozne eksik",           "Am coming.",     ["I am coming."],  False, KESIN,"SU-01", GRAMER, False),
 ("3. tekil -s",          "He work here.",  ["He works here."],False, KESIN,"AGR-01",GRAMER, False),
 ("artikel eksik",        "I saw dog.",     ["I saw a dog."],  False, KESIN,"ART-01",GRAMER, False),
 ("artikel yanlis",       "I saw the dog.", ["I saw a dog."],  False, KESIN,"ART-02",GRAMER, False),
 ("edat yanlis",          "I am in the bus.",["I am on the bus."],False,KESIN,"PREP-01",GRAMER,False),
 ("do eksik",             "I not like coffee.",["I do not like coffee."],False,KESIN,"AUX-01",GRAMER,False),
 ("iki icerik kelimesi",  "I drink tea every day", KAHVE,      False, OLASI,"SOZ-02", SOZCUK, True),
 ("iki hata birden",      "He teacher.",    ["He is a teacher."],False, YOK,"LEX-99", BELIRSIZ, None),
 ("alakasiz",             "hello world",    KAHVE,             False, YOK,"LEX-99", BELIRSIZ, None),
 ("bos",                  "",               KAHVE,             False, YOK,"LEX-99", BELIRSIZ, None),
]

def main():
    gecen=0
    print(f"{'VAKA':24s} {'GUVEN':16s} {'KOD':8s} {'KATEGORI':9s} {'GRM?':5s} SONUC")
    print("-"*86)
    for ad,cevap,kab,bd,bg,bk,bkat,bgd in VAKALAR:
        s=degerlendir(cevap,kab,ANLAM)
        ok=(s["dogru"]==bd and s["guven"]==bg and s["kod"]==bk
            and s["kategori"]==bkat and s["gramer_dogru"]==bgd)
        gecen+=ok
        print(f"{ad:24s} {s['guven']:16s} {str(s['kod'] or '-'):8s} "
              f"{s['kategori']:9s} {str(s['gramer_dogru']):5s} "
              f"{'PASS' if ok else 'FAIL bek=' + str((bg,bk,bkat,bgd))}")
    print("-"*86)
    print(f"TANI MOTORU v2: {gecen}/{len(VAKALAR)} PASS\n")

    print("=== KULLANICININ BILDIRDIGI VAKA — v1 vs v2 ===")
    s=degerlendir("Every day I drink coffee",KAHVE,ANLAM)
    print(f"  v1 ciktisi : OLASI_TANI / LEX-01 / 'Yapi dogru gorunuyor; bir kelime farkli'")
    print(f"  v2 ciktisi : {s['guven']} / {s['kod']} / kategori={s['kategori']}")
    print(f"               gramer_dogru = {s['gramer_dogru']}")
    print(f"               beklenen kelime = '{s['beklenen_kelime']}'")
    print(f"               yazilan kelime  = '{s['yazilan_kelime']}'")
    print(f"               aciklama = {s['neden']}")
    return 0 if gecen==len(VAKALAR) else 1

if __name__=="__main__":
    sys.exit(main())
