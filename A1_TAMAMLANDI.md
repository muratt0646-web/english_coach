# English Coach AI — A1 Seviyesi Tamamlandı

**Tarih:** 2026-07-20

---

## 1. Doğrulama beyanı

> **Bu oturumda Flutter kurulu değildir.** `flutter analyze`, `flutter test`,
> `flutter run -d windows` komutlarını **çalıştırmadım**; bu paketteki
> değişikliklere **PASS yazmıyorum.**
>
> Son doğrulanmış durum sizin çalıştırmanızdan geliyordu:
> `No issues found!` · 183 test geçti · uygulama Windows'ta açıldı.
> Ondan sonra **yalnızca içerik dosyası eklendi**; motor, ekran ve şema
> değişmedi.

Çalıştırılacaklar:

```powershell
cd C:\english_coach
flutter analyze
flutter test --reporter compact
flutter run -d windows
```

---

## 2. Gramer — 12 şablon ders

| Kod | Konu | Örnek | Soru |
|---|---|---|---|
| EN-A1-002 | To Be — am / is / are | 36+22 | 42 |
| EN-A1-003 | Kişi Zamirleri | 30+20 | 41 |
| EN-A1-004 | be — Olumsuz ve Soru | 30+20 | 42 |
| EN-A1-010 | Present Simple — Olumlu | 30+20 | 41 |
| EN-A1-011 | 3. Tekil -s Kuralı | 30+20 | 42 |
| EN-A1-012 | Present Simple — do / does | 30+20 | 42 |
| EN-A1-019 | Artikeller — a / an / the | 30+20 | 42 |
| EN-A1-020 | Çoğul İsimler | 30+20 | 42 |
| EN-A1-021 | this / that / these / those | 30+20 | 42 |
| EN-A1-022 | Sıfatlar ve Sıra | 30+20 | 42 |
| EN-A1-023 | there is / there are | 30+20 | 42 |
| EN-A1-030 | Yer Edatları — in / on / at | 30+20 | 42 |

**Toplam: 366 doğru + 242 yanlış örnek · 502 soru · 72 anlatım bloğu**

Her yanlış örnekte **neden yanlış** ve **doğru biçim** var — 242/242.

Ayrıca EN-A1-001 (Temel Cümle Sırası) eski 22 adımlı akışta duruyor.

### Her ders aynı 12 aşamadan geçer

```
1 Giris · 2 Anlatim · 3 Gorsel ornek · 4 Adim adim
5 Mini kontrol · 6 Kontrollu alistirma · 7 Serbest yazma
8 Hata analizi · 9 Pekistirme · 10 Mini sinav · 11 Ozet · 12 Basari
```

Sıra sabittir. Mini kontrolde yanlış cevap **ilgili anlatım bloğuna geri
yönlendirir**. Pekiştirme, zayıf alt konuları öne alıp tekrarlar.

---

## 3. Diğer modüller

| Modül | İçerik |
|---|---|
| **Hikâyeler** | 10 hikâye · 2.850 kelime · 10 farklı tema · 46 sözlük girdisi |
| **Kelime Akademisi** | 40 kelime · 2 paket · 8 pekiştirme etkinliği · PDF çıktı |
| **Konuşma · Senaryolar · Seviye Tespit · Akıllı Tekrar · İlerleme** | İskelet ekranlar |

---

## 4. Motorlar

| Motor | Satır | İşi |
|---|---|---|
| Tanı Motoru v3 | 532 | 9 kategori, ifade düzeyi karşılaştırma |
| Yapı Denetçisi | 276 | **Referanssız** yapısal denetim, 11 kural |
| Ders Motoru | 278 | 12 aşama, zayıf konu, ağırlıklı pekiştirme |
| Pekiştirme Motoru | 375 | 8 etkinlik türü |
| Hikâye Motoru | 234 | Kelime sınıflandırma, istatistik |
| Normalizer | 95 | Türkçe karakter katlama |

---

## 5. Ölçümler (derleme değil)

```
tool/ders_dogrulama.py           120 PASS · 0 FAIL   (12 ders × 10 sart)
tool/dart_statik_denetim.py        0 hata · 0 uyari  (10 kontrol, 77 dosya)
tool/yapi_denetcisi_dogrulama.py  36 PASS · 0 FAIL
tool/faz2e_dogrulama.py           20 PASS · 0 FAIL
```

> Bu araçlar `flutter test` yerine geçmez. Bu proje boyunca üç kez
> kanıtlandı: taşma, eskimiş test beklentisi ve tembel `ListView` sorununu
> hiçbiri yakalayamadı — yalnızca gerçek çalıştırma buldu.

---

## 6. Bilinen eksikler

| # | Konu | Not |
|---|---|---|
| E-1 | **A2 içeriği yok** | 20 konu haritası `MUFREDAT_A2.md`'de hazır |
| E-2 | Hikâyeler yalnızca A1 | A2/B1 yok |
| E-3 | Kelime 2 paket | Daha fazlası gerekli |
| E-4 | **Seviye tespit sınavı** | Yalnızca tanıtım ekranı |
| E-5 | Ses yok | Cihaz TTS doğrulaması yapılmadı |
| E-6 | EN-A1-001 eski akışta | 12 aşamaya taşınmadı |
| E-7 | Sürükle-bırak metin girişi olarak | Gerçek sürükleme yok |
| E-8 | Serbest cümlede tam dilbilgisi denetimi yok | Yapı Denetçisi 11 kuralla sınırlı |

---

## 7. Yeni ders eklemek

İki adım:

1. `lib/core/content/ders_XX.dart` yaz — **sadece veri**
2. `sablon_ders_kayitlari.dart`'a bir satır ekle

Motor, ekran ve testler **değişmez**. Testler kayıt defterindeki her ders
üzerinde otomatik döner; yeni ders eklendiğinde 10 içerik şartı kendiliğinden
ona da uygulanır.

`python tool/ders_dogrulama.py` çalıştırarak kendiniz de denetleyebilirsiniz.

---

## 8. Sıradaki adım için öneri

Öncelik sırasıyla:

1. **Seviye tespit sınavı** — kullanıcı nereden başlayacağını bilmiyor
2. **A2 gramer** — 20 konu, 7–10 tur
3. **A2/B1 hikâyeleri** — 400–1200 kelime
4. **Kelime paketleri** — A1 için 6 paket daha
