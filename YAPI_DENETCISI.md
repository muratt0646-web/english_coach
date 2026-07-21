# Yapısal Denetim — "Neden denetlenmiyor?" sorusunun cevabı

**Tarih:** 2026-07-20

---

## 1. Neden denetlenemiyordu

`TaniMotoru` v3 bir **karşılaştırıcıdır**, çözümleyici değil.

Şöyle çalışıyor: cevabınızı kabul kümesindeki cümlelere benzetir, en
yakınını bulur, **farkı** teşhis eder.

```
Kabul: "I drink coffee every morning."
Cevap: "Every day I drink coffee"
       -> fark: morning / day  -> KELIME_SECIMI
```

Kendi cümlenizi yazdığınızda **referans yok**. "I like coffee very much"
neyle karşılaştırılacak? Sonsuz sayıda doğru cümle var.

Üç çözüm yolu vardı, ikisi kapalı:

| Yol | Durum |
|---|---|
| Bulut dil modeli | ❌ PRODUCT_RULES: çevrimdışı, ücretsiz, sunucu yok |
| Cihaz içi dil modeli | ❌ Yüzlerce MB; TB-01…04 hiç yürütülmedi |
| **Yapısal kural denetimi** | ✅ **Yapıldı** |

---

## 2. Ne yapıldı

`lib/core/engine/yapi_denetcisi.dart` — **referanssız** denetim.

Elimizdeki veriden yararlanıyor: kelime verisindeki `tur` alanı
(isim/fiil/sıfat/zarf), Tanı Motoru'ndaki fonksiyon kelimeleri ve fiil
çiftleri.

### Denetlenen hata sınıfları

| Kod | Ne yakalar | Örnek |
|---|---|---|
| `BE-01` | to be düşürme | *I student.* → I **am** a student |
| `BE-02` | be + ana fiil yan yana | *He is works.* |
| `BE-03` | özne–be uyumsuzluğu | *I are happy.* → I **am** |
| `AGR-01` | 3. tekilde -s eksik | *He work here.* → work**s** |
| `AGR-02` | -s yanlış yerde | *They studies.* → study |
| `AUX-02` | do/does sonrası çekimli fiil | *Does he works?* → work |
| `WO-01` | fiil sonda (Türkçe SOV) | *I coffee drink.* |
| `PRO-01` | nesne zamiri özne yerinde | *Me am happy.* → **I** |
| `SU-01` | fiille başlama (uyarı) | *Drink coffee.* |
| `TEK-01` | kelime tekrarı (uyarı) | *I I drink* |
| `BUYUK-01` · `NOKTA-01` | biçim (uyarı) | küçük harf, nokta yok |

Bunlar tesadüfi seçilmedi — Türkçe konuşanın yaptığı hata sınıfları.

### İki kademe

- **Ciddi bulgu** → cümle kabul edilmez, düzeltme önerisi verilir
- **Uyarı** → cümle geçerli sayılır, sadece dikkat çekilir

*Drink coffee.* emir cümlesi olabilir; bu yüzden uyarı, hata değil.

---

## 3. En kritik ölçüt: yanlış alarm yok

Doğru bir cümleye "hata" demek, hiç denetlememekten **kötüdür**.

25 doğru cümleyle sınadım — **25/25 temiz**, tek ciddi bulgu yok:

```
I drink coffee every morning. · She reads books. · They are students.
He is a doctor. · She studies every evening. · He does not work here.
Do you like coffee? · The children play outside. · She has a car. ...
```

11 hatalı cümlede **11/11 yakalandı**.

Sözlükte olmayan kelimeler de sınandı: *"The quokka is happy."* →
ciddi bulgu yok. Bilinmeyen kelime yanlış alarm üretmiyor.

---

## 4. Hâlâ denetlenmeyenler — açıkça

| Denetlenmiyor | Neden |
|---|---|
| Anlam ve mantık | *"I drink books"* dilbilgisel olarak doğru |
| Zaman uygunluğu | Bağlam bilgisi yok |
| Eş dizim | *"make a mistake"* ✓ / *"do a mistake"* ✗ — veri yok |
| Yan cümleler | Ayrıştırıcı yok |
| Sözlük dışı kelimelerin türü | Tür bilgisi yok → ilgili kurallar atlanır |
| Artikel eksikliği | Sayılabilirlik verisi yok — **bilerek atlandı** |

Son madde önemli: artikel kuralı yazabilirdim ama sayılabilir/sayılamaz
ayrımı verisi olmadan *"I drink water"* cümlesine yanlış alarm verirdi.
Yanlış alarm vermemek, eksik denetlemekten iyidir.

---

## 5. Arayüzde ne değişti

Serbest cümle etkinliğinde artık her bulgu ayrı satırda gösteriliyor:

```
[BE-03] "i" oznesi "are" almaz.
        Dogrusu: "i am".
[NOKTA-01] Cumle sonunda noktalama yok.
        Sonuna nokta, soru veya unlem isareti koyun.

Ornek: I drink coffee.
```

Ciddi bulgu kırmızı, uyarı gri. Örnek cümle karşılaştırma için altta.

---

## 6. Eklenen dosyalar

| Dosya | Değişiklik |
|---|---|
| `core/engine/yapi_denetcisi.dart` | **YENİ** — 270 satır |
| `core/engine/pekistirme_motoru.dart` | `kendiCumlesiIncele()` |
| `modules/kelime/pekistirme_ekrani.dart` | Bulgu gösterimi |
| `test/yapi_denetcisi_test.dart` | **YENİ** — 27 test (25'i yanlış alarm testi) |
| `tool/yapi_denetcisi_dogrulama.py` | **YENİ** — 36/36 |

Yeni paket yok. Şema değişmedi. Ağ bağımlılığı yok.
