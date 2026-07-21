#!/usr/bin/env python3
"""
TANI MOTORU v3 — dokuz kategori + IFADE duzeyi raporlama.
Dart'a portlanmadan once mantigi dogrular.

v2'nin eksigi: "day" ve "morning" TEK JETON olarak raporlaniyordu.
Kullanicinin istedigi cikti IFADE duzeyinde:
    Beklenen ifade: every morning
    Yazdigin ifade: every day

v3 kategorileri (kullanicinin listesi):
  GRAMER_HATASI · KELIME_SECIMI · ANLAM_FARKI · KELIME_SIRASI
  EKSIK_KELIME · FAZLA_KELIME · YAZIM_HATASI
  KABUL_EDILEBILIR_ALTERNATIF · TANI_KONULAMADI
"""
import re, sys

# ------------------------------------------------------------ normalize
KISALTMALAR = {
    "i'm":"i am","you're":"you are","he's":"he is","she's":"she is",
    "it's":"it is","we're":"we are","they're":"they are","don't":"do not",
    "doesn't":"does not","isn't":"is not","aren't":"are not","can't":"can not",
}
def normalize(s):
    s = s.lower().strip().replace("\u2019","'").replace("\u2018","'")
    for k,v in KISALTMALAR.items(): s = s.replace(k,v)
    s = re.sub(r"[.!?,;:]"," ",s)          # noktalama toleransi
    return re.sub(r"\s+"," ",s).strip()    # buyuk harf + bosluk toleransi

def tok(s):
    n = normalize(s)
    return n.split(" ") if n else []

def mesafe(a,b):
    m,n=len(a),len(b)
    if m==0: return n
    if n==0: return m
    onc=list(range(n+1))
    for i in range(1,m+1):
        sim=[i]+[0]*n
        for j in range(1,n+1):
            sim[j]=min(sim[j-1]+1, onc[j]+1, onc[j-1]+(0 if a[i-1]==b[j-1] else 1))
        onc=sim
    return onc[n]

def kar_mesafe(a,b):
    return mesafe(list(a), list(b))

# ------------------------------------------------------------ sozluk
ARTIKEL={"a","an","the"}
OZNE={"i","you","he","she","it","we","they"}
NESNE={"me","him","her","us","them"}
IYELIK={"my","your","his","its","our","their"}
BE={"am","is","are","was","were"}
YARDIMCI={"do","does","did","have","has","had","will","can"}
EDAT={"in","on","at","to","from","for","with","of","about","into"}
BAGLAC={"and","but","or","so","because"}
BELIRTEC={"every","some","any","many","much","all","this","that","these",
          "those","no","each","next","last"}
OLUMSUZ={"not","never"}
FONKSIYON=ARTIKEL|OZNE|NESNE|IYELIK|BE|YARDIMCI|EDAT|BAGLAC|BELIRTEC|OLUMSUZ

# Bir icerik kelimesinin ONUNDE gelip onunla IFADE olusturan kelimeler
IFADE_ONEKI = BELIRTEC | EDAT | ARTIKEL

FIIL_CIFT={"drink":"drinks","read":"reads","eat":"eats","like":"likes",
  "work":"works","live":"lives","go":"goes","see":"sees","want":"wants",
  "open":"opens","write":"writes","speak":"speaks","play":"plays",
  "watch":"watches","study":"studies","teach":"teaches","buy":"buys",
  "make":"makes"}
FIILLER=set(FIIL_CIFT)|set(FIIL_CIFT.values())|BE|YARDIMCI

def icerik(t): return t not in FONKSIYON
def fiil_idx(t):
    for i,x in enumerate(t):
        if x in FIILLER: return i
    return -1
def cekim_cifti(a,b): return FIIL_CIFT.get(a)==b or FIIL_CIFT.get(b)==a

def ifade_cikar(jetonlar, idx):
    """idx'teki jetonu, onundeki belirtec/edat/artikel ile birlestirip
    anlamli ifade olarak dondurur. 'morning' -> 'every morning'."""
    bas = idx
    while bas > 0 and jetonlar[bas-1] in IFADE_ONEKI:
        bas -= 1
    return " ".join(jetonlar[bas:idx+1])

# ------------------------------------------------------------ kategoriler
GRAMER_HATASI="GRAMER_HATASI"; KELIME_SECIMI="KELIME_SECIMI"
ANLAM_FARKI="ANLAM_FARKI"; KELIME_SIRASI="KELIME_SIRASI"
EKSIK_KELIME="EKSIK_KELIME"; FAZLA_KELIME="FAZLA_KELIME"
YAZIM_HATASI="YAZIM_HATASI"; KABUL_ALT="KABUL_EDILEBILIR_ALTERNATIF"
TANI_YOK="TANI_KONULAMADI"; HATA_YOK="-"
KESIN="KESIN_TANI"; OLASI="OLASI_TANI"; YOK="TANI_KONULAMADI"

def R(dogru=False, guven=YOK, kategori=HATA_YOK, kod=None, gramer_dogru=None,
      bek=None, yaz=None, neden=None, karsit=None, kok="bilinmiyor",
      kanonik="", not_=None):
    carpan = 0.0 if dogru else (1.0 if guven==KESIN else 0.5)
    return dict(dogru=dogru, guven=guven, kategori=kategori, kod=kod,
                gramer_dogru=gramer_dogru, beklenen_ifade=bek, yazilan_ifade=yaz,
                neden=neden, karsit=karsit, kok_neden=kok if not dogru else "-",
                carpan=carpan, dogru_form=kanonik, not_=not_)

# ------------------------------------------------------------ v3 kaskadi
def degerlendir(cevap, kabuller, anlamlar=None):
    """kabuller: [(cevap, tip, not)] — tip: 'ana'|'alternatif'|'anlam_farkli'"""
    anlamlar = anlamlar or {}
    v = tok(cevap)
    ana = next((c for c,t,_ in kabuller if t=="ana"), kabuller[0][0] if kabuller else "")

    # [1] tam kabul (ana + alternatif)
    # Normalizer noktalamayi sildigi icin BIRDEN COK kayit ayni normalize
    # bicime dusebilir. NOTU OLAN kayit tercih edilir; aksi halde nota bagli
    # geri bildirim kaybolur.
    eslesen = None
    for c,t,n in kabuller:
        if t=="anlam_farkli" or mesafe(tok(c), v)!=0: continue
        if eslesen is None or (eslesen[2] is None and n is not None):
            eslesen = (c,t,n)
    if eslesen is not None:
        c,t,n = eslesen
        return R(dogru=True, guven=KESIN,
                 kategori=KABUL_ALT if t=="alternatif" else HATA_YOK,
                 kanonik=ana, not_=n, gramer_dogru=True)

    # [2] yazarin isaretledigi "gramer dogru ama anlam farkli"
    for c,t,n in kabuller:
        if t=="anlam_farkli" and mesafe(tok(c), v)==0:
            return R(guven=KESIN, kategori=ANLAM_FARKI, kod="ANL-01",
                     gramer_dogru=True, kanonik=ana, neden=n,
                     kok="sozcuk_secimi")

    if not v:
        return R(guven=YOK, kategori=TANI_YOK, kod="LEX-99", kanonik=ana)

    # [3] en yakin beklenen
    b, en = tok(ana), 1<<30
    for c,t,_ in kabuller:
        if t=="anlam_farkli": continue
        tt = tok(c); d = mesafe(tt, v)
        if d < en: en, b = d, tt

    # ===== A0. SIRALAMA =====
    if sorted(b)==sorted(v):
        bi, vi = fiil_idx(b), fiil_idx(v)
        if bi>=0 and vi>=0 and vi>bi and vi>=len(v)-1 and len(v)>=3:
            return R(guven=KESIN, kategori=KELIME_SIRASI, kod="WO-01",
                gramer_dogru=False, kanonik=ana, kok="L1_transfer",
                neden="Turkcede fiil cumlenin sonunda gelir. Ingilizcede fiil "
                      "ozneden hemen sonra gelir: Ozne + Fiil + Nesne.",
                karsit="I read books. (Ben kitap okurum.)")
        return R(guven=OLASI, kategori=KELIME_SIRASI, kod="WO-02",
            gramer_dogru=False, kanonik=ana,
            neden="Kelimeler dogru ama sira farkli.")

    # ===== A. TEK KONUMDA FARK =====
    if len(b)==len(v):
        farklar=[(i,b[i],v[i]) for i in range(len(b)) if b[i]!=v[i]]
        if len(farklar)==1:
            i,bek,yaz = farklar[0]
            b_if, v_if = ifade_cikar(b,i), ifade_cikar(v,i)

            if cekim_cifti(bek,yaz):
                return R(guven=KESIN, kategori=GRAMER_HATASI, kod="AGR-01",
                    gramer_dogru=False, bek=bek, yaz=yaz, kanonik=ana,
                    kok="eksik_bilgi",
                    neden="Present Simple'da he/she/it oznesiyle fiile -s eklenir.",
                    karsit="He works here.")
            if bek in ARTIKEL and yaz in ARTIKEL:
                return R(guven=KESIN, kategori=GRAMER_HATASI, kod="ART-02",
                    gramer_dogru=False, bek=bek, yaz=yaz, kanonik=ana,
                    kok="eksik_bilgi", neden="Artikel secimi yanlis.")
            if bek in EDAT and yaz in EDAT:
                return R(guven=KESIN, kategori=GRAMER_HATASI, kod="PREP-01",
                    gramer_dogru=False, bek=b_if, yaz=v_if, kanonik=ana,
                    kok="L1_transfer", neden="Edat secimi yanlis.")
            if kar_mesafe(bek,yaz)<=2 and bek[:1]==yaz[:1] and abs(len(bek)-len(yaz))<=2:
                return R(guven=KESIN, kategori=YAZIM_HATASI, kod="YAZ-01",
                    gramer_dogru=True, bek=bek, yaz=yaz, kanonik=ana,
                    kok="yazim", neden="Yapi dogru; kelime yanlis yazilmis.")
            if icerik(bek) and icerik(yaz):
                bt, yt = anlamlar.get(bek), anlamlar.get(yaz)
                ac = (f"'{v_if}' dilbilgisel olarak dogrudur ancak anlami "
                      f"'{b_if}' ile ayni degildir.")
                if bt and yt:
                    ac = (f"'{yaz}' = {yt}; beklenen kelime '{bek}' = {bt}. "
                          f"Dilbilgisi yapin dogru, anlam farkli.")
                return R(guven=KESIN, kategori=KELIME_SECIMI, kod="SOZ-01",
                    gramer_dogru=True, bek=b_if, yaz=v_if, kanonik=ana,
                    kok="sozcuk_secimi", neden=ac)
            return R(guven=OLASI, kategori=GRAMER_HATASI, kod="GRM-99",
                gramer_dogru=False, bek=bek, yaz=yaz, kanonik=ana,
                neden="Dilbilgisi tasiyici bir kelime farkli.")

        if len(farklar)==2 and all(icerik(x) and icerik(y) for _,x,y in farklar):
            return R(guven=OLASI, kategori=KELIME_SECIMI, kod="SOZ-02",
                gramer_dogru=True, kanonik=ana,
                bek=", ".join(x for _,x,_ in farklar),
                yaz=", ".join(y for _,_,y in farklar),
                neden="Yapi dogru; birden fazla kelime farkli.")

    # ===== B. YAPISAL KURALLAR (belirli eksikler) =====
    def eksik_kural(kume, kod, kat, neden, karsit, kok):
        bk=[t for t in b if t in kume]
        if bk and not any(t in kume for t in v) and \
           mesafe([t for t in b if t not in kume], v)==0:
            return R(guven=KESIN, kategori=kat, kod=kod, gramer_dogru=False,
                     bek=bk[0], kanonik=ana, kok=kok, neden=neden, karsit=karsit)
        return None

    r = eksik_kural(BE,"BE-01",GRAMER_HATASI,
        "Turkcede 'olmak' gizlidir. Ingilizcede am/is/are ZORUNLUDUR.",
        "She is a teacher.","L1_transfer")
    if r: return r

    if b and b[0] in OZNE and not(v and v[0] in OZNE) and mesafe(b[1:],v)==0:
        return R(guven=KESIN, kategori=GRAMER_HATASI, kod="SU-01",
            gramer_dogru=False, bek=b[0], kanonik=ana, kok="L1_transfer",
            neden="Turkcede ozne dusebilir. Ingilizcede ozne her zaman yazilir.",
            karsit="I am coming.")

    bа=[t for t in b if t in ARTIKEL]
    if len(bа)>len([t for t in v if t in ARTIKEL]) and \
       mesafe([t for t in b if t not in ARTIKEL],[t for t in v if t not in ARTIKEL])==0:
        return R(guven=KESIN, kategori=GRAMER_HATASI, kod="ART-01",
            gramer_dogru=False, bek=bа[0], kanonik=ana, kok="L1_transfer",
            neden="Tekil sayilabilir isimden once a/an veya the gerekir.",
            karsit="I saw a dog.")

    by=[t for t in b if t in YARDIMCI]
    if len(by)>len([t for t in v if t in YARDIMCI]) and \
       mesafe([t for t in b if t not in YARDIMCI],[t for t in v if t not in YARDIMCI])==0:
        return R(guven=KESIN, kategori=GRAMER_HATASI, kod="AUX-01",
            gramer_dogru=False, bek=by[0], kanonik=ana, kok="L1_transfer",
            neden="Olumsuz ve soruda do/does zorunludur.",
            karsit="I do not like coffee.")

    # ===== C. GENEL EKSIK / FAZLA KELIME =====
    bset, vset = set(b), set(v)
    if vset < bset or (len(v) < len(b) and vset <= bset):
        eksikler=[t for t in b if t not in vset]
        return R(guven=KESIN, kategori=EKSIK_KELIME, kod="EKS-01",
            gramer_dogru=False, bek=" ".join(eksikler), kanonik=ana,
            kok="eksik_bilgi",
            neden=f"Cumlede {len(eksikler)} kelime eksik.")
    if bset < vset or (len(v) > len(b) and bset <= vset):
        fazlalar=[t for t in v if t not in bset]
        return R(guven=KESIN, kategori=FAZLA_KELIME, kod="FAZ-01",
            gramer_dogru=False, yaz=" ".join(fazlalar), kanonik=ana,
            kok="bilinmiyor",
            neden=f"Cumlede fazladan {len(fazlalar)} kelime var.")

    # ===== D. TANI KONULAMADI =====
    return R(guven=YOK, kategori=TANI_YOK, kod="LEX-99", kanonik=ana)


# ================================================================ TESTLER
ANLAM={"morning":"sabah","day":"gun","coffee":"kahve","tea":"cay",
       "water":"su","books":"kitaplar","evening":"aksam"}

KAHVE=[("I drink coffee every morning.","ana",None),
       ("Every morning I drink coffee.","alternatif",
        "Zaman ifadesi basa da alinabilir; virgul kullanimi da dogrudur."),
       ("I drink coffee in the morning.","alternatif",
        'Bu da dogru; "every morning" daha yaygin.'),
       ("I drink coffee every day.","anlam_farkli",
        "Dilbilgisi dogru ancak 'every day' = her gun; beklenen 'every morning' = her sabah.")]

VAKALAR=[
 # (ad, cevap, kabuller, bek_dogru, bek_kategori, bek_gramer)
 ("1  Tam dogru cevap",        "I drink coffee every morning.", KAHVE, True,  HATA_YOK, True),
 ("2  Alternatif kelime sirasi","Every morning I drink coffee.", KAHVE, True,  None, True),
 ("2b Virgullu ayni kayda duser","Every morning, I drink coffee.", KAHVE, True,  KABUL_ALT, True),
 ("3  day/morning anlam farki","Every day I drink coffee",       KAHVE, False, KELIME_SECIMI, True),
 ("3b yazarin isaretledigi",   "I drink coffee every day.",      KAHVE, False, ANLAM_FARKI, True),
 ("4  Turkce kelime sirasi",   "I coffee drink every morning.",  KAHVE, False, KELIME_SIRASI, False),
 ("5  Eksik ozne",             "Am coming.", [("I am coming.","ana",None)], False, GRAMER_HATASI, False),
 ("6  Eksik fiil (be)",        "She happy.", [("She is happy.","ana",None)], False, GRAMER_HATASI, False),
 ("6b Genel eksik kelime",     "I drink every morning",          KAHVE, False, EKSIK_KELIME, False),
 ("7  Fazla kelime",           "I drink hot coffee every morning", KAHVE, False, FAZLA_KELIME, False),
 ("8  Kucuk yazim hatasi",     "I drink cofee every morning.",   KAHVE, False, YAZIM_HATASI, True),
 ("9  Buyuk harf + noktalama", "i drink coffee every morning",   KAHVE, True,  HATA_YOK, True),
 ("10 Siniflandirilamayan",    "hello world",                    KAHVE, False, TANI_YOK, None),
 ("10b Bos cevap",             "",                               KAHVE, False, TANI_YOK, None),
 ("+  3. tekil -s",            "He work here.", [("He works here.","ana",None)], False, GRAMER_HATASI, False),
 ("+  Artikel eksik",          "I saw dog.", [("I saw a dog.","ana",None)], False, GRAMER_HATASI, False),
]

def main():
    gecen=0
    print(f"{'VAKA':30s} {'DOGRU':6s} {'KATEGORI':28s} {'GRM':5s} SONUC")
    print("-"*92)
    for ad,cev,kab,bd,bk,bg in VAKALAR:
        s=degerlendir(cev,kab,ANLAM)
        ok = s["dogru"]==bd and (bk is None or s["kategori"]==bk) \
             and (bg is None or s["gramer_dogru"]==bg)
        gecen+=ok
        print(f"{ad:30s} {str(s['dogru']):6s} {s['kategori']:28s} "
              f"{str(s['gramer_dogru']):5s} {'PASS' if ok else 'FAIL bek='+str((bd,bk,bg))}")
    print("-"*92)
    print(f"TANI MOTORU v3: {gecen}/{len(VAKALAR)} PASS\n")

    print("=== KULLANICININ ISTEDIGI CIKTI ===")
    s=degerlendir("Every day I drink coffee",KAHVE,ANLAM)
    print(f"  Gramer yapin dogru.  -> gramer_dogru = {s['gramer_dogru']}")
    print(f"  Beklenen ifade: {s['beklenen_ifade']}")
    print(f"  Yazdigin ifade: {s['yazilan_ifade']}")
    print(f"  Kategori: {s['kategori']}" +
          (" / ANLAM_FARKI" if s['gramer_dogru'] else ""))
    print(f"  Guven: {s['guven']}  (TANI_KONULAMADI DEGIL)")
    print(f"  Aciklama: {s['neden']}")
    return 0 if gecen==len(VAKALAR) else 1

if __name__=="__main__":
    sys.exit(main())
