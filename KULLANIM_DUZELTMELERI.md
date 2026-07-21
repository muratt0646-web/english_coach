# Kullanım Kusurlarının Giderilmesi

**Tarih:** 2026-07-20
**Kaynak:** Uygulamayı gerçekten kullanırken bildirdiğiniz sorunlar

---

## 1. Doğrulama beyanı

> Flutter bu oturumda yok; `analyze` ve `test` **çalıştırmadım**, PASS yazmıyorum.

---

## 2. Bildirdiğiniz 8 sorun — durum

| # | Sorun | Durum |
|---|---|---|
| 1 | Türkçe karakter yazınca yanlış diyor | ✅ **düzeltildi** |
| 2 | Kelime verip cümle istiyor ama kendi cümlemi kabul etmiyor | ✅ **düzeltildi** |
| 3 | 20 kelime bitince aynı kelimelere dönüyor | ✅ **düzeltildi** |
| 4 | Gramerde Enter ile ilerleyemiyorum | ✅ **düzeltildi** |
| 5 | "O" için bazen he/she kabul etmiyor | ✅ **düzeltildi** |
| 6 | Tamamlanan ders belli değil | ✅ **düzeltildi** |
| 7 | Hikâye sayısı az, sadece A1 var | ⬜ **yapılmadı** — içerik üretimi |
| 8 | Seviye tespit sınavı eksik | ⬜ **yapılmadı** — ayrı modül |

7 ve 8 tek turda yapılamaz; §7'de planlıyorum.

---

## 3. Türkçe karakter (en yaygın sorun)

`Normalizer` Türkçe harfleri hiç işlemiyordu. `çay` ≠ `cay`, `öğrenci` ≠ `ogrenci`.

Ayrıca Dart'ın `toLowerCase()` metodu Türkçe `I` → `ı` dönüşümünü doğru
yapmaz; `İ` için birleşik nokta üretir.

**Düzeltme:** `turkceKatla()` — Türkçe harfleri ASCII karşılığına katlar,
**`toLowerCase()`'ten önce** çalışır.

```
'çay'      -> 'cay'
'öğrenci'  -> 'ogrenci'
'ŞİRKET'   -> 'sirket'
'Işık'     -> 'isik'
```

İngilizce metin etkilenmez. Bu düzeltme **tüm modülleri** kapsıyor:
kelime, gramer, hikâye, tanı motoru.

---

## 4. Kendi cümleni yazma

Haklısınız — "cümle yaz" deyip yalnızca kendi örnek cümlesini kabul etmek
anlamsızdı.

**Düzeltme:** `DogrulamaTuru.hedefKelimeIceren` eklendi. Artık cümleniz
şu ölçütlerle inceleniyor:

| Ölçüt | Davranış |
|---|---|
| Hedef kelime geçiyor mu (çekimli biçim dahil) | Geçmiyorsa reddedilir, **hangi kelime eksik** söylenir |
| En az 3 kelime | Kısaysa reddedilir, sebebi söylenir |
| Dilbilgisi | **Denetlenmiyor** — bu açıkça bildiriliyor |

Kabul mesajı dürüst:
> *"Kelime doğru kullanılmış. Dilbilgisi ayrıntılı denetlenmedi;
> örnekle karşılaştırın."*

Keyfi bir cümlenin dilbilgisini referanssız denetleyemem; bunu gizlemek
yerine söylüyorum.

---

## 5. he / she

**Kök neden bulundu:** Kelime verisinde 5 kayıtta Türkçe "O ..." yalnızca
tek cinsiyetli İngilizceye bağlıydı:

```
water  : 'O su icer.'          -> 'She drinks water.'   (He kabul edilmiyordu)
early  : 'O erken kalkar.'     -> 'He wakes up early.'  (She kabul edilmiyordu)
always · letter · never        -> aynı sorun
```

İçeriği tek tek düzeltmek yerine **motoru** düzelttim: Türkçede tek "o"
olduğu için, kabul cümlesi `He ` veya `She ` ile başlıyorsa diğer biçim
otomatik eklenir. Hem `PekistirmeMotoru` hem `DersMotoru` için geçerli —
**gelecekteki içerik de kapsanıyor.**

---

## 6. Paket geçişi

20 kelime bitince aynı pakete dönülüyordu.

**Düzeltme:** Ekran açılışta **öğrenilecek kelimesi kalan ilk paketi**
buluyor ve paket tamamlandığında düğme gösteriyor:

> **Paket 2'ye geç (yeni 20 kelime)**

Tüm paketler bittiyse dürüst mesaj: *"Bütün paketler tamamlandı. Yeni
kelime paketleri ilerideki fazlarda eklenecek."*

---

## 7. Enter ile ilerleme

Sunum aşamalarında (giriş, anlatım, görsel örnek, adım adım, hata analizi,
özet) artık **Enter "devam" görevini görüyor**. Her aşamanın kendi davranışı
var: anlatımda sonraki blok, görsel örnekte sonraki adım.

Metin girişi olan aşamalarda `CevapAlani` kendi Enter'ını işliyor; çakışma yok.

Bunu yaparken adımlı ilerleme mantığını düğmeden çıkarıp ortak
`_adimliIleri()` metoduna aldım — düğme ve Enter **aynı** kodu çağırıyor.

---

## 8. Tamamlanan ders işareti

Gramer listesinde artık üç durum ayırt ediliyor:

| Durum | Görünüm |
|---|---|
| Tamamlandı | ✅ Yeşil rozet + **sınav puanı** + kart arkaplanı yeşilimsi + "Tekrar et" |
| Devam ediyor | ⏳ "Devam ediyor" rozeti + "Devam et" |
| Başlanmadı | Rozet yok + "Derse başla" |

Veri `ders_ilerleme` tablosundan geliyor (Faz 4A.0'da eklenmişti, artık
kullanılıyor).

---

## 9. Eklenen testler — 15 adet

Türkçe karakter (4) · he/she (4) · kendi cümlen (5) · paket geçişi (2).

Özellikle: *"Türkçe ve ASCII yazım AYNI kabul edilir"* ve *"Örnek cümleden
FARKLI kendi cümlen kabul edilir"* — bildirdiğiniz iki sorunun doğrudan testi.

---

## 10. Yapılmayan ikisi için plan

### Hikâyeler (7)

Şu an 10 A1 hikâyesi var. A2 ve B1 hiç yok.

| Seviye | Kelime | Öneri |
|---|---|---|
| A1 | 250–400 | +10 hikâye (toplam 20) |
| A2 | 400–700 | 10 hikâye |
| B1 | 700–1200 | 6 hikâye |

Bir A2 hikâyesi ~550 kelime İngilizce + Türkçe çeviri + 5 soru.
Turda **3–4 hikâye** gerçekçi.

### Seviye tespit sınavı (8)

Şu an yalnızca tanıtım ekranı var. Gerçek sınav için gereken:

1. Soru havuzu (seviye × beceri etiketli, ~100 madde)
2. Uyarlanabilir seçim mantığı
3. Üç durumlu sonuç haritası (biliyor / eksik / belirsiz)
4. Beceri × seviye eksik analizi
5. Sonuç ekranı + önerilen başlangıç

Bu **tam bir modül** — kendi fazını hak ediyor.

---

## 11. Değişen dosyalar

| Dosya | Değişiklik |
|---|---|
| `core/engine/normalizer.dart` | Türkçe karakter katlama |
| `core/engine/pekistirme_motoru.dart` | Kendi cümlen + he/she varyantı |
| `core/engine/ders_motoru.dart` | he/she varyantı |
| `modules/kelime/kelime_ekrani.dart` | Sonraki eksik pakete geçiş |
| `modules/gramer/sablon_ders_ekrani.dart` | Enter desteği + ortak `_adimliIleri()` |
| `modules/gramer/gramer_ekrani.dart` | Tamamlanma rozeti |
| `test/kullanim_duzeltmeleri_test.dart` | **YENİ** — 15 test |

Şema değişmedi. `pubspec.yaml` değişmedi.
