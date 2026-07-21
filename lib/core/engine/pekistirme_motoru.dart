import 'dart:math';

import '../model/paket_kelime.dart';
import 'normalizer.dart';
import 'yapi_denetcisi.dart';

/// Faz 2E sartnamesindeki sekiz pekistirme etkinligi.
enum EtkinlikTipi {
  enTrEslestirme,
  trEnEslestirme,
  boslukDoldurma,
  enTrCeviri,
  trEnCeviri,
  dogruKelimeSecme,
  harfKarisik,
  cumleIcinde,
}

extension EtkinlikTipiAd on EtkinlikTipi {
  String get kod => switch (this) {
        EtkinlikTipi.enTrEslestirme => 'E1-EN-TR',
        EtkinlikTipi.trEnEslestirme => 'E2-TR-EN',
        EtkinlikTipi.boslukDoldurma => 'E3-BOSLUK',
        EtkinlikTipi.enTrCeviri => 'E4-CEVIRI-EN-TR',
        EtkinlikTipi.trEnCeviri => 'E5-CEVIRI-TR-EN',
        EtkinlikTipi.dogruKelimeSecme => 'E6-DOGRU-KELIME',
        EtkinlikTipi.harfKarisik => 'E7-HARF-KARISIK',
        EtkinlikTipi.cumleIcinde => 'E8-CUMLE-ICINDE',
      };

  String get ad => switch (this) {
        EtkinlikTipi.enTrEslestirme => 'Ingilizce - Turkce eslestirme',
        EtkinlikTipi.trEnEslestirme => 'Turkce - Ingilizce eslestirme',
        EtkinlikTipi.boslukDoldurma => 'Bosluk doldurma',
        EtkinlikTipi.enTrCeviri => 'Ingilizce -> Turkce ceviri',
        EtkinlikTipi.trEnCeviri => 'Turkce -> Ingilizce ceviri',
        EtkinlikTipi.dogruKelimeSecme => 'Dogru kelimeyi secme',
        EtkinlikTipi.harfKarisik => 'Harfleri karisik kelimeyi bulma',
        EtkinlikTipi.cumleIcinde => 'Cumle icinde kullanma',
      };
}

/// Cevap dogrulama bicimi.
enum DogrulamaTuru {
  /// Kabul kumesiyle birebir eslesme.
  tamEslesme,

  /// Kullanici KENDI cumlesini yazar. Hedef kelimeyi kullandiysa ve
  /// cumle yeterince uzunsa kabul edilir.
  hedefKelimeIceren,
}

/// Tek bir pekistirme sorusu.
class PekistirmeSorusu {
  final EtkinlikTipi tip;
  final String kelimeKod;
  final String soru;

  /// Bos ise metin girisi beklenir.
  final List<String> secenekler;

  /// Metin girisinde kabul edilen cevaplar (normalize karsilastirilir).
  final List<String> kabulEdilenler;

  final String? ipucu;

  final DogrulamaTuru dogrulama;

  /// hedefKelimeIceren dogrulamasinda aranan kelime.
  final String? hedefKelime;

  /// Serbest cumlede beklenen en az kelime sayisi.
  final int enAzKelime;

  const PekistirmeSorusu({
    required this.tip,
    required this.kelimeKod,
    required this.soru,
    required this.secenekler,
    required this.kabulEdilenler,
    this.ipucu,
    this.dogrulama = DogrulamaTuru.tamEslesme,
    this.hedefKelime,
    this.enAzKelime = 3,
  });

  bool get secmeli => secenekler.isNotEmpty;
  String get kanonikCevap =>
      kabulEdilenler.isEmpty ? '' : kabulEdilenler.first;

  /// Cevap dogru mu?
  ///
  /// [DogrulamaTuru.hedefKelimeIceren] durumunda kullanicinin KENDI
  /// cumlesi kabul edilir: hedef kelime (veya cekimli bicimi) geciyorsa
  /// ve cumle yeterince uzunsa dogru sayilir.
  bool dogruMu(String cevap) {
    final String v = Normalizer.normalize(cevap);
    if (v.isEmpty) return false;

    if (dogrulama == DogrulamaTuru.hedefKelimeIceren) {
      return kendiCumlesiGecerliMi(cevap).gecerli;
    }
    for (final String k in kabulEdilenler) {
      if (Normalizer.normalize(k) == v) return true;
    }
    return false;
  }

  /// Kullanicinin kendi cumlesini inceler.
  ///
  /// Iki katman:
  ///   1. Hedef kelime kullanilmis mi, cumle yeterince uzun mu
  ///   2. YapiDenetcisi ile REFERANSSIZ yapisal denetim
  ///
  /// Ikinci katman tam bir dilbilgisi cozumlemesi DEGILDIR; hangi hata
  /// siniflarini denetledigi YapiDenetcisi belgesinde yazilidir.
  ({
    bool gecerli,
    bool kelimeVar,
    int kelimeSayisi,
    String not,
    List<YapiBulgusu> bulgular,
  }) kendiCumlesiIncele(String cevap,
      {List<PaketKelime> sozluk = const <PaketKelime>[]}) {
    final ({bool gecerli, bool kelimeVar, int kelimeSayisi, String not}) temel =
        kendiCumlesiGecerliMi(cevap);
    final List<YapiBulgusu> bulgular =
        YapiDenetcisi.denetle(cevap, sozluk: sozluk);
    final bool yapiTemiz = YapiDenetcisi.yapisalOlarakGecerli(bulgular);
    return (
      gecerli: temel.gecerli && yapiTemiz,
      kelimeVar: temel.kelimeVar,
      kelimeSayisi: temel.kelimeSayisi,
      not: !temel.gecerli
          ? temel.not
          : (yapiTemiz
              ? 'Kelime dogru kullanilmis ve yapisal denetimden gecti.'
              : 'Kelime kullanilmis ama yapida sorun var.'),
      bulgular: bulgular,
    );
  }

  /// Kullanicinin kendi cumlesini inceler ve NEDEN kabul/ret edildigini
  /// bildirir. Tam bir dilbilgisi cozumlemesi DEGILDIR; sinirini bildirir.
  ({bool gecerli, bool kelimeVar, int kelimeSayisi, String not})
      kendiCumlesiGecerliMi(String cevap) {
    final String v = Normalizer.normalize(cevap);
    final List<String> jetonlar =
        v.split(' ').where((String x) => x.isNotEmpty).toList();
    final String hedef =
        Normalizer.normalize(hedefKelime ?? kelimeKod);

    // Cekimli bicimleri de kabul et: work / works / working / worked
    final bool kelimeVar = jetonlar.any((String j) =>
        j == hedef ||
        (hedef.length >= 3 &&
            (j.startsWith(hedef) &&
                j.length - hedef.length <= 3)));

    if (!kelimeVar) {
      return (
        gecerli: false,
        kelimeVar: false,
        kelimeSayisi: jetonlar.length,
        not: 'Cumlede "$hedef" kelimesi gecmiyor.'
      );
    }
    if (jetonlar.length < enAzKelime) {
      return (
        gecerli: false,
        kelimeVar: true,
        kelimeSayisi: jetonlar.length,
        not: 'Cumle cok kisa. En az $enAzKelime kelime yazin.'
      );
    }
    return (
      gecerli: true,
      kelimeVar: true,
      kelimeSayisi: jetonlar.length,
      not: 'Kelime dogru kullanilmis. '
          'Dilbilgisi ayrintili denetlenmedi; ornekle karsilastirin.'
    );
  }
}

/// Pekistirme sorularini URETIR. Saf Dart; veritabani veya arayuz bilmez.
///
/// KURAL: sorular YALNIZCA o paketin kelimelerinden uretilir.
class PekistirmeMotoru {
  final List<PaketKelime> paket;
  final Random _rnd;

  PekistirmeMotoru(this.paket, {int tohum = 42}) : _rnd = Random(tohum);

  /// Etkinlik basina uretilecek soru sayisi.
  static const int soruSayisi = 8;

  List<PekistirmeSorusu> etkinlikUret(EtkinlikTipi tip) {
    if (paket.isEmpty) return const <PekistirmeSorusu>[];
    final List<PaketKelime> secilenler = _karistir(paket)
        .take(soruSayisi > paket.length ? paket.length : soruSayisi)
        .toList();
    return secilenler
        .map((PaketKelime k) => _soruUret(tip, k))
        .toList(growable: false);
  }

  List<PaketKelime> _karistir(List<PaketKelime> l) {
    final List<PaketKelime> kopya = List<PaketKelime>.from(l);
    for (int i = kopya.length - 1; i > 0; i--) {
      final int j = _rnd.nextInt(i + 1);
      final PaketKelime g = kopya[i];
      kopya[i] = kopya[j];
      kopya[j] = g;
    }
    return kopya;
  }

  /// Ayni paketten celdirici uretir (paket disina CIKMAZ).
  List<String> _celdiriciler(PaketKelime dogru, String Function(PaketKelime) al,
      {int adet = 3}) {
    final List<String> havuz = paket
        .where((PaketKelime k) => k.kod != dogru.kod)
        .map(al)
        .where((String s) => s.isNotEmpty && s != al(dogru))
        .toSet()
        .toList();
    if (havuz.isEmpty) return const <String>[];
    for (int i = havuz.length - 1; i > 0; i--) {
      final int j = _rnd.nextInt(i + 1);
      final String g = havuz[i];
      havuz[i] = havuz[j];
      havuz[j] = g;
    }
    return havuz.take(adet > havuz.length ? havuz.length : adet).toList();
  }

  /// Turkcede tek "o" vardir; Ingilizcede he/she ayrimi bulunur.
  /// "O su icer." isteminde HEM "He drinks water." HEM "She drinks water."
  /// dogru olmalidir. Bu uretici iki bicimi de kabul kumesine ekler.
  static List<String> cinsiyetVaryantlari(String cumle) {
    final List<String> hepsi = <String>[cumle];
    if (cumle.startsWith('He ')) {
      hepsi.add('She ${cumle.substring(3)}');
    } else if (cumle.startsWith('She ')) {
      hepsi.add('He ${cumle.substring(4)}');
    }
    return hepsi;
  }

  List<String> _secenekYap(String dogru, List<String> celdirici) {
    final List<String> hepsi = <String>[dogru, ...celdirici];
    for (int i = hepsi.length - 1; i > 0; i--) {
      final int j = _rnd.nextInt(i + 1);
      final String g = hepsi[i];
      hepsi[i] = hepsi[j];
      hepsi[j] = g;
    }
    return hepsi;
  }

  PekistirmeSorusu _soruUret(EtkinlikTipi tip, PaketKelime k) {
    switch (tip) {
      case EtkinlikTipi.enTrEslestirme:
        return PekistirmeSorusu(
          tip: tip, kelimeKod: k.kod,
          soru: '"${k.yazilis}" kelimesinin Turkce anlami nedir?',
          secenekler: _secenekYap(k.trAnlam,
              _celdiriciler(k, (PaketKelime x) => x.trAnlam)),
          kabulEdilenler: <String>[k.trAnlam],
        );

      case EtkinlikTipi.trEnEslestirme:
        return PekistirmeSorusu(
          tip: tip, kelimeKod: k.kod,
          soru: '"${k.trAnlam}" kelimesinin Ingilizcesi nedir?',
          secenekler: _secenekYap(k.yazilis,
              _celdiriciler(k, (PaketKelime x) => x.yazilis)),
          kabulEdilenler: <String>[k.yazilis],
        );

      case EtkinlikTipi.boslukDoldurma:
        final String bosluklu = _bosluklaDegistir(k);
        return PekistirmeSorusu(
          tip: tip, kelimeKod: k.kod,
          soru: 'Boslugu doldurun:\n\n$bosluklu\n\n(${k.ornekCumleTr})',
          secenekler: const <String>[],
          kabulEdilenler: <String>[k.yazilis],
          ipucu: '${k.yazilis.length} harf · ${k.tur}',
        );

      case EtkinlikTipi.enTrCeviri:
        return PekistirmeSorusu(
          tip: tip, kelimeKod: k.kod,
          soru: 'Turkceye cevirin:\n\n${k.ornekCumle}',
          secenekler: const <String>[],
          kabulEdilenler: <String>[k.ornekCumleTr],
          ipucu: 'Anahtar kelime: ${k.yazilis} = ${k.trAnlam}',
        );

      case EtkinlikTipi.trEnCeviri:
        // Turkce "O ..." istemi hem He hem She ile cevrilebilir.
        return PekistirmeSorusu(
          tip: tip, kelimeKod: k.kod,
          soru: 'Ingilizceye cevirin:\n\n${k.ornekCumleTr}',
          secenekler: const <String>[],
          kabulEdilenler: cinsiyetVaryantlari(k.ornekCumle),
          ipucu: 'Anahtar kelime: ${k.trAnlam} = ${k.yazilis}',
        );

      case EtkinlikTipi.dogruKelimeSecme:
        return PekistirmeSorusu(
          tip: tip, kelimeKod: k.kod,
          soru: 'Hangi kelime bu cumleye uyar?\n\n'
              '${_bosluklaDegistir(k)}',
          secenekler: _secenekYap(k.yazilis,
              _celdiriciler(k, (PaketKelime x) => x.yazilis)),
          kabulEdilenler: <String>[k.yazilis],
        );

      case EtkinlikTipi.harfKarisik:
        return PekistirmeSorusu(
          tip: tip, kelimeKod: k.kod,
          soru: 'Harfleri karisik kelimeyi bulun:\n\n'
              '${_harfKaristir(k.yazilis)}\n\nAnlami: ${k.trAnlam}',
          secenekler: const <String>[],
          kabulEdilenler: <String>[k.yazilis],
          ipucu: '${k.yazilis.length} harf',
        );

      case EtkinlikTipi.cumleIcinde:
        // KENDI cumleniz kabul edilir; ornek cumleyi ezberlemek gerekmez.
        return PekistirmeSorusu(
          tip: tip, kelimeKod: k.kod,
          soru: '"${k.yazilis}" (${k.trAnlam}) kelimesini kullanarak '
              'KENDI cumlenizi yazin.',
          secenekler: const <String>[],
          kabulEdilenler: <String>[k.ornekCumle],
          dogrulama: DogrulamaTuru.hedefKelimeIceren,
          hedefKelime: k.yazilis,
          enAzKelime: 3,
          ipucu: 'En az 3 kelime. Ornek: ${k.ornekCumle}',
        );
    }
  }

  /// Hedef kelimeyi KELIME SINIRIYLA degistirir.
  /// Sinir olmadan 'read' -> 'She reads' icinde 'She ____s' gibi bozuk
  /// cikti uretiyordu. Kelime cumlede bulunamazsa cumle SONUNA bosluk
  /// eklenmez; bunun yerine cumle oldugu gibi verilir ve ipucu tasir.
  String _bosluklaDegistir(PaketKelime k) {
    final RegExp desen =
        RegExp(r'\b' + RegExp.escape(k.yazilis) + r'\b', caseSensitive: false);
    if (!desen.hasMatch(k.ornekCumle)) {
      return '${k.ornekCumle}\n\n(Hedef kelime: ____)';
    }
    return k.ornekCumle.replaceAll(desen, '____');
  }

  String _harfKaristir(String kelime) {
    final List<String> h = kelime.split('');
    if (h.length < 2) return kelime;
    for (int deneme = 0; deneme < 8; deneme++) {
      for (int i = h.length - 1; i > 0; i--) {
        final int j = _rnd.nextInt(i + 1);
        final String g = h[i];
        h[i] = h[j];
        h[j] = g;
      }
      if (h.join() != kelime) break;
    }
    return h.join(' ').toUpperCase();
  }
}
