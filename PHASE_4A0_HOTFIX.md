# FAZ 4A.0 HOTFIX — Gerçek Derleme Hatalarının Giderilmesi

**Tarih:** 2026-07-20
**Kaynak:** Sizin Windows makinenizdeki gerçek `flutter analyze / test / run` çıktısı

---

## 1. Doğrulama beyanı

> Bu oturumda Flutter **yok**. Komutları **çalıştırmadım**, **PASS yazmıyorum.**
> Aşağıdaki düzeltmeler sizin gönderdiğiniz **gerçek hata çıktısına** dayanıyor.

---

## 2. Kök neden — en büyüğü bende

`flutter analyze` **11 sorun** buldu: 6 error, 5 info. Ayrıca 7 test başarısız.

### Hataların kaynağı: sessiz başarısız olan bir metin değiştirme

Faz 2F'de `ders_ekrani.dart`'a şu importu eklemeye çalışmıştım:

```python
s = s.replace("import '../../shared_ui/bolum_basligi.dart';",
              "import '../../shared_ui/akis_kontrolcusu.dart';\n" + ...)
```

**O satır bu dosyada yoktu.** `replace()` hiçbir şey bulamadı, sessizce geçti ve
ben `assert` koymamıştım. Kod `AkisKontrolcusu` ve `CevapAlani` kullanmaya
başladı ama importu hiç eklenmedi.

**Bu tek hata 8 derleme hatası ve 2 test dosyasının yüklenememesine yol açtı.**

Bu turdaki tüm düzenlemelerde `assert` kullandım.

---

## 3. Giderilen sorunlar

| # | Tip | Konum | Kök neden | Düzeltme |
|---|---|---|---|---|
| 1 | **error ×6** | `ders_ekrani.dart:22,23,312,775` | `akis_kontrolcusu.dart` importu eksik | Import eklendi (assert ile doğrulandı) |
| 2 | **error** | `test/hikaye_test.dart:153` | Hotfix'te `repo.ilerleme` → `ilerlemeGetir` yaptım ama değişken adı `yeni` olan çağrıyı kaçırdım | `yeni.ilerlemeGetir(...)` |
| 3 | info | `ders_ekrani.dart:315` | `tani == null ? null : tani.dogru` | `tani?.dogru` |
| 4 | info | `hikaye_okuma_ekrani.dart:199` | `Navigator.of(ctx)` async boşluktan sonra; `mounted` State'e ait, `ctx`'e değil | `ctx.mounted` kontrolü + sıra değişikliği |
| 5 | info | `hikaye_okuma_ekrani.dart:587` | `BolumBasligi(...)` const olabilir | `const` eklendi |
| 6 | info | `kelime_pdf.dart:102` | `pw.TextStyle(...)` const olabilir | `const` eklendi |
| 7 | **7 test** | `sablon_ders_test.dart` — `find.text('Basla')` 0 sonuç | `initState` içinde `setState` çağırdım; Flutter bunu işlemez, ekran sonsuza kadar yükleme durumunda kaldı | `initState`'te alan **doğrudan** atanıyor, `setState` yok |

### 7 numara ayrı açıklanmalı

Bir önceki turda ilerleme kaydı eklerken şunu yazmıştım:

```dart
void initState() {
  super.initState();
  _ilerlemeYukle();          // async; ilk satirda throw ediyor
}
// catch icinde: setState(() => _yukleniyor = false);
```

Widget testinde veritabanı yok → `AppDatabase.instance.db` fırlatıyor →
`catch` → `setState`. Ama **`initState` sırasında `setState` çağrılamaz**;
Flutter onu yok sayar. Ekran `_yukleniyor = true` ile kilitlendi ve
"Basla" düğmesi hiç çizilmedi.

Düzeltme: `initState` içinde alan doğrudan atanıyor (build henüz olmadığı için
`setState` gereksiz):

```dart
try {
  _ilerleme = DersIlerlemeRepo(AppDatabase.instance.db);
} catch (_) {
  _ilerleme = null;
  _yukleniyor = false;   // setState YOK
  return;
}
_ilerlemeYukle();
```

---

## 4. Denetleyiciye 9. kontrol

Sekiz derleme hatasının hiçbirini mevcut sekiz kontrol yakalamadı. Aradaki
boşluk açıktı: araç **"import edilen dosya var mı"** diye bakıyordu ama
**"kullanılan sembol import edilmiş mi"** diye bakmıyordu.

`tool/dart_statik_denetim.py` → **9. kontrol** eklendi.

### Kanıt

Düzelttiğim importu geçici kopyadan çıkardım:

```
[HATA ] lib/modules/gramer/ders_ekrani.dart:22
   'AkisKontrolcusu' kullaniliyor ama IMPORT EDILMEMIS.
   Tanim: lib/shared_ui/akis_kontrolcusu.dart
[HATA ] lib/modules/gramer/ders_ekrani.dart:312
   'CevapAlani' kullaniliyor ama IMPORT EDILMEMIS.
```

İkisini de yakalıyor. Gerçek proje: **62 Dart dosyası, 9 kontrol, 0 hata.**

Ayrıca aynı hata sınıfını **tüm projede** taradım — başka eksik import yok.
(İlk taramam 30 yanlış alarm verdi çünkü yorumları temizlemiyordu;
`Kelime Akademisi` gibi yorum metinlerini sembol sanıyordu. Entegre kontrol
yorumları temizlediği için doğru sonucu veriyor.)

---

## 5. Değişen dosyalar — 6 adet

| Dosya | Değişiklik |
|---|---|
| `lib/modules/gramer/ders_ekrani.dart` | **Eksik import** + null-aware operatör |
| `lib/modules/gramer/sablon_ders_ekrani.dart` | `initState` düzeltmesi |
| `lib/modules/hikaye/hikaye_okuma_ekrani.dart` | `ctx.mounted` + const |
| `lib/modules/kelime/kelime_pdf.dart` | const |
| `test/hikaye_test.dart` | `ilerlemeGetir` |
| `tool/dart_statik_denetim.py` | 9. kontrol |

Yeni özellik yok. Şema değişmedi. `pubspec.yaml` değişmedi.

---

## 6. Beklenen sonuç

| Komut | Beklenen | Gerçek |
|---|---|---|
| `flutter analyze` | `No issues found!` | ⬜ |
| `flutter test` | Tüm testler PASS | ⬜ |
| `flutter run -d windows` | Uygulama açılır | ⬜ |

`flutter pub get` çıktısındaki *"12 packages have newer versions"* satırları
**hata değil** — bağımlılık kısıtları nedeniyle yükseltilemeyen paketler.
`pdf` ve `sqflite` sürümleri kasıtlı olarak sabit; dokunmadım.

---

## 7. Çalıştırma

```powershell
cd C:\english_coach
flutter clean
flutter pub get
flutter analyze
flutter test
flutter run -d windows
```

Hâlâ hata çıkarsa **tam çıktıyı** gönderin. Bu turda düzeltilen yedi sorunun
dışında yeni bir şey çıkarsa, onun da kök nedenini bulup denetleyiciye
kontrolünü eklerim.
