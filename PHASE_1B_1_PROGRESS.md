# PHASE_1B_1_PROGRESS.md

**Tarih:** 2026-07-19
**Durum:** 🟡 **KOD YAZILDI — DERLENMEDİ, ÇALIŞTIRILMADI**
**Faz 1B-1 sonucu:** **PASS DEĞİL.** Çıkış şartlarının hiçbiri gerçek çalıştırmayla doğrulanmadı.

---

## 1. Ortam durumu

`flutter doctor -v` bu oturumda **çalıştırılamadı.**

```
Bu oturumun ortami : Linux x86_64 konteyner
flutter / dart     : KURULU DEGIL
Flutter SDK kaynagi: storage.googleapis.com -> HTTP 403 (ag politikasi)
Hedef platform     : Windows -> BU OTURUMDAN ERISILEMEZ
```

**Sonuç:** Derleme ve çalıştırma sizin Windows makinenizde yapılmalıdır. Ben kodu yazdım; doğrulamayı siz yapacaksınız.

---

## 2. Üretilen kod

```
english_coach/
├── pubspec.yaml
├── analysis_options.yaml
├── lib/
│   ├── main.dart                          uygulama girisi, DB acilisi
│   ├── core/
│   │   ├── db/
│   │   │   ├── app_database.dart          iki dosya + ATTACH + WAL
│   │   │   ├── migrations.dart            sema gocu (surum 1)
│   │   │   └── seed_content.dart          ornek icerik
│   │   ├── engine/
│   │   │   ├── normalizer.dart            cevap normalizasyonu
│   │   │   └── tani_motoru.dart           UC DURUMLU tani kaskadi
│   │   └── model/models.dart
│   ├── data/
│   │   ├── icerik_repo.dart               content.db okumalari
│   │   └── ilerleme_repo.dart             user.db yazmalari
│   └── features/
│       ├── ana_ekran/ana_ekran.dart       baslik + ilerleme + "Derse Basla"
│       └── ders/ders_ekrani.dart          sunum + gorev akisi
├── test/tani_motoru_test.dart             18 Dart birim testi
└── tool/
    ├── tani_motoru_dogrulama.py           algoritma dogrulamasi
    └── sema_dogrulama.py                  SQL dogrulamasi
```

Toplam **1.753 satır Dart**.

**Kullanılmayan soyutlama yok:** yalnızca fiilen kullanılan sınıflar var. `LlmPort` / `AsrPort` **tanımlanmadı** (D-2).

### Kapsam eşlemesi

| # | İstenen | Kod karşılığı |
|---|---|---|
| 3 | Flutter projesi | `pubspec.yaml`, `lib/` |
| 5 | Clean arch + feature-first | `core/` (saf mantık) · `data/` · `features/` |
| 6 | Yerel SQLite | `app_database.dart` — `sqflite_common_ffi` |
| 7 | Migration | `migrations.dart` — `sema_gocu` tablosu, tek işlem |
| 8 | 1 konu / 1 ders / 3 alıştırma / 10 kelime | `seed_content.dart` |
| 9 | Ana ekran | `ana_ekran.dart` |
| 10 | Ders ekranı | `ders_ekrani.dart` |
| 11 | Çoklu kabul cevabı | `gorev_kabul` (3 cevap) + `TaniMotoru.degerlendir()` |
| 12 | Üç durumlu tanı | `TaniGuveni.kesin/olasi/yok` |
| 13 | SQLite'a kayıt | `ilerleme_repo.dart` — her sonuç anında yazılır |
| 15 | Ağ/bulut/hesap yok | Hiçbir ağ bağımlılığı eklenmedi |

---

## 3. Ön doğrulama (derleme değil)

Dart'ı derleyemediğim için **algoritmayı ve SQL'i ayrı ayrı doğruladım.**

### 3.1 Tanı motoru algoritması — `tool/tani_motoru_dogrulama.py`

Dart mantığının birebir Python portu, aynı test vakalarıyla.

```
ALGORITMA TESTI: 15/15 PASS
  Kanonik cevap / 2. kabul / 3. kabul            -> DOGRU
  Normalizasyon (kucuk harf, fazla bosluk)       -> DOGRU
  WO-01 SOV / BE-01 / SU-01 / AGR-01 / ART-01    -> KESIN_TANI
  LEX-01 tek kelime / WO-02 oge sirasi           -> OLASI_TANI
  Alakasiz cevap / bos cevap / iki hata birden   -> TANI_KONULAMADI
```

En önemli vaka: **"He teacher." → `He is a teacher.`** İki hata aynı anda (be eksik + artikel eksik). Motor tek bir nedene karar veremediği için `TANI_KONULAMADI` dönüyor ve **açıklama uydurmuyor.** D-4'ün amacı tam olarak budur.

### 3.2 SQL şeması ve sorgular — `tool/sema_dogrulama.py`

```
SEMA + SORGU DOGRULAMASI: 22 PASS, 0 FAIL
  content.db + user.db semalari olusturuluyor
  ATTACH ile birlesik sorgu calisiyor
  gorev_kabul 3 kabul cevabini donuyor
  1 yanlis + 3 dogru senaryosu: ustalik 0 -> 0.67 -> 1.0
  uretim_kaniti_var_mi G-CT dogru cevaplaninca 1 oluyor
  D-5: dinleme_durumu 'olculmedi' olarak DEGISMEDEN kaliyor
  hata_kaydi tani_guveni='KESIN' ile yaziliyor
  Kapat/ac sonrasi 4 kayit ve ustalik korunuyor
```

> ⚠️ **Bu iki doğrulama, Dart kodunun derlendiği anlamına gelmez.** Algoritma mantığının ve SQL sözdiziminin doğru olduğunu gösterir; Dart tip hataları, eksik import, paket sürüm çakışması veya Flutter widget hataları bu testlerle yakalanmaz.

---

## 4. Faz 1B-1 çıkış şartları

| # | Şart | Durum |
|---|---|---|
| 1 | Windows uygulaması başarıyla açılıyor | ⬜ **DOĞRULANMADI** |
| 2 | Örnek ders veritabanından okunuyor | ⬜ **DOĞRULANMADI** |
| 3 | Üç örnek görev tamamlanabiliyor | ⬜ **DOĞRULANMADI** |
| 4 | Birden fazla kabul cevabı çalışıyor | ⬜ **DOĞRULANMADI** (algoritma 15/15 geçti, uygulamada değil) |
| 5 | Hata tanısı güven düzeyine göre doğru durum üretiyor | ⬜ **DOĞRULANMADI** (algoritma geçti) |
| 6 | İlerleme SQLite'a yazılıyor | ⬜ **DOĞRULANMADI** (SQL 22/22 geçti) |
| 7 | Yeniden açıldığında ilerleme korunuyor | ⬜ **DOĞRULANMADI** |
| 8 | İnternet olmadan aynı işlevler çalışıyor | ⬜ **DOĞRULANMADI** |

**8/8 doğrulanmamış → Faz 1B-1 PASS ile kapatılamaz.**

---

## 5. Android durumu

**Android hedefinde hiçbir test yapılmamıştır ve hiçbir şeye PASS yazılmamıştır.**

Kablo yokluğu nedeniyle ertelenmiştir. `sqflite_common_ffi` masaüstü sürücüsüdür; Android'de `sqflite` kullanılması gerekecek ve `app_database.dart` içindeki sürücü seçimi platforma göre dallanacaktır. **Bu değişiklik henüz yapılmadı** — Android hedefi açıldığında ele alınacaktır.

---

## 6. Bilinen belirsizlikler

| # | Belirsizlik | Nasıl çözülür |
|---|---|---|
| B-1 | Paket sürümleri (`^2.3.3` vb.) çözümlenmemiş; çakışma çıkabilir | `flutter pub get` çıktısı |
| B-2 | `sqflite_common_ffi` + `sqlite3_flutter_libs` birlikte Windows'ta DLL sağlıyor mu | `flutter run -d windows` |
| B-3 | `ATTACH DATABASE ? AS icerik` parametreli çağrısı sqflite'ta destekleniyor mu | Çalıştırma |
| B-4 | `Colors.green.withValues(alpha:)` Flutter sürümünüzde var mı (yeni API) | `flutter analyze` — yoksa `.withOpacity()` |
| B-5 | Dart 3 `switch` ifadesi ve record `(renk, etiket)` sözdizimi SDK ≥3.3 ister | `flutter --version` |

**B-4 ve B-5, `flutter analyze` çıktısında hemen görünecektir.**
