# HOTFIX — Taşma ve Eskimiş Test Beklentileri

**Tarih:** 2026-07-20
**Kaynak:** Gerçek `flutter test` çıktısı — 176 geçti, **12 düştü**

---

## 1. Doğrulama durumu

| Komut | Sonuç | Kaynak |
|---|---|---|
| `flutter analyze` | ✅ **`No issues found!`** | **Sizin çalıştırmanız** |
| `flutter test` | 🔴 **176 geçti / 12 düştü** | **Sizin çalıştırmanız** |

Bu, projenin **ilk doğrulanmış temiz analyze**'ı. Derleme hataları kapandı.

> Bu turdaki düzeltmeleri **çalıştıramadım**; PASS yazmıyorum.

---

## 2. Tespit edilen iki kök neden

### A. `RenderFlex overflowed by 8.0 pixels` — gerçek kusur

`ModulKarti` içeriği 204px, ızgaranın verdiği alan 196px.

```
constraints: BoxConstraints(w=354.0, h=196.0)
size: Size(354.0, 196.0)   → 8px taşma
```

Bu bir düzen hatası ve **testlerde istisna fırlatıyor**; `ModulIzgarasi`
çizen her test düşüyor.

**Düzeltme — iki katmanlı:**

1. Açıklama metni `Expanded` içine alındı. Artık kalan boşluğu **emiyor**;
   yazı tipi ölçüleri değişse bile taşma olmaz.
2. `mainAxisExtent` 236 → **252** (ek pay).

Sabit yükseklik ~134px, kart içi alan ~212px → açıklamaya ~78px kalıyor
(2–3 satır rahat sığar).

### B. Eskimiş test beklentileri — testler geride kalmış

Faz 2E'de Kelime Akademisi başlığı değişti:

```
Eski: 'Kelime Akademisi'
Yeni: 'Kelime Akademisi · Paket 1'
```

`2D-3` ve `2D-6` hâlâ **tam eşleşme** arıyordu → düşüyorlardı.

`find.text(...)` → `find.textContaining(...)` yapıldı. **Beklenti
gevşetilmedi**; ekran kasıtlı değişti, test ona uyarlandı.

---

## 3. Dürüst bir eksik: 12 düşüşün hepsini göremiyorum

Çıktıda yalnızca **son** düşen test adı görünüyor (`2D-6`). Yukarıdaki iki
neden tahminen **6 testi** açıklıyor:

| Neden | Etkilenen |
|---|---|
| Taşma → `ModulIzgarasi` çizen testler | ~4 |
| Başlık değişikliği → `2D-3`, `2D-6` | 2 |

**Kalan ~6 düşüşün nedenini bilmiyorum.** Tahmin yürütüp körlemesine
"düzeltme" yapmayacağım.

---

## 4. Kalan listeyi almak için

```powershell
flutter test --reporter compact 2>&1 | Select-String -Pattern "\[E\]"
```

Bu yalnızca **düşen test adlarını** basar, uzun yığın izlerini atlar.
Çıktı birkaç satır olacak; onu gönderin.

Alternatif — dosya bazında:

```powershell
flutter test test/ana_ekran_test.dart --reporter compact
flutter test test/sablon_ders_test.dart --reporter compact
flutter test test/hikaye_test.dart --reporter compact
```

Hangi dosyada kaç düşüş olduğunu gösterir.

---

## 5. Değişen dosyalar — 3 adet

| Dosya | Değişiklik |
|---|---|
| `lib/shared_ui/modul_karti.dart` | Açıklama `Expanded` içine alındı |
| `lib/shared_ui/modul_izgarasi.dart` | `mainAxisExtent` 236 → 252 |
| `test/ana_ekran_test.dart` | `2D-3` ve `2D-6` güncel başlığa uyarlandı |

Yeni özellik yok. Şema, `pubspec.yaml` ve diğer ekranlar değişmedi.

---

## 6. Denetleyici hakkında not

Statik denetleyicim bu iki hatayı **yakalayamaz ve yakalayamayacak**:

- **Taşma** çalışma zamanında, gerçek düzen ölçüleriyle oluşur. Statik
  analiz piksel hesabı yapamaz.
- **Eskimiş test beklentisi** sözdizimsel olarak geçerlidir; yalnızca
  çalıştırınca anlaşılır.

Bu, aracın sınırıdır — `flutter test`'in yerini alamayacağının somut örneği.
Dokuz kontrol derleme hatalarını yakalıyor, davranış hatalarını yakalamıyor.
