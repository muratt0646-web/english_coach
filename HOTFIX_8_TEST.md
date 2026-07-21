# HOTFIX — Kalan 8 Test Düşüşü

**Tarih:** 2026-07-20
**Kaynak:** Gerçek `flutter test` çıktısı (düşen test listesi)

---

## 1. Doğrulama durumu

| Komut | Sonuç | Kaynak |
|---|---|---|
| `flutter analyze` | ✅ `No issues found!` | Sizin çalıştırmanız |
| `flutter test` (önceki) | 176 geçti / **12 düştü** | Sizin çalıştırmanız |
| `flutter test` (bir önceki hotfix sonrası) | ~**8 düştü** | Sizin çalıştırmanız |

Bir önceki hotfix 12 → 8'e indirdi: `2D-3` ve `2D-6` (başlık değişikliği)
ile `2D-2` ve `Kelime/Hikayeler görünür` testleri geçti.

> Bu turdaki düzeltmeleri **çalıştırmadım**; PASS yazmıyorum.

---

## 2. Kalan 8 düşüş — üç ayrı kök neden

| # | Test | Kök neden |
|---|---|---|
| 1–2 | `2D-1` Izgara 8 kart · Hazır olmayan modüller | Test görünüm alanı küçük; `GridView.builder` **tembel** |
| 3 | `3A-5` Bilinen/bilinmeyen sayımı BENZERSİZ | **Gerçek kusur:** kök yerine sade biçim sayılıyor |
| 4–8 | `4A-5` Widget akışı (5 test) | AppBar alt şeridi 24px'e sığmıyor |

---

## 3. Kusur A — kelime sayımı benzersiz değildi (gerçek hata)

`HikayeMotoru.kelimeSayimi()` benzersiz kümeye **sade biçimi** ekliyordu:

```dart
b.add(j.sade);        // 'morning' VE 'mornings' ayri ayri
```

H-A1-001 metninde her ikisi de geçiyor (16 kez `morning`, 2 kez `mornings`).
Sonuç 3 çıkıyordu, oysa aynı kelime.

**Düzeltme:**

```dart
// BENZERSIZLIK KOK uzerinden olmali: 'morning' ve 'mornings'
// ayni kelimedir, iki kez sayilmaz.
b.add(kokBul(j.sade));
```

Doğrulandı:

```
sade ile : ['coffee', 'morning', 'mornings'] -> 3
kok ile  : ['coffee', 'morning']             -> 2   ✓ test 2 bekliyor
```

**Test doğruydu, kod yanlıştı.** Testi gevşetmedim.

Bu kusur ürünü de etkiliyordu: hikâye sonu istatistiğinde "bilinen kelime"
sayısı olduğundan yüksek görünüyordu.

---

## 4. Kusur B — AppBar alt şeridi taşıyordu (5 test)

`SablonDersEkrani`'nin AppBar'ında:

```dart
preferredSize: const Size.fromHeight(24),   // yetersiz
```

İçerik hesabı:

| Öğe | Yükseklik |
|---|---|
| `LinearProgressIndicator` | 4px |
| `Padding` (3+3) | 6px |
| `Text` (labelSmall, ~11pt) | ~16px |
| **Toplam** | **~26px** |

24px'e sığmıyor → her çizimde taşma istisnası → **beş widget testi de**
düşüyordu, en basiti dahil.

**Düzeltme:** 24 → **38px**, `mainAxisSize: MainAxisSize.min` eklendi.

---

## 5. Sorun C — test görünüm alanı (2 test)

`ModulIzgarasi` bir `GridView.builder` kullanıyor ve **tembeldir**:
görünmeyen kartları kurmaz.

Testteki 800×600 alanda 8 kart × 252px iki sütunda 4 satır = 1008px →
hem taşıyor hem son kartlar hiç kurulmuyor. Bu yüzden:

- `findsNWidgets(8)` → daha az buluyordu
- Her modül adını arayan döngü → son modüllerde düşüyordu

**Düzeltme (yalnızca testte):**

```dart
Widget sar(Widget cocuk) => MaterialApp(
      home: Scaffold(body: SingleChildScrollView(child: cocuk)),
    );

Future<void> genisEkran(WidgetTester tester) async {
  tester.view.physicalSize = const Size(1400, 2400);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);
}
```

Izgara çizen dört teste uygulandı. **Üretim kodu değişmedi** — gerçek
uygulamada ızgara zaten kaydırılabilir bir `ListView` içinde.

---

## 6. Değişen dosyalar — 3 adet

| Dosya | Değişiklik | Tip |
|---|---|---|
| `lib/core/engine/hikaye_motoru.dart` | Benzersizlik kök üzerinden | **Ürün kusuru** |
| `lib/modules/gramer/sablon_ders_ekrani.dart` | AppBar alt şeridi 24 → 38 | **Ürün kusuru** |
| `test/ana_ekran_test.dart` | Geniş görünüm alanı + kaydırılabilir sarmalayıcı | Test ortamı |

---

## 7. Denetleyicinin göremediği hata sınıfları

Bu turdaki üç sorunun **hiçbirini** dokuz statik kontrol yakalayamaz:

| Sorun | Neden yakalanamaz |
|---|---|
| Kök yerine sade sayım | Mantık hatası; sözdizimi kusursuz |
| 24px'e sığmayan içerik | Piksel ölçüsü çalışma zamanında belli olur |
| Tembel `GridView` + küçük alan | Test ortamı davranışı |

Bu, aracın sınırının üçüncü somut kanıtı. Statik denetim derleme hatalarını
yakalıyor; **davranış ve düzen hatalarını yalnızca `flutter test` yakalar.**

---

## 8. Çalıştırma

```powershell
flutter test --reporter compact 2>&1 | Select-String -Pattern "\[E\]"
```

Hiç satır çıkmazsa hepsi geçti demektir. Çıkarsa listeyi gönderin —
aynı yöntemle kök nedene inerim.
