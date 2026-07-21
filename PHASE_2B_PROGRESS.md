# PHASE_2B_PROGRESS.md — İngilizce Düşünme Katmanı + Ortak Teaching Engine

**Tarih:** 2026-07-19
**Durum:** 🟡 **KOD YAZILDI — DERLENMEDİ, ÇALIŞTIRILMADI**
**Sonuç:** **PASS DEĞİL.**

---

## 1. Doğrulama durumu

`flutter analyze / test / run` komutlarını çalıştıramadım (bu oturumda Flutter yok). Faz 1B-1 ve 2A da henüz bir kez bile derlenmedi. Bu katman, üç kat doğrulanmamış bir tabanın üzerine eklendi.

---

## 2. Ne değişti — mimari

Talebiniz mimarinin gerçekten değişmesini gerektiriyordu. Önceki ders motoru "metin göster → cevap kontrol et" seviyesindeydi; düşünme katmanı orada veri olarak temsil edilemezdi.

**Kurulan yapı:**

```
lib/core/model/dusunme.dart        GENEL modeller (5 tip)
lib/core/engine/dusunme_motoru.dart GENEL motor — konu bilmez
lib/core/content/dusunme_<konu>.dart  KONU VERISI — is mantigi YOK
```

### Genellik nasıl sağlandı

Motor, dilbilgisi terimlerini bilmez. Yalnızca iki şey okur:

| Veri | Ne yapar |
|---|---|
| `tr_sira` | Rol kodlarının Türkçe cümledeki tipik sırası |
| `en_sira` | Rol kodlarının İngilizce cümledeki sırası — **dizim kuralı budur** |

`rol_kodu` serbest bir metindir. Motor `KIM`, `NE_YAPIYOR` gibi adları **yorumlamaz**; yalnızca eşleştirme anahtarı olarak kullanır.

**Sonuç:** Yeni konu eklemek için yalnızca veri yazılır. `dusunme_motoru.dart`, `ders_ekrani.dart` ve `icerik_repo.dart` değişmez.

### Genellik kanıtı — ölçüldü

```
Motorda sabit kodlanmis konu/rol adi taramasi:
  lib/core/engine/dusunme_motoru.dart  -> YOK
  lib/core/model/dusunme.dart          -> YOK
  lib/data/icerik_repo.dart            -> YOK
  lib/features/ders/ders_ekrani.dart   -> YOK
```

Aynı motor iki farklı konuyla çalıştırıldı, **kod değişmeden**:

| Konu | `en_sira` | Üretilen cümle |
|---|---|---|
| SVO | `KIM, NE_YAPIYOR, NEYI, NASIL, NEREDE, NE_ZAMAN` | `I drink coffee at home every morning` |
| Soru yapısı (fixture) | `YARDIMCI, KIM, NE_YAPIYOR, NEYI` | `Do you like coffee` |

İkincisi bir **test fixture**'ıdır, ders değildir — mevcut derslere dokunulmadı.

---

## 3. İstediğiniz altı alan

| Alan | Nerede |
|---|---|
| `ingilizce_dusunme_modeli` | `dusunme_modeli` tablosu (`ad`, `ozet`, `en_sira`) |
| `turkce_mudahale_hatasi` | `mudahale_hatasi` tablosu — 4 kayıt |
| `anlam_bloklari` | `anlam_blogu` tablosu — örnek başına bloklar |
| `zihinsel_soru_sirasi` | `zihinsel_soru` tablosu — 6 soru, sıralı |
| `dogru_dusunme_ornegi` | `dusunme_ornegi` (tip=`dogru`) — 3 kayıt |
| `yanlis_dusunme_ornegi` | `dusunme_ornegi` (tip=`yanlis`) — 3 kayıt |

**Altısı da SVO'ya özel kodlanmadı**; her konu aynı beş tabloyu doldurur.

---

## 4. Zihinsel soru sırası — EN-A1-001

| # | Soru | Zorunlu |
|---|---|---|
| 1 | Kim? | ✔ |
| 2 | Ne yapıyor? | ✔ |
| 3 | Neyi / kimi? | — |
| 4 | Nerede? | — |
| 5 | Ne zaman? | — |
| 6 | Nasıl? | — |

Türkçe sıra: `NE_ZAMAN → KIM → NEREDE → NEYI → NASIL → NE_YAPIYOR`
İngilizce sıra: `KIM → NE_YAPIYOR → NEYI → NASIL → NEREDE → NE_ZAMAN`

Bu iki satır, dersin asıl öğrettiği şeydir: **fiil bir basamak öne gelir, zaman bloğu sona gider.**

### Kelime kelime çeviriye karşı

Ders akışına eklenen **blok alıştırması** öğrenciye cümleyi tek seferde çevirtmez. Her zihinsel soruyu sırayla sorar, öğrenci yalnızca o bloğu yazar, sonunda motor blokları İngilizce sıraya dizip gösterir.

---

## 5. Ders akışı (yeni)

```
1. Ingilizce dusunme modeli  (TR sira / EN sira serit gorseli)
2. Zihinsel soru sirasi      (6 soru, zorunlu isaretli)
3. Dogru dusunme ornekleri   (3 adet, bloklar gorunur)
4. Yanlis dusunme ornekleri  (3 adet, neden yanlis)
5. Blok alistirmalari        (3 adet, interaktif, soru soru)
6. Turkce mudahale hatalari  (4 adet)
   --------- buradan sonrasi Faz 2A ---------
7. Ders anlatimi (10 adim), 30 gorev
```

Düşünme katmanı **derse girmeden önce** gelir — kural öğretmeden önce düşünme sırası kurulur.

---

## 6. Veritabanı

**Şema v2: yalnızca 5 yeni tablo eklendi. Mevcut tabloların hiçbirine dokunulmadı.**

```
dusunme_modeli   konu_kod, ad, ozet, tr_sira, en_sira
zihinsel_soru    konu_kod, sira, rol_kodu, soru_tr, ipucu, zorunlu_mu
dusunme_ornegi   konu_kod, kod, tip, tr_cumle, en_cumle, aciklama
anlam_blogu      konu_kod, ornek_kod, sira, rol_kodu, blok_tr, blok_en
mudahale_hatasi  konu_kod, kod, baslik, aciklama, yanlis, dogru
```

`CREATE TABLE IF NOT EXISTS` kullanıldı; mevcut `content.db` varsa yalnızca yeni tablolar eklenir, veri kaybolmaz.

---

## 7. Ölçümler (derleme değil)

```
tool/dusunme_motoru_dogrulama.py   ->  25/25 PASS
   iki farkli konu, ayni motor
   TR sirasi fiil sonda / EN sirasi fiil ikinci
   bloklardan cumle kurma (iki yonde)
   sorulacak sorularin ornekten turetilmesi
   blok cevabi dogrulama (buyuk/kucuk harf toleransli)
   sira kontrolu + eksik zorunlu rol kontrolu (AYRI islemler)
   GENELLIK: motorda konu kodu / rol adi / 'SVO' YOK

tool/icerik_dogrulama.py           ->  24/24 PASS
tool/tani_motoru_v2_dogrulama.py   ->  19/19 PASS
```

**Bulunan ve düzeltilen iki kusur:**

1. `sira_kontrol` testim tautolojiydi (`ok_ is True or not ok_` — her zaman doğru). Gerçek bir kontrolle değiştirildi ve **eksik zorunlu rol** kontrolü ayrı bir işlem olarak eklendi. Sıra doğruluğu ile eksiksizlik farklı sorulardır.
2. Ekranda `[SVO]` markdown işareti kalmıştı — genellik iddiasını bozuyordu. `[BLOK]` olarak yeniden adlandırıldı.

---

## 8. Dosyalar

| Dosya | Durum | Satır |
|---|---|---|
| `lib/core/model/dusunme.dart` | **YENİ** — genel modeller | 127 |
| `lib/core/engine/dusunme_motoru.dart` | **YENİ** — genel motor | 84 |
| `lib/core/content/dusunme_en_a1_001.dart` | **YENİ** — veri | 116 |
| `test/dusunme_motoru_test.dart` | **YENİ** — 14 test | 134 |
| `lib/core/db/migrations.dart` | v2 eklendi | 198 |
| `lib/core/db/app_database.dart` | v2 göçü bağlandı | 93 |
| `lib/core/db/seed_content.dart` | düşünme verisi yazılıyor | 127 |
| `lib/data/icerik_repo.dart` | `dusunmeModeli()` | 141 |
| `lib/features/ders/ders_ekrani.dart` | düşünme adımları | 844 |
| `lib/core/content/ders_en_a1_001.dart` | `[SVO]`→`[BLOK]` | 560 |

**Toplam Dart: 3.530 satır** (17 dosya). Test: 40 (26 tanı + 14 düşünme).

---

## 9. Çıkış şartları

| # | Şart | Durum |
|---|---|---|
| 1 | `flutter analyze` temiz | ⬜ **DOĞRULANMADI** |
| 2 | `flutter test` — 40 test | ⬜ **DOĞRULANMADI** |
| 3 | `flutter run -d windows` | ⬜ **DOĞRULANMADI** |
| 4 | Düşünme katmanı derse girmeden görünüyor | ⬜ **DOĞRULANMADI** |
| 5 | Blok alıştırması soru soru ilerliyor | ⬜ **DOĞRULANMADI** |
| 6 | v2 göçü mevcut veriyi bozmuyor | ⬜ **DOĞRULANMADI** |

---

## 10. Riskler

| # | Risk | Belirti |
|---|---|---|
| R-1 | **Eski `content.db` varsa düşünme verisi yazılmaz** — v2 tabloları oluşur ama boş kalır | Düşünme adımları hiç görünmez. **Çözüm:** `content.db`'yi silin |
| R-2 | `surfaceContainerHighest` / `withValues` eski Flutter'da yok | `flutter analyze` hatası |
| R-3 | Dart 3 record dönüşü `({bool dogru, List<String> beklenen})` SDK ≥3.0 ister | `flutter analyze` |
| R-4 | Ders akışı uzadı (~22 adım + 30 görev) | Süre 60 dk'yı aşabilir |

**R-1 en olası sorundur** ve Faz 2A'da da aynı riski yazmıştım.

---

## 11. Çalıştırma

```powershell
cd $env:USERPROFILE\Documents\english_coach
# ONEMLI: eski icerik veritabanini silin (yol ana ekranda yaziyor)
flutter analyze
flutter test
flutter run -d windows
```

Beklenen ilk ekran (Derse Başla sonrası):

```
INGILIZCE DUSUNME MODELI
Ingilizce dusunme sirasi
Turkce cumleyi kelime kelime cevirme. Once ANLAM BLOKLARINA ayir...

Turkce dusunme sirasi:   [1. Ne zaman?][2. Kim?][3. Nerede?][4. Neyi/kimi?][5. Nasil?][6. Ne yapiyor?]
                              ↓
Ingilizce dusunme sirasi: [1. Kim?][2. Ne yapiyor?][3. Neyi/kimi?][4. Nasil?][5. Nerede?][6. Ne zaman?]
```

`flutter analyze` çıktısını gönderin.
