# FAZ 4A.0 — Şartnameye Uyumlandırma

**Tarih:** 2026-07-20

---

## 1. Doğrulama beyanı — §21 ve §23

> **Bu oturumda Flutter kurulu değildir.** `flutter clean`, `flutter pub get`,
> `flutter analyze`, `flutter test`, `flutter run -d windows` komutlarını
> **çalıştırmadım.** Windows çalıştırma ortamına erişimim yok.
>
> **Hiçbirine PASS yazmıyorum.** Aşağıdaki Python doğrulamaları
> `flutter test` yerine geçmez ve öyle raporlanmamıştır.

| Komut | Beklenen | Gerçek |
|---|---|---|
| `flutter analyze` | 0 error | ⬜ |
| `flutter test` | ~180 test | ⬜ |
| `flutter run -d windows` | açılır | ⬜ |

---

## 2. §1 — Mevcut sistem denetimi

Kod yazmadan önce mevcut yapıyı şartnameye karşı denetledim. Sonuç:
**12 aşama, veri odaklı model, tek ekran ve To Be içeriği zaten vardı.**
Sıfırdan yazmadım; **sekiz eksiği** kapattım.

| # | Eksik | Durum |
|---|---|---|
| 1 | `prerequisites`, `diagnosisRules` alanları | ✅ eklendi |
| 2 | Yanlış örnekte `hataTuru`, `altKonu` | ✅ eklendi |
| 3 | Kısa cevap / yaş / milliyet içeriği | ✅ eklendi |
| 4 | **Sınavda cevap anında gösteriliyordu** | ✅ **düzeltildi** |
| 5 | `enGucluKonu`, `sinavPuani`, `tamamlanmaTarihi` | ✅ eklendi |
| 6 | **İlerleme SQLite'a yazılmıyordu** | ✅ **eklendi (migration v4)** |
| 7 | demo_lesson fixture | ✅ eklendi |
| 8 | Aynı soru art arda gelebiliyordu | ✅ düzeltildi |

4 ve 6 **gerçek kusurdu**; şartname olmasa fark edilmeyebilirdi.

---

## 3. §13 — Sınavda cevap gizlendi

Önceki sürümde mini sınavda her cevaptan sonra doğru/yanlış geri bildirimi
anında görünüyordu. Bu, sınavın ölçme değerini bozuyordu.

```dart
bool get _sinavModu => _asama == DersAsamasi.miniSinav;

if (_sinavModu) {
  _akis.gecikmeliGec(const Duration(milliseconds: 150), _soruIleri, ...);
  return;   // geri bildirim YOK
}
```

Sınav sırasında ekranda yalnızca şu uyarı var:
*"Sınav sırasında doğru cevap gösterilmez. Sonuçlar sınav bitince toplu
görünecek."*

---

## 4. §16 — İlerleme kaydı

**user.db şema sürümü 3 → 4.** Yalnızca ekleme; mevcut veri korunur.

```sql
ders_ilerleme(ders_kod PK, asama, madde_indeksi, baslama, son_acilis,
              tamamlanma, dogru_sayisi, yanlis_sayisi, sinav_puani, durum)
ders_altkonu_basari(ders_kod, alt_konu, dogru, yanlis)
```

`lib/data/ders_ilerleme_repo.dart` — kaydet / getir / tamamla / altKonuKaydet.

Ekran açılışta `ilerlemeGetir` ile kaldığı aşamayı yükler; her aşama
geçişinde kaydeder. **Veritabanı yoksa ders yine çalışır**, yalnızca
ilerleme yazılmaz.

`baslama` ilk açılışta yazılır ve **korunur**; `son_acilis` her seferinde
güncellenir. Testi var.

---

## 5. §18 — Mimari doğrulama (asıl kanıt)

`test/demo_ders.dart` — üretim içeriğine **dahil değil**, yalnızca test.

To Be'den kasıtlı olarak farklı: A2 seviye, 2 anlatım (To Be'de 6),
2 sınav sorusu (To Be'de 15), 3 örnek (To Be'de 56).

```dart
testWidgets('Demo ders AYNI ekranla acilir — yeni ekran GEREKMIYOR', ...)
```

Bu test yeni bir ekran, widget veya `if/else` bloğu olmadan farklı bir dersin
açıldığını gösteriyor. **§20'deki başarı ölçütünün ikinci maddesi budur.**

---

## 6. §12 — Uyarlanabilir pekiştirme

Üç şart da test edildi:

| Şart | Test |
|---|---|
| Zayıf konu daha fazla soru getirir | `aSayi > bSayi` |
| **Deterministik** | Aynı girdi iki kez → aynı çıktı |
| Aynı soru art arda gelmez | Ardışık kod karşılaştırması |

`_ardArdaAyikla()` eklendi: aynı kod art arda gelirse sonraki farklı soruyla
takas edilir.

---

## 7. §19 — Eklenen testler

| Dosya | Test |
|---|---|
| `test/sablon_ders_test.dart` | 25 (içerik şartları her kayıtlı ders için döngüde) |
| `test/sablon_ders_mimari_test.dart` | **23 YENİ** |
| `test/demo_ders.dart` | fixture |

Yeni testlerin kapsamı: §18 mimari (5) · §12 pekiştirme (3) · §15 sonuç (3) ·
§16 ilerleme (6) · §13 sınav (3) · §3 model (3).

---

## 8. Denetleyicide bulduğum **üç** hata

Bu turda kendi aracımda üç ayrı hata çıktı ve üçünü de düzelttim:

| # | Hata | Belirti |
|---|---|---|
| 1 | İç içe record değişmezindeki alan adları dış çağrının parametresi sanılıyordu | `{kA: (dogru: 1, yanlis: 4)}` yanlış alarm verdi |
| 2 | Derinlik sayımında `<` `>` kullanılıyordu | Dart'ın `=>` operatörü derinliği bozup 4 yanlış alarm üretti |
| 3 | Aynı ada sahip birden çok metot varsa kontrol **atlanıyordu** | `KelimePdf.kaydet` yüzünden `DersIlerlemeRepo.kaydet` hataları hiç görülmüyordu |

3 numara en tehlikelisiydi: araç "temiz" diyordu ama koca bir sınıfı hiç
denetlemiyordu. Artık **hiçbir tanıma uymayan** çağrıyı bildiriyor.

Her düzeltmeden sonra gerçek hatayı geçici kopyaya geri koyup yakalandığını
doğruladım.

---

## 9. Değişen / eklenen dosyalar

| Dosya | Değişiklik |
|---|---|
| `core/model/ders_sablonu.dart` | `hataTuru`, `altKonu`, `DersTaniKurali`, `onKosullar`, `taniKurallari` |
| `core/engine/ders_motoru.dart` | `enGucluKonu`, `sinavPuani`, `tamamlanmaTarihi`, `_ardArdaAyikla` |
| `core/db/migrations.dart` | user.db v4 (2 tablo) |
| `data/ders_ilerleme_repo.dart` | **YENİ** |
| `modules/gramer/sablon_ders_ekrani.dart` | Sınav modu + ilerleme kaydı |
| `core/content/ders_en_a1_002.dart` | Kısa cevap, yaş, milliyet örnekleri |
| `test/demo_ders.dart` | **YENİ** |
| `test/sablon_ders_mimari_test.dart` | **YENİ** — 23 test |
| `tool/dart_statik_denetim.py` | 3 hata düzeltildi |

**§20 kapsam sınırlarına uyuldu:** başka A1 dersi yazılmadı, hikâye/kelime
modülleri değişmedi, TTS/AI/bulut eklenmedi, yeni paket eklenmedi,
Flow Mode yeniden yazılmadı.

---

## 10. §22 — Manuel kabul testi

Bu 15 adımı **ben yapamam** (Flutter yok). Sizin yapmanız gerekiyor.
En kritik dördü:

| Adım | Beklenen |
|---|---|
| 9. `I are happy` yaz | `KESIN_TANI` · beklenen `am`, yazılan `are` |
| 10-11. Ders ortasında kapat, yeniden aç | **Aynı aşamadan** devam etmeli |
| 12. Mini sınav | Cevaplarda doğru/yanlış **görünmemeli** |
| 14. %80 altı | Tekrar önerisi + zayıf alt konular |

---

## 11. Bilinen sınırlamalar

| # | Konu |
|---|---|
| S-1 | `diagnosisRules` alanı **tanımlı ama kullanılmıyor** — Tanı Motoru henüz derse özel kural okumuyor |
| S-2 | Büyük harf / noktalama hataları ayrı kategori değil; normalizasyon onları siliyor |
| S-3 | Sürükle-bırak metin girişi olarak (§9 erişilebilirlik gereği bilinçli) |
| S-4 | EN-A1-001 hâlâ eski 22 adımlı akışta |
| S-5 | Kısa cevap (`Yes, I am`) örnek olarak var, ayrı soru türü değil |
