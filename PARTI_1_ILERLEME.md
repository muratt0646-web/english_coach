# İçerik Üretimi — Parti 1 / A2 Yol Haritası

**Tarih:** 2026-07-20

---

## 1. Doğrulama beyanı

> Flutter bu oturumda yok; `analyze` ve `test` **çalıştırmadım**, PASS yazmıyorum.

---

## 2. "A2'yi tamamen bitir" — gerçek maliyet

Ölçüm yazılmış derslerden alındı, tahmin değil:

| | Değer |
|---|---:|
| Ders başına Dart satırı | **378** |
| Ders başına örnek cümle | 50 (30 doğru + 20 yanlış) |
| Ders başına soru | 42 |
| A2 konu sayısı | ~30 |
| **A2 toplamı** | **~11.300 satır · 1.500 örnek · 1.260 soru** |
| Turda yazılabilen | 2–3 ders |
| **Gereken tur** | **10–15** |

Tek teslimatta bitmiyor. Zorlarsam örnekler ve gerekçeler birbirini tekrar
etmeye başlar — hikâye modülünde tam olarak bu sınıra çarptım (50 hikâye
istendi, 10 tanesi gerçekten farklı temada yazılabildi).

---

## 3. Sıralama sorunu — A2 doğrudan A1'e dayanıyor

```
EN-A1-010  Present Simple olumlu     ─┐
EN-A1-012  do / does                 ─┼─→  EN-A2-001  Past Simple (-ed)
EN-A1-013  Present Simple olumsuz    ─┘    EN-A2-003  did / didn't
```

`Did you work?` yapısı, `Do you work?` oturmadan öğretilemez. Past Simple
olumsuzu (`didn't work`) Present Simple olumsuzunun (`doesn't work`)
aynasıdır — biri olmadan diğeri ezber olur.

**Bu blok atlanamaz.** A2'ye giden en kısa yol buradan geçiyor.

---

## 4. Bu turda teslim edilen

### `docs/MUFREDAT_HARITASI.md` — 208 satır

A1'in kalan 36 konusu ve A2'nin 30 konusu, **bloklar hâlinde, bağımlılık
sırasıyla** listelendi. Her konunun hedeflediği hata kodu belirtildi
(`AUX-01`, `ART-01`, `PREP-01`…).

12 partilik üretim planı çıkarıldı. Kalan iş artık görünür ve ölçülebilir.

### `EN-A1-010` — Present Simple Olumlu

| Bölüm | Adet |
|---|---:|
| Anlatım bloğu | 6 |
| Görsel örnek | 5 |
| Adım adım örnek | 3 |
| Doğru örnek | 30 |
| Yanlış örnek | 20 |
| Soru (MK/KA/SU/PK/MS) | 41 |
| Özet maddesi | 6 |

Alt konular: `Genis zaman kavrami` · `Fiil yalin hali` · `Zaman ifadeleri` ·
`Siklik zarflari`

**Öğretim mantığı:** Türkçede fiil altı biçime girer ve zaman bilgisi ekte
saklıdır. İngilizcede Present Simple'da fiil **hiç değişmez**; zaman
bilgisi cümledeki zaman ifadelerinden gelir.

İki zor nokta ayrı bloklarla verildi:

1. **Zaman ifadesi sonda, sıklık zarfı fiilden önce.** Türkçe konuşan bunları
   karıştırır: *I drink always coffee* (✗) → *I always drink coffee*.
2. **`be` ile istisna:** sıklık zarfı `am/is/are`'den **sonra** gelir.
   *I always am ready* (✗) → *I am always ready*.

Yanlış örneklerin dağılımı: 5 fiil biçimi · 3 fazla yardımcı fiil ·
6 kelime sırası · 3 sıklık zarfı yeri · 3 diğer.

`onKosullar: ['EN-A1-003']` alanı ilk kez gerçek veriyle dolduruldu.

---

## 5. Kayıt defteri: 4 ders

```dart
DersEnA1002.ders,   // To Be
DersEnA1003.ders,   // Kisi zamirleri
DersEnA1010.ders,   // Present Simple olumlu   ← YENI
DersEnA1011.ders,   // 3. tekil -s
```

Şablonun iddiası yine tuttu: **motor, ekran ve testler değişmedi.**
Değişen tek şey kayıt defterindeki iki satır.

İçerik testleri kayıt defteri üzerinde döngüde olduğu için yeni ders
**otomatik olarak** on testin kapsamına girdi.

---

## 6. Doğrulama

```
tool/ders_dogrulama.py       ->  40/40 PASS   (onceden 30/30, +10 yeni ders)
tool/dart_statik_denetim.py  ->  0 hata, 0 uyari  (10 kontrol)
```

---

## 7. Sıradaki parti

| Sıra | Ders | Neden |
|---|---|---|
| **Parti 1 kalanı** | EN-A1-012 (do/does), EN-A1-013 (olumsuz/soru) | A2'yi açar |
| Parti 2 | EN-A2-001, EN-A2-002 (Past Simple) | A2 çekirdeği |
| Parti 3 | EN-A2-003, EN-A2-004 | Geçmiş zaman tamamlanır |

Parti 1 bittiğinde A2'ye geçilebilir. Toplam 10–15 tur sonunda A2 tamamlanır.
