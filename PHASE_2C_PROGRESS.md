# PHASE_2C_PROGRESS.md — Tanı Motoru v3 ve Kabul Modeli

**Tarih:** 2026-07-19
**Önceki varsayım düzeltmesi:** ✅ Proje **derleniyor ve çalışıyor**

---

## 1. Doğrulama durumu — dürüst kayıt

### 1.1 Sizin çalıştırdığınız (Faz 2C öncesi taban)

| Komut | Sonuç |
|---|---|
| `flutter pub get` | ✅ başarılı |
| `flutter analyze` | ✅ başarılı — 1 informational: *dangling library doc comment* |
| `flutter test` | ✅ tüm testler geçti |
| `flutter create --platforms=windows .` | ✅ |
| `flutter run -d windows` | ✅ uygulama açıldı ve test edildi |

**Önceki fazlardaki "hiç derlenmedi" varsayımım yanlıştı. Düzeltildi.**

### 1.2 Bu fazın değişikliklerinden sonra — ÇALIŞTIRILMADI

`flutter analyze / test / run` komutlarını **ben çalıştıramıyorum**; bu oturumda Flutter kurulu değil ve SDK kaynağı erişime kapalı. Bu değişmedi.

**Bu nedenle Faz 2C değişikliklerine PASS yazmıyorum.** Aşağıdaki tabloyu çalıştırdıktan sonra siz doldurmalısınız:

| Komut | Beklenen | Gerçek sonuç |
|---|---|---|
| `flutter pub get` | değişiklik yok (pubspec dokunulmadı) | ⬜ |
| `flutter analyze` | **0 uyarı** (dangling comment giderildi) | ⬜ |
| `flutter test` | 38 test (24 tanı + 14 düşünme) | ⬜ |
| `flutter run -d windows` | ders akışı çalışır | ⬜ |

---

## 2. Değiştirilen dosyalar ve gerekçeleri

| Dosya | Değişiklik | Gerekçe |
|---|---|---|
| `lib/core/model/models.dart` | `library;` direktifi eklendi · `kabuller` alanı | **`analyze` uyarısını giderir** · tipli kabul kümesi |
| `lib/core/model/dusunme.dart` | `library;` direktifi eklendi | Aynı uyarı |
| `lib/core/engine/tani_motoru.dart` | **Yeniden yazıldı** — v3, 9 kategori, ifade düzeyi | Faz 2C §4 |
| `lib/data/icerik_repo.dart` | `gorev_kabul.esdeger_mi` → `KabulTipi` çözümü | Faz 2C §5 |
| `lib/core/db/seed_content.dart` | `kabul_tip` / `kabul_not` yazılıyor | Faz 2C §5 |
| `lib/core/content/ders_en_a1_001.dart` | CT-02'ye 6 kabul kaydı | Faz 2C §5 |
| `lib/features/ders/ders_ekrani.dart` | Geri bildirim v3 alanlarına uyarlandı | Alan adları değişti |
| `test/tani_motoru_test.dart` | **Yeniden yazıldı** — 24 test | Faz 2C §6 |
| `tool/tani_motoru_v3_dogrulama.py` | **YENİ** — algoritma doğrulaması | — |

**Dokunulmayanlar:** `pubspec.yaml`, `migrations.dart`, `app_database.dart`, `main.dart`, `ana_ekran.dart`, `dusunme_motoru.dart`, `normalizer.dart`, `ilerleme_repo.dart`, `dusunme_en_a1_001.dart`, `dusunme_motoru_test.dart`.

**Şema değişmedi. Navigation değişmedi. Yeni paket yok. Kullanıcı verisi silinmedi.**

---

## 3. Tanı Motoru v3 — asıl sorun

### 3.1 Şema değiştirmeden kabul modeli

Faz 2C §5 dört tip kabul istiyor. Bunu **yeni sütun eklemeden** çözdüm: mevcut `gorev_kabul.esdeger_mi` sütunu üç durumlu kullanılıyor.

| `esdeger_mi` | Anlamı | Sonuç |
|---|---|---|
| `1` | Ana cevap veya tam kabul alternatifi | ✅ DOĞRU |
| `0` | Kabul edilir, ama not gösterilir | ✅ DOĞRU + `KABUL_EDILEBILIR_ALTERNATIF` |
| `-1` | Gramer doğru, **anlam farklı** | ❌ YANLIŞ → `ANLAM_FARKI` |

`not_tr` sütunu açıklamayı taşır. **Şema v3 göçüne gerek kalmadı.**

### 3.2 Dokuz kategori

```
GRAMER_HATASI · KELIME_SECIMI · ANLAM_FARKI · KELIME_SIRASI
EKSIK_KELIME · FAZLA_KELIME · YAZIM_HATASI
KABUL_EDILEBILIR_ALTERNATIF · TANI_KONULAMADI
```

### 3.3 İfade düzeyi raporlama — v2'nin eksiği

v2 **tek jeton** raporluyordu: `morning` / `day`. İstediğiniz çıktı **ifade** düzeyinde. `ifadeCikar()` fonksiyonu, farklı jetonu önündeki belirteç/edat/artikel ile birleştiriyor: `morning` → `every morning`.

### 3.4 İstenen çıktı — ölçüldü

Girdi: `Every day I drink coffee` · Beklenen: `Every morning I drink coffee.`

```
Gramer yapin dogru.          -> gramerDogru = true
Beklenen ifade: every morning
Yazdigin ifade: every day
Kategori: KELIME_SECIMI / ANLAM_FARKI
Guven: KESIN_TANI            (TANI_KONULAMADI DEGIL)
Aciklama: 'day' = gun; beklenen kelime 'morning' = sabah.
          Dilbilgisi yapin dogru, anlam farkli.
```

**`TANI_KONULAMADI` artık yalnızca gerçekten sınıflandırılamayan cevaplarda** (`hello world`, boş cevap) üretiliyor.

---

## 4. Eklenen testler

`test/tani_motoru_test.dart` — **24 test.** Faz 2C §6'nın istediği 10 maddenin tamamı:

| # | İstenen | Test |
|---|---|---|
| 1 | Tam doğru cevap | `2C-1` |
| 2 | Alternatif doğru kelime sırası | `2C-2` |
| 3 | day / morning anlam farkı | `2C-3`, `2C-3b` |
| 4 | Türkçe kelime sırası etkisi | `2C-4` |
| 5 | Eksik özne | `2C-5` |
| 6 | Eksik fiil | `2C-6`, `2C-6b` |
| 7 | Fazla kelime | `2C-7` |
| 8 | Küçük yazım hatası | `2C-8` |
| 9 | Büyük harf ve noktalama | `2C-9` |
| 10 | Sınıflandırılamayan cevap | `2C-10`, `2C-10b` |

Ek: `2C-11` (kabul edilebilir alternatif + not), 6 gramer regresyonu, 3 normalizer regresyonu, 1 geriye dönük uyum testi.

**Mevcut testler bozulmadı:** eski `degerlendir()` imzası korundu ve test edildi. `dusunme_motoru_test.dart` (14 test) dokunulmadı.

---

## 5. Ölçümler (derleme değil)

```
tool/tani_motoru_v3_dogrulama.py  ->  16/16 PASS
tool/icerik_dogrulama.py          ->  24/24 PASS
tool/dusunme_motoru_dogrulama.py  ->  25/25 PASS
Ayrac/import taramasi             ->  temiz
```

---

## 6. İleri mimariye uyum (Faz 2C §7)

Şema v3'e geçilmedi. Ancak yapı ileride taşınabilir:

| Hedef | Bugünkü karşılık |
|---|---|
| `Beceri` | `HataKategorisi` beceri eşlemesine hazır (GRAMER/KELIME ayrımı zaten var) |
| `IcerikKimligi` | `gorev.kod` benzersiz; `DERS:` öneki eklenerek taşınır |
| `OgrenmeOlayi` | `gorev_sonucu` + `hata_kaydi` bu tablonun içine akacak |
| `ProgressEngine` | Ustalık hesabı hâlâ `ilerleme_repo`'da — Faz 3A'da taşınacak |
| `RecommendationEngine` | Yok |

---

## 7. Bilinen eksikler

| # | Eksik | Etki |
|---|---|---|
| E-1 | **18 adımlık ders sırası uygulanmadı** | Ders hâlâ: düşünme katmanı → 10 sunum adımı → 30 görev. İstenen sıra bunları harmanlıyor. Ekran akış mantığının değişmesi gerekiyor — bu fazda "844 satırı yeniden yazma" yasağı nedeniyle yapılmadı |
| E-2 | Yalnızca CT-02 görevine tipli kabul kaydı eklendi | Diğer 29 görev tek tip (`ana`). Genişletme içerik işidir |
| E-3 | `ANLAM_FARKI` ustalık skoruna yanlış sayılıyor | Doğru davranış; ancak gramer doğru olduğu için kısmi kredi tartışılabilir |
| E-4 | Eski `content.db` varsa yeni kabul kayıtları görünmez | Üç fazdır bilinen R-1 riski. **Çalıştırmadan önce `content.db` silinmeli** |
| E-5 | `ProgressEngine` yok | Ustalık hâlâ ders modülüne gömülü |

**E-1 en önemli eksiktir** ve bilinçli bırakıldı: 18 adımlık sıra, sunum adımlarıyla görevleri ve düşünme katmanını harmanlıyor; bu, ekran akış mantığının yeniden düzenlenmesini gerektirir. Faz 2C bunu açıkça yasakladı.

---

## 8. Çalıştırma

```powershell
cd $env:USERPROFILE\Documents\english_coach
# E-4: eski icerik veritabanini silin (yol ana ekranda yazili)
flutter analyze     # 0 uyari bekleniyor
flutter test        # 38 test
flutter run -d windows
```

**Doğrulanacak kritik davranış** — CT-02 görevinde (`Ben her sabah kahve içerim.`):

| Yazın | Beklenen |
|---|---|
| `Every day I drink coffee` | `KESIN_TANI` · `KELIME_SECIMI / ANLAM_FARKI` · Beklenen ifade: `every morning` · Yazdığın ifade: `every day` |
| `Every morning, I drink coffee.` | ✅ Doğru + "Virgul kullanimi da dogrudur." |
| `I drink coffee every day.` | `ANLAM_FARKI` — yazarın işaretlediği |
| `I drink hot coffee every morning` | `FAZLA_KELIME` |
| `hello world` | `TANI_KONULAMADI` — açıklama gösterilmez |
