# PHASE_4A1_PROGRESS.md — Sıralı Ders Üretimi (1. Parti)

**Tarih:** 2026-07-20

---

## 1. Doğrulama beyanı

> **Bu oturumda Flutter kurulu değildir.** `flutter analyze`, `flutter test`,
> `flutter run -d windows` komutlarını **çalıştırmadım** ve **PASS yazmıyorum.**

| Komut | Beklenen | Gerçek sonuç |
|---|---|---|
| `flutter analyze` | `No issues found!` | ⬜ |
| `flutter test` | 137 mevcut + ~20 yeni = **~157 test** | ⬜ |
| `flutter run -d windows` | Gramer'de **3 şablon ders** | ⬜ |

---

## 2. Şablon çalıştı: ders eklemek yalnızca veri

Faz 4A.0'daki iddiayı bu fazda **sınadım**. İki yeni ders eklemek için:

| Değişen | Ne kadar |
|---|---|
| Yeni içerik dosyası | 2 adet |
| `sablon_ders_kayitlari.dart` | **2 satır** |
| `ders_motoru.dart` | **0 satır** |
| `ders_sablonu.dart` | **0 satır** |
| `sablon_ders_ekrani.dart` | **0 satır** |
| `gramer_ekrani.dart` | **0 satır** |

İddia tutuyor.

---

## 3. Yazılan dersler

### EN-A1-003 — Kişi Zamirleri

Hedef hata kodu: **`SU-01`** (özne düşürme) — Tanı Motoru'nda zaten tanımlı.

Öğretim mantığı: Türkçede fiil eki özneyi taşır (*gel-iyor-um*), İngilizcede
taşımaz. Ayrıca Türkçedeki tek "o" üçe ayrılır (he/she/it). Ders bu iki farkı
karşılaştırarak kuruyor; ezber listesi vermiyor.

Alt konular: `Ozne zamiri` · `Nesne zamiri` · `Iyelik sifati` · `Ozne dusurme`

### EN-A1-011 — 3. Tekil -s Kuralı

Hedef hata kodu: **`AGR-01`** — Türkçe konuşanın en klasik hatası.

Öğretim mantığı: Türkçede fiil altı biçime girer, İngilizcede Present
Simple'da **hiç değişmez** — tek istisna dışında. Ders bunu "tek istisnayı
öğren" çerçevesine oturtuyor; `-es`, `y→ies` ve `have→has` alt kurallarını
telaffuz gerekçesiyle açıklıyor.

Ayrıca sık atlanan noktayı ayrı bir blokla veriyor: **olumsuz ve soruda -s yok**
(*He does not works* ✗). Kural şöyle özetleniyor: *-s ya "does"ta olur ya
fiilde; ikisinde birden asla.*

Alt konular: `-s eklenmesi` · `-es kurali` · `y -> ies` · `have -> has` ·
`Ozne tespiti`

---

## 4. İçerik sayımı

```
DERS         DOGRU YANLIS  MK  KA  SU  PK  MS OZET ANL
EN-A1-002       30     20   5  10   4   8  15    6   6
EN-A1-003       30     20   4  10   4   8  15    6   6
EN-A1-011       30     20   5  10   4   8  15    6   6
```

**Toplam:** 90 doğru + 60 yanlış örnek · 125 soru · 18 anlatım bloğu.

Her yanlış örnekte **neden yanlış** ve **doğru biçim** var — 60/60.

---

## 5. Testler genelleştirildi

Faz 4A.0'da içerik testleri yalnızca To Be'yi sınıyordu. Artık **kayıt
defterindeki her ders üzerinde otomatik dönüyorlar**:

```dart
for (final DersSablonu d in SablonDersKayitlari.dersler) {
  group('4A-2 Icerik sartlari — ${d.kod}', () { ... });
}
```

Yani dördüncü dersi eklediğinizde bu on test kendiliğinden onu da kapsayacak.
Eklenen kontroller: soru kodlarının benzersizliği, serbest üretim kabullerinin
geçerliliği.

---

## 6. Bağımsız doğrulama aracı

`tool/ders_dogrulama.py` — kayıt defterini okur, her ders için testlerin
sınadığı **aynı** şartları kontrol eder.

```
DERS ICERIK DOGRULAMASI: 30 PASS, 0 FAIL
```

### Aracın kendisinde bulunan hata

İlk yazımda `EN-A1-002` için "geri dönüş kodları anlatımda yok" hatası verdi.
İnceledim: içerik doğruydu, **regex hatalıydı** — `AnlatimBlogu(` ile `kod:`
arasında satır sonu olan yazımı yakalamıyordu. `\s*` eklendi.

Bu tür yanlış alarmları kaydetmek önemli: araç hatasını içerik hatası sanıp
doğru içeriği "düzeltmeye" kalkışmak, gerçek bir bozulma yaratırdı.

---

## 7. Eklenen / değişen dosyalar

| Dosya | Durum | Satır |
|---|---|---|
| `core/content/ders_en_a1_003.dart` | **YENİ** | 341 |
| `core/content/ders_en_a1_011.dart` | **YENİ** | 344 |
| `core/content/sablon_ders_kayitlari.dart` | +2 satır | 27 |
| `test/sablon_ders_test.dart` | İçerik testleri genelleştirildi | 297 |
| `tool/ders_dogrulama.py` | **YENİ** | 96 |

**Dokunulmayanlar:** `ders_motoru.dart`, `ders_sablonu.dart`,
`sablon_ders_ekrani.dart`, `gramer_ekrani.dart`, Tanı Motoru, Hikâye modülü,
Kelime Akademisi, şema, `pubspec.yaml`.

---

## 8. Neden üç ders, on değil

Bir ders To Be kalitesinde ~350 satır veri: 30 doğru + 20 yanlış örnek
(her yanlışta gerekçe), 6 anlatım bloğu, 42 soru.

Tek turda on ders yazarsam örnekler ve gerekçeler birbirini tekrar etmeye
başlar — hikâyelerde yaşadığım sorunun aynısı. Üç ders, **tutarlı bir blok**
oluşturacak şekilde seçildi: zamirler → (Present Simple) → 3. tekil -s.

**Sıradaki parti için öneri:**

| Ders | Gerekçe |
|---|---|
| EN-A1-010 Present Simple Olumlu | 003 ile 011 arasındaki boşluğu kapatır |
| EN-A1-012 do / does | `AUX-01` hata kodunu hedefler |
| EN-A1-013 Present Simple olumsuz ve soru | 011'in altıncı bloğunu derinleştirir |

---

## 9. Bilinen eksikler

| # | Konu |
|---|---|
| E-1 | **EN-A1-010 yazılmadı** — 003 ile 011 arasında konu boşluğu var |
| E-2 | EN-A1-001 hâlâ eski 22 adımlı akışta |
| E-3 | Sürükle-bırak ve eşleştirme metin girişi olarak |
| E-4 | Ders ilerlemesi SQLite'a yazılmıyor |
| E-5 | Ses yok (TB-03) |

**E-1 bilinçli:** 011'i öne aldım çünkü `AGR-01` en sık hata ve Tanı Motoru
onu zaten tanıyor. 010 sıradaki partide.

---

## 10. Çalıştırma

```powershell
flutter analyze
flutter test
flutter run -d windows
```

### Doğrulama

1. **Gramer** → listede **üç** şablon ders (EN-A1-002, 003, 011)
2. EN-A1-011'e girin → anlatımda 6 blok
3. Mini kontrolde bilerek `studys` seçin → *"İlgili anlatıma dön"* (C4 bloğu)
4. Serbest yazmada `He work` yazın → Tanı Motoru `AGR-01` üretmeli
5. Mini sınavda `-es` sorularını kaçırın → hata analizinde `-es kurali` zayıf çıkmalı
6. Pekiştirmede o konu **başta ve tekrar** gelmeli

Ek olarak `python tool/ders_dogrulama.py` çalıştırıp içerik sayımını
kendiniz de görebilirsiniz.
