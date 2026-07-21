# Çalıştırma Talimatları — Faz 1B-1

Windows geliştirme makinenizde, PowerShell'de sırayla çalıştırın.
**Her adımın çıktısını bana gönderin.** Çıktıyı görmeden hiçbir şeye PASS yazmayacağım.

---

## Adım 0 — Ortam kontrolü

```powershell
flutter --version
flutter doctor -v
```

**Görmem gereken:** Flutter sürümü, Dart sürümü ve `flutter doctor` içinde
`[√] Visual Studio - develop Windows apps` satırı.

Bu satır `[X]` ise Windows derlemesi **başlamaz**. Visual Studio Installer'dan
**"Desktop development with C++"** iş yükünü kurun, sonra devam edin.

---

## Adım 1 — Projeyi oluştur ve dosyaları yerleştir

```powershell
cd $env:USERPROFILE\Documents
flutter create --platforms=windows english_coach
cd english_coach
```

Sonra size verdiğim dosyaları proje köküne kopyalayın
(`pubspec.yaml`, `analysis_options.yaml`, `lib/`, `test/`, `tool/`),
`flutter create`'in ürettiği `lib/main.dart` dosyasının **üzerine yazın.**

```powershell
flutter config --enable-windows-desktop
flutter pub get
```

**Görmem gereken:** `flutter pub get` çıktısının tamamı — özellikle sürüm
çözümleme hataları veya uyarılar (belirsizlik B-1).

---

## Adım 2 — Statik analiz

```powershell
flutter analyze
```

**Beklenen:** `No issues found!`

Hata çıkarsa **bana gönderin, önce onu çözeriz.** En olası iki hata:
- `withValues` bulunamadı → Flutter sürümünüz eski, `.withOpacity(0.12)` ile değiştireceğiz (B-4)
- `switch` ifade sözdizimi → Dart SDK < 3.3 (B-5)

---

## Adım 3 — Birim testleri

```powershell
flutter test
```

**Beklenen:** 18 test geçmeli. Bu testler tanı motorunun üç durumunu doğrular.

---

## Adım 4 — Windows'ta çalıştır

```powershell
flutter run -d windows
```

**Beklenen ekran:**
- Başlık: `EN-A1-001 / Temple cümle sırası (SVO)`
- İlerleme çubuğu: %0, `0 / 3 görev`
- `Dinleme: olculmedi (gramer ustaligini etkilemez)` satırı
- `Derse Başla` düğmesi
- Alt kartta SQLite sürümü ve `user.db` yolu

---

## Adım 5 — Çıkış şartlarını doğrula

Uygulama açıldıktan sonra sırayla:

| # | Yapılacak | Doğrulanan şart |
|---|---|---|
| 1 | Ekranın açıldığını ve ders başlığının göründüğünü kontrol edin | Şart 1, 2 |
| 2 | "Derse Başla" → 5 sunum adımını geçin | Şart 2 |
| 3 | 1. görev (boşluk): `read` yazın | Şart 3 |
| 4 | 2. görev (sıralama): `I drink coffee.` yazın | Şart 3 |
| 5 | 3. görev: **`Every morning I drink coffee.`** yazın | **Şart 4** — 2. kabul cevabı, DOĞRU dönmeli |
| 6 | Ana ekrana dönün — ilerleme %100 olmalı | Şart 6 |

**Sonra tanının üç durumunu test edin.** Derse tekrar girip 3. göreve gelin:

| Yazacağınız | Beklenen etiket | Beklenen kod |
|---|---|---|
| `I coffee drink every morning` | `OLASI_TANI` (WO-02) | WO-02 |
| `I drink tea every morning` | `OLASI_TANI` | LEX-01 |
| `hello world` | `TANI_KONULAMADI` — **açıklama gösterilmemeli** | LEX-99 |

**Şart 5** bu üç deneme ile doğrulanır.

---

## Adım 6 — Kalıcılık ve çevrimdışı

```powershell
# Uygulamayi tamamen kapatin (pencereyi kapatin), sonra:
flutter run -d windows
```

**Görmem gereken:** Ana ekrandaki "Toplam kayıtlı görev sonucu" sayısının
kapanmadan önceki değerle **aynı** olması, ilerleme çubuğunun korunması. → **Şart 7**

Sonra **Wi-Fi'yi ve Ethernet'i kapatın**, uygulamayı yeniden çalıştırın ve
Adım 5'i tekrarlayın. Her şey aynı çalışmalı. → **Şart 8**

---

## Bana gönderecekleriniz

1. `flutter --version` ve `flutter doctor -v` tam çıktısı
2. `flutter pub get` çıktısı
3. `flutter analyze` çıktısı
4. `flutter test` çıktısı
5. `flutter run -d windows` konsol çıktısı
6. Ana ekran ve tanı geri bildirim ekranlarının görüntüsü (varsa)
7. Adım 5 ve 6'daki gözlemleriniz

Hata çıkan ilk adımda durun ve o adımın çıktısını gönderin — sonraki adıma geçmeyiz.
