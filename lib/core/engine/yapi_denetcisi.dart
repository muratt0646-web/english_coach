import '../model/paket_kelime.dart';
import 'normalizer.dart';
import 'tani_motoru.dart';

/// Yapisal denetim bulgusu.
class YapiBulgusu {
  final String kod;
  final String mesaj;
  final String? oneri;

  /// true = kesin hata · false = dikkat cekilen nokta
  final bool ciddi;

  const YapiBulgusu({
    required this.kod,
    required this.mesaj,
    required this.ciddi,
    this.oneri,
  });
}

/// REFERANSSIZ yapisal denetim.
///
/// Tani Motoru bir KARSILASTIRICI'dir: cevabi kabul kumesiyle esler ve
/// FARKI teshis eder. Kullanici kendi cumlesini yazdiginda referans yoktur.
///
/// Bu sinif farkli calisir: cumlenin KENDI yapisini inceler ve Turkce
/// konusanlarin yaptigi belirli hata siniflarini arar.
///
/// SINIRLARI (acikca):
///   · Sozlukte olmayan kelimeler tur bilgisi tasimaz; o kelimelerle
///     ilgili kurallar ATLANIR.
///   · Anlam, zaman uygunlugu ve es dizim DENETLENMEZ.
///   · Birden fazla yan cumleli yapilar DENETLENMEZ.
///   · Belirsiz durumda kural SESSIZ kalir — yanlis alarm vermez.
class YapiDenetcisi {
  const YapiDenetcisi._();

  /// Ozne olabilecek zamirler.
  static const Set<String> _tekilUcuncu = <String>{'he', 'she', 'it'};
  static const Set<String> _cogulOzne = <String>{'you', 'we', 'they'};

  /// Sifat gibi davranan, be gerektiren yaygin kelimeler.
  static const Set<String> _sifatlar = <String>{
    'happy', 'sad', 'tired', 'ready', 'busy', 'kind', 'quiet', 'loud',
    'new', 'old', 'big', 'small', 'cheap', 'expensive', 'difficult',
    'easy', 'important', 'hungry', 'cold', 'hot', 'late', 'early',
    'right', 'wrong', 'clean', 'dirty', 'young', 'beautiful', 'fresh',
  };

  /// Cumleyi denetler.
  ///
  /// [sozluk] uygulamanin kelime havuzu; tur bilgisi buradan gelir.
  static List<YapiBulgusu> denetle(
    String cumle, {
    List<PaketKelime> sozluk = const <PaketKelime>[],
  }) {
    final List<YapiBulgusu> bulgular = <YapiBulgusu>[];
    final String ham = cumle.trim();
    if (ham.isEmpty) return bulgular;

    final List<String> j = Normalizer.tokenize(ham);
    if (j.isEmpty) return bulgular;

    // tur haritasi: yazilis -> tur
    final Map<String, String> tur = <String, String>{
      for (final PaketKelime k in sozluk) k.yazilis.toLowerCase(): k.tur
    };

    bool fiilMi(String t) =>
        TaniMotoru.fiiller.contains(t) || tur[t] == 'fiil';
    bool beMi(String t) => TaniMotoru.beFiilleri.contains(t);
    bool yardimciMi(String t) => TaniMotoru.yardimciFiiller.contains(t);
    bool sifatMi(String t) => _sifatlar.contains(t) || tur[t] == 'sifat';
    bool isimMi(String t) =>
        tur[t] == 'isim' ||
        (!TaniMotoru.fonksiyonKelimeleri.contains(t) &&
            !fiilMi(t) &&
            !sifatMi(t));

    final int fiilYeri = j.indexWhere(fiilMi);
    final bool beVar = j.any(beMi);
    final bool yardimciVar = j.any(yardimciMi);
    final bool ozneZamiri =
        TaniMotoru.ozneler.contains(j.first);

    // ---------- 1. Ozne var mi? ----------
    // Cumle fiille basliyorsa emir cumlesi OLABILIR; kesin hata demiyoruz.
    if (fiilYeri == 0 && !yardimciMi(j.first) && !beMi(j.first)) {
      bulgular.add(YapiBulgusu(
        kod: 'SU-01',
        ciddi: false,
        mesaj: 'Cumle fiille basliyor. Turkcede ozne dusebilir '
            '("Geliyorum"), Ingilizcede dusemez.',
        oneri: 'Emir cumlesi kastetmediyseniz basa bir ozne ekleyin: '
            'I ${j.first} ...',
      ));
    }

    // ---------- 2. Fiil hic yok mu? ----------
    if (fiilYeri < 0 && !beVar && !yardimciVar) {
      final bool yuklemVar =
          j.skip(1).any((String t) => sifatMi(t) || isimMi(t));
      if (yuklemVar && j.length >= 2) {
        final String ozne = j.first;
        final String uygun = ozne == 'i'
            ? 'am'
            : (_tekilUcuncu.contains(ozne) ? 'is' : 'are');
        bulgular.add(YapiBulgusu(
          kod: 'BE-01',
          ciddi: true,
          mesaj: 'Cumlede fiil yok. Turkcede "O ogretmen" yeterlidir; '
              'Ingilizcede am/is/are YAZILMAK ZORUNDADIR.',
          oneri: '${_bas(ozne)} $uygun ${j.skip(1).join(' ')}',
        ));
      }
    }

    // ---------- 3. Ozne-fiil uyumu (3. tekil -s) ----------
    if (fiilYeri > 0 && !beVar && !yardimciVar) {
      final String ozne = j[fiilYeri - 1];
      final String fiil = j[fiilYeri];
      final bool tekilOzne = _tekilUcuncu.contains(ozne) ||
          (fiilYeri == 1 && isimMi(ozne) && !ozne.endsWith('s'));
      final String? cekimli = TaniMotoru.fiilCiftleri[fiil];
      if (tekilOzne && cekimli != null) {
        bulgular.add(YapiBulgusu(
          kod: 'AGR-01',
          ciddi: true,
          mesaj: 'Ozne tekil ucuncu kisi ($ozne) ama fiil yalin: "$fiil".',
          oneri: 'Fiile -s ekleyin: "$cekimli".',
        ));
      }
      // I / you / we / they + cekimli fiil
      final bool cogulOzne =
          ozne == 'i' || _cogulOzne.contains(ozne) || ozne.endsWith('s');
      if (cogulOzne && TaniMotoru.fiilCiftleri.containsValue(fiil)) {
        final String yalin = TaniMotoru.fiilCiftleri.entries
            .firstWhere((MapEntry<String, String> e) => e.value == fiil)
            .key;
        bulgular.add(YapiBulgusu(
          kod: 'AGR-02',
          ciddi: true,
          mesaj: '"-s" yalnizca he/she/it icindir; ozne "$ozne".',
          oneri: 'Fiili yalin birakin: "$yalin".',
        ));
      }
    }

    // ---------- 4. be + cekimli fiil ----------
    for (int i = 0; i < j.length - 1; i++) {
      if (beMi(j[i]) && fiilMi(j[i + 1]) && !beMi(j[i + 1])) {
        if (!j[i + 1].endsWith('ing')) {
          bulgular.add(YapiBulgusu(
            kod: 'BE-02',
            ciddi: true,
            mesaj: '"${j[i]}" ile "${j[i + 1]}" yan yana olamaz. '
                'Bir cumlede ya to be ya da ana fiil bulunur.',
            oneri: 'Ya "${j[i]}"yi kaldirin ya da fiili -ing yapin.',
          ));
        }
      }
    }

    // ---------- 5. do/does SONRASINDAKI ilk ana fiil yalin olmali ----------
    // Arada ozne bulunabilir: "Does he works?" -> does · he · works
    for (int i = 0; i < j.length; i++) {
      if (j[i] != 'do' && j[i] != 'does' && j[i] != 'did') continue;
      for (int k = i + 1; k < j.length; k++) {
        if (!fiilMi(j[k]) || beMi(j[k])) continue;
        if (TaniMotoru.fiilCiftleri.containsValue(j[k])) {
          final String yalin = TaniMotoru.fiilCiftleri.entries
              .firstWhere((MapEntry<String, String> e) => e.value == j[k])
              .key;
          bulgular.add(YapiBulgusu(
            kod: 'AUX-02',
            ciddi: true,
            mesaj: '"${j[i]}" zaten cekimi tasiyor; ana fiil yalin kalmali.',
            oneri: '"${j[k]}" yerine "$yalin".',
          ));
        }
        break;
      }
    }

    // ---------- 5b. Ozne - be uyumu ----------
    const Map<String, String> beUyum = <String, String>{
      'i': 'am', 'he': 'is', 'she': 'is', 'it': 'is',
      'you': 'are', 'we': 'are', 'they': 'are',
    };
    for (int i = 1; i < j.length; i++) {
      if (!beMi(j[i])) continue;
      final String? beklenen = beUyum[j[i - 1]];
      if (beklenen != null && beklenen != j[i]) {
        bulgular.add(YapiBulgusu(
          kod: 'BE-03',
          ciddi: true,
          mesaj: '"${j[i - 1]}" oznesi "${j[i]}" almaz.',
          oneri: 'Dogrusu: "${j[i - 1]} $beklenen".',
        ));
      }
    }

    // ---------- 6. Fiil sonda (Turkce SOV aktarimi) ----------
    if (fiilYeri > 1 && fiilYeri == j.length - 1 && j.length >= 3) {
      final bool oncekiNesne = isimMi(j[fiilYeri - 1]);
      if (oncekiNesne) {
        bulgular.add(YapiBulgusu(
          kod: 'WO-01',
          ciddi: true,
          mesaj: 'Fiil cumlenin sonunda. Turkcede fiil sondadir, '
              'Ingilizcede ozneden HEMEN SONRA gelir.',
          oneri: 'Sira: ${_bas(j.first)} ${j[fiilYeri]} '
              '${j.sublist(1, fiilYeri).join(' ')}',
        ));
      }
    }

    // ---------- 7. Ust uste ayni kelime ----------
    for (int i = 1; i < j.length; i++) {
      if (j[i] == j[i - 1] && j[i].length > 1) {
        bulgular.add(YapiBulgusu(
          kod: 'TEK-01',
          ciddi: false,
          mesaj: '"${j[i]}" iki kez art arda yazilmis.',
        ));
        break;
      }
    }

    // ---------- 8. Bicim: buyuk harf ve noktalama ----------
    final String ilk = ham[0];
    if (ilk.toLowerCase() == ilk && ilk.toUpperCase() != ilk) {
      bulgular.add(const YapiBulgusu(
        kod: 'BUYUK-01',
        ciddi: false,
        mesaj: 'Cumle kucuk harfle basliyor.',
        oneri: 'Ingilizcede cumleler buyuk harfle baslar.',
      ));
    }
    if (!RegExp(r'[.!?]$').hasMatch(ham)) {
      bulgular.add(const YapiBulgusu(
        kod: 'NOKTA-01',
        ciddi: false,
        mesaj: 'Cumle sonunda noktalama yok.',
        oneri: 'Sonuna nokta, soru veya unlem isareti koyun.',
      ));
    }

    // ---------- 9. Ozne zamiri nesne bicimindeyse ----------
    const Map<String, String> nesneOzne = <String, String>{
      'me': 'I', 'him': 'He', 'her': 'She', 'us': 'We', 'them': 'They',
    };
    if (nesneOzne.containsKey(j.first) && j.length >= 2) {
      bulgular.add(YapiBulgusu(
        kod: 'PRO-01',
        ciddi: true,
        mesaj: '"${j.first}" nesne bicimidir; cumlenin oznesi olamaz.',
        oneri: 'Ozne bicimi: "${nesneOzne[j.first]}".',
      ));
    }
    if (ozneZamiri && j.length < 2) {
      // tek kelimelik cevap; baska kural uygulanmaz
    }

    return bulgular;
  }

  static String _bas(String k) =>
      k.isEmpty ? k : k[0].toUpperCase() + k.substring(1);

  /// Ciddi bulgusu olmayan cumle "yapisal olarak gecerli" sayilir.
  static bool yapisalOlarakGecerli(List<YapiBulgusu> bulgular) =>
      !bulgular.any((YapiBulgusu b) => b.ciddi);
}
