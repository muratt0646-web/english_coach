import 'package:flutter/material.dart';

import '../../shared_ui/bolum_basligi.dart';
import '../../shared_ui/gelistirme_notu.dart';

/// Gunluk Hayat Senaryolari — iskelet ekrani.
class SenaryoEkrani extends StatelessWidget {
  const SenaryoEkrani({super.key});

  static const List<List<String>> _senaryolar = <List<String>>[
    <String>['Kafede siparis', 'A1', 'Icecek ve yiyecek isteme, hesap odeme'],
    <String>['Havaalaninda', 'A2', 'Check-in, bagaj, kapi sorma'],
    <String>['Alisveris', 'A1', 'Fiyat sorma, beden isteme, deneme'],
    <String>['Yol tarifi', 'A2', 'Adres sorma, yon anlama'],
    <String>['Doktorda', 'B1', 'Sikayet anlatma, randevu alma'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gunluk Hayat Senaryolari')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              const GelistirmeNotu(
                calisan: 'senaryo listesi ve tanitim',
                bekleyen: 'diyalog akisi, rol yapma, kalip cumle havuzu, '
                    'sesli okuma',
              ),
              const BolumBasligi('Senaryolar',
                  altBaslik: 'Gercek durumlarda kullanilan kalip cumleler',
                  ikon: Icons.forum_outlined),
              ..._senaryolar.map((List<String> s) => Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: CircleAvatar(child: Text(s[1])),
                      title: Text(s[0]),
                      subtitle: Text(s[2]),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('"${s[0]}" senaryosu Faz 4E\'de '
                              'eklenecek.'),
                        ),
                      ),
                    ),
                  )),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
