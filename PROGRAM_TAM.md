# English Coach AI — Tam Program

**Tarih:** 2026-07-20

---

## 1. Doğrulama beyanı

> **Bu oturumda Flutter kurulu değildir.** `flutter analyze`, `flutter test`,
> `flutter run -d windows` komutlarını **çalıştırmadım** ve bu paketteki
> değişikliklere **PASS yazmıyorum.**
>
> Son doğrulanmış durum sizin çalıştırmanızdan geliyordu:
> `No issues found!` · 183 test geçti · uygulama Windows'ta açıldı.
> Ondan sonra **yalnızca içerik dosyası eklendi** — motor, ekran ve şema
> değişmedi.

```powershell
cd C:\english_coach
flutter analyze
flutter test --reporter compact
flutter run -d windows
```

---

## 2. Toplam içerik

| Öğe | Miktar |
|---|---|
| **Gramer dersi** | **32** (12 A1 + 20 A2) |
| Doğru örnek cümle | 966 |
| Yanlış örnek (gerekçeli) | 642 |
| Soru | 1.342 |
| Anlatım bloğu | 192 |
| **Hikâye** | **20** (13 A1 + 7 A2) |
| Hikâye kelimesi | 7.292 |
| Hikâye sorusu | 100 |
| Sözlük girdisi | 58 |
| **Kelime** | **520** (26 paket) |
| Pekiştirme etkinliği | 8 tür |

---

## 3. Gramer — 32 ders

### A1 (12)
To Be · Kişi Zamirleri · be olumsuz/soru · Present Simple · 3. tekil -s ·
do/does · Artikeller · Çoğul İsimler · this/that/these/those · Sıfatlar ·
there is/are · Yer Edatları

### A2 (20)

| Blok | Dersler |
|---|---|
| Past Simple | was/were · düzenli -ed · düzensiz · did |
| Present | Continuous · Simple↔Continuous seçimi |
| Gelecek | going to · will |
| Karşılaştırma | comparative · superlative |
| Miktar | sayılabilirlik+some/any · much/many · there is/are (A2) |
| Modal | can/could · should/must/have to |
| Perfect | Present Perfect · for/since |
| Zarf ve edat | sıklık zarfları · yer edatları · zaman edatları |

Her ders 12 aşamadan geçer; mini kontrolde yanlış cevap **ilgili anlatım
bloğuna geri yönlendirir**.

---

## 4. "İngilizce düşünmek" nasıl işlendi

Her A2 dersi bir `INGILIZCE DUSUNME NOTU` ile açılır ve tek bir karar
sorusuna bağlanır:

| Soru | Ders |
|---|---|
| **Bir kelime bir iş** — Türkçe yığar, İngilizce ayırır | A2-001, 002, 004 |
| **Çerçeve mi, an mı?** | A2-006 |
| **Kararı şimdi mi verdim, önceden mi?** | A2-007, 008 |
| **Zaman dilimi bitti mi?** | A2-016 |
| **Süre mi, başlangıç noktası mı?** | A2-017 |
| **Sayabilir miyim?** | A2-011, 012 |
| **Hacim mi, yüzey mi, nokta mı?** | A1-030, A2-019, 020 |

Bilinçle reddedilen eşleştirme: **Türkçe `-miş` ≠ Present Perfect.**
`"Ali gitmiş"` duyuma dayanır, `"Ali has gone"` şimdiye bağlantıya.

---

## 5. Hikâyeler — 20

13 A1 (280–300 kelime) + 7 A2 (490–535 kelime). Her biri 6 paragraf
(İngilizce + Türkçe) ve 5 soru: doğru-yanlış, çoktan seçmeli, boşluk
doldurma, sıralama, yazılı.

A2 hikâyeleri **öğrenilen gramerle bağlantılı** yazıldı:

| Hikâye | Çalıştırdığı yapı |
|---|---|
| The Missing Keys | Past Simple + Present Perfect |
| The Late Train | Past Simple + karşılaştırma |
| The New Neighbour | karşılaştırma + modal |
| The Job Interview | Past Perfect + Present Perfect |
| The Old Photograph | Past Perfect anlatı |
| The Wrong Bus | Past Simple + Present Perfect |
| Learning to Swim | could + Present Perfect + karşılaştırma |

---

## 6. Kelime — 520 (26 paket)

Seyahat · İş rutini · Ev · Yiyecek · Duygular · Şehir · Sağlık · Okul ·
Doğa · Giyim · Aile · Teknoloji · Spor · Para · Hayvanlar · Meslekler ·
Günlük fiiller · Sıfatlar · Zaman · Bağlaçlar · Yön · İletişim · Soyut
kavramlar · A1 çekirdek

Her kelimede: yazılış · IPA · okunuş · tür · Türkçe anlam · örnek cümle ·
Türkçe çevirisi · eş/zıt anlam.

**A1 çekirdek kapsamı: 70/70.**

---

## 7. Ölçümler (derleme değil)

```
ders_dogrulama.py        320 PASS · 0 FAIL   (32 ders × 10 sart)
dart_statik_denetim.py     0 hata · 0 uyari  (10 kontrol)
yapi_denetcisi            36 PASS · 0 FAIL
faz2e_dogrulama           19 PASS · 0 FAIL
```

Kelime havuzu ayrıca her eklemede denetlendi: kod benzersizliği, mükerrer
yazılış, **örnek cümlenin hedef kelimeyi yalın içermesi**, alan tamlığı.

> Bu araçlar `flutter test` yerine geçmez. Proje boyunca üç kez kanıtlandı:
> taşma, eskimiş test beklentisi ve tembel `ListView` sorununu hiçbiri
> yakalayamadı — yalnızca sizin çalıştırmanız buldu.

---

## 8. İçerik üretiminde bulduğum hatalar

Kelime havuzunu genişletirken kendi kontrollerim **11 hata** buldu ve
hepsi düzeltildi:

| Tür | Adet | Örnek |
|---|---|---|
| Kopyala-yapıştır | 1 | `W-4020` yazılışı `salary`, içeriği `early` |
| Mükerrer yazılış | 6 | `early` iki kez · `book` isim+fiil · `help` iki kez |
| Çekimli örnek cümle | 12 | `"I bought two tickets"` → `ticket` bulunamıyor |

Üçüncüsü sessiz bir bozulmaydı: boşluk doldurma etkinliği kelimeyi
cümleden siliyor; örnek çekimliyse etkinlik kırılıyor.

**Doğrulayıcımda da 2 yanlış alarm çıktı** — benzersizlik `== 40` ile
karşılaştırılıyordu. Düzeltip gerçek bir mükerrer geri koyarak hâlâ
yakaladığını kanıtladım. Bu, projedeki dördüncü araç yanlış alarmı.

---

## 9. Bilinen eksikler

| # | Konu | Not |
|---|---|---|
| E-1 | **Seviye tespit sınavı** | Yalnızca tanıtım ekranı — en büyük boşluk |
| E-2 | B1 ve üstü içerik yok | — |
| E-3 | Serbest cümlede tam dilbilgisi denetimi yok | Yapı Denetçisi 11 kural |
| E-4 | Ses yok | Cihaz TTS doğrulaması yapılmadı |
| E-5 | EN-A1-001 eski 22 adımlı akışta | 12 aşamaya taşınmadı |
| E-6 | Sürükle-bırak metin girişi olarak | — |

---

## 10. Yeni içerik eklemek

```dart
// DERS: lib/core/content/ders_XX.dart + kayit defterine 1 satir
// HIKAYE: hikaye_icerik.dart listesine 1 Hikaye kaydi
// KELIME: kelime_ornek_veri.dart listesine ekle (20'serlik otomatik paketlenir)
```

Motor, ekran ve testler değişmez. Doğrulama:
`python tool/ders_dogrulama.py`

---

## 11. Sıradaki adım için öneri

1. **Seviye tespit sınavı** — 32 ders, 20 hikâye ve 520 kelime var ama
   kullanıcı nereden başlayacağını bilmiyor. En yüksek değerli iş bu.
2. B1 gramer (20 konu)
3. B1 hikâyeleri (700–1200 kelime)
4. Ses desteği (cihaz TTS doğrulaması gerekir)
