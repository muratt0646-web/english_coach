# HOTFIX — Açılışta Çökme: Mükerrer Seed Bloğu

**Tarih:** 2026-07-20
**Belirti:** Uygulama derleniyor, `.exe` üretiliyor, **açılışta çöküyor**

---

## 1. Hata

```
UNIQUE constraint failed: hikaye_sozluk.kelime
INSERT INTO hikaye_sozluk ... parameters: wake, veyk, uyanmak
seed_content.dart:172
```

Çöken kayıt sözlüğün **ilk** girdisi (`wake`). Yani tablo daha o an dolu.

---

## 2. Kök neden — benim hatam

`seed_content.dart` içinde hikâye seed bloğu **iki kez** bulunuyordu:

```
satir 128: for (final SozlukGirdisi g in HikayeSozluk.girdiler) { ... }
satir 171: for (final SozlukGirdisi g in HikayeSozluk.girdiler) { ... }   ← ayni blok
```

Faz 3A'da bu bloğu ekleyen düzenleme betiğim **iki kez uygulanmış.**
İlk döngü 40 kelimeyi yazıyor, ikincisi aynılarını tekrar yazmaya
çalışıyor → `UNIQUE constraint` → işlem geri alınıyor → `main()` çöküyor.

### İkinci kusur: yanlış ayraç

İki blok **birebir aynı değildi**:

| Blok | Ayraç | Durum |
|---|---|---|
| Blok 1 (128) | `join('||')` | ❌ Repo `split('|')` yapıyor |
| Blok 2 (171) | `join('|')` | ✅ Doğru |

Blok 1 çalışsaydı `secenekler` alanı `a||b` olarak yazılacak,
`split('|')` bunu `['a', '', 'b']` diye çözecekti — **boş şık**.

**Blok 1 silindi, Blok 2 korundu.** Doğrulandı:

```
hikaye_sozluk insert : 1   (onceden 2)
stories insert       : 1
'||' kalan           : 0
'|'  ayrac           : 3
```

---

## 3. Veritabanı kendini onarıyor

`icerikSifirla()` kendi işleminde çalışıp tabloları düşürdü; `doldur()`
işlemi geri alındı. Yani `content.db` şu an **boş içerik tabloları** ve
`icerik_surum` kaydı **yok**.

Açılışta `_icerikSurumu()` `null` dönecek, `'0.4.0'` ile eşleşmeyecek,
yeniden seed çalışacak. **Elle silmeye gerek yok.**

`user.db`'ye hiç dokunulmadı.

---

## 4. Denetleyiciye 10. kontrol

Dokuz kontrolün hiçbiri bunu yakalamadı. Kod sözdizimsel olarak kusursuz,
importlar doğru, türler doğru, imzalar doğru — sadece bir blok iki kez var.

**10. kontrol: mükerrer kod bloğu.** Aynı dosyada 15+ satırlık birebir
tekrar arıyor.

### Eşik neden 15

İlk denemede eşik 6 satırdı → temiz projede **19 yanlış alarm** verdi.
Arayüz kodunda 5–8 satırlık benzer bloklar doğaldır (benzer widget'lar).
15 satırlık birebir tekrar ise neredeyse her zaman kazadır.

### Kanıt

40 satırlık bloğu geçici kopyaya geri koydum:

```
[UYARI] lib/core/db/seed_content.dart:165
   15 satirlik blok satir 124 ile AYNI. Kopyala-yapistir veya
   iki kez uygulanmis duzenleme olabilir.
```

Yakalıyor. Temiz projede: **0 hata, 0 uyarı.**

---

## 5. Bu hatanın asıl dersi

Bu, düzenleme betiklerimle ilgili **üçüncü** olay:

| Faz | Olay |
|---|---|
| 2F | `s.replace()` sessizce başarısız oldu → import eklenmedi |
| 2C.1 | Import bloğu mükerrer yazıldı (fark ettim, temizledim) |
| 3A | Seed bloğu iki kez eklendi → **uygulama hiç açılmadı** |

Artık `assert` kullanıyorum, ama `assert` yalnızca *bulunamadı* durumunu
yakalar; *iki kez uygulandı* durumunu yakalamaz. 10. kontrol bu boşluğu
kapatıyor.

---

## 6. Değişen dosyalar

| Dosya | Değişiklik |
|---|---|
| `lib/core/db/seed_content.dart` | Mükerrer blok silindi (45 satır), yanlış ayraçlı sürüm gitti |
| `tool/dart_statik_denetim.py` | 10. kontrol |

Ürün mantığı değişmedi; yalnızca çift yazım kaldırıldı.

---

## 7. Çalıştırma

```powershell
cd C:\english_coach
flutter run -d windows
```

Uygulama açılmalı ve ana ekranda 8 modül görünmeli. Ardından:

```powershell
flutter test --reporter compact 2>&1 | Select-String -Pattern "\[E\]"
```

Bir önceki turdaki `ListView` düzeltmesiyle birlikte hiç satır çıkmaması
bekleniyor.
