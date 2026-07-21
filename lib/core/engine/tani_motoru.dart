import 'normalizer.dart';

/// Tani guveni.
enum TaniGuveni { kesin, olasi, yok }

/// v3: dokuz kategori (PRODUCT_RULES uyumlu, Faz 2C).
enum HataKategorisi {
  hataYok,
  gramerHatasi,
  kelimeSecimi,
  anlamFarki,
  kelimeSirasi,
  eksikKelime,
  fazlaKelime,
  yazimHatasi,
  kabulEdilebilirAlternatif,
  taniKonulamadi,
}

/// Bir kabul edilebilir cevabin tipi.
/// Sema DEGISMEDI: gorev_kabul.esdeger_mi sutunu 3 durumlu kullanilir.
///   1 = ana veya tam kabul alternatif
///   0 = kabul edilir + not gosterilir
///  -1 = gramer dogru ama anlam farkli (DOGRU SAYILMAZ)
enum KabulTipi { ana, alternatif, anlamFarkli }

class KabulCevabi {
  final String cevap;
  final KabulTipi tip;
  final String? not;
  const KabulCevabi(this.cevap, this.tip, [this.not]);

  static KabulTipi tipCoz(int esdegerMi) => switch (esdegerMi) {
        1 => KabulTipi.ana,
        0 => KabulTipi.alternatif,
        _ => KabulTipi.anlamFarkli,
      };
}

extension TaniGuveniDb on TaniGuveni {
  String get dbDegeri => switch (this) {
        TaniGuveni.kesin => 'KESIN',
        TaniGuveni.olasi => 'OLASI',
        TaniGuveni.yok => 'YOK',
      };
  String get etiket => switch (this) {
        TaniGuveni.kesin => 'KESIN_TANI',
        TaniGuveni.olasi => 'OLASI_TANI',
        TaniGuveni.yok => 'TANI_KONULAMADI',
      };
  double get ustalikCarpani => switch (this) {
        TaniGuveni.kesin => 1.0,
        TaniGuveni.olasi => 0.5,
        TaniGuveni.yok => 0.5,
      };
}

extension HataKategorisiAd on HataKategorisi {
  String get dbDegeri => switch (this) {
        HataKategorisi.hataYok => '-',
        HataKategorisi.gramerHatasi => 'GRAMER_HATASI',
        HataKategorisi.kelimeSecimi => 'KELIME_SECIMI',
        HataKategorisi.anlamFarki => 'ANLAM_FARKI',
        HataKategorisi.kelimeSirasi => 'KELIME_SIRASI',
        HataKategorisi.eksikKelime => 'EKSIK_KELIME',
        HataKategorisi.fazlaKelime => 'FAZLA_KELIME',
        HataKategorisi.yazimHatasi => 'YAZIM_HATASI',
        HataKategorisi.kabulEdilebilirAlternatif =>
          'KABUL_EDILEBILIR_ALTERNATIF',
        HataKategorisi.taniKonulamadi => 'TANI_KONULAMADI',
      };

  String get adTr => switch (this) {
        HataKategorisi.hataYok => '-',
        HataKategorisi.gramerHatasi => 'Dilbilgisi hatasi',
        HataKategorisi.kelimeSecimi => 'Kelime secimi',
        HataKategorisi.anlamFarki => 'Anlam farki',
        HataKategorisi.kelimeSirasi => 'Kelime sirasi',
        HataKategorisi.eksikKelime => 'Eksik kelime',
        HataKategorisi.fazlaKelime => 'Fazla kelime',
        HataKategorisi.yazimHatasi => 'Yazim hatasi',
        HataKategorisi.kabulEdilebilirAlternatif => 'Kabul edilebilir alternatif',
        HataKategorisi.taniKonulamadi => 'Belirlenemedi',
      };
}

class TaniSonucu {
  final bool dogru;
  final TaniGuveni guven;
  final HataKategorisi kategori;

  /// Cumlenin YAPISI dogru mu? Sozcuk/yazim/anlam hatalarinda true.
  final bool? gramerDogru;

  final String? hataKodu;

  /// v3: JETON degil IFADE duzeyi. "every morning" / "every day".
  final String? beklenenIfade;
  final String? yazilanIfade;

  /// TANI_KONULAMADI durumunda BOS. Aciklama UYDURULMAZ.
  final String? neden;
  final String dogruForm;
  final String? karsitOrnek;

  /// Kabul edilen alternatiflerde gosterilen not.
  final String? not;

  final String kokNeden;
  final double kokNedenCarpani;

  const TaniSonucu({
    required this.dogru,
    required this.guven,
    required this.kategori,
    required this.dogruForm,
    required this.kokNeden,
    required this.kokNedenCarpani,
    this.gramerDogru,
    this.hataKodu,
    this.beklenenIfade,
    this.yazilanIfade,
    this.neden,
    this.karsitOrnek,
    this.not,
  });

  /// Arayuzde gosterilecek kategori etiketi.
  /// Gramer dogruyken kelime secimi hatasi ayni zamanda anlam farkidir.
  String get kategoriEtiketi {
    if (kategori == HataKategorisi.kelimeSecimi && gramerDogru == true) {
      return 'KELIME_SECIMI / ANLAM_FARKI';
    }
    return kategori.dbDegeri;
  }
}

/// Tani Motoru v3.
///
/// Kaskad:
///   1. Tam kabul (ana / alternatif)          -> DOGRU
///   2. Yazarin isaretledigi 'anlam farkli'   -> ANLAM_FARKI
///   3. Siralama (multiset ayni)              -> KELIME_SIRASI
///   4. Tek konumda fark                      -> cekim/artikel/edat/yazim/sozcuk
///   5. Belirli yapisal eksikler              -> GRAMER_HATASI
///   6. Genel eksik / fazla kelime            -> EKSIK_KELIME / FAZLA_KELIME
///   7. Hicbiri                               -> TANI_KONULAMADI
class TaniMotoru {
  static const artikeller = {'a', 'an', 'the'};
  static const ozneler = {'i', 'you', 'he', 'she', 'it', 'we', 'they'};
  static const _nesneZamir = {'me', 'him', 'her', 'us', 'them'};
  static const _iyelik = {'my', 'your', 'his', 'its', 'our', 'their'};
  static const beFiilleri = {'am', 'is', 'are', 'was', 'were'};
  static const yardimciFiiller = {
    'do', 'does', 'did', 'have', 'has', 'had', 'will', 'can'
  };
  static const edatlar = {
    'in', 'on', 'at', 'to', 'from', 'for', 'with', 'of', 'about', 'into'
  };
  static const _baglaclar = {'and', 'but', 'or', 'so', 'because'};
  static const belirtecler = {
    'every', 'some', 'any', 'many', 'much', 'all', 'this', 'that',
    'these', 'those', 'no', 'each', 'next', 'last'
  };
  static const _olumsuz = {'not', 'never'};

  static final Set<String> fonksiyonKelimeleri = {
    ...artikeller, ...ozneler, ..._nesneZamir, ..._iyelik, ...beFiilleri,
    ...yardimciFiiller, ...edatlar, ..._baglaclar, ...belirtecler, ..._olumsuz,
  };

  /// Bir icerik kelimesinin onunde gelip onunla IFADE olusturan kelimeler.
  static final Set<String> ifadeOnekleri = {
    ...belirtecler, ...edatlar, ...artikeller
  };

  static const fiilCiftleri = {
    'drink': 'drinks', 'read': 'reads', 'eat': 'eats', 'like': 'likes',
    'work': 'works', 'live': 'lives', 'go': 'goes', 'see': 'sees',
    'want': 'wants', 'open': 'opens', 'write': 'writes', 'speak': 'speaks',
    'play': 'plays', 'watch': 'watches', 'study': 'studies',
    'teach': 'teaches', 'buy': 'buys', 'make': 'makes',
  };

  static final Set<String> fiiller = {
    ...fiilCiftleri.keys, ...fiilCiftleri.values,
    ...beFiilleri, ...yardimciFiiller,
  };

  static bool icerikKelimesi(String t) => !fonksiyonKelimeleri.contains(t);

  static int fiilIndeksi(List<String> t) {
    for (var i = 0; i < t.length; i++) {
      if (fiiller.contains(t[i])) return i;
    }
    return -1;
  }

  static bool _cekimCifti(String a, String b) =>
      fiilCiftleri[a] == b || fiilCiftleri[b] == a;

  /// Jetonu, onundeki belirtec/edat/artikel ile birlestirip ifade dondurur.
  /// 'morning' -> 'every morning'
  static String ifadeCikar(List<String> jetonlar, int idx) {
    var bas = idx;
    while (bas > 0 && ifadeOnekleri.contains(jetonlar[bas - 1])) {
      bas--;
    }
    return jetonlar.sublist(bas, idx + 1).join(' ');
  }

  static int _karakterMesafe(String a, String b) =>
      Normalizer.tokenMesafe(a.split(''), b.split(''));

  static TaniSonucu _yap({
    required TaniGuveni guven,
    required HataKategorisi kategori,
    required String dogruForm,
    String? kod,
    bool? gramerDogru,
    String? beklenen,
    String? yazilan,
    String? neden,
    String? karsit,
    String kokNeden = 'bilinmiyor',
  }) =>
      TaniSonucu(
        dogru: false,
        guven: guven,
        kategori: kategori,
        gramerDogru: gramerDogru,
        hataKodu: kod,
        beklenenIfade: beklenen,
        yazilanIfade: yazilan,
        neden: neden,
        karsitOrnek: karsit,
        dogruForm: dogruForm,
        kokNeden: guven == TaniGuveni.kesin ? kokNeden : 'bilinmiyor',
        kokNedenCarpani: guven.ustalikCarpani,
      );

  /// Geriye donuk uyumlu giris: duz metin listesi = hepsi 'ana/alternatif'.
  static TaniSonucu degerlendir({
    required String kullaniciCevabi,
    required List<String> kabulCevaplari,
    Map<String, String> kelimeAnlamlari = const {},
  }) =>
      degerlendirTipli(
        kullaniciCevabi: kullaniciCevabi,
        kabuller: [
          for (var i = 0; i < kabulCevaplari.length; i++)
            KabulCevabi(kabulCevaplari[i],
                i == 0 ? KabulTipi.ana : KabulTipi.alternatif)
        ],
        kelimeAnlamlari: kelimeAnlamlari,
      );

  static TaniSonucu degerlendirTipli({
    required String kullaniciCevabi,
    required List<KabulCevabi> kabuller,
    Map<String, String> kelimeAnlamlari = const {},
  }) {
    final v = Normalizer.tokenize(kullaniciCevabi);
    final ana = kabuller
        .firstWhere((k) => k.tip == KabulTipi.ana,
            orElse: () => kabuller.isNotEmpty
                ? kabuller.first
                : const KabulCevabi('', KabulTipi.ana))
        .cevap;

    // --- 1. tam kabul ---
    // Normalizer noktalama/buyuk harf farkini sildigi icin BIRDEN COK kabul
    // kaydi ayni normalize bicime dusebilir. Bu durumda NOTU OLAN kayit
    // tercih edilir; aksi halde nota bagli geri bildirim kaybolur.
    KabulCevabi? eslesen;
    for (final k in kabuller) {
      if (k.tip == KabulTipi.anlamFarkli) continue;
      if (Normalizer.tokenMesafe(Normalizer.tokenize(k.cevap), v) != 0) {
        continue;
      }
      if (eslesen == null) {
        eslesen = k;
      } else if (eslesen.not == null && k.not != null) {
        eslesen = k;
      }
    }
    if (eslesen != null) {
      final alt = eslesen.tip == KabulTipi.alternatif;
      return TaniSonucu(
        dogru: true,
        guven: TaniGuveni.kesin,
        kategori: alt
            ? HataKategorisi.kabulEdilebilirAlternatif
            : HataKategorisi.hataYok,
        gramerDogru: true,
        dogruForm: ana,
        not: eslesen.not,
        kokNeden: '-',
        kokNedenCarpani: 0,
      );
    }

    // --- 2. yazarin isaretledigi 'gramer dogru, anlam farkli' ---
    for (final k in kabuller) {
      if (k.tip != KabulTipi.anlamFarkli) continue;
      if (Normalizer.tokenMesafe(Normalizer.tokenize(k.cevap), v) == 0) {
        return _yap(
          guven: TaniGuveni.kesin,
          kategori: HataKategorisi.anlamFarki,
          kod: 'ANL-01',
          gramerDogru: true,
          neden: k.not ??
              'Dilbilgisi dogru ancak anlam beklenenden farkli.',
          kokNeden: 'sozcuk_secimi',
          dogruForm: ana,
        );
      }
    }

    if (v.isEmpty) {
      return _yap(
          guven: TaniGuveni.yok,
          kategori: HataKategorisi.taniKonulamadi,
          kod: 'LEX-99',
          dogruForm: ana);
    }

    // --- en yakin beklenen ---
    var b = Normalizer.tokenize(ana);
    var enKucuk = 1 << 30;
    for (final k in kabuller) {
      if (k.tip == KabulTipi.anlamFarkli) continue;
      final t = Normalizer.tokenize(k.cevap);
      final d = Normalizer.tokenMesafe(t, v);
      if (d < enKucuk) {
        enKucuk = d;
        b = t;
      }
    }

    // --- 3. SIRALAMA ---
    if (Normalizer.ayniCokluk(b, v)) {
      final bi = fiilIndeksi(b), vi = fiilIndeksi(v);
      if (bi >= 0 && vi >= 0 && vi > bi && vi >= v.length - 1 && v.length >= 3) {
        return _yap(
          guven: TaniGuveni.kesin,
          kategori: HataKategorisi.kelimeSirasi,
          kod: 'WO-01',
          gramerDogru: false,
          neden: 'Turkcede fiil cumlenin sonunda gelir. Ingilizcede fiil '
              'ozneden hemen sonra gelir: Ozne + Fiil + Nesne.',
          karsit: 'I read books. (Ben kitap okurum.)',
          kokNeden: 'L1_transfer',
          dogruForm: ana,
        );
      }
      return _yap(
        guven: TaniGuveni.olasi,
        kategori: HataKategorisi.kelimeSirasi,
        kod: 'WO-02',
        gramerDogru: false,
        neden: 'Kelimeler dogru ama sira farkli.',
        dogruForm: ana,
      );
    }

    // --- 4. TEK KONUMDA FARK ---
    if (b.length == v.length) {
      final farklar = <List<int>>[];
      for (var i = 0; i < b.length; i++) {
        if (b[i] != v[i]) farklar.add([i]);
      }

      if (farklar.length == 1) {
        final i = farklar.first.first;
        final bek = b[i], yaz = v[i];
        final bIf = ifadeCikar(b, i), vIf = ifadeCikar(v, i);

        if (_cekimCifti(bek, yaz)) {
          return _yap(
            guven: TaniGuveni.kesin, kategori: HataKategorisi.gramerHatasi,
            kod: 'AGR-01', gramerDogru: false, beklenen: bek, yazilan: yaz,
            neden: "Present Simple'da he/she/it oznesiyle fiile -s eklenir.",
            karsit: 'He works here.', kokNeden: 'eksik_bilgi', dogruForm: ana,
          );
        }
        if (artikeller.contains(bek) && artikeller.contains(yaz)) {
          return _yap(
            guven: TaniGuveni.kesin, kategori: HataKategorisi.gramerHatasi,
            kod: 'ART-02', gramerDogru: false, beklenen: bek, yazilan: yaz,
            neden: 'Artikel secimi yanlis. a/an belirsiz, the belirlidir.',
            kokNeden: 'eksik_bilgi', dogruForm: ana,
          );
        }
        if (edatlar.contains(bek) && edatlar.contains(yaz)) {
          return _yap(
            guven: TaniGuveni.kesin, kategori: HataKategorisi.gramerHatasi,
            kod: 'PREP-01', gramerDogru: false, beklenen: bIf, yazilan: vIf,
            neden: 'Edat secimi yanlis. Turkcede tek ek (-de) Ingilizcede '
                'in / on / at olarak ayrilir.',
            kokNeden: 'L1_transfer', dogruForm: ana,
          );
        }
        if (_karakterMesafe(bek, yaz) <= 2 &&
            bek.isNotEmpty && yaz.isNotEmpty &&
            bek[0] == yaz[0] &&
            (bek.length - yaz.length).abs() <= 2) {
          return _yap(
            guven: TaniGuveni.kesin, kategori: HataKategorisi.yazimHatasi,
            kod: 'YAZ-01', gramerDogru: true, beklenen: bek, yazilan: yaz,
            neden: 'Yapi dogru; kelime yanlis yazilmis.',
            kokNeden: 'yazim', dogruForm: ana,
          );
        }
        if (icerikKelimesi(bek) && icerikKelimesi(yaz)) {
          final bt = kelimeAnlamlari[bek], yt = kelimeAnlamlari[yaz];
          final aciklama = (bt != null && yt != null)
              ? "'$yaz' = $yt; beklenen kelime '$bek' = $bt. "
                  'Dilbilgisi yapin dogru, anlam farkli.'
              : "'$vIf' dilbilgisel olarak dogrudur ancak anlami "
                  "'$bIf' ile ayni degildir.";
          return _yap(
            guven: TaniGuveni.kesin, kategori: HataKategorisi.kelimeSecimi,
            kod: 'SOZ-01', gramerDogru: true, beklenen: bIf, yazilan: vIf,
            neden: aciklama, kokNeden: 'sozcuk_secimi', dogruForm: ana,
          );
        }
        return _yap(
          guven: TaniGuveni.olasi, kategori: HataKategorisi.gramerHatasi,
          kod: 'GRM-99', gramerDogru: false, beklenen: bek, yazilan: yaz,
          neden: 'Dilbilgisi tasiyici bir kelime beklenenden farkli.',
          dogruForm: ana,
        );
      }

      if (farklar.length == 2) {
        final i1 = farklar[0].first, i2 = farklar[1].first;
        if (icerikKelimesi(b[i1]) && icerikKelimesi(v[i1]) &&
            icerikKelimesi(b[i2]) && icerikKelimesi(v[i2])) {
          return _yap(
            guven: TaniGuveni.olasi, kategori: HataKategorisi.kelimeSecimi,
            kod: 'SOZ-02', gramerDogru: true,
            beklenen: '${b[i1]}, ${b[i2]}', yazilan: '${v[i1]}, ${v[i2]}',
            neden: 'Yapi dogru; birden fazla kelime farkli.',
            dogruForm: ana,
          );
        }
      }
    }

    // --- 5. BELIRLI YAPISAL EKSIKLER ---
    final bBe = b.where(beFiilleri.contains).toList();
    if (bBe.isNotEmpty &&
        !v.any(beFiilleri.contains) &&
        Normalizer.tokenMesafe(
                b.where((t) => !beFiilleri.contains(t)).toList(), v) == 0) {
      return _yap(
        guven: TaniGuveni.kesin, kategori: HataKategorisi.gramerHatasi,
        kod: 'BE-01', gramerDogru: false, beklenen: bBe.first,
        neden: "Turkcede 'olmak' gizlidir. Ingilizcede am/is/are ZORUNLUDUR.",
        karsit: 'She is a teacher.', kokNeden: 'L1_transfer', dogruForm: ana,
      );
    }

    if (b.isNotEmpty &&
        ozneler.contains(b.first) &&
        !(v.isNotEmpty && ozneler.contains(v.first)) &&
        Normalizer.tokenMesafe(b.sublist(1), v) == 0) {
      return _yap(
        guven: TaniGuveni.kesin, kategori: HataKategorisi.gramerHatasi,
        kod: 'SU-01', gramerDogru: false, beklenen: b.first,
        neden: 'Turkcede ozne dusebilir. Ingilizcede ozne her zaman yazilir.',
        karsit: 'I am coming.', kokNeden: 'L1_transfer', dogruForm: ana,
      );
    }

    final bArt = b.where(artikeller.contains).toList();
    if (bArt.length > v.where(artikeller.contains).length &&
        Normalizer.tokenMesafe(
                b.where((t) => !artikeller.contains(t)).toList(),
                v.where((t) => !artikeller.contains(t)).toList()) == 0) {
      return _yap(
        guven: TaniGuveni.kesin, kategori: HataKategorisi.gramerHatasi,
        kod: 'ART-01', gramerDogru: false, beklenen: bArt.first,
        neden: 'Tekil sayilabilir isimden once a/an veya the gerekir.',
        karsit: 'I saw a dog.', kokNeden: 'L1_transfer', dogruForm: ana,
      );
    }

    final bYrd = b.where(yardimciFiiller.contains).toList();
    if (bYrd.length > v.where(yardimciFiiller.contains).length &&
        Normalizer.tokenMesafe(
                b.where((t) => !yardimciFiiller.contains(t)).toList(),
                v.where((t) => !yardimciFiiller.contains(t)).toList()) == 0) {
      return _yap(
        guven: TaniGuveni.kesin, kategori: HataKategorisi.gramerHatasi,
        kod: 'AUX-01', gramerDogru: false, beklenen: bYrd.first,
        neden: 'Olumsuz ve soruda do/does yardimci fiili zorunludur.',
        karsit: 'I do not like coffee.', kokNeden: 'L1_transfer',
        dogruForm: ana,
      );
    }

    // --- 6. GENEL EKSIK / FAZLA KELIME ---
    final bSet = b.toSet(), vSet = v.toSet();
    if (v.length < b.length && vSet.difference(bSet).isEmpty) {
      final eksikler = b.where((t) => !vSet.contains(t)).toList();
      return _yap(
        guven: TaniGuveni.kesin, kategori: HataKategorisi.eksikKelime,
        kod: 'EKS-01', gramerDogru: false, beklenen: eksikler.join(' '),
        neden: 'Cumlede ${eksikler.length} kelime eksik.',
        kokNeden: 'eksik_bilgi', dogruForm: ana,
      );
    }
    if (v.length > b.length && bSet.difference(vSet).isEmpty) {
      final fazlalar = v.where((t) => !bSet.contains(t)).toList();
      return _yap(
        guven: TaniGuveni.kesin, kategori: HataKategorisi.fazlaKelime,
        kod: 'FAZ-01', gramerDogru: false, yazilan: fazlalar.join(' '),
        neden: 'Cumlede fazladan ${fazlalar.length} kelime var.',
        dogruForm: ana,
      );
    }

    // --- 7. TANI KONULAMADI ---
    return _yap(
      guven: TaniGuveni.yok, kategori: HataKategorisi.taniKonulamadi,
      kod: 'LEX-99', dogruForm: ana,
    );
  }
}
