# PHASE_2D_PROGRESS.md — Ana Ekran ve Bağımsız Modül İskeletleri

**Tarih:** 2026-07-19

---

## 1. Doğrulama durumu — açık beyan

> **Bu oturumda Flutter kurulu değildir.** `flutter pub get`, `flutter analyze`,
> `flutter test`, `flutter run -d windows` komutlarını **çalıştırmadım** ve
> **hiçbirine PASS yazmıyorum.** Aşağıdakiler beklentidir.

| Komut | Beklenen | Gerçek sonuç |
|---|---|---|
| `flutter pub get` | değişiklik yok (pubspec dokunulmadı) | ⬜ |
| `flutter analyze` | `No issues found!` | ⬜ |
| `flutter test` | 38 mevcut + 16 yeni = **54 test** | ⬜ |
| `flutter run -d windows` | 8 modüllü ana ekran açılır | ⬜ |

### 2C.1 dersinin uygulaması

Faz 2C'de "ayraç taraması temiz" deyip tür hatasını kaçırmıştım. Bu faz için
**`tool/dart_statik_denetim.py`** yazdım; dört denetim yapıyor:

1. **Null / non-nullable koleksiyon uyuşmazlığı** ← 2C hata sınıfı
2. Import hedefinin varlığı
3. **Mimari sınır:** modül → modül importu yasak
4. Ayraç dengesi

**Aracın işe yaradığını kanıtladım:** 2C hatasını geçici bir dosyaya geri koydum,
araç ikisini de yakaladı:

```
[HATA ] lib/hatali.dart:6
   'gorevler' bildirimi Map<String, Object> (nullable DEGIL) ama deger null.
[HATA ] lib/hatali.dart:10
   'etiketler' bildirimi List<String> (nullable DEGIL) ama null eleman var.
```

Gerçek proje üzerinde: **35 dosya, 0 hata, 0 uyarı, 72 import doğrulandı.**

> Bu araç `flutter analyze` yerine geçmez; yalnızca bilinen hata sınıflarını yakalar.

---

## 2. Yeni navigasyon yapısı

```
lib/
├── app/                          ← uygulama kabugu
│   ├── ana_ekran.dart               modul merkezi
│   ├── modul_kimlik.dart            8 modulun VERI tanimi
│   ├── modul_yonlendirme.dart       kod -> ekran eslemesi
│   └── gunluk_oneri.dart            K11 sade surum
├── shared_ui/                    ← ortak bilesenler
│   ├── modul_karti.dart
│   ├── modul_izgarasi.dart
│   ├── bolum_basligi.dart
│   └── gelistirme_notu.dart
├── modules/                      ← HER MODUL KENDI KLASORUNDE
│   ├── gramer/    ders_ekrani.dart · gramer_ekrani.dart
│   ├── kelime/    kelime_ekrani.dart · kelime_ornek_veri.dart
│   ├── hikaye/    hikaye_ekrani.dart · hikaye_ornek_veri.dart
│   ├── konusma/   konusma_ekrani.dart
│   ├── senaryo/   senaryo_ekrani.dart
│   ├── seviye/    seviye_ekrani.dart
│   ├── tekrar/    tekrar_ekrani.dart
│   └── ilerleme/  ilerleme_ekrani.dart
├── core/                         ← DEGISMEDI
└── data/                         ← DEGISMEDI
```

### Bağımsızlık nasıl garanti edildi

Modüller **birbirini import etmez.** Modülleri birlikte tanıyan tek yer
`app/modul_yonlendirme.dart`'tır. Bu, PRODUCT_RULES K3/K7'nin mimari
karşılığıdır: *bir modül diğerini import edemezse, onu kilitleyemez.*

Statik denetleyici bu kuralı **her çalıştırmada** denetler (madde 3).

Ayrıca `ModulKimlik` veri yapısında **`kilit` veya `onKosul` alanı yoktur** —
bir modülü kilitlemek için veri yapısında yer bulunmuyor. Buna ait test var (2D-8).

---

## 3. Değiştirilen / eklenen dosyalar

### Taşınan
| Eski | Yeni | Not |
|---|---|---|
| `lib/features/ders/ders_ekrani.dart` | `lib/modules/gramer/ders_ekrani.dart` | **İçerik değişmedi.** Aynı derinlik → `../../` importları bozulmadı |
| `lib/features/ana_ekran/ana_ekran.dart` | `lib/app/ana_ekran.dart` | **Yeniden yazıldı** (modül merkezi) |

`lib/features/` klasörü kaldırıldı.

### Yeni (16 dosya)
`app/modul_kimlik.dart` · `app/modul_yonlendirme.dart` · `app/gunluk_oneri.dart` ·
`app/ana_ekran.dart` · `shared_ui/` (4 dosya) · `modules/` (10 dosya) ·
`test/ana_ekran_test.dart` · `tool/dart_statik_denetim.py`

### Değişen
| Dosya | Değişiklik |
|---|---|
| `lib/main.dart` | Tek satır: import yolu `app/ana_ekran.dart` |

### Dokunulmayanlar
`core/` tamamı · `data/` tamamı · `ders_ekrani.dart` içeriği · `pubspec.yaml` ·
`migrations.dart` · Tanı Motoru v3 · mevcut 38 test.

**Şema değişmedi. Yeni paket yok. Ağ bağımlılığı yok. Kullanıcı verisi silinmedi.**

---

## 4. Ana ekran

| Bölüm | Durum |
|---|---|
| Kullanıcı selamlaması | ✅ Saate göre |
| Günlük öneri alanı | ✅ K11 sade sürüm, **asla boş dönmez** |
| Bugünkü çalışma özeti | ✅ Tamamlanan görev · gramer ustalığı · önerilen süre |
| Devam et butonu | ✅ İlk öneriye götürür |
| Modül kartları | ✅ 8 kart: ad, açıklama, ilerleme oranı, son içerik, giriş butonu |

**Dayanıklılık:** Veritabanı okunamazsa ana ekran **yine açılır**; ilerlemeler %0
görünür. Bu hem daha sağlam hem de widget testlerini veritabanısız mümkün kılıyor.

---

## 5. Modül iskeletleri

| Modül | Çalışan | Bekleyen |
|---|---|---|
| **Gramer** | Ders listesi, EN-A1-001, ustalık oranı | — (hazır) |
| **Kelime** | 8 kelime kartı (IPA, tür, örnek cümle, eş/zıt anlam), öğrendim/tekrar et, tekrar listesi | SQLite kalıcılık, SRS, telaffuz sesi |
| **Hikâyeler** | 4 paragraflık hikâye, TR çeviri aç/kapat, **hedef kelime vurgusu**, 3 anlama sorusu | Hikâye havuzu, seslendirme |
| **Konuşma** | Cümle akışı, öz-değerlendirme (3 kademe), ilerleme | Model sesi, kayıt (cihaz ses altyapısı) |
| **Senaryolar** | 5 senaryo listesi | Diyalog akışı |
| **Seviye Tespit** | Tanıtım, A1–C2 açıklaması, süre, **örnek sonuç**, "A1'den başla" | Uyarlanabilir sınav |
| **Akıllı Tekrar** | Tanıtım, örnek tekrar planı | SRS motoru |
| **İlerleme** | Yedi becerinin listesi ve ölçüm durumu | Olay akışından skorlar |

### Ses düğmeleri hakkında dürüst not

Telaffuz ve dinleme düğmeleri **var ama bağlı değil.** Basıldığında sahte bir
"yakında" göstermiyor; açık bir mesaj veriyor:

> *"Ses altyapisi henuz baglanmadi. Cihaz TTS dogrulamasi (TB-03) tamamlaninca
> bu dugme calisacak."*

Gerekçe: TB-03 (cihaz TTS doğrulaması) hiç yürütülmedi ve doğrulanmamış bir
paketi eklemek derlemeyi riske atardı. Sahte ses vermek yerine durumu söylüyoruz.

---

## 6. Eklenen testler — 16 adet

| İstenen | Test |
|---|---|
| 1. Ana ekranda 8 modülün tamamı görünür | `2D-1` (4 test: sayı, kodlar, ızgara, gizlenmiyor) |
| 2. Gramer kartı EN-A1-001'e gider | `2D-2` (3 test: seçim, yönlendirme, bilinmeyen kod) |
| 3. Kelime Akademisi açılır | `2D-3` |
| 4. Hikâyeler açılır | `2D-4` |
| 5. Hazır olmayan modüller hata üretmez | `2D-5` (5 test, her iskelet modül) |
| 6. Geri navigasyonu çalışır | `2D-6` |
| — | `2D-7` günlük öneri (3 test) · `2D-8` kilit alanı yok |

**Testler veritabanı gerektirmez** — sunum widget'ları saf veriyle çalışır.
Mevcut 38 test dokunulmadı.

---

## 7. Bilinen eksikler

| # | Eksik | Neden |
|---|---|---|
| E-1 | 18 adımlık ders sırası hâlâ uygulanmadı | Faz 2C'den devrediyor |
| E-2 | Ses düğmeleri bağlı değil | TB-03 yürütülmedi |
| E-3 | Kelime/hikâye verisi SQLite'da değil, Dart dosyasında | "Tam sistem yazılmayacak" kısıtı; şema değişmesin diye |
| E-4 | Yalnızca gramer modülünün ilerlemesi gerçek; diğerleri %0 | Olay akışı (Faz 3A) yok |
| E-5 | `ProgressEngine` / `RecommendationEngine` yok | Faz 3A |

---

## 8. Çalıştırma

```powershell
cd $env:USERPROFILE\Documents\english_coach
flutter pub get
flutter analyze          # beklenen: No issues found!
flutter test             # beklenen: 54 test
flutter run -d windows
```

### Doğrulanacak

1. Uygulama açılınca **tek ders değil, 8 modül kartı** görünmeli
2. Üstte selamlama + günlük öneri + özet
3. **Kelime Akademisi** kartına bas → 8 kelime kartı, eş/zıt anlam, öğrendim düğmesi
4. **Hikâyeler** kartına bas → hikâye, "Türkçe çeviri" anahtarı, vurgulu kelimeler, 3 soru
5. **Gramer** kartına bas → EN-A1-001 listede, derse gir → ders akışı eskisi gibi
6. Her modülden geri dönüş çalışmalı
7. Hiçbir modül "kilitli" veya "önce şunu bitir" demiyor olmalı

Ek olarak isterseniz `python tool/dart_statik_denetim.py` çalıştırıp
statik denetimi kendiniz de görebilirsiniz.
