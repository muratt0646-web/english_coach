# PHASE_2F_PROGRESS.md — Flow Mode / Klavye ile Kesintisiz Alıştırma

**Tarih:** 2026-07-19
**Tip:** Etkileşim iyileştirmesi — **yeni öğrenme içeriği eklenmedi**

---

## 1. Doğrulama beyanı

> **Bu oturumda Flutter kurulu değildir.** `flutter analyze`, `flutter test`,
> `flutter run -d windows` komutlarını **çalıştırmadım** ve **PASS yazmıyorum.**

| Komut | Beklenen | Gerçek sonuç |
|---|---|---|
| `flutter pub get` | değişiklik yok (pubspec dokunulmadı) | ⬜ |
| `flutter analyze` | `No issues found!` | ⬜ |
| `flutter test` | 72 mevcut + 16 yeni = **88 test** | ⬜ |
| `flutter run -d windows` | Enter ile kesintisiz alıştırma | ⬜ |

---

## 2. Tasarım kararı — mantık neden ortak dosyada

Flow Mode iki ekranı birden etkiliyor: **pekiştirme** ve **ders**. Odak, kilit
ve çift-Enter mantığını iki yere kopyalamak, iki farklı hata kaynağı yaratırdı.

Bunun yerine ortak bir yardımcı yazdım:

```
lib/shared_ui/akis_kontrolcusu.dart
  ├── AkisKontrolcusu   odak + kilit + zamanlayici yasam dongusu
  └── CevapAlani        tek satirli, Enter gonderen cevap alani
```

Her iki ekran da **aynı** `AkisKontrolcusu` örneğini kendi durumu için kullanıyor
ve **tek** merkezi `cevabiKontrolEt()` fonksiyonuna sahip.

---

## 3. Sartname maddelerinin karşılığı

### 3.1 Otomatik odak

`autofocus: true` **tek başına bırakılmadı.** Üç katman birlikte çalışıyor:

| Katman | Ne yapar |
|---|---|
| `FocusNode odak` | `AkisKontrolcusu` içinde oluşturulur, `dispose` edilir |
| `autofocus: true` | Alan ilk kez çizildiğinde odağı alır |
| `odakla()` | **Her yeni soruda** `addPostFrameCallback` ile `requestFocus()` |

```dart
void odakla() {
  if (_atildi) return;
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (_atildi) return;
    if (odak.canRequestFocus) odak.requestFocus();
  });
}
```

`yeniSoru()` her geçişte `odakla()` çağırır — odak garanti olarak cevap alanına döner.

**Kapsam:** TR→EN, EN→TR, boşluk doldurma, harfleri karışık kelime, cümle içinde
kullanma, ders görevleri (G-BD/G-SR/G-CT) ve düşünme katmanı blok alıştırması.

### 3.2 Enter ile gönderme

`maxLines: 1` + `textInputAction: TextInputAction.done` + `onSubmitted`.
Tek satır olduğu için Enter yeni satır açmaz, gönderir.

Elemeler `islenmeliMi()` içinde **tek yerde**:

```dart
bool islenmeliMi(String cevap) {
  if (_atildi || kilitli || dogruVerildi) return false;   // gecis / bitmis soru
  final String t = cevap.trim();
  if (t.isEmpty) return false;                            // bos cevap
  if (sonGonderilen != null && sonGonderilen == t) return false;  // ayni cevap
  return true;
}
```

Böylece **aynı cevap iki kez kaydedilmez** ve boş Enter hiçbir şey yapmaz.

### 3.3 Doğru cevaptan sonra otomatik geçiş

```dart
if (dogru) {
  _akis.gecikmeliGec(gecisSuresi, _ileri, hala: () => mounted);
}
```

`gecisSuresi = 400 ms` (sartname: 300–500 ms).

Sıra: yeşil kenarlık + ✓ simgesi → 400 ms → `_ileri()` → `yeniSoru()` →
alan temizlenir → odak geri döner.

**Çift geçiş koruması:** `gecikmeliGec()` `kilitli = true` yapar. Geçiş
süresince gelen her Enter `islenmeliMi()` tarafından yutulur. Testi var (2F-2).

### 3.4 Yanlış cevap davranışı

```dart
} else {
  _akis.hepsiniSec();   // metin secili kalir, odak alanda kalir
}
```

- Otomatik geçiş **yok**
- Kırmızı kenarlık + ✕ simgesi
- Metin **tamamen seçili** → kullanıcı yazmaya başlayınca eski cevap değişir
- Odak alanda kalır
- İstatistik gönderim başına **bir kez** yazılır; aynı yanlış cevabın tekrarı sayılmaz

### 3.5 Buton davranışı

"Devam" düğmesi **kaldırıldı** (doğru cevapta otomatik geçiş var).
"Cevapla" → **"Kontrol Et"** olarak kaldı ve **Enter ile aynı fonksiyonu** çağırıyor:

```dart
FilledButton(onPressed: cevabiKontrolEt, child: const Text('Kontrol Et'))
CevapAlani(onGonder: cevabiKontrolEt)
```

Altında ipucu: *"Enter tuşu ile de cevaplayabilirsiniz."*

### 3.6 Odak yaşam döngüsü

| Kural | Uygulama |
|---|---|
| FocusNode oluşturulur | `AkisKontrolcusu` yapıcısında |
| `dispose` edilir | `AkisKontrolcusu.dispose()` → ekran `dispose`'unda çağrılır |
| Controller `dispose` edilir | Aynı yerde |
| Ekran kapalıyken `requestFocus`/`setState` yok | `_atildi` bayrağı + `hala: () => mounted` |
| `mounted` kontrolü | `_ileri()`, `cevabiKontrolEt()`, zamanlayıcı geri çağrısı |
| Zamanlayıcı iptali | `dispose`, `yeniSoru`, `gecisiIptalEt` |

`dispose` sonrası çağrılar sessizce hiçbir şey yapmaz — testi var (2F-7).

---

## 4. Değiştirilen dosyalar

| Dosya | Değişiklik |
|---|---|
| `lib/shared_ui/akis_kontrolcusu.dart` | **YENİ** — `AkisKontrolcusu` + `CevapAlani` |
| `lib/modules/kelime/pekistirme_ekrani.dart` | Merkezi `cevabiKontrolEt()`, otomatik geçiş, "Devam" kaldırıldı |
| `lib/modules/gramer/ders_ekrani.dart` | Aynı akış; blok alıştırması da Flow Mode |
| `test/akis_kontrolcusu_test.dart` | **YENİ** — 16 test |

**Dokunulmayanlar:** Tanı Motoru v3, Pekiştirme Motoru, `KelimeRepo`, şema,
`pubspec.yaml`, içerik dosyaları, ana ekran, diğer modüller, mevcut 72 test.

**Yeni paket eklenmedi. Şema değişmedi. İçerik eklenmedi.**

---

## 5. Eklenen testler — 16 adet

| Grup | Kapsam |
|---|---|
| `2F-1` | Boş cevap işlenmez · aynı cevap iki kez işlenmez · farklı cevap işlenir |
| `2F-2` | Kilitliyken Enter yutulur · **art arda 3 Enter → geçiş tam 1 kez** · ekran kapalıysa geçiş yok · iptal çalışır |
| `2F-3` | Doğru verildikten sonra yeni gönderim işlenmez |
| `2F-4` | `yeniSoru()` tüm durumu sıfırlar · bekleyen geçişi iptal eder |
| `2F-5` | Yanlış cevapta metin **tamamen seçili** olur |
| `2F-6` | Alan **tek satırlı** · Enter gönderir · açılışta odak alanda · doğru/yanlış görsel geri bildirim farklı |
| `2F-7` | `dispose` sonrası hiçbir işlem yapılmaz, istisna fırlatılmaz |

Testler **veritabanı gerektirmez.**

---

## 6. Ölçümler (derleme değil)

```
tool/dart_statik_denetim.py  ->  0 hata, 0 uyari (46 dosya)
   null/non-nullable · import hedefi · mimari sinir
   kullanilmayan import · final->const · ayrac dengesi
```

> Bu araç `flutter analyze` yerine geçmez. Özellikle **odak davranışını ve
> zamanlayıcı etkileşimini** doğrulayamaz — bunlar ancak gerçek çalıştırmada
> görülür.

---

## 7. Bilinen sınırlar

| # | Konu | Not |
|---|---|---|
| S-1 | **Seçmeli sorularda Enter yok** | Şıklı sorularda (E1, E2, E6) seçim fare/dokunma ile yapılır; "Kontrol Et" düğmesi çalışır. Doğru cevapta otomatik geçiş **onlarda da** var. Klavye ile şık seçimi (1–4 tuşları) bu fazda yapılmadı |
| S-2 | Sunum adımlarında odak yok | "Anladım" düğmesi fare/Tab ile; metin alanı olmadığı için odak hedefi yok |
| S-3 | Geçiş süresi sabit 400 ms | Ayar ekranından değiştirilebilir yapılmadı |
| S-4 | Yanlış cevapta "doğru cevap" hemen gösteriliyor | Kullanıcı düzeltmeden önce cevabı görüyor. İstenirse gizlenebilir — davranış değişikliği olur, bu fazda yapmadım |

---

## 8. Çalıştırma ve doğrulama

```powershell
cd $env:USERPROFILE\Documents\english_coach
flutter analyze
flutter test
flutter run -d windows
```

### Fareye dokunmadan test edin

1. Ana ekran → **Kelime Akademisi** → 20 kelimeyi öğrenin → **Pekiştirmeye Başla**
2. **Boşluk doldurma** etkinliğine gelin (3. etkinlik)
3. İmleç cevap alanında **hazır** olmalı — tıklamaya gerek yok
4. Doğru cevabı yazıp **Enter** → yeşil kenarlık → ~0,4 sn → sonraki soru,
   alan boş, imleç hazır
5. **Art arda hızlıca Enter'a basın** → soru **atlanmamalı**
6. Yanlış cevap yazıp Enter → kırmızı kenarlık, **metin seçili**, geçiş yok
7. Doğrudan yazmaya başlayın → eski cevap değişmeli
8. Boş alanda Enter → hiçbir şey olmamalı
9. Aynı yanlış cevabı iki kez gönderin → yanlış sayacı **bir** artmalı

Aynı akış **Gramer → EN-A1-001 → görevler** bölümünde de geçerli.
