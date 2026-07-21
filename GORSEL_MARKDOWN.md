# Görsel İyileştirme — Ders Metni Biçimlendirme

**Tarih:** 2026-07-20

---

## 1. Doğrulama beyanı

> Flutter bu oturumda yok; `analyze` ve `test` **çalıştırmadım**, PASS yazmıyorum.

---

## 2. Bulunan sorun

EN-A1-001 — **Gramer listesindeki ilk ders** — ham markdown olarak
çiziliyordu:

```
| Cumle | Anlam |
|---|---|
| The dog bit the man. | Kopek adami isirdi. |
```

Kullanıcı ekranda tam olarak bunu görüyordu: boru işaretleri, `---`
ayırıcıları, `#` başlık işaretleri, `**yıldızlar**`.

**Sayım:** 70 tablo satırı · 20 başlık · 51 kalın vurgu · 7 alıntı.

Bu, uygulamanın en görünür görsel kusuruydu ve ilk açılan derste duruyordu.

---

## 3. Çözüm — yeni paket eklemeden

`flutter_markdown` eklemedim: sürüm riski taşıyor ve ihtiyacımız olan alt
küme küçük. Bunun yerine `lib/shared_ui/basit_markdown.dart` yazdım.

| Biçim | Önce | Sonra |
|---|---|---|
| Tablo | `\| a \| b \|` | Gerçek `Table`, kenarlıklı, başlık satırı gölgeli |
| Başlık | `# Konu` | Tema rengi + uygun punto |
| Kalın | `**önemli**` | **önemli** |
| Alıntı | `> metin` | Sol kenarlıklı vurgu kutusu |
| Madde | `- x` | • x |
| Ayırıcı | `---` | `Divider` |

**Tasarım kararı:** Desteklenmeyen her şey **düz metin olarak korunur**.
İçerik hiçbir koşulda kaybolmaz — çizici tanımadığı satırı olduğu gibi basar.

### Yanlış biçimli girdiye dayanıklılık

- Eksik hücreli tablo satırı → boş hücreyle tamamlanır, çökmez
- Boş girdi → çökmez
- Tablo ayırıcı satırı (`|---|---|`) → hücre olarak **çizilmez**

Üçünün de testi var.

---

## 4. Eklenen testler — 7 adet

| Test | Doğruladığı |
|---|---|
| Tablo gerçek `Table` olarak çizilir | Hücreler ayrı metin, **ham `\|` ekranda yok** |
| Başlıklar ham `#` ile görünmez | `#` hiç bulunmuyor |
| `**kalın**` yıldızsız ve kalın | `TextSpan` ağacında `fontWeight: w700` |
| Alıntı ve madde işaretleri | `>` ve `-` görünmüyor |
| Desteklenmeyen biçim korunur | İçerik kaybolmuyor |
| Boş girdi | Çökmüyor |
| Düzensiz tablo | Çökmüyor |

---

## 5. Değişen dosyalar

| Dosya | Değişiklik |
|---|---|
| `lib/shared_ui/basit_markdown.dart` | **YENİ** — 210 satır |
| `lib/modules/gramer/ders_ekrani.dart` | `SelectableText` → `BasitMarkdown` |
| `test/basit_markdown_test.dart` | **YENİ** — 7 test |

`pubspec.yaml` **değişmedi**. Şablon dersler (EN-A1-002/003/011) zaten
yapılandırılmış veri kullanıyor; onlar etkilenmedi.

---

## 6. Etkilenmeyen ama iyileştirilebilecek yerler

Şunları **yapmadım** — hangisinin öncelikli olduğunu bilmiyorum:

| Yer | Şu an | Olabilecek |
|---|---|---|
| Ana ekran kartları | Tek renk, ikon | Modüle göre renk kodu |
| Hikâye okuma | Vurgulu kelimeler renkli | Renklerin ne anlama geldiğini gösteren küçük açıklama |
| Kelime kartı | Yoğun metin | Ön/arka yüz çevirme |
| 12 aşama göstergesi | İnce çubuk + `1/12` | Aşama noktaları (tamamlanan/aktif) |
| Başarı ekranı | Sayı kutuları | Alt konu bazında çubuk grafik |
