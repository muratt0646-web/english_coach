# HOTFIX — Tembel ListView / GridView Test Sorunu

**Tarih:** 2026-07-20
**Kaynak:** Gerçek istisna metni (nihayet tam çıktı)

---

## 1. Gerçek hata

İki turdur "taşma" veya "istisna" arıyordum. **İkisi de değilmiş.**

```
Expected: exactly one matching candidate
  Actual: Found 0 widgets with text "Basla"
  file:///C:/english_coach/test/sablon_ders_test.dart line 195
```

193. ve 194. satırlar **geçti** — başlık ve `1/12` bulundu. Ekran doğru
çiziliyor. Yalnızca `Basla` düğmesi bulunamadı.

## 2. Kök neden

`ListView` **tembeldir**: yalnızca görünen alandaki çocukları kurar.

Giriş aşamasının içeriği ~436px (başlık + kart + bölüm başlığı + 5 kazanım
+ düğme). Test görünüm alanı 800×600 ve AppBar ~94px yer kaplıyor →
**düğme ekranın altında kalıyor, hiç kurulmuyor.**

Gerçek uygulamada sorun yok; kullanıcı kaydırıyor.

### Bunu daha önce görmüştüm

2D-1'de `GridView.builder` için **aynı kök nedeni** teşhis edip geniş
görünüm alanıyla çözmüştüm. Burada tanımadım ve iki tur "taşma" hipotezi
kovaladım. Kaybedilen zaman benim hatam.

## 3. Düzeltme

Testte görünüm alanı büyütüldü — **üretim kodu değişmedi**:

```dart
Future<void> genisEkran(WidgetTester tester) async {
  tester.view.physicalSize = const Size(1400, 2400);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);
}
```

`4A-5` grubundaki **beş** widget testine ve mimari testindeki widget
testine uygulandı.

## 4. Yanlış hipotez hakkında dürüst not

Önceki turda AppBar alt şeridini 24 → 38px yaptım; gerekçem "taşıyor"du.
**Taşma hiç gözlenmedi** — istisna metninde `RenderFlex overflowed` yok.

Değişikliği geri almıyorum (24px hesaben sınırdaydı: 4 + 8 + ~16 = 28),
ama koddaki yorumu düzelttim: artık "taşıyordu" değil, "sınırdaydı, pay
bırakıldı" yazıyor. Yanlış gerekçeyi kodda bırakmak ileride yanıltır.

## 5. Değişen dosyalar

| Dosya | Değişiklik |
|---|---|
| `test/sablon_ders_test.dart` | 5 widget testine geniş görünüm alanı |
| `test/sablon_ders_mimari_test.dart` | 1 widget testine aynısı |
| `lib/modules/gramer/sablon_ders_ekrani.dart` | Yalnızca yorum düzeltmesi |

**Ürün davranışı değişmedi.**

## 6. Bu hata sınıfı için kalıcı ders

`flutter test` varsayılan olarak **800×600** bir görünüm kullanır. Uzun
içerikli ekranlarda `ListView`/`GridView` alttaki widget'ları kurmaz ve
`find.text(...)` onları bulamaz.

İki seçenek var:
- Görünüm alanını büyütmek (bu projede tercih edildi)
- `tester.scrollUntilVisible(...)` ile kaydırmak

Statik denetleyici bunu **yakalayamaz**: kod kusursuz, sorun yalnızca test
ortamının boyutunda.
