# İçerik Artırımı — Hikâyeler ve Kelime Havuzu (1. Parti)

**Tarih:** 2026-07-20

---

## 1. Doğrulama beyanı

> Flutter bu oturumda **yok**. `analyze` / `test` **çalıştırmadım**, PASS yazmıyorum.
> Bu turda **yalnızca içerik dosyası** değişti; motor, ekran ve şema değişmedi.

---

## 2. Eklenenler

| Öğe | Önce | Sonra |
|---|---|---|
| Hikâye | 10 (hepsi A1) | **13** (10 A1 + **3 A2**) |
| Hikâye kelimesi | 2.850 | **4.394** |
| Sözlük girdisi | 46 | **58** |
| Kelime | 40 (2 paket) | **80 (4 paket)** |

---

## 3. Yeni A2 hikâyeleri

Üçü de **A2 gramerini çalıştıracak** şekilde yazıldı — öğrenilen yapı
okuma içinde tekrar karşılaşılıyor.

| Kod | Başlık | Kelime | Çalıştırdığı yapı |
|---|---|---|---|
| H-A2-001 | The Missing Keys | 512 | Past Simple + Present Perfect (*"I have never lost..."*, *"has always kept"*) |
| H-A2-002 | The Late Train | 534 | Past Simple anlatı + karşılaştırma (*"worse than usual"*) |
| H-A2-003 | The New Neighbour | 498 | Karşılaştırma + modal + Present Perfect (*"has lived for thirty years"*) |

Her hikâyede 6 paragraf (İngilizce + Türkçe), 5 soru (doğru-yanlış,
çoktan seçmeli, boşluk doldurma, sıralama, yazılı).

---

## 4. Yeni kelime paketleri

| Paket | Tema | Örnek |
|---|---|---|
| **Paket 3** | Seyahat ve ulaşım | travel · ticket · station · airport · luggage · passenger · delay · reserve |
| **Paket 4** | İş ve günlük rutin | office · meeting · manager · salary · deadline · appointment · schedule · email |

Her kelimede: yazılış, IPA, okunuş, tür, Türkçe anlam, örnek cümle,
Türkçe çevirisi, eş/zıt anlam.

---

## 5. Kendi kontrolüm dört hata buldu

Kelimeleri yazdıktan sonra doğrulayıcıları çalıştırdım. **Dördü de içerik
hatasıydı ve düzeltildi:**

| # | Hata | Düzeltme |
|---|---|---|
| 1 | `W-4020` yazılışı `salary` kalmış ama içeriği `early` — kopyala-yapıştır | → `email` |
| 2 | `early` **zaten W-1019'da vardı** — mükerrer | W-4020 değiştirildi |
| 3 | `book` iki kez (isim + fiil) | W-3012 → `reserve` |
| 4 | **5 örnek cümlede hedef kelime çekimli geçiyordu** | Yalın biçime çevrildi |

### 4 numara neden önemli

Boşluk doldurma etkinliği hedef kelimeyi cümleden siler. Örnek cümle
`"I bought two tickets"` ise kelime `ticket` olarak bulunamaz ve etkinlik
bozulur.

Bozuk olanlar: `ticket · passenger · arrive · depart · reserve · return ·
employee · dress` → hepsi yalın biçim içerecek şekilde yeniden yazıldı.

**80/80 kelimede örnek cümle artık hedef kelimeyi yalın içeriyor.**

---

## 6. Doğrulayıcımda iki yanlış alarm

`faz2e_dogrulama.py` 4 FAIL verdi; ikisi araç hatasıydı:

```python
k("Kodlar benzersiz", len({x[0] for x in kayit}) == 40)   # 40'a SABITLENMIS
```

80 kelime olunca "benzersiz değil" dedi — oysa benzersizdi. Gerçek sayıyla
karşılaştıracak şekilde düzeltildi, sonra gerçek bir mükerrer geri konularak
hâlâ yakaladığı kanıtlandı.

Bu, projedeki **dördüncü** araç yanlış alarmı. Kaydediyorum çünkü tehlikeli:
araç hatasını içerik hatası sanıp doğru içeriği "düzeltmek" gerçek bir
bozulma yaratır.

---

## 7. Ölçümler

```
ders_dogrulama.py        320 PASS · 0 FAIL   (32 ders)
dart_statik_denetim.py     0 hata · 0 uyari
yapi_denetcisi            36 PASS · 0 FAIL
faz2e_dogrulama           19 PASS · 0 FAIL   (dinamiklestirildi)
```

---

## 8. Kalan boşluk

| Öğe | Şu an | Hedef |
|---|---|---|
| A2 hikâye | 3 | ~10 |
| A1 hikâye | 10 | yeterli |
| Kelime | 80 (4 paket) | ~300 (15 paket) |
| B1 içerik | 0 | — |

Tur başına **3 hikâye + 2 paket** çıkıyor. A2 hikâyeleri için 2–3 tur,
kelime için 5–6 tur gerekir.
