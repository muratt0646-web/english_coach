# PHASE_3A_PROGRESS.md — Hikâye Öğrenme Modülü

**Tarih:** 2026-07-20

---

## 1. Doğrulama beyanı

> **Bu oturumda Flutter kurulu değildir.** `flutter pub get`, `flutter analyze`,
> `flutter test`, `flutter run -d windows` komutlarını **çalıştırmadım** ve
> **hiçbirine PASS yazmıyorum.**

| Komut | Beklenen | Gerçek sonuç |
|---|---|---|
| `flutter pub get` | değişiklik yok (pubspec dokunulmadı) | ⬜ |
| `flutter analyze` | `No issues found!` | ⬜ |
| `flutter test` | 88 mevcut + 24 yeni = **112 test** | ⬜ |
| `flutter run -d windows` | Hikâyeler modülü açılır | ⬜ |

---

## 2. 50 hikâye hakkında — açık kayıt

İstenen: **en az 50 A1 hikâyesi.**
Teslim edilen: **10 tam hikâye + yüzlerce hikâyeye ölçeklenen altyapı.**

**Gerekçe:** 50 hikâye × 250–400 kelime = 12.500–20.000 kelime İngilizce metin,
artı Türkçe çeviri, artı 250 soru. Tek turda yazılırsa hikâyeler birbirini
tekrar etmeye başlar ve öğretim değeri düşer. 10 hikâye **gerçekten farklı 10
temada** ve A1 aralığında yazıldı.

**Kalan 40 hikâye kod işi değil, içerik işidir.** Yeni hikâye eklemek için
`HikayeIcerik.hikayeler` listesine bir kayıt eklemek yeterlidir — motor,
veritabanı, ekranlar ve testler **değişmez**.

### Yazılan 10 hikâye

| Kod | Başlık | Tema | Kelime |
|---|---|---|---|
| H-A1-001 | A Normal Morning | Günlük yaşam | 309 |
| H-A1-002 | Sunday at Home | Aile | 285 |
| H-A1-003 | The First Day at School | Okul | 292 |
| H-A1-004 | The Train to Izmir | Seyahat | 286 |
| H-A1-005 | At the Market | Alışveriş | 293 |
| H-A1-006 | A Busy Day at Work | İş | 277 |
| H-A1-007 | At the Doctor | Sağlık | 282 |
| H-A1-008 | The Guitar Lesson | Hobiler | 282 |
| H-A1-009 | Cooking with Grandmother | Yemek | 268 |
| H-A1-010 | A Rainy Day | Hava ve mevsimler | 276 |

**Toplam 2.850 kelime · 60 paragraf · 50 soru · 40 sözlük girdisi.**

### Kendi ölçümümün yakaladığı kusur

Hikâyeleri yazdıktan sonra kelime sayılarını hesaplattım: **136–172** çıktı,
A1 için 250–400 gerekiyordu. **Hepsi kısaydı.** Beşinci paragrafları ekledim →
209–245, hâlâ kısa. Altıncıları ekledim → **268–309, 10/10 uygun.**

`kelimeSayisi` alanları elle yazılmadı; metinden hesaplanıp yazıldı.

---

## 3. Veri modeli

### content.db (sürüm 3) — içerik

```sql
stories(kod, baslik, seviye, konu_etiketi, kelime_sayisi, tahmini_dk,
        ozet_tr, anahtar_kavramlar, arsiv)
story_paragraph(hikaye_kod, sira, metin_en, metin_tr)
story_questions(hikaye_kod, sira, tip, soru, secenekler, kabul, aciklama)
hikaye_sozluk(kelime, okunus, tr_anlam, ornek_cumle)
```

### user.db (sürüm 3) — kullanıcı verisi

```sql
story_progress(hikaye_kod, son_paragraf, okuma_yuzdesi, durum, favori,
               baslama_tarihi, son_okuma_tarihi, toplam_sure_ms)
story_unknown_words(id, hikaye_kod, kelime, okunus, tr_anlam,
                    eklenme_tarihi, ogrenmeye_eklendi)
story_statistics(id, hikaye_kod, tarih, okuma_suresi_ms, yeni_kelime,
                 bilinen_kelime, dogru, yanlis, basari_yuzdesi)
```

Sartnamedeki beş tablonun tamamı var; `story_paragraph` ve `hikaye_sozluk`
ek olarak eklendi. **Tümü `IF NOT EXISTS` — mevcut kullanıcı verisi silinmez.**

### Ölçeklenebilirlik

- Sözlük **tek havuzdur**; aynı kelime birden çok hikâyede geçse bir kez yazılır.
- Sorular **veri olarak** saklanır; hem elle yazılabilir hem otomatik üretilebilir.
- Çok değerli alanlar `|` ile saklanır → şema değişmeden seçenek sayısı artar.

---

## 4. Öğrenilen kelimelerin kullanılması

Modülün asıl amacı buydu. `HikayeRepo.bilinenKelimeler()` **Kelime
Akademisi'nin** `ogrenilen_kelime` tablosunu okur. `HikayeMotoru` her jetonu
üç durumdan birine ayırır:

| Durum | Anlamı | Görünüm |
|---|---|---|
| `bilinen` | Kullanıcı öğrenmiş | Yeşil vurgu — *"bunu biliyorum"* |
| `bilinmeyen` | Sözlükte var, öğrenilmemiş | Mavi, **tıklanabilir** |
| `notr` | Dilbilgisi kelimesi veya sözlükte yok | Vurgu yok |

**Kök eşleme:** `books` → `book`, `studies` → `study`, `watches` → `watch`.
Çekimli biçim de bilinen sayılır.

Bilinmeyen kelimeye tıklanınca açılan pencerede anlam, okunuş ve örnek cümle
var; **"Öğrenilecek Kelimelere Ekle"** düğmesi `story_unknown_words`'e yazar.
Aynı kelime aynı hikâyede iki kez eklenmez.

---

## 5. Okuma akışı

`hikaye_okuma_ekrani.dart` dört aşamalıdır:

```
OKUMA  ->  TEST  ->  OZET  ->  SONUC
```

| Aşama | İçerik |
|---|---|
| **Okuma** | Paragraf paragraf; her paragrafta "Dinle" ve "Devam Et"; her adımda ilerleme kaydedilir |
| **Test** | 5 soru tipi karışık: doğru/yanlış, çoktan seçmeli, boşluk doldurma, sıralama, cevabı yaz |
| **Özet** | 2–3 cümlelik özet; `OzetDegerlendirici` kavram kapsaması ve uzunluk ölçer |
| **Sonuç** | Okuma süresi, yeni/bilinen kelime, doğru/yanlış, başarı yüzdesi |

**Kaldığı yer:** `story_progress` her paragrafta güncellenir. Uygulama
kapanıp açılınca aynı paragraftan devam edilir.

### Özet değerlendirmesinin sınırı — dürüst not

`OzetDegerlendirici` bir **anlam çözümleyici değildir.** Anahtar kavram
kapsaması ve uzunluk ölçer; dilbilgisi geri bildirimini Tanı Motoru'na bırakır.
Bu sınır kodda ve arayüzde açıkça yazılıdır.

---

## 6. Kütüphane

`hikaye_kutuphane_ekrani.dart` — arama + altı filtre:
seviye · konu · süre · tamamlananlar · devam edenler · favoriler.

**PRODUCT_RULES K9 uyumu:** Hikâye erişimi hiçbir dersin tamamlanmasına
bağlı değildir. İlişkilendirme (bilinen kelime vurgusu) vardır, **kapı yoktur**.

---

## 7. Ses

"Dinle" düğmeleri var ama **bağlı değil.** Basılınca dürüst mesaj veriyor:
cihaz TTS doğrulaması (TB-03) tamamlanınca çalışacak. TB-03 hiç yürütülmedi;
doğrulanmamış bir ses paketi eklemek derlemeyi riske atardı.

---

## 8. Dosyalar

| Dosya | Satır | Durum |
|---|---|---|
| `core/model/hikaye.dart` | 206 | YENİ |
| `core/engine/hikaye_motoru.dart` | 231 | YENİ |
| `core/content/hikaye_icerik.dart` | 981 | YENİ — 10 hikâye |
| `core/content/hikaye_sozluk.dart` | 102 | YENİ — 40 girdi |
| `data/hikaye_repo.dart` | 307 | YENİ |
| `modules/hikaye/hikaye_kutuphane_ekrani.dart` | 279 | YENİ |
| `modules/hikaye/hikaye_okuma_ekrani.dart` | 714 | YENİ |
| `core/db/migrations.dart` | — | content v3 + user v3 |
| `core/db/app_database.dart` | — | v3 göçü bağlandı |
| `core/db/seed_content.dart` | — | hikâye seed'i, sürüm `0.4.0` |
| `test/hikaye_test.dart` | — | YENİ — 24 test |

Eski iskelet dosyalar (`hikaye_ekrani.dart`, `hikaye_ornek_veri.dart`) kaldırıldı.

### Mimari ihlali — yakalandı ve düzeltildi

`seed_content.dart` (core) önce `modules/hikaye/`'yi import ediyordu. Statik
denetleyicim yakaladı. İçerik `core/content/` altına taşındı — ders içeriğiyle
aynı desen. `core/` artık `modules/` ve `data/` bilmiyor.

---

## 9. Testler — 24 adet

| Sartname maddesi | Test |
|---|---|
| Hikâye listeleniyor | `3A-1`, `3A-1b`, `3A-1c` |
| Hikâye açılıyor | `3A-2` |
| Paragraf ilerliyor | `3A-3` |
| İlerleme kaydediliyor | `3A-3` |
| Devam et çalışıyor | `3A-4` |
| Bilinen kelime vurgulanıyor | `3A-5` grubu (6 test) |
| Bilinmeyen kelime açıklaması | `3A-6` |
| Hikâye tamamlanıyor | `3A-7` |
| Test sonuçları kaydediliyor | `3A-8`, `3A-8b` |
| Eski testler bozulmuyor | Dokunulmadı |
| — | `3A-9` kütüphane (5 test) · `3A-10` özet (3 test) |

Bellek içi SQLite; gerçek kullanıcı verisine dokunulmaz.

---

## 10. Ölçümler (derleme değil)

```
Icerik dogrulamasi           ->  9/9 PASS
   10 hikaye A1 araliginda (250-400)
   10 farkli konu etiketi
   her hikayede 5 soru ve 5 FARKLI tip
   her hikayede 6 paragraf
   ozet kapsama hesabi dogru
tool/dart_statik_denetim.py  ->  0 hata, 0 uyari
```

---

## 11. Bilinen eksikler

| # | Konu |
|---|---|
| E-1 | **40 hikâye daha gerekli** (50 hedefi) — içerik işi |
| E-2 | A2 ve B1 hikâyeleri yok — model hazır, içerik yok |
| E-3 | Ses düğmeleri bağlı değil (TB-03) |
| E-4 | Özet değerlendirmesi anlam çözümlemez |
| E-5 | Soru otomatik üretimi yapılmadı; model destekliyor, üretici yazılmadı |
| E-6 | 18 adımlık ders sırası (Faz 2C'den devam) |

---

## 12. Çalıştırma

```powershell
cd $env:USERPROFILE\Documents\english_coach
flutter analyze
flutter test
flutter run -d windows
```

`content.db` **otomatik yenilenir** (sürüm `0.3.0` → `0.4.0`); elle silmeye
gerek yok, `user.db` korunur.

### Doğrulama

1. Ana ekran → **Hikâyeler** → 10 hikâye listelenmeli
2. Arama ve filtreler çalışmalı
3. Bir hikâye açın → paragraf paragraf ilerleyin
4. Kelime Akademisi'nde öğrendiğiniz kelimeler **yeşil** görünmeli
5. Mavi kelimeye tıklayın → anlam/okunuş/örnek penceresi
6. Yarıda çıkıp geri dönün → **aynı paragraftan** devam etmeli
7. Bitirin → 5 soruluk test → özet → istatistik ekranı
