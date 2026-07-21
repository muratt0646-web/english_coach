#!/usr/bin/env python3
"""Sablon derslerin icerik sartlari dogrulamasi.
test/sablon_ders_test.dart ile AYNI sartlari kontrol eder.
BU BIR FLUTTER TESTI DEGILDIR."""
import re, glob, sys, os

OK = FAIL = 0
def k(ad, kosul, detay=''):
    global OK, FAIL
    if kosul: OK += 1; print(f'[OK]   {ad}' + (f'  {detay}' if detay else ''))
    else: FAIL += 1; print(f'[FAIL] {ad}  {detay}')

# kayit defterinden dersleri bul
kayit = open('lib/core/content/sablon_ders_kayitlari.dart', encoding='utf-8').read()
sinif_kod = re.findall(r'(\w+)\.ders,', kayit)
dosyalar = {}
for sinif in sinif_kod:
    for f in glob.glob('lib/core/content/ders_*.dart'):
        s = open(f, encoding='utf-8').read()
        if f'class {sinif} ' in s or f'class {sinif}{{' in s:
            m = re.search(r"kod: '([A-Z0-9-]+)'", s)
            dosyalar[m.group(1) if m else sinif] = f
print(f'Kayitli ders: {len(dosyalar)} — {sorted(dosyalar)}\n')

basliklar = f"{'DERS':12s}{'DOGRU':>6s}{'YANLIS':>7s}{'MK':>4s}{'KA':>4s}{'SU':>4s}{'PK':>4s}{'MS':>4s}{'OZET':>5s}{'ANL':>4s}"
print(basliklar); print('-' * len(basliklar))
sayimlar = {}
for kod, f in sorted(dosyalar.items()):
    s = open(f, encoding='utf-8').read()
    n = {
        'dogru': len(re.findall(r'dogruMu: true', s)),
        'yanlis': len(re.findall(r'dogruMu: false', s)),
        'mk': len(re.findall(r"kod: 'MK-", s)),
        'ka': len(re.findall(r"kod: 'KA-", s)),
        'su': len(re.findall(r"kod: 'SU-", s)),
        'pk': len(re.findall(r"kod: 'PK-", s)),
        'ms': len(re.findall(r"kod: 'MS-", s)),
        'ozet': len(re.findall(r'OzetMaddesi\(', s)),
        'anl': len(re.findall(r'AnlatimBlogu\(', s)),
    }
    sayimlar[kod] = (n, s)
    print(f"{kod:12s}{n['dogru']:>6d}{n['yanlis']:>7d}{n['mk']:>4d}"
          f"{n['ka']:>4d}{n['su']:>4d}{n['pk']:>4d}{n['ms']:>4d}"
          f"{n['ozet']:>5d}{n['anl']:>4d}")
print()

for kod, (n, s) in sorted(sayimlar.items()):
    k(f'{kod} · en az 30 dogru ornek', n['dogru'] >= 30, str(n['dogru']))
    k(f'{kod} · en az 20 yanlis ornek', n['yanlis'] >= 20, str(n['yanlis']))
    k(f'{kod} · mini sinav tam 15', n['ms'] == 15, str(n['ms']))
    k(f'{kod} · mini kontrol 3-5', 3 <= n['mk'] <= 5, str(n['mk']))
    k(f'{kod} · ozet >= 6', n['ozet'] >= 6, str(n['ozet']))
    k(f'{kod} · anlatim >= 4', n['anl'] >= 4, str(n['anl']))

    # DENGELI PARANTEZ ile blok cikar.
    # Regex kullanilamaz: 'neden' metni ("uc kitap"), gibi ifadeler
    # icerebilir ve deseni erken keser.
    yanlis_blok = []
    i = 0
    while True:
        i = s.find('OrnekCumle(', i)
        if i < 0:
            break
        d = 0
        j = i + len('OrnekCumle(') - 1
        while j < len(s):
            if s[j] == '(':
                d += 1
            elif s[j] == ')':
                d -= 1
                if d == 0:
                    break
            j += 1
        blok = s[i:j + 1]
        i = j + 1
        if 'dogruMu: false' in blok:
            yanlis_blok.append(blok)
    eksikler = [b for b in yanlis_blok
                if 'neden:' not in b or 'dogruBicim:' not in b]
    k(f'{kod} · her yanlista neden + dogruBicim',
      not eksikler,
      f'{len(yanlis_blok)} blok' if not eksikler
      else f'{len(eksikler)} EKSIK')

    # ANLATIM KODLARI: satir sonu olabilir -> \s* gerekli
    anlatim_kod = set(re.findall(r"AnlatimBlogu\(\s*kod:\s*'(\w+)'", s))
    geri = set(re.findall(r"geriDonusKodu:\s*'(\w+)'", s))
    k(f'{kod} · geri donus kodlari anlatimda var', geri <= anlatim_kod,
      f'{sorted(geri)} <= {sorted(anlatim_kod)}')

    # soru kodlari benzersiz mi (bolum bazinda)
    tum = re.findall(r"kod: '((?:MK|KA|PK|MS|SU)-\d+)'", s)
    k(f'{kod} · soru kodlari benzersiz', len(set(tum)) == len(tum),
      f'{len(tum)} soru')

    # karisik tur
    ka_blok = s[s.index('kontrolluAlistirmalar:'):s.index('serbestUretim:')]
    turler = set(re.findall(r'tur: SoruTuru\.(\w+)', ka_blok))
    k(f'{kod} · alistirmalar >= 4 farkli tur', len(turler) >= 4,
      f'{len(turler)}: {sorted(turler)}')

print('\n' + '=' * 60)
print(f'DERS ICERIK DOGRULAMASI: {OK} PASS, {FAIL} FAIL')
print('Bu bir Flutter testi DEGILDIR.')
print('=' * 60)
sys.exit(1 if FAIL else 0)
