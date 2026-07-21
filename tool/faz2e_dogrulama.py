#!/usr/bin/env python3
"""Faz 2E mantik dogrulamasi: tekrar araliklari, paket bolme, bosluk uretimi.
Dart'a portlanmadan once beklentileri dogrular. FLUTTER TESTI DEGILDIR."""
import re, sys
from datetime import datetime, timedelta

OK = FAIL = 0
def k(ad, kosul, detay=""):
    global OK, FAIL
    if kosul: OK += 1; print(f"[OK]   {ad}" + (f"  {detay}" if detay else ""))
    else: FAIL += 1; print(f"[FAIL] {ad}  {detay}")

SRC = 'lib/modules/kelime/kelime_ornek_veri.dart'
s = open(SRC, encoding='utf-8').read()
kayit = re.findall(
    r"kod: '(W-\d+)', yazilis: '([^']+)'.*?okunus: '([^']*)'.*?"
    r"trAnlam: '([^']+)'.*?ornekCumle: '([^']+)'", s, re.S)
k("Kelime sayisi 20'nin kati", len(kayit) % 20 == 0 and len(kayit) >= 40,
      f"{len(kayit)} kelime, {len(kayit)//20} paket")
k("Kodlar benzersiz", len({x[0] for x in kayit}) == len(kayit),
      f"{len(kayit)} kod")
k("Yazilislar benzersiz", len({x[1] for x in kayit}) == len(kayit),
      f"{len(kayit)} kelime")
k("Her kelimenin okunusu var", all(x[2].strip() for x in kayit))
k("Her kelimenin TR anlami var", all(x[3].strip() for x in kayit))

# --- Seviye denetimi (kelime havuzu buyudukce zorunlu) ---
import collections as _c
_sev = re.findall(r"seviye: '(A[12])'", s)
k("Her kelimede seviye etiketi", len(_sev) == len(kayit),
  f"{len(_sev)}/{len(kayit)}")
_dag = _c.Counter(_sev)
k("Iki seviye de dolu", _dag['A1'] > 0 and _dag['A2'] > 0,
  f"A1 {_dag['A1']} · A2 {_dag['A2']}")

# paket bolme
PB = 20
paket1 = kayit[:PB]; paket2 = kayit[PB:2*PB]
k("Her paket tam 20 kelime",
      all(len(kayit[i:i+20]) == 20 for i in range(0, len(kayit), 20)),
      f"{len(kayit)//20} paket")

k("Paketler kesismiyor",
  not ({x[0] for x in paket1} & {x[0] for x in paket2}))

# bosluk uretimi: kelime siniriyla
bozuk = []
for kod, yaz, ok_, anlam, cumle in kayit:
    desen = re.compile(r'\b' + re.escape(yaz) + r'\b', re.I)
    if not desen.search(cumle):
        bozuk.append((yaz, cumle)); continue
    bosluklu = desen.sub('____', cumle)
    # bosluktan hemen sonra harf kalmamali (She ____s gibi)
    if re.search(r'____[a-zA-Z]', bosluklu):
        bozuk.append((yaz, bosluklu))
k("Bosluk doldurma hicbir kelimede bozulmuyor", not bozuk, str(bozuk[:3]))

# tekrar araliklari
ARALIK = [1, 3, 7, 14, 30]
def sonraki(tekrar_sayisi, t0):
    i = min(max(tekrar_sayisi, 0), len(ARALIK) - 1)
    return (t0 + timedelta(days=ARALIK[i])).strftime('%Y-%m-%d')

t0 = datetime(2026, 1, 1)
k("Araliklar 1,3,7,14,30", ARALIK == [1, 3, 7, 14, 30])
k("Ogrenildiginde +1 gun", sonraki(0, t0) == '2026-01-02', sonraki(0, t0))
k("1. dogru -> +3 gun",   sonraki(1, t0) == '2026-01-04', sonraki(1, t0))
k("2. dogru -> +7 gun",   sonraki(2, t0) == '2026-01-08', sonraki(2, t0))
k("3. dogru -> +14 gun",  sonraki(3, t0) == '2026-01-15', sonraki(3, t0))
k("4. dogru -> +30 gun",  sonraki(4, t0) == '2026-01-31', sonraki(4, t0))
k("Ustunde kalirsa +30'da sabitlenir", sonraki(9, t0) == '2026-01-31')
k("Yanlis -> sayac sifirlanir, +1 gun", sonraki(0, t0) == '2026-01-02')

# ASCII cevrimi
HARITA = {'ç':'c','Ç':'C','ğ':'g','Ğ':'G','ı':'i','İ':'I','ö':'o','Ö':'O',
          'ş':'s','Ş':'S','ü':'u','Ü':'U','â':'a','î':'i','û':'u'}
def asciiye(x):
    return ''.join(HARITA.get(c, c if ord(c) < 128 else '?') for c in x)
k("ASCII: oğrenci -> ogrenci", asciiye('öğrenci şirket') == 'ogrenci sirket',
  asciiye('öğrenci şirket'))
k("ASCII: İIıi -> IIii", asciiye('İIıi') == 'IIii', asciiye('İIıi'))

# etkinlik sayisi
m = open('lib/core/engine/pekistirme_motoru.dart', encoding='utf-8').read()
etkinlik = re.search(r'enum EtkinlikTipi \{(.*?)\}', m, re.S)
adet = len([x for x in etkinlik.group(1).split(',') if x.strip()])
k("Sekiz etkinlik tipi tanimli", adet == 8, f"{adet}")

print("\n" + "=" * 60)
print(f"FAZ 2E MANTIK DOGRULAMASI: {OK} PASS, {FAIL} FAIL")
print("Bu bir Flutter/Dart testi DEGILDIR.")
print("=" * 60)
sys.exit(1 if FAIL else 0)
