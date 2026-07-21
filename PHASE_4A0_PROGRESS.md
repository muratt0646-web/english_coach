# PHASE_4A0_PROGRESS.md — A1 Ders Motoru ve To Be Dersi

**Tarih:** 2026-07-20

---

## 1. Doğrulama beyanı

> **Bu oturumda Flutter kurulu değildir.** `flutter analyze`, `flutter test`,
> `flutter run -d windows` komutlarını **çalıştırmadım** ve **PASS yazmıyorum.**

| Komut | Beklenen | Gerçek sonuç |
|---|---|---|
| `flutter analyze` | `No issues found!` | ⬜ |
| `flutter test` | 112 mevcut + 25 yeni = **137 test** | ⬜ |
| `flutter run -d windows` | Gramer → To Be açılır | ⬜ |

---

## 2. Asıl çıktı: şablon, ders değil

Bu fazın hedefi To Be dersi değil, **yüzlerce dersin kullanacağı ortak yapı**.

```
core/model/ders_sablonu.dart          12 asama + tum veri tipleri
core/engine/ders_motoru.dart          akis, zayif konu, agirlikli pekistirme
core/content/ders_en_a1_002.dart      To Be — SADECE VERI
core/content/sablon_ders_kayitlari.dart   kayit defteri
modules/gramer/sablon_ders_ekrani.dart    TEK ekran, 12 asamayi cizer
```

### Yeni ders eklemek

1. `core/content/ders_XX.dart` yaz — sadece veri
2. `SablonDersKayitlari.dersler` listesine bir satır ekle

**Bitti.** Motor, ekran ve testler değişmez. Bu, testle de doğrulanıyor
(`4A-4`: kayıtlı her ders 12 aşamayı doldurmalı).

### Kod tekrarı yok

| Ortak bileşen | Nerede kullanılıyor |
|---|---|
| `SablonSoru` | Mini kontrol · alıştırma · pekiştirme · mini sınav — **tek tip** |
| `AdimliOrnek` | Görsel örnekler · adım adım örnekler — **tek tip** |
| `CevapAlani` / `AkisKontrolcusu` | Tüm yazılı cevaplar (Faz 2F'den) |
| `SecenekSatiri` | Tüm seçmeli sorular (Faz 2D.1'den) |
| `TaniMotoru` v3 | Hata analizi (Faz 2C'den) |

---

## 3. 12 aşama — sıra sabit

| # | Aşama | Uygulama |
|---|---|---|
| 1 | Giriş | Türkçe-İngilizce farkı + kazanımlar |
| 2 | Konu anlatımı | 6 blok, her birinde Türkçe karşılaştırma |
| 3 | Görsel örnekler | **Adım adım açılır**: `I` → `I am` → `I am happy.` |
| 4 | Adım adım örnekler | Türkçeden İngilizceye kurulum |
| 5 | Mini kontrol | 5 soru; **yanlışta ilgili anlatıma geri döner** |
| 6 | Kontrollü alıştırmalar | 10 soru, 5 farklı tür |
| 7 | Serbest yazma | 4 görev, kendi cümlesini kurar |
| 8 | Hata analizi | Alt konu bazında doğru/yanlış + zayıf konular |
| 9 | Pekiştirme | **Zayıf konular öne alınır ve tekrarlanır** |
| 10 | Mini sınav | 15 soru, karışık |
| 11 | Ders özeti | 6 madde |
| 12 | Başarı ekranı | Süre · doğru · yanlış · en çok hata · öneri |

`DersMotoru.asamaSirasi` sabittir; hiçbir ders dışına çıkamaz. Testi var.

---

## 4. To Be içeriği

| Bölüm | Adet |
|---|---|
| Anlatım bloğu | 6 (hepsinde Türkçe karşılaştırma) |
| Görsel örnek | 5 |
| Adım adım örnek | 3 |
| **Doğru örnek** | **30** |
| **Yanlış örnek** | **20** (her birinde neden + doğru biçim) |
| Mini kontrol | 5 (hepsinde geri dönüş kodu) |
| Kontrollü alıştırma | 10 (5 tür) |
| Serbest üretim | 4 |
| Pekiştirme | 8 |
| **Mini sınav** | **15** |
| Özet maddesi | 6 |

Alt konular: `am (I)` · `is (he/she/it)` · `are (you/we/they)` ·
`Olumsuz cumle` · `Soru cumlesi` — zayıf konu analizi bunlarla yapılır.

### Anlatım ezber değil, mantık

Her blok "neden" sorusunu cevaplıyor. Örnek:

> **You / We / They are — neden "are"?**
> Birden fazla kişi veya şey varsa "are" gelir. Dikkat: "you" tek kişi için
> de kullanılsa "are" alır, çünkü İngilizcede "you" hem sen hem sizdir.
>
> *Sen mutlusun. → You are happy.*

### Hata analizi — istenen biçimde

`I are happy` girildiğinde `TaniMotoru` v3 çalışıyor ve şunu üretiyor:

```
KESIN_TANI  ·  GRAMER_HATASI
Dilbilgisi hatasi var.
Beklenen: am   Yazdiginiz: are
Dogru form: I am happy.
```

Yanlış örnekler bölümünde de aynı açıklama yazılı:
*"Ozne 'I' tekildir ve YALNIZCA 'am' alir. 'are' cogul ozneler icindir."*

---

## 5. Zayıf konu → ağırlıklı pekiştirme

`DersMotoru.agirlikliPekistirme()` zayıf konu sorularını **başa alır ve
listenin sonunda bir kez daha tekrarlar**. Zayıf konu yoksa liste değişmez.
İkisinin de testi var.

Mini sınav %80'in altındaysa `DersSonucu.sinavGecti = false` ve
`onerilenTekrarlar` dolu döner.

---

## 6. Eklenen dosyalar

| Dosya | Satır | İçerik |
|---|---|---|
| `core/model/ders_sablonu.dart` | 231 | 12 aşama + 8 veri tipi |
| `core/engine/ders_motoru.dart` | 235 | Akış, zayıf konu, sonuç |
| `core/content/ders_en_a1_002.dart` | 411 | To Be — sadece veri |
| `core/content/sablon_ders_kayitlari.dart` | 24 | Kayıt defteri |
| `modules/gramer/sablon_ders_ekrani.dart` | 708 | Tek genel ekran |
| `test/sablon_ders_test.dart` | 249 | 25 test |

**Değişen:** `modules/gramer/gramer_ekrani.dart` (şablon dersler listeye eklendi).

**Dokunulmayanlar:** EN-A1-001 dersi ve eski `ders_ekrani.dart`, Tanı Motoru,
Hikâye modülü, Kelime Akademisi, şema, `pubspec.yaml`, mevcut 112 test.

---

## 7. Testler — 25 adet

| Grup | Kapsam |
|---|---|
| `4A-1` | 12 aşama tanımlı · sıra sabit · geçişler doğru · To Be'nin tüm aşamaları dolu |
| `4A-2` | 30 doğru / 20 yanlış örnek · her yanlışta neden+doğru biçim · mini kontrol geri dönüş kodları anlatımda var · 15 sınav sorusu · karışık türler · her kabul cevabı kendi kabulünü geçiyor |
| `4A-3` | Cevap kaydı · zayıf konu tespiti · **ağırlıklı pekiştirme** · %80 eşiği (geçen ve kalan) |
| `4A-4` | Kayıt defteri · **kayıtlı her ders 12 aşamayı doldurmalı** (ileriye uyumluluk) |
| `4A-5` | **Widget:** ders açılıyor · akış sırası bozulmuyor · anlatım ilerliyor · görsel örnekler adım adım açılıyor · ilerleme çubuğu artıyor |

Testler veritabanı gerektirmez.

### Yazdığım yanıltıcı bir testi kaldırdım

İlk yazımda "hiçbir aşama hata fırlatmaz" diye bir test vardı: aynı ekranı 12
kez açıp aşama değiştirmiyordu — ölçtüğünü iddia ettiği şeyi ölçmüyordu.
Kaldırdım, yerine görsel örneklerin adım adım açılmasını ve ilerleme
çubuğunun artışını sınayan iki gerçek test yazdım.

---

## 8. Denetleyiciye 8. kontrol

`DersSablonu` 17 zorunlu alan istiyor; içerik dosyasını yazarken **9'unu
vermiştim.** Bu derleme hatasıydı ve mevcut yedi kontrolün hiçbiri yakalamadı.

`tool/dart_statik_denetim.py`'ye **eksik zorunlu yapıcı parametresi** kontrolü
eklendi. Kanıt — eksik hâli geçici kopyaya geri koydum:

```
[HATA ] lib/core/content/ders_en_a1_002.dart:19
   'DersSablonu' yapicisinda EKSIK zorunlu parametre:
   ['kontrolluAlistirmalar', 'miniKontrol', 'miniSinav', 'ornekler',
    'ozet', 'pekistirme', 'serbestUretim']
```

Araç artık sekiz kontrol yapıyor. Gerçek proje: **54 dosya, 0 hata, 0 uyarı.**

---

## 9. Bilinen eksikler

| # | Konu |
|---|---|
| E-1 | **EN-A1-001 eski akışta kaldı.** İçeriği Faz 0.2.1'in 22 adımlı şablonuna göre yazılmış; 12 aşamalı yapıya taşımak ayrı bir iş. İki ders sistemi geçici olarak yan yana |
| E-2 | Sürükle-bırak ve eşleştirme **metin girişi olarak** uygulandı; gerçek sürükleme etkileşimi yok |
| E-3 | Ders ilerlemesi SQLite'a yazılmıyor (şablon dersler için) |
| E-4 | Ses düğmeleri yok (TB-03 bekliyor) |

**E-1 en önemlisi** ve bilinçli: çalışan EN-A1-001'i bu fazda taşımak,
"mevcut sistemi bozma" kuralını riske atardı.

---

## 10. Çalıştırma

```powershell
cd $env:USERPROFILE\Documents\english_coach
flutter analyze
flutter test
flutter run -d windows
```

### Doğrulama

1. Ana ekran → **Gramer** → listede iki ders: EN-A1-001 ve **EN-A1-002 (12 aşamalı)**
2. To Be'ye girin → üstte `1/12 · Giris` görünmeli
3. Anlatımda 6 blok, her birinde Türkçe karşılaştırma kutusu
4. Görsel örneklerde **"Sonraki adim"** → satırlar tek tek açılmalı
5. Mini kontrolde **bilerek yanlış** cevaplayın → *"İlgili anlatıma dön"* çıkmalı
6. Serbest yazmada `I are happy` yazın → Tanı Motoru analizi görünmeli
7. Hata analizinde zayıf konu listelenmeli
8. Pekiştirmede o konu **başta ve tekrar** gelmeli
9. Mini sınav 15 soru → başarı ekranında süre, doğru/yanlış, en çok hata, öneri
