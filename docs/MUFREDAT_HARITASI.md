# Müfredat Haritası — A1 ve A2

**Sürüm:** 1.0 · **Tarih:** 2026-07-20
**Amaç:** Kalan içerik işini görünür ve ölçülebilir kılmak

---

## 1. Gerçek maliyet

Ölçüm, yazılmış üç şablon dersten alındı:

| Ders | Satır | Doğru örnek | Yanlış örnek | Soru |
|---|---:|---:|---:|---:|
| EN-A1-002 To Be | 425 | 36 | 22 | 42 |
| EN-A1-003 Zamirler | 347 | 30 | 20 | 41 |
| EN-A1-011 3. tekil -s | 364 | 30 | 20 | 42 |
| **Ortalama** | **378** | 32 | 21 | 42 |

| Seviye | Konu | Dart satırı | Örnek cümle | Soru | Tahmini tur |
|---|---:|---:|---:|---:|---:|
| A1 kalan | 36 | ~13.600 | 1.800 | 1.512 | 12–18 |
| A2 | 30 | ~11.300 | 1.500 | 1.260 | 10–15 |
| **Toplam** | **66** | **~24.900** | **3.300** | **2.772** | **22–33** |

Turda 2–3 ders yazılabiliyor — kalite düşmeden. Daha fazlasını zorlarsam
örnekler ve gerekçeler birbirini tekrar etmeye başlar.

---

## 2. Bağımlılık sorunu

A2'nin ilk üç konusu doğrudan A1'in eksik bloğuna dayanıyor:

```
EN-A1-010  Present Simple olumlu     ─┐
EN-A1-012  do / does yardimci fiili  ─┼─→  EN-A2-001  Past Simple (-ed)
EN-A1-013  Present Simple olumsuz    ─┘    EN-A2-003  did / didn't
```

"Did you work?" yapısı, "Do you work?" oturmadan öğretilemez. Aynı şekilde
Past Simple olumsuzu (`didn't work`) Present Simple olumsuzunun (`doesn't
work`) aynasıdır — biri olmadan diğeri ezber olur.

**Bu yüzden sıra: önce A1'in Present Simple bloğu, sonra A2.**

---

## 3. A1 — kalan konular

### Blok 1: Present Simple çekirdeği (A2'yi açan blok) 🔴 ÖNCELİK

| Kod | Konu | Hedef hata kodu |
|---|---|---|
| EN-A1-010 | Present Simple olumlu | — |
| EN-A1-012 | do / does yardımcı fiili | `AUX-01` |
| EN-A1-013 | Present Simple olumsuz ve soru | `AUX-01` |

### Blok 2: İsim ve belirleyiciler

| Kod | Konu | Hedef |
|---|---|---|
| EN-A1-019 | a / an belirsiz artikel | `ART-01` |
| EN-A1-020 | the belirli artikel | `ART-02` |
| EN-A1-021 | Çoğul isimler (-s / -es / düzensiz) | — |
| EN-A1-022 | this / that / these / those | — |
| EN-A1-023 | Sayılabilen / sayılamayan | — |

### Blok 3: Sıfat ve zarflar

| Kod | Konu |
|---|---|
| EN-A1-024 | Sıfatlar ve sıra |
| EN-A1-025 | Sıklık zarfları (always, never…) |
| EN-A1-026 | very / too / quite |

### Blok 4: Edatlar

| Kod | Konu | Hedef |
|---|---|---|
| EN-A1-030 | in / on / at — zaman | `PREP-01` |
| EN-A1-031 | in / on / at — yer | `PREP-01` |
| EN-A1-032 | to / from / with | `PREP-01` |

### Blok 5: Temel yapılar

| Kod | Konu |
|---|---|
| EN-A1-033 | there is / there are |
| EN-A1-034 | have got / has got |
| EN-A1-035 | can / can't (yetenek) |
| EN-A1-036 | Emir cümleleri |
| EN-A1-037 | Soru kelimeleri (what, where, when…) |
| EN-A1-038 | Present Continuous — giriş |
| EN-A1-039 | Bağlaçlar: and / but / or |
| EN-A1-040 | Sayılar, saat, tarih |

*(Kalan ~16 konu: kelime alanlarına özel dersler — renkler, aile, meslekler,
yiyecek, hava, vücut, kıyafet, ulaşım vb.)*

---

## 4. A2 — tam müfredat

### Blok A: Geçmiş zaman 🔴 A2'nin çekirdeği

| Kod | Konu | Not |
|---|---|---|
| EN-A2-001 | Past Simple — düzenli fiiller (-ed) | Yazım kuralları: stop→stopped, study→studied |
| EN-A2-002 | Past Simple — düzensiz fiiller | ~40 sık fiil |
| EN-A2-003 | Past Simple olumsuz ve soru (did) | A1-012'nin aynası |
| EN-A2-004 | was / were | To Be'nin geçmişi |
| EN-A2-005 | Past Continuous | while / when |

### Blok B: Gelecek

| Kod | Konu |
|---|---|
| EN-A2-006 | going to |
| EN-A2-007 | will |
| EN-A2-008 | going to vs will |

### Blok C: Karşılaştırma

| Kod | Konu |
|---|---|
| EN-A2-009 | Karşılaştırma sıfatları (-er / more) |
| EN-A2-010 | Üstünlük (-est / most) |
| EN-A2-011 | as … as / not as … as |

### Blok D: Miktar

| Kod | Konu |
|---|---|
| EN-A2-012 | some / any |
| EN-A2-013 | much / many / a lot of |
| EN-A2-014 | a few / a little |

### Blok E: Kipler

| Kod | Konu |
|---|---|
| EN-A2-015 | can / could (geçmiş yetenek) |
| EN-A2-016 | should (öneri) |
| EN-A2-017 | must / have to |
| EN-A2-018 | would like |

### Blok F: Present Perfect

| Kod | Konu |
|---|---|
| EN-A2-019 | Present Perfect — giriş |
| EN-A2-020 | ever / never / just / already / yet |
| EN-A2-021 | Present Perfect vs Past Simple |
| EN-A2-022 | for / since |

### Blok G: Cümle yapısı

| Kod | Konu |
|---|---|
| EN-A2-023 | Bağlaçlar: because / so / although |
| EN-A2-024 | Sıfat cümlecikleri (who / which / that) |
| EN-A2-025 | Birinci koşul cümlesi |
| EN-A2-026 | Mastar / -ing (want to, enjoy -ing) |
| EN-A2-027 | used to |

### Blok H: Diğer

| Kod | Konu |
|---|---|
| EN-A2-028 | Dönüşlü zamirler (myself…) |
| EN-A2-029 | İyelik zamirleri (mine, yours…) |
| EN-A2-030 | Edilgen çatı — giriş |

---

## 5. Önerilen üretim sırası

| Parti | İçerik | Sonuç |
|---|---|---|
| 1 | A1-010, 012, 013 | **A2 açılır** |
| 2 | A2-001, 002 | Past Simple çekirdeği |
| 3 | A2-003, 004 | Geçmiş zaman tamamlanır |
| 4 | A2-005, 006, 007 | Süreklilik + gelecek |
| 5–8 | A2-008…018 | Karşılaştırma, miktar, kipler |
| 9–12 | A2-019…030 | Present Perfect + cümle yapısı |
| 13+ | A1 kalan blokları | A1 tamamlanır |

**Parti 1 bittiğinde A2'ye geçilebilir.** Bu, kullanıcının "A2'yi bitir"
hedefine giden en kısa yoldur — atlanamaz, çünkü A2-003 doğrudan A1-012'ye
dayanır.

---

## 6. Neden A2 tek teslimatta bitmez

| Kısıt | Değer |
|---|---|
| Ders başına içerik | ~378 satır, 50 örnek, 42 soru |
| Turda yazılabilen | 2–3 ders |
| A2 toplamı | 30 ders |
| Gereken tur | **10–15** |

Tek turda 30 ders yazmayı denersem örnekler tekrara düşer, gerekçeler
yüzeyselleşir ve yanlış örnekler birbirinin kopyası olur. Hikâye
modülünde bu sınıra çarptım: 50 hikâye istendi, 10 tanesi gerçekten
farklı temada yazılabildi.

**Alternatif yok; yalnızca kadans var.** Turda 2–3 ders, sürekli ilerleme.
