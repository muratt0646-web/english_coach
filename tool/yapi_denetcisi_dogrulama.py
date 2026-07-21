#!/usr/bin/env python3
"""YapiDenetcisi mantik dogrulamasi.
EN ONEMLI olcut: DOGRU cumlelerde YANLIS ALARM vermemek."""
import re, sys

BE={'am','is','are','was','were'}
YARDIMCI={'do','does','did','have','has','had','will','can'}
OZNE={'i','you','he','she','it','we','they'}
TEKIL3={'he','she','it'}
COGUL={'you','we','they'}
FIIL_CIFT={'drink':'drinks','read':'reads','eat':'eats','like':'likes',
  'work':'works','live':'lives','go':'goes','see':'sees','want':'wants',
  'open':'opens','write':'writes','speak':'speaks','play':'plays',
  'watch':'watches','study':'studies','teach':'teaches','buy':'buys',
  'make':'makes','listen':'listens','help':'helps','need':'needs'}
FIILLER=set(FIIL_CIFT)|set(FIIL_CIFT.values())|BE|YARDIMCI
SIFAT={'happy','sad','tired','ready','busy','kind','quiet','loud','new','old',
  'big','small','cheap','expensive','difficult','easy','important','hungry',
  'cold','hot','late','early','right','wrong','clean','dirty','young',
  'beautiful','fresh'}
FONKSIYON={'a','an','the','i','you','he','she','it','we','they','me','him',
  'her','us','them','my','your','his','its','our','their','in','on','at','to',
  'from','for','with','of','about','into','and','but','or','so','because',
  'every','some','any','many','much','all','this','that','these','those','no',
  'each','next','last','not','never'}|BE|YARDIMCI

def tok(s):
    s=re.sub(r"[.!?,;:]",' ',s.lower())
    return [x for x in s.split() if x]

def denetle(cumle):
    b=[]
    ham=cumle.strip()
    if not ham: return b
    j=tok(ham)
    if not j: return b
    fiil=lambda t:t in FIILLER
    sifat=lambda t:t in SIFAT
    isim=lambda t: t not in FONKSIYON and not fiil(t) and not sifat(t)
    fi=next((i for i,t in enumerate(j) if fiil(t)), -1)
    beVar=any(t in BE for t in j); yVar=any(t in YARDIMCI for t in j)

    if fi==0 and j[0] not in YARDIMCI and j[0] not in BE:
        b.append(('SU-01',False))
    if fi<0 and not beVar and not yVar:
        if len(j)>=2 and any(sifat(t) or isim(t) for t in j[1:]):
            b.append(('BE-01',True))
    if fi>0 and not beVar and not yVar:
        ozne=j[fi-1]; f=j[fi]
        tekil = ozne in TEKIL3 or (fi==1 and isim(ozne) and not ozne.endswith('s'))
        if tekil and f in FIIL_CIFT: b.append(('AGR-01',True))
        cogul = ozne=='i' or ozne in COGUL or ozne.endswith('s')
        if cogul and f in FIIL_CIFT.values(): b.append(('AGR-02',True))
    for i in range(len(j)-1):
        if j[i] in BE and fiil(j[i+1]) and j[i+1] not in BE and not j[i+1].endswith('ing'):
            b.append(('BE-02',True))
    # do/does SONRASINDAKI ilk fiil cekimli olmamali (arada ozne olabilir)
    for i,t in enumerate(j):
        if t in ('do','does','did'):
            for k in range(i+1,len(j)):
                if fiil(j[k]) and j[k] not in BE:
                    if j[k] in FIIL_CIFT.values(): b.append(('AUX-02',True))
                    break
    # ozne - be uyumu
    BE_UYUM={'i':'am','he':'is','she':'is','it':'is',
             'you':'are','we':'are','they':'are'}
    for i,t in enumerate(j):
        if t in BE and i>0 and j[i-1] in BE_UYUM:
            if BE_UYUM[j[i-1]]!=t: b.append(('BE-03',True))
    if fi>1 and fi==len(j)-1 and len(j)>=3 and isim(j[fi-1]):
        b.append(('WO-01',True))
    for i in range(1,len(j)):
        if j[i]==j[i-1] and len(j[i])>1: b.append(('TEK-01',False)); break
    if ham[0].islower(): b.append(('BUYUK-01',False))
    if not re.search(r'[.!?]$',ham): b.append(('NOKTA-01',False))
    if j[0] in {'me','him','her','us','them'} and len(j)>=2:
        b.append(('PRO-01',True))
    return b

def ciddi(b): return [k for k,c in b if c]

DOGRU=[
 'I drink coffee every morning.','She reads books.','They are students.',
 'He is a doctor.','We eat bread.','You are right.','It is cold outside.',
 'My father reads the newspaper.','I am a student.','She studies every evening.',
 'He does not work here.','Do you like coffee?','Are they at home?',
 'The children play outside.','I like coffee very much.','She has a car.',
 'We are not ready.','He never drinks coffee.','I open the window.',
 'The book is new.','They live in the city.','I help my friend.',
 'She is very kind.','We listen to music.','He watches films.',
]
YANLIS=[
 ('I are happy.','BE-03'),          # are + ? -> aslinda BE var, fiil yok
 ('He work here.','AGR-01'),
 ('They studies math.','AGR-02'),
 ('I student.','BE-01'),
 ('She teacher.','BE-01'),
 ('I coffee drink.','WO-01'),
 ('She books reads.','WO-01'),
 ('Does he works?','AUX-02'),
 ('He is works.','BE-02'),
 ('Me am happy.','PRO-01'),
 ('Him is a doctor.','PRO-01'),
]
OK=FAIL=0
print("=== 1. DOGRU cumlelerde YANLIS ALARM olmamali ===")
for c in DOGRU:
    cd=ciddi(denetle(c))
    if cd: FAIL+=1; print(f'  [YANLIS ALARM] {c!r} -> {cd}')
    else: OK+=1
print(f'  {OK}/{len(DOGRU)} temiz')

print("\n=== 2. YANLIS cumleler yakalanmali ===")
y=0
for c,bek in YANLIS:
    kodlar=[k for k,_ in denetle(c)]
    if bek in kodlar: y+=1; print(f'  [OK]   {c!r:24s} -> {bek}')
    else: FAIL+=1; print(f'  [KACTI] {c!r:24s} bek={bek} bulunan={kodlar}')
print(f'  {y}/{len(YANLIS)} yakalandi')

print("\n"+"="*56)
print(f'YAPI DENETCISI: {OK+y} PASS, {FAIL} FAIL')
print('Bu bir Flutter testi DEGILDIR.')
print("="*56)
sys.exit(1 if FAIL else 0)
