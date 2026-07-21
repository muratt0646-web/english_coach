/// EN-A1-001 — Temel Cumle Sirasi (SVO)
/// Faz 2A Teaching Engine v1 icerigi. Yaklasik 40-60 dakikalik ders.
///
/// Bu bir ICERIK dosyasidir; mimari degildir.
/// Gorsel kutu bloklari [BLOK] ... [/BLOK] isaretleriyle kodlanir ve
/// ders_ekrani.dart tarafindan cizilir. SQLite semasi DEGISMEZ.
class DersEnA1001 {
  static const konuKod = 'EN-A1-001';

  /// [adim_no, tip, govde_md]
  /// tip: sunum | svo | ornek_dogru | ornek_yanlis | karsilastirma | ozet | tekrar
  static const List<List<String>> adimlar = [
    // ============ 1. MOTIVASYON ============
    ['1', 'sunum', '''
# 1. Neden Turkce gibi konusunca anlasilmiyoruz?

Turkce konusan biri Ingilizce ogrenirken en cok su cumleyi kurar:

> *I water drink.*

Kelimelerin hepsi dogru. Yazim dogru. Ama bir Ingiliz bunu duydugunda
**anlamiyor** — ya da anlamak icin duraksiyor.

Sebep sudur: Turkcede anlami **ekler** tasir, Ingilizcede **sira** tasir.

Turkce:  Ben **suyu** icerim.     → "-yu" eki bize nesneyi soyler
Ingilizce: I drink **water**.      → nesne oldugunu YERI soyler

Turkcede kelimeleri karistirabilirsiniz, anlam bozulmaz:

- Ben suyu icerim.
- Suyu ben icerim.
- Icerim ben suyu.

Ucu de anlasilir. Cunku "-yu" eki nereye giderse gitsin nesneyi isaretler.

Ingilizcede boyle bir ek **yoktur**. Sira degisirse anlam degisir.
'''],
    ['2', 'sunum', '''
# 2. Sira degisince ne oluyor?

Su iki cumleye bakin. Ayni uc kelime, farkli sira:

| Cumle | Anlam |
|---|---|
| The dog bit the man. | Kopek adami isirdi. |
| The man bit the dog. | **Adam kopegi isirdi.** |

Hicbir kelime degismedi. Yalnizca yer degisti — ve olay tamamen tersine dondu.

Turkcede bunu yapmak icin ek degistirmeniz gerekir:
"Kopek adam**i** isirdi" ↔ "Adam kopeg**i** isirdi".

**Ingilizcede ek yok. Yer var.**

Bu dersin tamami tek bir kurali oturtmak icindir:

> Ingilizce cumlede once **kim**, sonra **ne yapiyor**, sonra **neye**.
'''],

    // ============ 2. SVO KUTULARI ============
    ['3', 'svo', '''
# 3. Turkce ve Ingilizce cumle kutulari

[BLOK]
baslik: Ben kahve icerim.
tr: Ben | kahve | icerim
tr_rol: OZNE | NESNE | FIIL
en: I | drink | coffee
en_rol: OZNE | FIIL | NESNE
not: Fiil Turkcede SONDA, Ingilizcede ORTADA.
[/BLOK]

Dikkat edin: **kahve** ile **coffee** yer degistirdi.
Turkcede nesne fiilden once, Ingilizcede fiilden sonra gelir.
'''],
    ['4', 'svo', '''
# 4. Ucunu birden gorelim

[BLOK]
baslik: O kitap okur.
tr: O | kitap | okur
tr_rol: OZNE | NESNE | FIIL
en: She | reads | books
en_rol: OZNE | FIIL | NESNE
not: Fiil ozneden hemen sonra.
[/BLOK]

[BLOK]
baslik: Biz ekmek yeriz.
tr: Biz | ekmek | yeriz
tr_rol: OZNE | NESNE | FIIL
en: We | eat | bread
en_rol: OZNE | FIIL | NESNE
not: Ayni kalip her cumlede tekrar eder.
[/BLOK]

[BLOK]
baslik: Ogretmen kapiyi acar.
tr: Ogretmen | kapiyi | acar
tr_rol: OZNE | NESNE | FIIL
en: The teacher | opens | the door
en_rol: OZNE | FIIL | NESNE
not: Ozne uzun olsa da kalip degismez.
[/BLOK]
'''],
    ['5', 'sunum', '''
# 5. Kural tek cumlede

> **Ozne + Fiil + Nesne**
>
> Kim → Ne yapiyor → Neye

Turkce yazarken kafanizda fiili sona atma refleksi var.
Ingilizce yazarken **fiili ortaya cekin.**

Kendinize sorun: *"Kim?"* → yazin. *"Ne yapiyor?"* → hemen yazin.
*"Neye?"* → en sona.
'''],

    // ============ 3. 25 DOGRU ORNEK ============
    ['6', 'ornek_dogru', '''
# 6. Yirmi bes dogru ornek

Her satirda ayni kalip var: **Ozne → Fiil → Nesne**.
Once Ingilizceyi okuyun, sonra Turkcesini.

| # | Ingilizce | Turkce |
|---|---|---|
| 1 | I drink coffee. | Ben kahve icerim. |
| 2 | She reads books. | O kitap okur. |
| 3 | We eat bread. | Biz ekmek yeriz. |
| 4 | He writes letters. | O mektup yazar. |
| 5 | They watch films. | Onlar film izler. |
| 6 | I like music. | Ben muzik severim. |
| 7 | You speak English. | Sen Ingilizce konusursun. |
| 8 | The teacher opens the door. | Ogretmen kapiyi acar. |
| 9 | My sister plays the guitar. | Kiz kardesim gitar calar. |
| 10 | Ali drinks water. | Ali su icer. |
| 11 | Children eat apples. | Cocuklar elma yer. |
| 12 | I see a bird. | Ben bir kus gorurum. |
| 13 | She wants a book. | O bir kitap ister. |
| 14 | We buy bread. | Biz ekmek aliriz. |
| 15 | He teaches English. | O Ingilizce ogretir. |
| 16 | They study math. | Onlar matematik calisir. |
| 17 | I make tea. | Ben cay yaparim. |
| 18 | The dog eats meat. | Kopek et yer. |
| 19 | My father reads the newspaper. | Babam gazete okur. |
| 20 | You write emails. | Sen e-posta yazarsin. |
| 21 | She speaks Turkish. | O Turkce konusur. |
| 22 | We play football. | Biz futbol oynariz. |
| 23 | I open the window. | Ben pencereyi acarim. |
| 24 | He likes coffee. | O kahve sever. |
| 25 | The students read the lesson. | Ogrenciler dersi okur. |

**Fark ettiniz mi?** Turkce sutununda fiil hep en sonda.
Ingilizce sutununda fiil hep ikinci sirada.
'''],

    // ============ 4. 25 YANLIS ORNEK ============
    ['7', 'ornek_yanlis', '''
# 7. Yirmi bes yanlis ornek ve nedenleri

## A. Fiili sona atma (en sik hata)

| # | Yanlis | Dogru | Neden yanlis |
|---|---|---|---|
| 1 | *I water drink.* | I drink water. | Fiil sona atildi. Turkce sira Ingilizceye tasindi. |
| 2 | *She books reads.* | She reads books. | Ayni hata: nesne fiilden once gelemez. |
| 3 | *We bread eat.* | We eat bread. | Fiil ozneden hemen sonra gelmeli. |
| 4 | *He letters writes.* | He writes letters. | Nesne fiilin ARKASINA gecmeli. |
| 5 | *They films watch.* | They watch films. | Turkce refleksi; fiili ortaya cekin. |
| 6 | *I music like.* | I like music. | "like" bir fiildir, sonda duramaz. |
| 7 | *Ali water drinks.* | Ali drinks water. | Ozel isim de olsa kalip degismez. |
| 8 | *The teacher the door opens.* | The teacher opens the door. | Uzun nesne de fiilden sonra gelir. |

## B. Ozne ile fiili karistirma

| # | Yanlis | Dogru | Neden yanlis |
|---|---|---|---|
| 9 | *Drink I coffee.* | I drink coffee. | Cumle fiille baslamaz (emir degilse). |
| 10 | *Coffee I drink.* | I drink coffee. | Nesne basa alinamaz. |
| 11 | *Reads she books.* | She reads books. | Ozne fiilden once gelmeli. |
| 12 | *Books she reads.* | She reads books. | Nesne basta olunca anlam kayboluyor. |

## C. Ozne dusurme (Turkce aliskanligi)

| # | Yanlis | Dogru | Neden yanlis |
|---|---|---|---|
| 13 | *Drink coffee.* | I drink coffee. | Turkcede "Kahve icerim" olur; Ingilizcede ozne ZORUNLU. |
| 14 | *Read books.* | I read books. | Ozne yoksa cumle emir cumlesine donusur. |
| 15 | *Eat bread every day.* | We eat bread every day. | Kim yiyor? Belirtilmeli. |
| 16 | *Speaks English.* | He speaks English. | Fiilde -s var ama ozne yok. |

## D. be fiilini dusurme

| # | Yanlis | Dogru | Neden yanlis |
|---|---|---|---|
| 17 | *She teacher.* | She is a teacher. | Turkcede "O ogretmen" olur; Ingilizcede "is" gerekir. |
| 18 | *I happy.* | I am happy. | Sifat cumlesinde de be zorunlu. |
| 19 | *They students.* | They are students. | Coğulda "are". |

## E. Yardimci fiil dusurme

| # | Yanlis | Dogru | Neden yanlis |
|---|---|---|---|
| 20 | *I not like coffee.* | I do not like coffee. | Olumsuzda "do" gerekir. |
| 21 | *She not read books.* | She does not read books. | 3. tekilde "does". |
| 22 | *You like coffee?* | Do you like coffee? | Soruda "do" basa gelir. |

## F. 3. tekil -s unutma

| # | Yanlis | Dogru | Neden yanlis |
|---|---|---|---|
| 23 | *He drink water.* | He drinks water. | he/she/it oznesinde fiile -s eklenir. |
| 24 | *She read books.* | She reads books. | Ayni kural. |
| 25 | *My father read the newspaper.* | My father reads the newspaper. | "My father" = he demektir. |
'''],

    // ============ 5. KARSILASTIRMALAR ============
    ['8', 'karsilastirma', '''
# 8. Turkce ↓ Ingilizce karsilastirma

| Turkce | Sira | Ingilizce | Sira |
|---|---|---|---|
| Ben kahve icerim. | O + N + F | I drink coffee. | O + F + N |
| O kitap okur. | O + N + F | She reads books. | O + F + N |
| Biz ekmek yeriz. | O + N + F | We eat bread. | O + F + N |
| Onlar film izler. | O + N + F | They watch films. | O + F + N |
| Ogretmen kapiyi acar. | O + N + F | The teacher opens the door. | O + F + N |

**O** = Ozne · **F** = Fiil · **N** = Nesne

## Akilda kalici kural

Turkce cumleyi kurarken zihniniz sunu yapar:
> kim → neye → ne yapiyor

Ingilizce cumleyi kurarken sunu yapmali:
> kim → **ne yapiyor** → neye

Tek fark: **fiil bir basamak one geliyor.**
'''],

    // ============ 13. DERS OZETI ============
    ['20', 'ozet', '''
# Ders ozeti

1. Turkcede anlami **ek** tasir, Ingilizcede **sira** tasir.
2. Ingilizce temel kalip: **Ozne + Fiil + Nesne**.
3. Fiil, ozneden **hemen sonra** gelir. Sona atilmaz.
4. Ozne dusurulmez. "Drink coffee" degil, "I drink coffee".
5. Sifat/isim cumlesinde **be** (am/is/are) zorunludur.
6. Olumsuz ve soruda **do/does** gerekir.
7. he/she/it oznesinde fiile **-s** eklenir.

## En sik yaptiginiz hata

> Fiili cumlenin sonuna atmak.

Yazmadan once kendinize sorun: **"Fiil nerede?"**
Ikinci sirada degilse, cumleyi tekrar kurun.
'''],
    ['21', 'tekrar', '''
# 5 dakikalik tekrar

Bu bolumu ders bittikten sonra, ertesi gun tekrar okuyun.

## Uc cumle, uc kural

| Cumle | Hatirlatan kural |
|---|---|
| I drink coffee. | Ozne + Fiil + Nesne |
| She **is** a teacher. | be fiili zorunlu |
| He drink**s** water. | 3. tekil -s |

## Hizli kontrol

Asagidaki cumleleri icinizden duzeltin:

1. *I tea drink.* → ?
2. *Read books.* → ?
3. *She happy.* → ?
4. *He drink water.* → ?
5. *You like coffee?* → ?

**Cevaplar:** I drink tea. / I read books. / She is happy. /
He drinks water. / Do you like coffee?
'''],
  ];

  /// [kod, adim_no, tip, govde, ipucu, zorluk, kabul cevaplari...]
  /// tip: G-BD | G-EM | G-SR | G-CE | G-CT
  ///
  /// Deger turu Object? cunku 'ipucu' ve 'kabul_not' ISTEGE BAGLI alanlardir
  /// ve null olabilirler. Zorunlu alanlar (kod, adim, tip, govde, zorluk,
  /// kabul) hicbir zaman null degildir.
  static const List<Map<String, Object?>> gorevler = [
    // ============ 6. MINI QUIZ (adim 9) ============
    {
      'kod': 'Q-01', 'adim': 9, 'tip': 'G-BD', 'zorluk': 1,
      'govde': 'MINI QUIZ 1/4\n\nIngilizce temel cumle sirasi nedir?\n\n'
          'Bosluga uc harfi yazin (ornek: SOV):',
      'ipucu': 'Ozne-Fiil-Nesne kelimelerinin Ingilizce bas harfleri',
      'kabul': ['SVO', 'svo'],
    },
    {
      'kod': 'Q-02', 'adim': 9, 'tip': 'G-BD', 'zorluk': 1,
      'govde': 'MINI QUIZ 2/4\n\n"I ___ coffee." — Bosluga hangi kelime gelir?\n'
          '(Ben kahve icerim.)',
      'ipucu': 'Fiil ozneden hemen sonra gelir.',
      'kabul': ['drink'],
    },
    {
      'kod': 'Q-03', 'adim': 9, 'tip': 'G-BD', 'zorluk': 2,
      'govde': 'MINI QUIZ 3/4\n\n"She ___ books." — "O kitap okur."\n\n'
          'Dikkat: ozne "she".',
      'ipucu': 'he/she/it oznesinde fiile ne eklenir?',
      'kabul': ['reads'],
    },
    {
      'kod': 'Q-04', 'adim': 9, 'tip': 'G-BD', 'zorluk': 2,
      'govde': 'MINI QUIZ 4/4\n\n"*I water drink*" cumlesinde hata nedir?\n\n'
          'Tek kelimeyle yazin: sira / kelime / yazim',
      'ipucu': 'Kelimelerin hepsi dogru mu?',
      'kabul': ['sira', 'siralama'],
    },

    // ============ 7. YAZMA ALISTIRMALARI (adim 10) ============
    {
      'kod': 'YZ-01', 'adim': 10, 'tip': 'G-CT', 'zorluk': 2,
      'govde': 'YAZMA 1/3\n\nSu cumleyi Ingilizce yazin:\n\n**Ben su icerim.**',
      'ipucu': 'Once kim, sonra ne yapiyor, sonra neye.',
      'kabul': ['I drink water.'],
    },
    {
      'kod': 'YZ-02', 'adim': 10, 'tip': 'G-CT', 'zorluk': 2,
      'govde': 'YAZMA 2/3\n\nSu cumleyi Ingilizce yazin:\n\n**Biz ekmek yeriz.**',
      'ipucu': 'Fiili ortaya cekin.',
      'kabul': ['We eat bread.'],
    },
    {
      'kod': 'YZ-03', 'adim': 10, 'tip': 'G-CT', 'zorluk': 3,
      'govde': 'YAZMA 3/3\n\nSu cumleyi Ingilizce yazin:\n\n'
          '**Ogretmen kapiyi acar.**',
      'ipucu': 'Ozne iki kelime olabilir: the teacher',
      'kabul': ['The teacher opens the door.'],
    },

    // ============ 8. KELIME SURUKLEME (adim 11) ============
    {
      'kod': 'SR-01', 'adim': 11, 'tip': 'G-SR', 'zorluk': 1,
      'govde': 'SIRALAMA 1/3\n\nKelimeleri dogru siraya dizin:\n\n'
          'coffee / drink / I\n\n(Ben kahve icerim.)',
      'ipucu': 'Ozne + Fiil + Nesne',
      'kabul': ['I drink coffee.'],
    },
    {
      'kod': 'SR-02', 'adim': 11, 'tip': 'G-SR', 'zorluk': 2,
      'govde': 'SIRALAMA 2/3\n\nKelimeleri dogru siraya dizin:\n\n'
          'books / She / reads\n\n(O kitap okur.)',
      'ipucu': 'Fiil ikinci sirada.',
      'kabul': ['She reads books.'],
    },
    {
      'kod': 'SR-03', 'adim': 11, 'tip': 'G-SR', 'zorluk': 3,
      'govde': 'SIRALAMA 3/3\n\nKelimeleri dogru siraya dizin:\n\n'
          'the newspaper / My father / reads\n\n(Babam gazete okur.)',
      'ipucu': 'Ozne "My father" iki kelimedir.',
      'kabul': ['My father reads the newspaper.'],
    },

    // ============ 9. BOSLUK DOLDURMA (adim 12) ============
    {
      'kod': 'BD-01', 'adim': 12, 'tip': 'G-BD', 'zorluk': 1,
      'govde': 'BOSLUK 1/3\n\nWe ___ bread.  (Biz ekmek yeriz.)',
      'ipucu': 'yemek fiili',
      'kabul': ['eat'],
    },
    {
      'kod': 'BD-02', 'adim': 12, 'tip': 'G-BD', 'zorluk': 2,
      'govde': 'BOSLUK 2/3\n\nHe ___ English.  (O Ingilizce ogretir.)\n\n'
          'Dikkat: ozne "he".',
      'ipucu': '-s eklemeyi unutmayin',
      'kabul': ['teaches'],
    },
    {
      'kod': 'BD-03', 'adim': 12, 'tip': 'G-BD', 'zorluk': 2,
      'govde': 'BOSLUK 3/3\n\nShe ___ a teacher.  (O bir ogretmen.)\n\n'
          'Dikkat: bu bir isim cumlesi.',
      'ipucu': 'Turkcede gizli olan fiil',
      'kabul': ['is'],
    },

    // ============ 10. TR -> EN (adim 13) ============
    {
      'kod': 'CT-01', 'adim': 13, 'tip': 'G-CT', 'zorluk': 2,
      'govde': 'TR → EN 1/4\n\n**Onlar film izler.**',
      'ipucu': null,
      'kabul': ['They watch films.', 'They watch movies.'],
    },
    {
      'kod': 'CT-02', 'adim': 13, 'tip': 'G-CT', 'zorluk': 2,
      'govde': 'TR → EN 2/4\n\n**Ben her sabah kahve icerim.**',
      'ipucu': 'Zaman ifadesi basa veya sona gelebilir.',
      // esdeger_mi: 1=ana/tam kabul · 0=kabul+not · -1=gramer dogru anlam farkli
      // NOT: Normalizer noktalama isaretlerini siler. Bu yuzden
      // 'Every morning, I drink coffee.' ile 'Every morning I drink coffee.'
      // AYNI cevaptir ve TEK kayit olarak tutulur; notu o kayda baglidir.
      'kabul': [
        'I drink coffee every morning.',
        'Every morning I drink coffee.',
        'I drink coffee in the morning.',
        'I drink coffee every day.',
        'I drink tea every morning.',
      ],
      'kabul_tip': [1, 0, 0, -1, -1],
      'kabul_not': [
        null,
        'Virgul kullanimi da dogrudur; zaman ifadesi basa da alinabilir.',
        'Bu da dogru; "every morning" daha yaygin.',
        "Dilbilgisi dogru, ancak 'every day' = her gun; "
            "beklenen 'every morning' = her sabah.",
        "Dilbilgisi dogru, ancak 'tea' = cay; beklenen 'coffee' = kahve.",
      ],
    },
    {
      'kod': 'CT-03', 'adim': 13, 'tip': 'G-CT', 'zorluk': 3,
      'govde': 'TR → EN 3/4\n\n**O kahve sevmez.**',
      'ipucu': 'Olumsuzda yardimci fiil gerekir.',
      'kabul': [
        'He does not like coffee.',
        "He doesn't like coffee.",
        'She does not like coffee.',
      ],
    },
    {
      'kod': 'CT-04', 'adim': 13, 'tip': 'G-CT', 'zorluk': 3,
      'govde': 'TR → EN 4/4\n\n**Kiz kardesim gitar calar.**',
      'ipucu': null,
      'kabul': ['My sister plays the guitar.', 'My sister plays guitar.'],
    },

    // ============ 11. EN -> TR (adim 14) ============
    {
      'kod': 'CE-01', 'adim': 14, 'tip': 'G-CE', 'zorluk': 2,
      'govde': 'EN → TR 1/3\n\n**The dog eats meat.**',
      'ipucu': null,
      'kabul': ['Kopek et yer.', 'Kopek et yiyor.'],
    },
    {
      'kod': 'CE-02', 'adim': 14, 'tip': 'G-CE', 'zorluk': 2,
      'govde': 'EN → TR 2/3\n\n**Children eat apples.**',
      'ipucu': null,
      'kabul': ['Cocuklar elma yer.', 'Cocuklar elma yiyor.'],
    },
    {
      'kod': 'CE-03', 'adim': 14, 'tip': 'G-CE', 'zorluk': 3,
      'govde': 'EN → TR 3/3\n\n**My father reads the newspaper.**',
      'ipucu': null,
      'kabul': ['Babam gazete okur.', 'Babam gazete okuyor.'],
    },

    // ============ 12. KARISIK TEKRAR (adim 15) ============
    {
      'kod': 'KT-01', 'adim': 15, 'tip': 'G-SR', 'zorluk': 2,
      'govde': 'KARISIK 1/4 — Siralama\n\nwater / Ali / drinks',
      'ipucu': null,
      'kabul': ['Ali drinks water.'],
    },
    {
      'kod': 'KT-02', 'adim': 15, 'tip': 'G-BD', 'zorluk': 2,
      'govde': 'KARISIK 2/4 — Bosluk\n\nThey ___ students.  (Onlar ogrenci.)',
      'ipucu': null,
      'kabul': ['are'],
    },
    {
      'kod': 'KT-03', 'adim': 15, 'tip': 'G-CT', 'zorluk': 3,
      'govde': 'KARISIK 3/4 — Ceviri\n\n**Sen e-posta yazarsin.**',
      'ipucu': null,
      'kabul': ['You write emails.', 'You write e-mails.'],
    },
    {
      'kod': 'KT-04', 'adim': 15, 'tip': 'G-CT', 'zorluk': 3,
      'govde': 'KARISIK 4/4 — Ceviri\n\n**Ben pencereyi acarim.**',
      'ipucu': null,
      'kabul': ['I open the window.'],
    },

    // ============ 15. CIKIS SINAVI (adim 30) ============
    {
      'kod': 'CS-01', 'adim': 30, 'tip': 'G-SR', 'zorluk': 2,
      'govde': 'CIKIS SINAVI 1/6\n\nSiralayin: bread / We / buy',
      'ipucu': null,
      'kabul': ['We buy bread.'],
    },
    {
      'kod': 'CS-02', 'adim': 30, 'tip': 'G-CT', 'zorluk': 3,
      'govde': 'CIKIS SINAVI 2/6\n\nIngilizceye cevirin:\n\n**O muzik sever.**',
      'ipucu': null,
      'kabul': ['She likes music.', 'He likes music.'],
    },
    {
      'kod': 'CS-03', 'adim': 30, 'tip': 'G-BD', 'zorluk': 2,
      'govde': 'CIKIS SINAVI 3/6\n\nI ___ a bird.  (Ben bir kus gorurum.)',
      'ipucu': null,
      'kabul': ['see'],
    },
    {
      'kod': 'CS-04', 'adim': 30, 'tip': 'G-CT', 'zorluk': 3,
      'govde': 'CIKIS SINAVI 4/6\n\nIngilizceye cevirin:\n\n'
          '**Onlar matematik calisir.**',
      'ipucu': null,
      'kabul': ['They study math.', 'They study maths.',
                'They study mathematics.'],
    },
    {
      'kod': 'CS-05', 'adim': 30, 'tip': 'G-CT', 'zorluk': 4,
      'govde': 'CIKIS SINAVI 5/6\n\nIngilizceye cevirin:\n\n'
          '**Sen Ingilizce konusmuyorsun.**',
      'ipucu': 'Olumsuz cumle.',
      'kabul': ['You do not speak English.', "You don't speak English."],
    },
    {
      'kod': 'CS-06', 'adim': 30, 'tip': 'G-CT', 'zorluk': 4,
      'govde': 'CIKIS SINAVI 6/6\n\nIngilizceye cevirin:\n\n'
          '**Babam her sabah gazete okur.**',
      'ipucu': null,
      'kabul': [
        'My father reads the newspaper every morning.',
        'Every morning my father reads the newspaper.',
      ],
    },
  ];

  /// Ders kapsamindaki kelimeler: kod, yazilis, ipa, tr_okunus, tur, anlam
  static const List<List<String>> kelimeler = [
    ['W-0001', 'drink', '/drɪŋk/', 'drink', 'fiil', 'icmek'],
    ['W-0002', 'read', '/riːd/', 'riid', 'fiil', 'okumak'],
    ['W-0003', 'eat', '/iːt/', 'iit', 'fiil', 'yemek'],
    ['W-0004', 'write', '/raɪt/', 'rayt', 'fiil', 'yazmak'],
    ['W-0005', 'watch', '/wɒtʃ/', 'voc', 'fiil', 'izlemek'],
    ['W-0006', 'like', '/laɪk/', 'layk', 'fiil', 'sevmek'],
    ['W-0007', 'speak', '/spiːk/', 'spiik', 'fiil', 'konusmak'],
    ['W-0008', 'open', '/ˈəʊpən/', 'oupin', 'fiil', 'acmak'],
    ['W-0009', 'play', '/pleɪ/', 'pley', 'fiil', 'oynamak, calmak'],
    ['W-0010', 'see', '/siː/', 'sii', 'fiil', 'gormek'],
    ['W-0011', 'want', '/wɒnt/', 'vont', 'fiil', 'istemek'],
    ['W-0012', 'buy', '/baɪ/', 'bay', 'fiil', 'satin almak'],
    ['W-0013', 'teach', '/tiːtʃ/', 'tiic', 'fiil', 'ogretmek'],
    ['W-0014', 'study', '/ˈstʌdi/', 'stadi', 'fiil', 'calismak'],
    ['W-0015', 'make', '/meɪk/', 'meyk', 'fiil', 'yapmak'],
    ['W-0016', 'coffee', '/ˈkɒfi/', 'kofi', 'isim', 'kahve'],
    ['W-0017', 'water', '/ˈwɔːtə/', 'voter', 'isim', 'su'],
    ['W-0018', 'bread', '/bred/', 'bred', 'isim', 'ekmek'],
    ['W-0019', 'book', '/bʊk/', 'buk', 'isim', 'kitap'],
    ['W-0020', 'books', '/bʊks/', 'buks', 'isim', 'kitaplar'],
    ['W-0021', 'morning', '/ˈmɔːnɪŋ/', 'morning', 'isim', 'sabah'],
    ['W-0022', 'day', '/deɪ/', 'dey', 'isim', 'gun'],
    ['W-0023', 'tea', '/tiː/', 'tii', 'isim', 'cay'],
    ['W-0024', 'teacher', '/ˈtiːtʃə/', 'tiicir', 'isim', 'ogretmen'],
    ['W-0025', 'student', '/ˈstjuːdənt/', 'styudint', 'isim', 'ogrenci'],
    ['W-0026', 'door', '/dɔː/', 'door', 'isim', 'kapi'],
    ['W-0027', 'window', '/ˈwɪndəʊ/', 'vindou', 'isim', 'pencere'],
    ['W-0028', 'newspaper', '/ˈnjuːzpeɪpə/', 'nyuzpeypir', 'isim', 'gazete'],
    ['W-0029', 'music', '/ˈmjuːzɪk/', 'myuzik', 'isim', 'muzik'],
    ['W-0030', 'film', '/fɪlm/', 'film', 'isim', 'film'],
    ['W-0031', 'films', '/fɪlmz/', 'filmz', 'isim', 'filmler'],
    ['W-0032', 'apple', '/ˈæpl/', 'epil', 'isim', 'elma'],
    ['W-0033', 'meat', '/miːt/', 'miit', 'isim', 'et'],
    ['W-0034', 'guitar', '/ɡɪˈtɑː/', 'gitaar', 'isim', 'gitar'],
    ['W-0035', 'letter', '/ˈletə/', 'letir', 'isim', 'mektup'],
    ['W-0036', 'email', '/ˈiːmeɪl/', 'iimeyl', 'isim', 'e-posta'],
    ['W-0037', 'math', '/mæθ/', 'mets', 'isim', 'matematik'],
    ['W-0038', 'bird', '/bɜːd/', 'börd', 'isim', 'kus'],
    ['W-0039', 'dog', '/dɒɡ/', 'dog', 'isim', 'kopek'],
    ['W-0040', 'father', '/ˈfɑːðə/', 'faadir', 'isim', 'baba'],
  ];
}
