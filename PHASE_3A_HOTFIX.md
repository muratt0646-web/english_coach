# PHASE_3A_HOTFIX.md — Derleme Kırıklarının Giderilmesi

**Tarih:** 2026-07-20
**Tip:** Hotfix — **yeni özellik yok, refactor yok**

---

## 1. Doğrulama beyanı

> **Bu oturumda Flutter kurulu değildir.** `flutter analyze`, `flutter test`,
> `flutter run -d windows` komutlarını **çalıştırmadım** ve **PASS yazmıyorum.**
> Aşağıdakiler kök neden analizine dayanan beklentilerdir.

| Komut | Beklenen | Gerçek sonuç |
|---|---|---|
| `flutter analyze` | `No issues found!` | ⬜ |
| `flutter test` | 112 test PASS | ⬜ |
| `flutter run -d windows` | Açılır | ⬜ |

---

## 2. Kök neden — hata bende

Faz 3A'da `hikaye_repo.dart`'ı **sıfırdan yazdım**, ekranların hangi API'yi
beklediğine bakmadan. Ekranlar farklı bir sürüme göre yazılmıştı. Sonuç:
beş noktada imza uyumsuzluğu.

**Düzeltme ilkesi:** Ekranlar çalışan taraftır ve **kaynak doğru** kabul edildi.
Repo ve testler onlara uyduruldu. Ekran dosyalarına dokunulmadı.

---

## 3. Giderilen kırıklar

| # | Kırık | Ekran ne bekliyordu | Repo ne sunuyordu | Düzeltme |
|---|---|---|---|---|
| 1 | `HikayeOzet` erişimi | `o.baslik`, `o.kod`, `o.seviye`, `o.konuEtiketi`, `o.kelimeSayisi`, `o.tahminiDk` | `o.hikaye.baslik` (iç içe) | **Yönlendirici getirici'ler** eklendi. Tek sürüm; hem düz hem iç içe çalışır |
| 2 | İlerleme okuma | `r.ilerlemeGetir(kod)` | `r.ilerleme(kod)` | Metot adı `ilerlemeGetir` yapıldı |
| 3 | İlerleme yazma | `ilerlemeKaydet(kod: ...)` | `ilerlemeKaydet(hikayeKod: ...)` | Parametre adı `kod` yapıldı |
| 4 | Kütüphane | `r.kutuphane(filtre: ...)` (adlandırılmış) | `kutuphane(HikayeFiltre f)` (konumsal) | Adlandırılmış parametreye çevrildi, varsayılanı var |
| 5 | **`Virgul` testi** | `contains('Virgul')` — büyük V | Not metni `...virgul...` — küçük v | Not metni `'Virgul kullanimi da dogrudur; ...'` olarak düzeltildi |

### 5 numara ayrıca açıklanmalı

Bu test **zaten geçmiyordu.** Faz 2C.1'de not metnini
`'Virgul kullanimi da dogrudur.'` → `'Zaman ifadesi basa da alinabilir; virgul
kullanimi da dogrudur.'` diye değiştirmiştim ama `contains('Virgul')`
beklentisini bırakmıştım. Dart'ta `contains` büyük/küçük harfe duyarlıdır.

Düzeltme: not metni hem testte hem içerikte
`'Virgul kullanimi da dogrudur; zaman ifadesi basa da alinabilir.'` yapıldı.
Beklenti **değiştirilmedi**, gevşetilmedi.

---

## 4. `AkisKontrolcusu` ve `CevapAlani`

Sistematik taradım: ekranların kullandığı **tüm** üyeler zaten tanımlı.

```
Kullanilan: dispose · dogruVerildi · gecikmeliGec · giris · gonderildi
            hepsiniSec · islenmeliMi · kilitli · odak · yeniSoru
CevapAlani: akis · etkin · onGonder · sonucDogruMu · etiket
EKSIK: YOK
```

Bu ikisinde değişiklik **gerekmedi ve yapılmadı**.

---

## 5. Denetleyiciye eklenen kontrol

Bu kırılma sınıfını (çağrı imzası uyumsuzluğu) mevcut denetleyicim
**yakalayamıyordu**. Ayraç, import ve tür kontrolleri bu hatayı görmez.

`tool/dart_statik_denetim.py`'ye **7. kontrol** eklendi: proje içindeki metot
tanımlarının adlandırılmış parametreleri toplanır, çağrı yerlerindeki
adlandırılmış argümanlarla karşılaştırılır.

### Aracın kendisinde bulunan hata

İlk yazımda kontrol **çalışmadı.** Sebep: metot tanımını yakalayan regex
parametre listesinde `{` görünce eşleşmeyi kesiyordu — oysa adlandırılmış
parametre bloğu tam olarak `{` ile başlar. Tanım ayıklayıcısı **dengeli
parantez taramasına** çevrildi.

### Kanıt

Düzelttiğim gerçek hatayı geçici bir kopyaya geri koydum:

```
[HATA ] lib/modules/hikaye/hikaye_okuma_ekrani.dart:115
   'ilerlemeKaydet' cagrisinda taninmayan parametre: ['kod'].
   Tanim lib/data/hikaye_repo.dart:176 sunlari bekliyor:
   ['ekSureMs', 'hikayeKod', 'okunanParagraf', 'toplamParagraf']
```

Yakalıyor. Gerçek proje: **51 dosya, 0 hata, 0 uyarı.**

---

## 6. Ek bütünlük taraması

Ekranların kullandığı model alanlarını tek tek karşılaştırdım:

```
HikayeOzet        kullanilan 7 alan  -> EKSIK YOK
HikayeIstatistik  cagri parametreleri -> EKSIK YOK
HikayeIlerleme    kullanilan alanlar  -> EKSIK YOK
HikayeFiltre      kullanilan 7 alan   -> EKSIK YOK
Repo metotlari    cagrilan 8 metot    -> EKSIK YOK
```

---

## 7. Değiştirilen dosyalar — 4 adet

| Dosya | Değişiklik |
|---|---|
| `lib/data/hikaye_repo.dart` | 4 API uyumsuzluğu (getirici'ler, `ilerlemeGetir`, `kod:`, `filtre:`) |
| `test/hikaye_test.dart` | Yeni API'ye uyarlandı |
| `test/tani_motoru_test.dart` | `Virgul` not metni |
| `lib/core/content/ders_en_a1_001.dart` | Aynı not metni (test verisiyle eşit) |
| `tool/dart_statik_denetim.py` | 7. kontrol + kendi hatasının düzeltilmesi |

**Ekran dosyalarına DOKUNULMADI.** Yeni özellik yok. Refactor yok.
Şema değişmedi. `pubspec.yaml` değişmedi.

---

## 8. Çalıştırma

```powershell
cd $env:USERPROFILE\Documents\english_coach
flutter analyze
flutter test
flutter run -d windows
```

Hata çıkarsa **tam çıktıyı** gönderin. Özellikle şunlara bakın:

- `hikaye_okuma_ekrani.dart` ve `hikaye_kutuphane_ekrani.dart` derleme hataları
- `2C-11 Kabul edilebilir alternatif + not` testi
- `3A-*` hikâye testleri

İsterseniz `python tool/dart_statik_denetim.py` çalıştırıp statik denetimi
kendiniz de görebilirsiniz — yedi kontrol yapıyor.
