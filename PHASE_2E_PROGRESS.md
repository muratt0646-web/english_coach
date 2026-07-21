# PHASE_2E_PROGRESS.md — 20 Kelimelik Öğrenme Döngüsü ve PDF

**Tarih:** 2026-07-19

---

## 1. Doğrulama beyanı

> **Bu oturumda Flutter kurulu değildir.** `flutter pub get`, `flutter analyze`,
> `flutter test`, `flutter run -d windows` komutlarını **çalıştırmadım** ve
> **hiçbirine PASS yazmıyorum.**

| Komut | Beklenen | Gerçek sonuç |
|---|---|---|
| `flutter pub get` | **`pdf` paketi çözümlenir** (yeni bağımlılık) | ⬜ |
| `flutter analyze` | `No issues found!` | ⬜ |
| `flutter test` | 54 mevcut + 18 yeni = **72 test** | ⬜ |
| `flutter run -d windows` | Kelime Akademisi 20/20 kapısıyla açılır | ⬜ |

**En riskli adım `flutter pub get`.** Bu fazda ilk kez yeni bir paket eklendi.

---

## 2. Yeni bağımlılık — neden `pdf`, neden `printing` değil

```yaml
# PDF: saf Dart, CEVRIMDISI uretir. Ag veya bulut kullanmaz.
# 'printing' paketi EKLENMEDI (platform eklentisi getirir);
# dosya yazimi dart:io + path_provider ile yapilir.
pdf: ^3.11.1
```

`printing` paketi yazdırma/paylaşma için platform eklentisi getirir ve Windows
derlemesini riske atar. Onun yerine `pdf` ile baytları üretip `dart:io` ile
dosyaya yazıyorum — `path_provider` zaten projede vardı.

`pw.Table.fromTextArray` gibi sürüme göre değişen yardımcıları **kullanmadım**;
tablo `pw.Table` + `pw.TableRow` ile elle kuruldu (kararlı API).

---

## 3. Veritabanı değişiklikleri

**user.db şema sürümü 1 → 2. Yalnızca ekleme; mevcut tablolara dokunulmadı.**

```sql
CREATE TABLE ogrenilen_kelime (
  kelime_id             TEXT PRIMARY KEY,   -- ayni kelime IKI KEZ eklenemez
  ingilizce             TEXT NOT NULL,
  okunus                TEXT NOT NULL,
  turkce_anlam          TEXT NOT NULL,
  paket_id              INTEGER NOT NULL,
  ogrenilme_tarihi      TEXT NOT NULL,
  son_tekrar_tarihi     TEXT,
  sonraki_tekrar_tarihi TEXT NOT NULL,
  tekrar_sayisi         INTEGER NOT NULL DEFAULT 0,
  dogru_sayisi          INTEGER NOT NULL DEFAULT 0,
  yanlis_sayisi         INTEGER NOT NULL DEFAULT 0,
  durum                 TEXT NOT NULL DEFAULT 'ogrenildi'
);
CREATE TABLE pekistirme_sonucu (...);
```

Sartnamedeki 11 alanın tamamı mevcut. `kelime_id` birincil anahtar olduğu için
**aynı kelime ikinci kez ayrı kayıt olarak eklenemez** — kısıt veritabanı
düzeyinde.

**Kullanıcı verisi silinmez:** göç `IF NOT EXISTS` ile yalnızca ekleme yapar.

---

## 4. 20/20 kapısı

`KelimeRepo.pekistirmeAcikMi(paketId)` → `paketOgrenilenSayisi >= 20`.

Ekranda "Pekiştirmeye Başla" düğmesi `onPressed: tamam ? ... : null` ile
**devre dışı**; 20/20 olmadan basılamaz. İlerleme metni sartnamedeki biçimde:
`3 / 20 ogrenildi` · `20 / 20 tamamlandi`.

---

## 5. Sekiz pekiştirme etkinliği

`core/engine/pekistirme_motoru.dart` — saf Dart, veritabanı ve arayüz bilmez.

| # | Etkinlik | Kod | Cevap tipi |
|---|---|---|---|
| 1 | İngilizce–Türkçe eşleştirme | `E1-EN-TR` | Seçmeli |
| 2 | Türkçe–İngilizce eşleştirme | `E2-TR-EN` | Seçmeli |
| 3 | Boşluk doldurma | `E3-BOSLUK` | Metin |
| 4 | İngilizce → Türkçe çeviri | `E4-CEVIRI-EN-TR` | Metin |
| 5 | Türkçe → İngilizce çeviri | `E5-CEVIRI-TR-EN` | Metin |
| 6 | Doğru kelimeyi seçme | `E6-DOGRU-KELIME` | Seçmeli |
| 7 | Harfleri karışık kelime | `E7-HARF-KARISIK` | Metin |
| 8 | Cümle içinde kullanma | `E8-CUMLE-ICINDE` | Metin |

**Çeldiriciler paketin dışına çıkmaz** — `_celdiriciler()` yalnızca aynı paketten
seçer. Testi var (2E-5b).

Etkinlik sonunda doğru/yanlış sayısı, zorlanılan kelimeler ve tekrar planına
alındıkları bilgisi gösterilir.

### Bulunan ve düzeltilen hata

Boşluk doldurma ilk sürümde kelime sınırı kontrolü yapmıyordu:

```
'read' + 'She reads a book.'  ->  'She ____s a book.'   BOZUK
```

İki katmanlı düzeltme:
1. `_bosluklaDegistir()` artık `\bkelime\b` deseni kullanıyor.
2. Dört örnek cümle yalın biçime çekildi (`read`, `open`, `work`, `speak`).

Doğrulandı: **40 kelimenin tamamı kendi cümlesinde yalın hâlde bulunuyor** ve
hiçbirinde `____x` gibi bozuk çıktı üretilmiyor.

---

## 6. PDF çıktısı

Yalnızca üç sütun. `KelimePdf.satirlariHazirla()` başka alan taşımaz — testi var.

**Gerçek satır içeriği (Paket 1):**

```
Ingilizce   | Okunus        | Turkce
--------------------------------------------
morning     | mor-ning      | sabah
coffee      | ko-fi         | kahve
water       | vo-tir        | su
bread       | bred          | ekmek
book        | buk           | kitap
teacher     | tii-cir       | ogretmen
...
always      | ol-veyz       | her zaman
```

Dosya adı: `english_coach_kelimeler_2026-07-19.pdf`

**Filtre seçenekleri:** tüm kelimeler · seçilen paket · yalnızca tekrar gerekenler.
Filtre `ogrenilenler()` sorgusunda uygulanır, PDF onu olduğu gibi alır.

### Türkçe karakter sınırı — dürüst not

`pdf` paketinin gömülü fontları Türkçe karakterleri taşımaz. `KelimePdf.asciiye()`
güvenli karşılığa çevirir (`ğ→g`, `ş→s`, `ı→i`…). Ekranla PDF'in aynı görünmesi
için kaynak verideki iki okunuş da ASCII'ye çekildi (`ör-li`→`ir-li`,
`vörk`→`virk`).

**Gerçek Türkçe karakter gerekirse bir TTF font paketlenmelidir.** Bu fazda
yapılmadı: font dosyası projeye ~300 KB ekler ve asset yapılandırması gerektirir.

---

## 7. Tekrar sistemi

Aralıklar: **1, 3, 7, 14, 30 gün.**

| Olay | Sonuç |
|---|---|
| "Öğrendim" | tekrar_sayisi=0 → +1 gün |
| Doğru cevap | tekrar_sayisi++ → sonraki aralık |
| **Yanlış cevap** | tekrar_sayisi=**0** → +1 gün, durum=`tekrar_gerekli` |
| 5. doğru ve sonrası | +30 günde sabitlenir, durum=`kalici` |

Yanlış cevaplanan kelime **erken geri gelir** — sayaç sıfırlanır.

---

## 8. Değiştirilen / eklenen dosyalar

| Dosya | Değişiklik |
|---|---|
| `pubspec.yaml` | **`pdf: ^3.11.1`** eklendi |
| `core/db/migrations.dart` | user.db sürüm 2 (2 yeni tablo) |
| `core/model/paket_kelime.dart` | **YENİ** — alan modeli |
| `core/engine/pekistirme_motoru.dart` | **YENİ** — 8 etkinlik üreteci |
| `data/kelime_repo.dart` | **YENİ** — kalıcılık + tekrar planı |
| `modules/kelime/kelime_ornek_veri.dart` | 8 → **40 kelime** (2 paket) |
| `modules/kelime/kelime_ekrani.dart` | 20/20 kapısı, ilerleme, kalıcı kayıt |
| `modules/kelime/pekistirme_ekrani.dart` | **YENİ** |
| `modules/kelime/ogrenilen_kelimeler_ekrani.dart` | **YENİ** |
| `modules/kelime/kelime_pdf.dart` | **YENİ** |
| `app/modul_yonlendirme.dart` | `KelimeEkrani(paketId: 1)` |
| `test/kelime_akademisi_test.dart` | **YENİ** — 18 test |
| `tool/faz2e_dogrulama.py` | **YENİ** |

**Dokunulmayanlar:** Gramer modülü, Hikâye modülü, Tanı Motoru v3, Düşünme
motoru, ana ekran, `core/db/app_database.dart`, mevcut 54 test.

### Mimari ihlali — yakalandı ve düzeltildi

İlk yazımda `core/engine/pekistirme_motoru.dart`, `modules/kelime/`'yi import
ediyordu. **Statik denetleyicim bunu yakaladı** (`core/ katmani modules import
ediyor`). Düzeltme: `PaketKelime` modeli `core/model/`'e taşındı; veri modülde
kaldı. Artık `core/` `modules/`'u bilmiyor.

---

## 9. Eklenen testler — 18 adet

| Sartname maddesi | Test |
|---|---|
| 1. "Öğrendim" kaydedilir | `2E-2` |
| 2. Aynı kelime iki kez kaydedilmez | `2E-3` |
| 3. 19 kelimede pekiştirme açılmaz | `2E-4` |
| 4. 20 kelimede açılır | `2E-4` |
| 5. Etkinlikler yalnız o paketin kelimelerini kullanır | `2E-5`, `2E-5b` |
| 6. Doğru/yanlış cevaplar kaydedilir | `2E-10` grubu |
| 7. Öğrenilen kelimeler listelenir | `2E-6`, `2E-7` grubu |
| 8. PDF yalnızca 3 sütun | `2E-8`, `2E-8b` |
| 9. PDF pakete göre filtrelenir | `2E-9` |
| 10. Mevcut testler geçmeye devam eder | Dokunulmadı |

Testler **bellek içi SQLite** kullanır (`inMemoryDatabasePath`) — gerçek
kullanıcı verisine dokunmaz.

---

## 10. Ölçümler (derleme değil)

```
tool/faz2e_dogrulama.py      ->  20/20 PASS
   40 kelime · 2 paket · kodlar ve yazilislar benzersiz
   bosluk doldurma hicbir kelimede bozulmuyor
   tekrar araliklari 1,3,7,14,30 ve tarih hesabi dogru
   ASCII cevrimi dogru
tool/dart_statik_denetim.py  ->  0 hata, 0 uyari (43 dosya)
```

> Bu araçlar `flutter analyze` yerine geçmez. Özellikle **yeni eklenen `pdf`
> paketinin API kullanımını doğrulayamazlar** — bu fazın en büyük bilinmeyeni budur.

---

## 11. Bilinen eksikler ve riskler

| # | Konu | Not |
|---|---|---|
| R-1 | **`pdf` paketi API uyumu** | Doğrulanamadı. `pw.MultiPage`, `pw.Table`, `pw.TableRow` kararlı API'lerdir ama sürüm çözümlemesi `pub get` çıktısında görülmeli |
| R-2 | PDF'de Türkçe karakter | ASCII'ye çevriliyor; TTF font gerekirse ayrı iş |
| R-3 | Ses düğmeleri bağlı değil | TB-03 bekliyor (Faz 2D'den devam) |
| E-1 | 18 adımlık ders sırası | Faz 2C'den devrediyor |
| E-2 | Kelime verisi hâlâ Dart dosyasında | Faz 4A'da SQLite'a taşınacak |
| E-3 | Paket 3+ yok | 40 kelime = 2 paket |

---

## 12. Çalıştırma

```powershell
cd $env:USERPROFILE\Documents\english_coach
flutter pub get      # pdf paketi cozumlenecek — ciktiyi gonderin
flutter analyze
flutter test
flutter run -d windows
```

### Doğrulama adımları

1. Ana ekran → **Kelime Akademisi**
2. Üstte `0 / 20 ogrenildi`, "Pekiştirmeye Başla" **devre dışı**
3. Birkaç kelimeye "Öğrendim" → sayaç artmalı
4. 19'da düğme hâlâ **kapalı**, 20'de **açılmalı**
5. Uygulamayı kapatıp açın → sayaç korunmalı (SQLite)
6. Pekiştirmeye girin → 8 etkinlik sırayla, her etkinlik sonunda sonuç kartı
7. Sağ üstteki liste simgesi → **Öğrendiğim Kelimeler**: arama, sıralama, paket filtresi
8. PDF simgesi → dosya kaydedilmeli, yol SnackBar'da görünmeli
9. PDF'i açın: **yalnızca üç sütun** olmalı
