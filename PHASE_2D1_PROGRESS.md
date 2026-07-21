# PHASE_2D1_PROGRESS.md — Analyze Uyarılarının Giderilmesi

**Tarih:** 2026-07-19
**Tip:** Düzeltme (yeni özellik yok)

---

## 1. Doğrulama beyanı

> Bu oturumda Flutter yok. `flutter analyze` / `flutter test` **çalıştırmadım**,
> **PASS yazmıyorum.** Beklenen: `No issues found!` ve 54 test.

---

## 2. Beş uyarı ve düzeltmeleri

| # | Uyarı | Dosya:satır | Düzeltme |
|---|---|---|---|
| 1 | `unused_import` | `app/ana_ekran.dart:3` | `app_database.dart` importu kaldırıldı — ana ekranı yeniden yazarken `AppDatabase` kullanımı kalkmıştı, import unutulmuştu |
| 2 | `prefer_const_declarations` | `hikaye_ekrani.dart:33` | `final Hikaye h` → `const Hikaye h` |
| 3 | `deprecated_member_use` (`groupValue`) | `hikaye_ekrani.dart:176` | `RadioListTile` kaldırıldı — bkz. §3 |
| 4 | `deprecated_member_use` (`onChanged`) | `hikaye_ekrani.dart:178` | Aynı |
| 5 | `prefer_const_declarations` | `kelime_ekrani.dart:44` | `final List<OrnekKelime>` → `const` |

---

## 3. RadioListTile kararı — neden `RadioGroup` kullanmadım

Flutter'ın önerisi: *"Use a RadioGroup ancestor to manage group value instead."*

`RadioGroup<int>(groupValue: ..., onChanged: ..., child: ...)` yazabilirdim.
**Ama bu API'nin tam imzasını doğrulayamıyorum** — Flutter kurulu değil, belgelere
erişimim yok. Yanlış yazarsam sonuç bir lint *info*'su değil, **derleme hatası** olur.

Bunun yerine `shared_ui/secenek_satiri.dart` yazdım: yalnızca yıllardır kararlı
olan ilkellerden (`InkWell`, `Icon`, `Text`) oluşuyor. Sürüm bağımlılığı yok,
kullanımdan kaldırılmış üye yok, aynı kullanıcı deneyimi.

**Takas:** Flutter'ın kendi widget'ı yerine kendi widget'ımı kullanıyorum. Karşılığında
derleme riski sıfır. `RadioGroup` API'sini doğrulayabildiğinizde geri dönülebilir —
`SecenekSatiri` tek dosya, 50 satır.

Test de güncellendi: `find.byType(RadioListTile<int>)` → `find.byType(SecenekSatiri)`.

---

## 4. Denetleyiciye eklenen iki kontrol

Faz 2C.1'de tür hatalarını kaçırdığım için `dart_statik_denetim.py` yazmıştım.
Faz 2D'de **bu iki uyarıyı da kaçırdı.** Araca iki kontrol daha eklendi:

| # | Kontrol |
|---|---|
| 5 | Kullanılmayan import |
| 6 | `final` → `const` önerisi |

### Aracın kendisinde bulunan hata

İlk denemede **kullanılmayan import kontrolü çalışmadı.** Sebep: hedef dosyadaki
üst düzey adları toplarken **sınıf içi metotları da** üst düzey sanıyordu.
`AppDatabase.ac()` metodunun adı `ac`, ana ekrandaki `ModulYonlendirme.ac(...)`
çağrısıyla eşleşiyor ve import "kullanılıyor" görünüyordu.

Düzeltme: yalnızca **sütun 0'daki** bildirimler toplanıyor; girintili satırlar
sınıf üyesidir ve import edilebilir ad değildir.

### Kanıt

Düzeltilen iki hatayı geçici bir kopyaya geri koydum:

```
[HATA ] lib/app/ana_ekran.dart:3
   Kullanilmayan import: ../core/db/app_database.dart
   (sundan hicbiri kullanilmiyor: ['AppDatabase'])
[UYARI] lib/modules/kelime/kelime_ekrani.dart:44
   'final' yerine 'const' kullanilabilir: KelimeOrnekVeri.gununKelimeleri
   bir static const.
```

İkisi de yakalanıyor. Gerçek proje: **36 dosya, 0 hata, 0 uyarı, 85 import.**

> Araç hâlâ `flutter analyze` yerine geçmez. `deprecated_member_use` gibi
> Flutter sürümüne bağlı uyarıları **yakalayamaz** — bunun için gerçek analyze şart.

---

## 5. Değiştirilen dosyalar

| Dosya | Değişiklik |
|---|---|
| `lib/app/ana_ekran.dart` | Kullanılmayan import kaldırıldı |
| `lib/modules/hikaye/hikaye_ekrani.dart` | `const` bildirimi · `RadioListTile` → `SecenekSatiri` |
| `lib/modules/kelime/kelime_ekrani.dart` | `const` bildirimi |
| `lib/shared_ui/secenek_satiri.dart` | **YENİ** (50 satır) |
| `test/ana_ekran_test.dart` | Finder güncellendi |
| `tool/dart_statik_denetim.py` | 2 yeni kontrol + kendi hatasının düzeltilmesi |

**Dokunulmayanlar:** `core/`, `data/`, `ders_ekrani.dart`, Tanı Motoru v3,
`pubspec.yaml`, şema, mevcut 38 test.

---

## 6. Çalıştırma

```powershell
flutter pub get
flutter analyze     # beklenen: No issues found!
flutter test        # beklenen: 54 test
flutter run -d windows
```

Hikâye ekranındaki anlama sorularının hâlâ seçilebildiğini ve seçilen şıkkın
işaretlendiğini doğrulayın — widget değişti, davranış aynı kalmalı.
