# PHASE_2A_PROGRESS.md — Teaching Engine v1

**Tarih:** 2026-07-19
**Durum:** 🟡 **KOD YAZILDI — DERLENMEDİ, ÇALIŞTIRILMADI**
**Faz 2A sonucu:** **PASS DEĞİL.**

---

## 1. Doğrulama durumu — önce bu

`flutter analyze`, `flutter test`, `flutter run -d windows` komutlarını **çalıştıramadım.**
Bu oturum bir Linux konteyneri; Flutter kurulu değil, SDK kaynağı (`storage.googleapis.com`) HTTP 403.

**Ayrıca:** Faz 1B-1'in çalıştığına dair henüz bir çıktı almadım. "Mevcut çalışan proje" varsayımı doğrulanmamış durumda. Faz 2A değişiklikleri, henüz bir kez bile derlenmemiş bir tabanın üzerine yazıldı.

Derleyemediğim için **algoritmayı, içeriği ve SQL'i ayrı ayrı doğruladım.** Bunlar derleme kanıtı değildir.

---

## 2. Tanı Motoru v2 — bildirdiğiniz sorun

### Bulgu: sorunu birebir yeniden üretemedim

`Every day I drink coffee` girdisi v1'de `TANI_KONULAMADI` değil, **`OLASI_TANI / LEX-01`** dönüyordu. Ölçüm:

```
'Every day I drink coffee'  -> guven=OLASI  kod=LEX-01
mesafe analizi: 'Every morning I drink coffee.' ile jeton mesafesi = 1
```

**Ama eleştiriniz yerinde.** `OLASI / "Yapı doğru görünüyor; bir kelime farklı"` çıktısı işe yaramaz: hangi kelime olduğunu söylemiyor, gramerin doğru olduğunu belirtmiyor, öğrenciye ne yapacağını göstermiyor. Yapı birebir aynıyken sistem **kesin** konuşabilmeli.

### v1 → v2 karşılaştırması

| | v1 | v2 |
|---|---|---|
| Güven | `OLASI_TANI` | **`KESIN_TANI`** |
| Kod | `LEX-01` | **`SOZ-01`** |
| Kategori | yok | **`SOZCUK`** |
| Gramer doğru mu | belirtilmiyor | **`true`** |
| Beklenen kelime | yok | **`morning`** |
| Yazılan kelime | yok | **`day`** |
| Açıklama | "bir kelime farklı" | "Cümlenin yapısı doğru. `day` = gün; burada beklenen kelime `morning` = sabah." |

### Yeni kategori ayrımı

```
GRAMER   -> BE-01, SU-01, AGR-01, ART-01, ART-02, PREP-01, AUX-01
SOZCUK   -> SOZ-01 (tek kelime), SOZ-02 (iki kelime)   [gramer DOGRU]
YAZIM    -> YAZ-01 (karakter mesafesi <= 2)            [gramer DOGRU]
SIRALAMA -> WO-01 (SOV transferi), WO-02 (oge sirasi)
BELIRSIZ -> LEX-99 (TANI_KONULAMADI)
```

### Kaskad sırasında bulunan hata

İlk tasarımda `I books read.` (SOV hatası) **sözcük değişimi** olarak sınıflandırıldı — aynı uzunlukta iki konum farklı olduğu için. Düzeltme: **permütasyon kontrolü (A0) en başa alındı.** Kelime çokluğu (multiset) aynıysa hiçbir kelime değiştirilmemiştir; yalnızca sıra değişmiştir.

### Ölçüm

```
tool/tani_motoru_v2_dogrulama.py   ->  19/19 PASS
  kanonik + 2. kabul cevabi                      -> DOGRU
  morning->day, coffee->tea                      -> KESIN / SOZ-01 / SOZCUK / gramer=true
  cofee, mornning                                -> KESIN / YAZ-01 / YAZIM  / gramer=true
  I books read.                                  -> KESIN / WO-01  / SIRALAMA
  Coffee I drink...                              -> OLASI / WO-02  / SIRALAMA
  She happy / Am coming / He work / I saw dog    -> KESIN / GRAMER
  I saw the dog / in the bus / I not like        -> KESIN / ART-02, PREP-01, AUX-01
  iki icerik kelimesi                            -> OLASI / SOZ-02
  He teacher. / hello world / bos                -> TANI_KONULAMADI, aciklama YOK
```

---

## 3. Ders içeriği — EN-A1-001

15 aşama, `lib/core/content/ders_en_a1_001.dart` içinde.

| # | Aşama | Karşılığı |
|---|---|---|
| 1 | Motivasyon | Adım 1–2: "Türkçede anlamı ek taşır, İngilizcede sıra taşır" |
| 2 | SVO kutuları | Adım 3–5: **4 görsel kutu**, `[SVO]` bloğu → Flutter'da renkli kutu + ok |
| 3 | 25 doğru örnek | Adım 6, tablo |
| 4 | 25 yanlış örnek | Adım 7, **6 kategoriye ayrılmış**, her biri için "neden yanlış" |
| 5 | Karşılaştırmalar | Adım 8, TR↓EN sıra tablosu |
| 6 | Mini quiz | 4 görev (Q-01…04) |
| 7 | Yazma | 3 görev (YZ-01…03) |
| 8 | Kelime sürükleme | 3 görev (SR-01…03) |
| 9 | Boşluk doldurma | 3 görev (BD-01…03) |
| 10 | TR→EN | 4 görev (CT-01…04) |
| 11 | EN→TR | 3 görev (CE-01…03) |
| 12 | Karışık tekrar | 4 görev (KT-01…04) |
| 13 | Ders özeti | Adım 20 |
| 14 | 5 dakikalık tekrar | Adım 21 |
| 15 | Çıkış sınavı | 6 görev (CS-01…06) |

**Toplam:** 10 sunum adımı + **30 görev** + 40 kelime + 47 kabul cevabı.

### Yanlış örneklerin kategorileri

| Kategori | Adet | Örnek |
|---|---|---|
| A. Fiili sona atma (SOV transferi) | 8 | *I water drink.* |
| B. Özne-fiil karıştırma | 4 | *Coffee I drink.* |
| C. Özne düşürme | 4 | *Drink coffee.* |
| D. be düşürme | 3 | *She teacher.* |
| E. Yardımcı fiil düşürme | 3 | *I not like coffee.* |
| F. 3. tekil -s unutma | 3 | *He drink water.* |

### Ölçüm

```
tool/icerik_dogrulama.py   ->  24/24 PASS
  10 ders adimi, adim numaralari benzersiz
  4 SVO kutusu, hucre sayilari eslesiyor (tr/tr_rol, en/en_rol)
  25 dogru ornek, 25 yanlis ornek, her yanlisin aciklamasi var
  30 gorev, kodlar benzersiz, bos kabul kumesi yok
  13 uretim gorevi (G-CT)
  40 kelime, kodlar/yazilislar benzersiz, IPA ve TR anlam tam
  GERCEK SQLite'a yukleme basarili, 47 kabul cevabi yazildi
```

---

## 4. Değişen dosyalar

| Dosya | Değişiklik | Satır |
|---|---|---|
| `lib/core/engine/tani_motoru.dart` | **Yeniden yazıldı** — v2 kaskadı, `HataKategorisi`, `gramerDogru`, `beklenenKelime`/`yazilanKelime` | 402 |
| `lib/core/content/ders_en_a1_001.dart` | **YENİ** — ders içeriği (mimari değil, veri) | 560 |
| `lib/core/db/seed_content.dart` | İçeriği `DersEnA1001`'den okuyacak şekilde güncellendi | 78 |
| `lib/data/icerik_repo.dart` | `kelimeAnlamHaritasi()` eklendi | +12 |
| `lib/features/ders/ders_ekrani.dart` | SVO kutu çizimi + v2 geri bildirim gösterimi | 422 |
| `test/tani_motoru_test.dart` | v2 için yeniden yazıldı, **26 test** | 148 |

### Kısıtlara uyum

| Kısıt | Durum |
|---|---|
| SQLite yapısını bozma | ✅ **Şema değişmedi.** Hata kategorisi ayrı sütunda tutulmuyor; hata **kodundan türetiliyor** |
| Navigation değiştirme | ✅ Dokunulmadı |
| Yeni paket ekleme | ✅ `pubspec.yaml` değişmedi |
| Yeni mimari | ✅ Yeni katman yok; `content/` bir veri klasörü |
| Diğer derslere dokunma | ✅ Yalnızca EN-A1-001 |

---

## 5. Öğrenmenin ölçülmesi

Çıkış sınavı (CS-01…06) SVO'yu üç farklı yoldan sınar:

| Görev | Ölçtüğü |
|---|---|
| CS-01 | Sıralama — kelimeleri doğru dizebiliyor mu |
| CS-02, CS-04 | TR→EN üretim — kalıbı kendisi kurabiliyor mu |
| CS-03 | Boşluk — fiili doğru yere koyabiliyor mu |
| CS-05 | Olumsuz cümle — yardımcı fiil |
| CS-06 | Uzun cümle + zaman ifadesi |

`gramer_ustaligi` yalnızca **doğru tamamlanan benzersiz görev** oranından hesaplanır; yanlış cevap ustalığı artırmaz. Üretim kanıtı (`uretim_kaniti_var_mi`) yalnızca G-CT görevleri doğru cevaplanınca 1 olur.

---

## 6. Faz 2A çıkış şartları

| # | Şart | Durum |
|---|---|---|
| 1 | `flutter analyze` temiz | ⬜ **DOĞRULANMADI** |
| 2 | `flutter test` — 26 test geçiyor | ⬜ **DOĞRULANMADI** (algoritma 19/19 geçti) |
| 3 | `flutter run -d windows` açılıyor | ⬜ **DOĞRULANMADI** |
| 4 | 15 aşama sırayla görünüyor | ⬜ **DOĞRULANMADI** |
| 5 | SVO kutuları çiziliyor | ⬜ **DOĞRULANMADI** |
| 6 | `Every day I drink coffee` → SOZ-01 / gramer doğru | ⬜ **DOĞRULANMADI** (algoritma geçti) |
| 7 | 30 görev tamamlanabiliyor | ⬜ **DOĞRULANMADI** |
| 8 | İlerleme korunuyor | ⬜ **DOĞRULANMADI** |

**8/8 doğrulanmamış → Faz 2A PASS ile kapatılamaz.**

---

## 7. Bilinen riskler

| # | Risk | Nasıl görülür |
|---|---|---|
| R-1 | `content.db` zaten varsa **eski içerikle** açılır; yeni ders görünmez | Uygulama açılınca 3 görev görürseniz eski DB'dedir → `user.db` ve `content.db`'yi silin (yol ana ekranda yazıyor) |
| R-2 | `withValues(alpha:)` Flutter sürümünüzde yoksa | `flutter analyze` hatası → `.withOpacity()` ile değiştiririz |
| R-3 | `surfaceContainerHighest` Material 3 rengi eski sürümde yok | `flutter analyze` hatası → `surfaceVariant` ile değiştiririz |
| R-4 | Dart 3 `switch` ifadesi ve record `(renk, etiket)` SDK ≥3.3 ister | `flutter analyze` |
| R-5 | Uzun markdown metinleri düz metin olarak görünür (markdown renderer yok) | Tablolar `|` işaretleriyle görünür — yeni paket eklemedim |

**R-1 en olası sorundur.** Faz 1B-1'de oluşmuş bir `content.db` varsa, `SeedContent.doldur()` yalnızca dosya yokken çalışır.

---

## 8. Çalıştırma

```powershell
cd $env:USERPROFILE\Documents\english_coach

# R-1 onlemi: eski icerik veritabanini temizleyin
# (yol ana ekranda "user.db:" satirinda yaziyor, ayni klasorde content.db de var)

flutter analyze
flutter test
flutter run -d windows
```

**Test edilecek kritik davranış** — 13. adımdaki CT-02 görevinde (`Ben her sabah kahve içerim.`) şunu yazın:

```
Every day I drink coffee
```

Beklenen ekran:
```
KESIN_TANI   [Kelime secimi]   [SOZ-01]
✓ Dilbilgisi dogru.
Beklenen kelime: morning
Yazilan: day
Dogru form: I drink coffee every morning.
Cumlenin yapisi dogru. 'day' = gun; burada beklenen kelime 'morning' = sabah.
```

Bu ekranı görürseniz Tanı Motoru v2 çalışıyor demektir. Çıktıyı gönderin; hata çıkarsa önce onu çözelim.
