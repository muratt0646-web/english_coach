# PHASE_2C1_PROGRESS.md — Derleme ve Test Düzeltmesi

**Tarih:** 2026-07-19
**Tip:** Hata düzeltme (yeni özellik yok)

---

## 1. Doğrulama durumu — açık beyan

> **Bu oturumda Flutter kurulu değildir ve SDK kaynağına erişim kapalıdır.**
> `flutter pub get`, `flutter analyze`, `flutter test` komutlarını **çalıştırmadım.**
> **Hiçbirine PASS yazmıyorum.** Aşağıdaki beklentiler, kök neden analizine
> dayanan tahminlerdir; doğrulama sizin çalıştırmanızla olur.

| Komut | Beklenen | Gerçek sonuç |
|---|---|---|
| `flutter pub get` | değişiklik yok | ⬜ |
| `flutter analyze` | `No issues found!` | ⬜ |
| `flutter test` | `All tests passed!` (38 test) | ⬜ |

---

## 2. Değiştirilen dosyalar

| # | Dosya | Değişiklik |
|---|---|---|
| 1 | `lib/core/content/ders_en_a1_001.dart` | `Map<String, Object>` → `Map<String, Object?>` · kabul kayıtları birleştirildi |
| 2 | `lib/core/engine/tani_motoru.dart` | Notlu eşleşme tercihi |
| 3 | `lib/core/db/seed_content.dart` | Lint · `icerikSurumu` sabiti |
| 4 | `lib/core/db/migrations.dart` | `icerikSifirla()` eklendi |
| 5 | `lib/core/db/app_database.dart` | Sürüm tabanlı güvenli yeniden seed |
| 6 | `lib/features/ders/ders_ekrani.dart` | 2 lint (`prefer_const_constructors`) |
| 7 | `test/tani_motoru_test.dart` | Kabul kümesi içerikle hizalandı · 2C-11 güçlendirildi |
| 8 | `test/dusunme_motoru_test.dart` | 1 lint |
| 9 | `tool/tani_motoru_v3_dogrulama.py` | Aynı düzeltme portlandı |
| 10 | `tool/icerik_dogrulama.py` | Yeni tür bildirimine uyarlandı |

---

## 3. Hata 1 — `The element type 'Null' can't be assigned to the map value type 'Object'`

### Kök neden

```dart
static const List<Map<String, Object>> gorevler = [   // <- Object (nullable DEGIL)
  ...
  'ipucu': null,                                       // <- 14 yerde
```

`Object` nullable değildir; `null` atanamaz. 14 görevde `ipucu` alanı boş bırakılmıştı.

### Bu hata neden şimdi ortaya çıktı

Bu dosya **Faz 2A'da** eklendi ve hata o günden beri gizliydi. Sizin başarılı doğrulamanız **Faz 1B-1** paketine aitti; o pakette `ders_en_a1_001.dart` **yoktu**. Faz 2C, bu dosyayı içeren ilk gerçekten derlenen paket oldu.

Bu benim hatam: Faz 2A ve 2B'yi "derlenmemiş taban" varsayımıyla teslim ettim ve ayraç/import taramasıyla yetindim. Ayraç taraması **tür hatalarını yakalamaz.**

### Nasıl düzeltildi

```dart
static const List<Map<String, Object?>> gorevler = [
```

**Zorla cast, `dynamic` veya `null as Object` kullanılmadı.** Alan gerçekten isteğe bağlı olduğu için tür nullable yapıldı. Belge yorumu da eklendi:

> *Değer türü `Object?` çünkü `ipucu` ve `kabul_not` **isteğe bağlı** alanlardır ve null olabilirler. Zorunlu alanlar (kod, adim, tip, govde, zorluk, kabul) hiçbir zaman null değildir.*

### Veri zinciri tutarlılığı

| Katman | Durum |
|---|---|
| `ders_en_a1_001.dart` | `Map<String, Object?>` ✅ |
| `seed_content.dart` | `g['ipucu'] as String?` — zaten nullable cast ✅ |
| `txn.insert(...)` | sqflite `Map<String, Object?>` bekler ✅ |
| SQLite `gorev.ipucu` | `TEXT` (NOT NULL değil) ✅ |
| `icerik_repo` | `g['ipucu'] as String?` ✅ |
| `Gorev.ipucu` | `final String? ipucu` ✅ |
| Ekran | `if (g.ipucu != null)` ✅ |

Diğer içerik yapıları (`adimlar`, `kelimeler`, `bloklar`, `dusunme_en_a1_001.dart`) null içermiyor; `List<List<String>>` olarak kaldı.

---

## 4. Hata 2 — 2C-11: `not_tr` kayboluyor

### `not_tr` tam olarak nerede kayboldu

Zincirin **hiçbir yerinde** kaybolmadı. Sorun tanı motorunun **eşleşme döngüsündeydi.**

`Normalizer.normalize()` noktalama işaretlerini siler:

```
normalize('Every morning, I drink coffee.') = 'every morning i drink coffee'
normalize('Every morning I drink coffee.')  = 'every morning i drink coffee'
                                              ^^^ AYNI
```

Kabul kümesinde **iki ayrı kayıt** vardı:

| sıra | cevap | not |
|---|---|---|
| 1 | `Every morning I drink coffee.` | **null** |
| 3 | `Every morning, I drink coffee.` | `'Virgul kullanimi da dogrudur.'` |

Döngü **ilk eşleşeni** döndürüyordu → sıra 1 → `not = null`.

Yani not veritabanına yazılmıştı, repository okumuştu, modele girmişti; **motor yanlış kaydı seçiyordu.**

### İki katmanlı düzeltme

**(a) Motor — notlu eşleşme tercih edilir**

```dart
// Normalizer noktalama/buyuk harf farkini sildigi icin BIRDEN COK kabul
// kaydi ayni normalize bicime dusebilir. Bu durumda NOTU OLAN kayit
// tercih edilir; aksi halde nota bagli geri bildirim kaybolur.
KabulCevabi? eslesen;
for (final k in kabuller) {
  ...
  if (eslesen == null) {
    eslesen = k;
  } else if (eslesen.not == null && k.not != null) {
    eslesen = k;   // notu olan kazanir
  }
}
```

**(b) İçerik — mükerrer kayıt birleştirildi**

Normalizasyon sonrası aynı olan iki kayıt tek kayda indirildi ve not ona bağlandı:

```dart
'kabul': [
  'I drink coffee every morning.',       // ana
  'Every morning I drink coffee.',       // alternatif + not
  'I drink coffee in the morning.',      // alternatif + not
  'I drink coffee every day.',           // anlam farkli
  'I drink tea every morning.',          // anlam farkli
],
'kabul_tip': [1, 0, 0, -1, -1],
```

**(c) Test — güçlendirildi, gevşetilmedi**

Test silinmedi, beklenti null'a açılmadı. Aksine **iki yazımı birden** sınıyor:

```dart
for (final yazim in const [
  'Every morning, I drink coffee.',
  'Every morning I drink coffee.',
]) {
  expect(s.not, isNotNull, reason: 'not_tr kaybolmamali: $yazim');
  expect(s.not, contains('Virgul'), reason: yazim);
}
```

Not metni `'Zaman ifadesi basa da alinabilir; virgul kullanimi da dogrudur.'` — `contains('Virgul')` beklentisi karşılanıyor.

---

## 5. Hata 3 — Dört lint

| Dosya:satır | Lint | Düzeltme |
|---|---|---|
| `seed_content.dart:46` | `unnecessary_brace_in_string_interps` | `'${konuKod}-...'` → `'$konuKod-...'` |
| `ders_ekrani.dart:565` | `prefer_const_constructors` | `Text(...)` → `const Text(...)`, iç `const TextStyle` sadeleşti |
| `ders_ekrani.dart:594` | `prefer_const_constructors` | `Chip(...)` → `const Chip(...)` |
| `dusunme_motoru_test.dart:47` | `prefer_const_constructors` | `DusunmeOrnegi(...)` → `const DusunmeOrnegi(...)` |

---

## 6. content.db sürümleme (§3)

### Sorun

`content.db` yalnızca **dosya yokken** dolduruluyordu. İçerik güncellenince eski kayıtlar kalıyordu. Bu riski Faz 1B-1'den beri R-1 olarak işaretlemiştim ama çözmemiştim.

### Çözüm — sürüm karşılaştırması

```dart
static const icerikSurumu = '0.3.0';   // seed_content.dart

// app_database.dart, acilista:
final mevcutSurum = await _icerikSurumu(contentDb);
if (mevcutSurum != SeedContent.icerikSurumu) {
  await Migrations.icerikSifirla(contentDb);   // YALNIZCA content.db
  await Migrations.uygulaContent(contentDb);
  await Migrations.uygulaContentV2(contentDb);
  await SeedContent.doldur(contentDb);
}
```

**`user.db`'ye ASLA dokunulmaz.** `icerikSifirla()` yalnızca içerik tablolarını düşürür; kullanıcı ilerlemesi ayrı dosyadadır ve kod tabanlı bağlama sayesinde korunur (SP-07'de kanıtlanmıştı).

**Büyük şema göçü yapılmadı** — v3'e geçilmedi.

**Yan fayda:** Artık `content.db`'yi elle silmenize gerek yok. İçerik sürümü değiştiğinde otomatik yenilenir.

---

## 7. Geriye dönük uyumluluk

| Kural | Durum |
|---|---|
| Eski `degerlendir()` imzası | ✅ Korundu, testi var |
| 14 düşünme motoru testi | ✅ Yalnızca 1 lint düzeltmesi; mantık değişmedi |
| Tanı Motoru v3 kategorileri | ✅ Dokuzu da duruyor |
| day / morning düzeltmesi | ✅ Geri alınmadı, testi var (2C-3) |
| Navigation | ✅ Dokunulmadı |
| SQLite şeması | ✅ Tablo/sütun **değişmedi** (yalnızca DROP+yeniden seed yolu eklendi) |
| Yeni özellik | ✅ Eklenmedi |
| SVO ders içeriği | ✅ Genişletilmedi |

---

## 8. Ölçümler (derleme değil)

```
tool/tani_motoru_v3_dogrulama.py  ->  16/16 PASS
   2C-11 ozel dogrulama: not_tr HER IKI yazimda korunuyor
tool/icerik_dogrulama.py          ->  24/24 PASS
tool/dusunme_motoru_dogrulama.py  ->  25/25 PASS
Ayrac/import taramasi             ->  8 dosya temiz
```

> ⚠️ Bu taramalar **tür hatalarını yakalamaz** — Hata 1'in üç faz boyunca gizli kalmasının sebebi budur. Tek gerçek doğrulama `flutter analyze`'dır.

---

## 9. Çalıştırılacak komutlar

```powershell
cd $env:USERPROFILE\Documents\english_coach

flutter pub get
flutter analyze     # beklenen: No issues found!
flutter test        # beklenen: All tests passed!  (38 test)
flutter run -d windows
```

**`content.db`'yi silmenize gerek yok** — sürüm `0.3.0`'a çıktığı için otomatik yenilenecek.

### Doğrulanacak davranışlar

| Görev CT-02'de yazın | Beklenen |
|---|---|
| `Every morning, I drink coffee.` | ✅ Doğru + not: *"Zaman ifadesi basa da alinabilir; virgul kullanimi da dogrudur."* |
| `Every day I drink coffee` | `KESIN_TANI` · `KELIME_SECIMI / ANLAM_FARKI` · Beklenen ifade: `every morning` |
| `I drink coffee every day.` | `ANLAM_FARKI` (yazarın işaretlediği) |
| `hello world` | `TANI_KONULAMADI`, açıklama yok |

---

## 10. Bilinen eksikler (değişmedi)

| # | Eksik |
|---|---|
| E-1 | 18 adımlık ders sırası uygulanmadı (Faz 2C'de yasaklıydı) |
| E-2 | Tipli kabul kaydı yalnızca CT-02'de; diğer 29 görev tek tip |
| E-5 | `ProgressEngine` yok; ustalık hâlâ ders modülüne gömülü |

### Bu düzeltmeden çıkan ders

Üç faz boyunca "ayraç ve import taraması temiz" diyerek tür güvenliğini doğrulanmış saydım. **Bu tarama tür hatası yakalamaz.** Flutter'ı çalıştıramadığım sürece, ürettiğim Dart kodunun derlendiğini **iddia edemem** — yalnızca mantığını Python portuyla doğrulayabilirim. Bundan sonra bu ayrımı her raporda açık tutacağım.
