# Kelime Seviyelendirme ve Havuz Genişletme

**Tarih:** 2026-07-20

---

## 1. Doğrulama beyanı

> Flutter bu oturumda **yok**. `analyze` / `test` **çalıştırmadım**, PASS yazmıyorum.
> **Bu turda ekran kodu değişti** — `flutter test` sonucunu görmem gerekiyor.

---

## 2. Bulduğunuz eksik

Haklıydınız: kelimeler seviyeye göre bölünmemişti. `PaketKelime` modelinde
`seviye` alanı **yoktu**; paketler yalnızca temaya göre gruplanmış ve liste
sırasına göre 20'şer bölünmüştü.

Sonuç: A1 öğrencisine `apologise`, `career`, `discount` gibi kelimeler
geliyordu.

---

## 3. Yapılanlar

### Veri katmanı

```dart
final String seviye;   // 'A1' | 'A2'

static List<PaketKelime> seviyeKelimeleri(String seviye)
static int seviyePaketSayisi(String seviye)
static List<PaketKelime> paket(int paketId, {String? seviye})
```

`seviye` verilmezse eski davranış korunur — geriye dönük uyumlu.

### Arayüz

| Ekran | Değişiklik |
|---|---|
| `KelimeEkrani` | `seviye` parametresi · başlık `Kelime · A1 · Paket 3` |
| `PekistirmeEkrani` | Aynı havuzu kullanması için `seviye` parametresi |

**A1 bitince A2'ye geçiş düğmesi** eklendi.

### İlerleme kaydında tuzak

`ogrenilenler(paketId:)` kayıtları paket numarasına göre tutuyor. A1 Paket 1
ile A2 Paket 1 aynı numarayı alsaydı **sayımlar karışırdı**.

Çözüm: kayıtta **küresel numara** kullanılıyor.

```
A1 paketleri ->   1..15
A2 paketleri -> 101..115
```

Ekranda görünen numara değişmedi; yalnızca saklama numarası farklı.
Şema değişmedi.

---

## 4. Kelime havuzu

| | Önce | Sonra |
|---|---|---|
| Toplam | 520 | **580** |
| A1 | — | **296** (15 paket) |
| A2 | — | **284** (15 paket) |

Eklenen 3 A1 paketi: sayılar ve temel · ev ve günlük nesneler · temel fiiller.

---

## 5. Etiketlerken bulduğum hata

60 A1 kelimesi eklerken 7 mükerrer çıktı: `wear`, `pay`, `sell`, `talk`,
`say`, `meet`, `watch`.

Sebebi kopya değil, **yanlış sınıflandırma**: bu kelimeleri daha önce
tematik paketlere (Giyim, Para, İletişim) koyup **A2 etiketlemiştim**.
Oysa hepsi A1 çekirdeği.

Düzeltme: kopya eklemek yerine mevcut kayıtlar A1'e taşındı, Paket 29'daki
boş yerler yeni kelimelerle dolduruldu (`catch`, `follow`, `stay`, `leave`,
`believe`, `happen`).

Bu, tematik gruplamanın seviye bilgisini gizlediğini gösterdi — `seviye`
alanı olmadan bu hata görünmezdi.

---

## 6. Ölçümler

```
kelime            580 · seviyeli 580/580 · kod benzersiz · mukerrer YOK
                  bozuk ornek YOK · eksik alan YOK
ders_dogrulama    320 PASS · 0 FAIL
dart_statik         0 hata · 0 uyari
faz2e              19 PASS · 0 FAIL
```

Arayüz tutarlılığı 8 kontrolle doğrulandı (seviye parametreleri, küresel
numara, eski `paketSayisi` çağrısı kalmadı).

---

## 7. Kalan

| İş | Şu an | Hedef |
|---|---|---|
| A1 kelime | 296 | ~500 |
| A2 kelime | 284 | ~500 |

**+420 kelime, ~4 tur.**

---

## 8. Çalıştırma

```powershell
flutter analyze
flutter test --reporter compact 2>&1 | Select-String -Pattern "\[E\]"
flutter run -d windows
```

Kelime Akademisi'nde başlık artık `Kelime · A1 · Paket 1` olmalı ve
yalnızca A1 kelimeleri gelmeli.
