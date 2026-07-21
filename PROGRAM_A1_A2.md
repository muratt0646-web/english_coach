# English Coach AI — A1 + A2 Gramer Tamamlandı

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

```
32 sablon ders  (12 A1 + 20 A2)
966 dogru + 642 yanlis ornek
1.342 soru
192 anlatim blogu
```

Her yanlış örnekte **neden yanlış** ve **doğru biçim** yazılı — 642/642.

### A1 (12 ders)

To Be · Kişi Zamirleri · be olumsuz/soru · Present Simple · 3. tekil -s ·
do/does · Artikeller · Çoğul İsimler · this/that/these/those · Sıfatlar ·
there is/are · Yer Edatları

### A2 (20 ders)

| Blok | Dersler |
|---|---|
| Past Simple | was/were · düzenli -ed · düzensiz · did |
| Present | Continuous · Simple↔Continuous seçimi |
| Gelecek | going to · will |
| Karşılaştırma | comparative · superlative |
| Miktar | sayılabilirlik+some/any · much/many · there is/are (A2) |
| Modal | can/could · should/must/have to |
| Perfect | Present Perfect giriş · for/since |
| Zarf ve edat | sıklık zarfları · yer edatları · zaman edatları |

---

## 3. "İngilizce düşünmek" nasıl işlendi

Her ders **kural listesi** değil, **Türkçe–İngilizce düşünme farkı**
üzerine kuruldu. Her A2 dersi bir `INGILIZCE DUSUNME NOTU` ile açılıyor.

Kurduğum ana çerçeveler:

| İlke | Nerede |
|---|---|
| **Bir kelime bir iş** — Türkçe tek kelimeye yığar, İngilizce ayırır | A2-001, 002, 004 |
| Kişi → öznede, zaman → yardımcı fiilde, anlam → ana fiilde | A2-004 |
| **Çerçeve mi, an mı?** | A2-006 |
| **Kararı şimdi mi verdim, önceden mi?** | A2-007, 008 |
| **Zaman dilimi bitti mi?** | A2-016 |
| **Süre mi, başlangıç noktası mı?** | A2-017 |
| **Sayabilir miyim?** | A2-011, 012 |
| **Hacim mi, yüzey mi, nokta mı?** (yer ve zaman aynı mantık) | A1-030, A2-019, 020 |

Ayrıca öğrenciyi rahatlatan gözlemler ekledim: geçmiş zaman şimdikinden
**daha kolay** (kişi eki yok), `did` tek biçim, gelecekte `there will be`
tekil-çoğul ayrımı yok.

### Bilinçli olarak reddettiğim eşleştirme

Türkçe `-miş` eki ≠ Present Perfect. `"Ali gitmiş"` duyuma dayanır,
`"Ali has gone"` şimdiye bağlantıya. Bunu A2-016'nın giriş bloğunda
açıkça yazdım.

---

## 4. Diğer modüller (değişmedi)

| Modül | İçerik |
|---|---|
| Hikâyeler | 10 hikâye · 2.850 kelime · 46 sözlük girdisi · **hepsi A1** |
| Kelime Akademisi | 40 kelime · 2 paket · 8 pekiştirme etkinliği · PDF |
| Motorlar | Tanı Motoru v3 · Yapı Denetçisi · Ders Motoru · Pekiştirme · Hikâye · Normalizer |

---

## 5. Ölçümler (derleme değil)

```
tool/ders_dogrulama.py           320 PASS · 0 FAIL   (32 ders × 10 sart)
tool/dart_statik_denetim.py        0 hata · 0 uyari  (10 kontrol, 97 dosya)
tool/yapi_denetcisi_dogrulama.py  36 PASS · 0 FAIL
tool/faz2e_dogrulama.py           20 PASS · 0 FAIL
```

Her ders otomatik denetlenir: 30 doğru + 20 yanlış örnek, 15 sınav sorusu,
3–5 mini kontrol, 6 özet, 4+ anlatım, geri dönüş kodlarının anlatımda
bulunması, soru kodlarının benzersizliği, 4+ farklı alıştırma türü.

> Bu araçlar `flutter test` yerine geçmez. Bu proje boyunca üç kez
> kanıtlandı: taşma, eskimiş test beklentisi ve tembel `ListView` sorununu
> hiçbiri yakalayamadı — yalnızca sizin çalıştırmanız buldu.

---

## 6. Şablon iddiası 20 kez sınandı

A2'nin 20 dersini eklerken **motor, ekran ve test hiç değişmedi**.
Her ders için yalnızca:

1. `lib/core/content/ders_XX.dart` — sadece veri
2. `sablon_ders_kayitlari.dart`'a bir satır

Testler kayıt defterindeki her ders üzerinde otomatik döner.

---

## 7. Bilinen eksikler

| # | Konu | Not |
|---|---|---|
| E-1 | **Hikâyeler yalnızca A1** | A2 için 10 hikâye (400–700 kelime) gerekli |
| E-2 | **Kelime 2 paket** | A2 için ~6 paket daha |
| E-3 | **Seviye tespit sınavı** | Yalnızca tanıtım ekranı; tam modül gerekiyor |
| E-4 | Serbest cümlede tam dilbilgisi denetimi yok | Yapı Denetçisi 11 kuralla sınırlı |
| E-5 | Ses yok | Cihaz TTS doğrulaması yapılmadı |
| E-6 | EN-A1-001 eski 22 adımlı akışta | 12 aşamaya taşınmadı |
| E-7 | Sürükle-bırak metin girişi olarak | Erişilebilirlik gereği bilinçli |
| E-8 | B1 ve üstü yok | — |

---

## 8. Sıradaki adım için öneri

Öncelik sırasıyla:

1. **Seviye tespit sınavı** — kullanıcı hâlâ nereden başlayacağını bilmiyor.
   32 ders var ama sıralama önerisi yok. En büyük boşluk bu.
2. **A2 hikâyeleri** — gramer öğrenildi, okuma pratiği yok
3. **Kelime paketleri** — A1+A2 için ~200 kelime
4. B1 gramer

---

## 9. Yeni ders eklemek

```dart
// 1. lib/core/content/ders_en_b1_001.dart — sadece veri
class DersEnB1001 { static const DersSablonu ders = DersSablonu(...); }

// 2. sablon_ders_kayitlari.dart
import 'ders_en_b1_001.dart';
DersEnB1001.ders,
```

Doğrulama: `python tool/ders_dogrulama.py`
