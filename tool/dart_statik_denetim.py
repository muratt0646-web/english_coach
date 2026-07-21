#!/usr/bin/env python3
"""
DART STATIK DENETLEYICI — Faz 2C.1 dersinden dogdu.

Ayrac/import taramasi TUR HATALARINI YAKALAMAZ. Faz 2A'da girilen
  static const List<Map<String, Object>> gorevler = [...  'ipucu': null ...]
hatasi uc faz boyunca gizli kaldi.

Bu arac o hata sinifini ve mimari sinir ihlallerini yakalar.
YINE DE `flutter analyze` YERINE GECMEZ.
"""
import re, os, sys, glob

hata = 0
uyari = 0


def bildir(seviye, dosya, satir, mesaj):
    global hata, uyari
    if seviye == 'HATA':
        hata += 1
    else:
        uyari += 1
    yer = f'{dosya}:{satir}' if satir else dosya
    print(f'[{seviye:5s}] {yer}\n         {mesaj}')


def yorumsuz(s):
    """Yorumlari ve string iceriklerini temizler (satir sayisi korunur)."""
    s = re.sub(r'/\*.*?\*/', lambda m: '\n' * m.group(0).count('\n'), s, flags=re.S)
    s = re.sub(r'//[^\n]*', '', s)
    s = re.sub(r"'''.*?'''", lambda m: '""' + '\n' * m.group(0).count('\n'), s, flags=re.S)
    s = re.sub(r'"(?:\\.|[^"\\\n])*"', '""', s)
    s = re.sub(r"'(?:\\.|[^'\\\n])*'", "''", s)
    return s


# =====================================================================
# 1. NULL / NON-NULLABLE KOLEKSIYON UYUSMAZLIGI  (2C hata sinifi)
# =====================================================================
def null_tur_denetimi(dosyalar):
    print('=== 1. Null / non-nullable koleksiyon denetimi ===')
    bulundu = 0
    for f in dosyalar:
        ham = open(f, encoding='utf-8').read()
        temiz = yorumsuz(ham)
        satirlar = temiz.split('\n')

        # Bildirimleri bul: List<Map<String, X>> ad = [   veya  Map<String, X> ad = {
        for m in re.finditer(
                r'(?:List<)?Map<\s*String\s*,\s*([A-Za-z_][\w<>, ]*?)\s*>>?\s+(\w+)\s*=\s*[\[{]',
                temiz):
            deger_turu = m.group(1).strip()
            ad = m.group(2)
            bildirim_satiri = temiz[:m.start()].count('\n') + 1
            if deger_turu.endswith('?') or deger_turu == 'dynamic':
                continue

            # Bildirimden sonraki blogun sonunu ayraç sayarak bul
            i = m.end() - 1
            derinlik = 0
            son = i
            while i < len(temiz):
                c = temiz[i]
                if c in '[{':
                    derinlik += 1
                elif c in ']}':
                    derinlik -= 1
                    if derinlik == 0:
                        son = i
                        break
                i += 1
            blok = temiz[m.start():son + 1]

            for nm in re.finditer(r":\s*null\b", blok):
                nsatir = bildirim_satiri + blok[:nm.start()].count('\n')
                bildir('HATA', f, nsatir,
                       f"'{ad}' bildirimi Map<String, {deger_turu}> "
                       f"(nullable DEGIL) ama deger null. "
                       f"-> Map<String, {deger_turu}?> kullanin.")
                bulundu += 1

        # List<X> icinde null (X nullable degilse)
        for m in re.finditer(r'List<\s*([A-Za-z_][\w<>, ]*?)\s*>\s+(\w+)\s*=\s*\[', temiz):
            deger_turu = m.group(1).strip()
            if deger_turu.endswith('?') or deger_turu in ('dynamic', 'Object'):
                continue
            if deger_turu.startswith('Map') or deger_turu.startswith('List'):
                continue
            bildirim_satiri = temiz[:m.start()].count('\n') + 1
            i = m.end() - 1
            derinlik = 0
            son = i
            while i < len(temiz):
                if temiz[i] == '[':
                    derinlik += 1
                elif temiz[i] == ']':
                    derinlik -= 1
                    if derinlik == 0:
                        son = i
                        break
                i += 1
            blok = temiz[m.start():son + 1]
            for nm in re.finditer(r'(?<![\w.])null(?![\w])', blok):
                nsatir = bildirim_satiri + blok[:nm.start()].count('\n')
                bildir('HATA', f, nsatir,
                       f"'{m.group(2)}' bildirimi List<{deger_turu}> "
                       f"(nullable DEGIL) ama null eleman var.")
                bulundu += 1
        del satirlar
    if bulundu == 0:
        print('  Uyusmazlik bulunamadi.\n')
    else:
        print()


# =====================================================================
# 2. IMPORT HEDEFI VAR MI
# =====================================================================
def import_denetimi(dosyalar, kok='lib'):
    print('=== 2. Import hedefi denetimi ===')
    sayac = 0
    kirik = 0
    for f in dosyalar:
        s = open(f, encoding='utf-8').read()
        for m in re.finditer(r"import\s+'([^']+)'", s):
            yol = m.group(1)
            satir = s[:m.start()].count('\n') + 1
            if yol.startswith('package:flutter') or yol.startswith('dart:'):
                continue
            sayac += 1
            if yol.startswith('package:english_coach/'):
                hedef = os.path.join(kok, yol.split('package:english_coach/')[1])
            elif yol.startswith('package:'):
                continue
            else:
                hedef = os.path.normpath(os.path.join(os.path.dirname(f), yol))
            if not os.path.exists(hedef):
                bildir('HATA', f, satir, f'Import hedefi yok: {yol}')
                kirik += 1
    print(f'  {sayac} yerel import kontrol edildi, {kirik} kirik.\n')


# =====================================================================
# 3. MIMARI SINIR: modul -> modul importu YASAK  (PRODUCT_RULES K3/K7)
# =====================================================================
def mimari_denetimi():
    print('=== 3. Mimari sinir denetimi (modul -> modul import YASAK) ===')
    ihlal = 0
    for f in glob.glob('lib/modules/*/*.dart'):
        kendi_modul = f.split(os.sep)[2]
        s = open(f, encoding='utf-8').read()
        for m in re.finditer(r"import\s+'([^']+)'", s):
            yol = m.group(1)
            satir = s[:m.start()].count('\n') + 1
            hedef = os.path.normpath(os.path.join(os.path.dirname(f), yol))
            parcalar = hedef.split(os.sep)
            if len(parcalar) > 2 and parcalar[1] == 'modules':
                hedef_modul = parcalar[2]
                if hedef_modul != kendi_modul:
                    bildir('HATA', f, satir,
                           f"'{kendi_modul}' modulu '{hedef_modul}' modulunu "
                           f'import ediyor. PRODUCT_RULES K3/K7 ihlali.')
                    ihlal += 1
    # core, modules'u import etmemeli
    for f in glob.glob('lib/core/**/*.dart', recursive=True):
        s = open(f, encoding='utf-8').read()
        if re.search(r"import\s+'[^']*modules/", s) or \
           re.search(r"import\s+'package:flutter/", s):
            bildir('UYARI', f, None,
                   'core/ katmani Flutter veya modules import ediyor')
            ihlal += 1
    if ihlal == 0:
        print('  Ihlal yok.\n')
    else:
        print()


# =====================================================================
# 4. AYRAC DENGESI
# =====================================================================
def ayrac_denetimi(dosyalar):
    print('=== 4. Ayrac dengesi ===')
    bozuk = 0
    for f in dosyalar:
        t = yorumsuz(open(f, encoding='utf-8').read())
        for a, c, ad in [('{', '}', 'sus'), ('(', ')', 'parantez'),
                         ('[', ']', 'kose')]:
            if t.count(a) != t.count(c):
                bildir('HATA', f, None,
                       f'{ad} ayraci dengesiz: {t.count(a)} vs {t.count(c)}')
                bozuk += 1
    if bozuk == 0:
        print(f'  {len(dosyalar)} dosya dengeli.\n')
    else:
        print()



# =====================================================================
# 5. KULLANILMAYAN IMPORT  (Faz 2D'de kacirildi)
# =====================================================================
def kullanilmayan_import(dosyalar, kok='lib'):
    print('=== 5. Kullanilmayan import denetimi ===')
    bulundu = 0

    def ust_duzey_adlar(yol):
        """YALNIZCA sutun 0'daki bildirimler. Girintili satirlar sinif ICI
        uyeleridir ve import edilebilir ad DEGILDIR.
        (Faz 2D hatasi: metot adlari ust duzey sanilip yanlis eslesme oluyordu.)"""
        if not os.path.exists(yol):
            return set()
        t = yorumsuz(open(yol, encoding='utf-8').read())
        adlar = set()
        for m in re.finditer(
                r'^(?:abstract\s+)?(?:class|enum|mixin|extension|typedef)\s+(\w+)',
                t, re.M):
            adlar.add(m.group(1))
        for m in re.finditer(r'^(?:const|final)\s+[\w<>,?\[\] ]*?(\w+)\s*=', t, re.M):
            adlar.add(m.group(1))
        for m in re.finditer(r'^(?!import|export|library|part)[\w<>,?]+\s+(\w+)\s*\(',
                             t, re.M):
            adlar.add(m.group(1))
        return adlar

    for f in dosyalar:
        ham = open(f, encoding='utf-8').read()
        govde = yorumsuz(re.sub(r"^import\s+'[^']+';\s*$", '', ham, flags=re.M))
        for m in re.finditer(r"import\s+'([^']+)'", ham):
            yol = m.group(1)
            satir = ham[:m.start()].count('\n') + 1
            if yol.startswith('dart:') or yol.startswith('package:flutter'):
                continue
            if yol.startswith('package:english_coach/'):
                hedef = os.path.join(kok, yol.split('package:english_coach/')[1])
            elif yol.startswith('package:'):
                continue
            else:
                hedef = os.path.normpath(os.path.join(os.path.dirname(f), yol))
            adlar = ust_duzey_adlar(hedef)
            if not adlar:
                continue
            if not any(re.search(r'\b' + re.escape(a) + r'\b', govde) for a in adlar):
                bildir('HATA', f, satir,
                       f'Kullanilmayan import: {yol} '
                       f'(sundan hicbiri kullanilmiyor: {sorted(adlar)[:4]})')
                bulundu += 1
    if bulundu == 0:
        print('  Kullanilmayan import yok.\n')
    else:
        print()


# =====================================================================
# 6. prefer_const_declarations  (Faz 2D'de kacirildi)
# =====================================================================
def const_bildirim_denetimi(dosyalar):
    print('=== 6. final -> const onerisi ===')
    const_alanlar = set()
    for f in dosyalar:
        t = yorumsuz(open(f, encoding='utf-8').read())
        for m in re.finditer(r'static\s+const\s+[\w<>,?\[\] ]*?(\w+)\s*=', t):
            const_alanlar.add(m.group(1))
    bulundu = 0
    for f in dosyalar:
        t = yorumsuz(open(f, encoding='utf-8').read())
        for m in re.finditer(r'\bfinal\s+[\w<>,?\[\] ]+\s+\w+\s*=\s*(\w+)\.(\w+)\s*;', t):
            if m.group(2) in const_alanlar:
                satir = t[:m.start()].count('\n') + 1
                bildir('UYARI', f, satir,
                       f"'final' yerine 'const' kullanilabilir: "
                       f'{m.group(1)}.{m.group(2)} bir static const.')
                bulundu += 1
    if bulundu == 0:
        print('  Oneri yok.\n')
    else:
        print()


# =====================================================================
# 7. CAGRI IMZASI UYUMU  (Faz 3A HOTFIX dersinden dogdu)
#
# Ekranlar repo.ilerlemeKaydet(kod: ...) cagiriyordu, repo
# hikayeKod: bekliyordu. Ayrac/import taramasi bunu YAKALAMAZ.
# =====================================================================
def _duzey0_adlar(arg):
    """Arguman metnindeki YALNIZCA en dis duzeydeki 'ad:' cifitlerini doner.
    Ic ice record/map/liste degismezlerindeki alan adlari SAYILMAZ.
    (Faz 4A.0 hatasi: {kA: (dogru: 1, yanlis: 4)} icindeki 'yanlis' dis
     cagrinin parametresi sanildi.)"""
    adlar = set()
    derinlik = 0
    i = 0
    while i < len(arg):
        c = arg[i]
        # NOT: '<' ve '>' SAYILMAZ — Dart'ta '=>' operatoru derinligi bozar.
        # Jenerikler zaten dengeli oldugu icin gerek de yok.
        if c in '([{':
            derinlik += 1
        elif c in ')]}':
            derinlik -= 1
        elif derinlik == 0 and c == ':':
            j = i - 1
            while j >= 0 and arg[j].isspace():
                j -= 1
            k = j
            while k >= 0 and (arg[k].isalnum() or arg[k] == '_'):
                k -= 1
            ad = arg[k + 1:j + 1]
            if ad and not ad[0].isdigit():
                onceki = arg[:k + 1].rstrip()
                if not onceki or onceki[-1] in ',(':
                    adlar.add(ad)
        i += 1
    return adlar


def imza_denetimi(dosyalar):
    print('=== 7. Cagri imzasi uyumu ===')

    # Proje icindeki metot tanimlarini topla: ad -> (dosya, satir, named, poz)
    # NOT: adlandirilmis parametre blogu '{' icerir; parametreler DENGELI
    # parantez taranarak alinir (regex ile alinamaz).
    tanim = {}
    for f in dosyalar:
        t = yorumsuz(open(f, encoding='utf-8').read())
        for m in re.finditer(
                r'^\s{2,}(?:static\s+)?(?:Future<[^>]*>|void|bool|int|double|'
                r'String\??|List<[^>]*>|Map<[^>]*>|Set<[^>]*>|\w+\??)\s+'
                r'(\w+)\s*\(', t, re.M):
            ad = m.group(1)
            if ad in ('if', 'for', 'while', 'switch', 'catch', 'return'):
                continue
            # dengeli parantezle parametre listesini al
            i = m.end() - 1
            derinlik = 0
            son = i
            while i < len(t):
                if t[i] in '([{':
                    derinlik += 1
                elif t[i] in ')]}':
                    derinlik -= 1
                    if derinlik == 0:
                        son = i
                        break
                i += 1
            ham_par = t[m.end():son]
            # govde '{' ile mi basliyor? degilse tanim degil (cagri olabilir)
            kalan = t[son + 1:son + 40]
            if not re.match(r'\s*(?:async\s*)?\{', kalan):
                continue
            named = set()
            if '{' in ham_par:
                blok = ham_par[ham_par.find('{') + 1:ham_par.rfind('}')]
                for pm in re.finditer(
                        r'(?:required\s+)?[\w<>,?\[\]. ]+?\s+(\w+)\s*(?:=[^,]*)?(?:,|$)',
                        blok):
                    named.add(pm.group(1))
            poz = bool(ham_par.strip()) and not ham_par.strip().startswith('{')
            satir = t[:m.start()].count('\n') + 1
            tanim.setdefault(ad, []).append((f, satir, named, poz))

    bulundu = 0
    for f in dosyalar:
        ham = open(f, encoding='utf-8').read()
        t = yorumsuz(ham)
        for m in re.finditer(r'\.(\w+)\s*\(', t):
            ad = m.group(1)
            if ad not in tanim:
                continue
            adaylar = [x for x in tanim[ad] if x[2]]
            if not adaylar:
                continue          # adlandirilmis parametresi olan tanim yok

            # cagri argumanlarini ayikla (dengeli parantez)
            i = m.end() - 1
            derinlik = 0
            son = i
            while i < len(t):
                if t[i] in '([': derinlik += 1
                elif t[i] in ')]':
                    derinlik -= 1
                    if derinlik == 0:
                        son = i; break
                i += 1
            arg = t[m.end():son]
            cagri_named = _duzey0_adlar(arg)
            if not cagri_named:
                continue
            # Birden cok tanim varsa: HICBIRINE uymuyorsa bildir.
            uyan = None
            for dosya_t, satir_t, named_t, _ in adaylar:
                if not (cagri_named - named_t):
                    uyan = (dosya_t, satir_t, named_t)
                    break
            if uyan is None:
                satir = t[:m.start()].count('\n') + 1
                dosya_t, satir_t, named_t, _ = adaylar[0]
                bildir('HATA', f, satir,
                       f"'{ad}' cagrisi hicbir tanima uymuyor. "
                       f"Verilen: {sorted(cagri_named)}. "
                       f"Ornek tanim {dosya_t}:{satir_t} "
                       f"sunlari bekliyor: {sorted(named_t)}")
                bulundu += 1
    if bulundu == 0:
        print('  Imza uyumsuzlugu bulunamadi.\n')
    else:
        print()


# =====================================================================
# 8. EKSIK ZORUNLU YAPICI PARAMETRESI  (Faz 4A.0 dersinden dogdu)
#
# DersSablonu 17 zorunlu alan istiyordu; icerik dosyasi 9'unu veriyordu.
# Ayrac/import/imza kontrolleri bunu YAKALAMAZ.
# =====================================================================
def zorunlu_parametre_denetimi(dosyalar):
    print('=== 8. Eksik zorunlu yapici parametresi ===')

    # sinif -> zorunlu adlandirilmis parametreler
    zorunlu = {}
    for f in dosyalar:
        t = yorumsuz(open(f, encoding='utf-8').read())
        for m in re.finditer(r'^class (\w+)', t, re.M):
            sinif = m.group(1)
            govde_bas = m.end()
            # yapici: const Sinif({...}) veya Sinif({...})
            yp = re.search(
                r'(?:const\s+)?' + re.escape(sinif) + r'\s*\(\s*\{', t[govde_bas:govde_bas + 4000])
            if not yp:
                continue
            i = govde_bas + yp.end() - 1
            derinlik = 0
            son = i
            while i < len(t):
                if t[i] == '{': derinlik += 1
                elif t[i] == '}':
                    derinlik -= 1
                    if derinlik == 0:
                        son = i; break
                i += 1
            blok = t[govde_bas + yp.end():son]
            gerekli = set(re.findall(r'required\s+(?:this\.)?(\w+)', blok))
            if gerekli:
                zorunlu[sinif] = gerekli

    bulundu = 0
    for f in dosyalar:
        ham = open(f, encoding='utf-8').read()
        t = yorumsuz(ham)
        for sinif, gerekli in zorunlu.items():
            for m in re.finditer(r'(?<![\w.])' + re.escape(sinif) + r'\s*\(', t):
                # tanimin kendisi mi?
                onceki = t[max(0, m.start() - 30):m.start()]
                if re.search(r'(?:const\s+)?$', onceki) and re.search(
                        r'^\s*(?:const\s+)?' + re.escape(sinif) + r'\s*\(\s*\{',
                        t[m.start():m.start() + 200]):
                    # yapici tanimi olabilir: govdesinde 'required' varsa atla
                    pass
                i = m.end() - 1
                derinlik = 0
                son = i
                while i < len(t):
                    if t[i] in '([{': derinlik += 1
                    elif t[i] in ')]}':
                        derinlik -= 1
                        if derinlik == 0:
                            son = i; break
                    i += 1
                arg = t[m.end():son]
                if 'required ' in arg:
                    continue          # yapici TANIMI, cagri degil
                verilen = _duzey0_adlar(arg)
                if not verilen:
                    continue
                eksik = gerekli - verilen
                if eksik:
                    satir = t[:m.start()].count('\n') + 1
                    bildir('HATA', f, satir,
                           f"'{sinif}' yapicisinda EKSIK zorunlu parametre: "
                           f"{sorted(eksik)}")
                    bulundu += 1
    if bulundu == 0:
        print('  Eksik zorunlu parametre yok.\n')
    else:
        print()


# =====================================================================
# 9. KULLANILAN SEMBOL IMPORT EDILMIS MI  (Faz 4A.0 son hatasindan dogdu)
#
# ders_ekrani.dart 'AkisKontrolcusu' kullaniyordu ama importu YOKTU.
# Sekiz derleme hatasi cikti; hicbir mevcut kontrol yakalamadi.
# =====================================================================
def eksik_import_denetimi(dosyalar, kok='lib'):
    print('=== 9. Kullanilan sembol import edilmis mi ===')

    # sembol -> tanimlandigi dosya (yalnizca sutun 0 bildirimleri)
    tanim_yeri = {}
    for f in dosyalar:
        t = yorumsuz(open(f, encoding='utf-8').read())
        for m in re.finditer(
                r'^(?:abstract\s+)?(?:class|enum|mixin|extension)\s+(\w+)',
                t, re.M):
            tanim_yeri.setdefault(m.group(1), set()).add(f)

    bulundu = 0
    for f in dosyalar:
        ham = open(f, encoding='utf-8').read()
        t = yorumsuz(ham)

        # bu dosyanin import ettigi proje dosyalari
        edilen = set()
        for m in re.finditer(r"import\s+'([^']+)'", ham):
            yol = m.group(1)
            if yol.startswith('dart:') or yol.startswith('package:flutter'):
                continue
            if yol.startswith('package:english_coach/'):
                hedef = os.path.join(kok, yol.split('package:english_coach/')[1])
            elif yol.startswith('package:'):
                continue
            else:
                hedef = os.path.normpath(os.path.join(os.path.dirname(f), yol))
            edilen.add(os.path.normpath(hedef))

        govde = re.sub(r"^import\s+'[^']+';\s*$", '', t, flags=re.M)
        for sembol, yerler in tanim_yeri.items():
            if len(sembol) < 4:
                continue
            if f in yerler:
                continue          # ayni dosyada tanimli
            if not re.search(r'(?<![\w.])' + re.escape(sembol) + r'\b', govde):
                continue          # kullanilmiyor
            if any(os.path.normpath(y) in edilen for y in yerler):
                continue          # importu var
            satir = govde[:re.search(
                r'(?<![\w.])' + re.escape(sembol) + r'\b', govde).start()
                ].count('\n') + 1
            bildir('HATA', f, satir,
                   f"'{sembol}' kullaniliyor ama IMPORT EDILMEMIS. "
                   f'Tanim: {sorted(yerler)[0]}')
            bulundu += 1
    if bulundu == 0:
        print('  Eksik import yok.\n')
    else:
        print()


# =====================================================================
# 10. MUKERRER KOD BLOGU  (Faz 4A.0 seed hatasindan dogdu)
#
# ESIK 15 SATIR: arayuz kodunda 5-8 satirlik benzer bloklar DOGALDIR
# (benzer widget'lar). 15 satirlik birebir tekrar ise neredeyse her zaman
# kaza eseri kopyalamadir. Gercek hata 40 satirdi.
#
# seed_content.dart'a hikaye seed blogu IKI KEZ eklenmisti (duzenleme
# betigi iki kez uygulandi). Sonuc: acilista UNIQUE constraint hatasi,
# uygulama HIC ACILMADI. Dokuz kontrolun hicbiri yakalamadi.
# =====================================================================
def mukerrer_blok_denetimi(dosyalar, esik=15):
    print(f'=== 10. Mukerrer kod blogu (>= {esik} satir) ===')
    bulundu = 0
    for f in dosyalar:
        ham = open(f, encoding='utf-8').read().split('\n')
        # anlamli satirlar: bos ve yorum olmayan
        anlamli = [(i, l.strip()) for i, l in enumerate(ham)
                   if l.strip() and not l.strip().startswith('//')
                   and not l.strip().startswith('///')]
        if len(anlamli) < esik * 2:
            continue
        metinler = [m for _, m in anlamli]
        gorulen = {}
        i = 0
        while i <= len(metinler) - esik:
            imza = '\n'.join(metinler[i:i + esik])
            # onemsiz tekrarlari ele (tek karakterli ayraclar vb.)
            if sum(len(x) for x in metinler[i:i + esik]) < 200:
                i += 1
                continue
            if imza in gorulen:
                ilk = gorulen[imza]
                bildir('UYARI', f, anlamli[i][0] + 1,
                       f'{esik} satirlik blok satir '
                       f'{anlamli[ilk][0] + 1} ile AYNI. '
                       f'Kopyala-yapistir veya iki kez uygulanmis '
                       f'duzenleme olabilir.')
                bulundu += 1
                i += esik      # ayni blogu tekrar tekrar bildirme
                continue
            gorulen[imza] = i
            i += 1
    if bulundu == 0:
        print('  Mukerrer blok yok.\n')
    else:
        print()


def main():
    dosyalar = sorted(glob.glob('lib/**/*.dart', recursive=True) +
                      glob.glob('test/**/*.dart', recursive=True))
    print(f'{len(dosyalar)} Dart dosyasi taraniyor\n')
    null_tur_denetimi(dosyalar)
    import_denetimi(dosyalar)
    mimari_denetimi()
    ayrac_denetimi(dosyalar)
    kullanilmayan_import(dosyalar)
    const_bildirim_denetimi(dosyalar)
    imza_denetimi(dosyalar)
    zorunlu_parametre_denetimi(dosyalar)
    eksik_import_denetimi(dosyalar)
    mukerrer_blok_denetimi(dosyalar)
    print('=' * 66)
    print(f'SONUC: {hata} hata, {uyari} uyari')
    print('UYARI: Bu arac `flutter analyze` YERINE GECMEZ.')
    print('       Yalnizca bilinen hata siniflarini yakalar.')
    print('=' * 66)
    return 1 if hata else 0


if __name__ == '__main__':
    sys.exit(main())
