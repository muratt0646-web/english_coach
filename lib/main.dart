import 'package:flutter/material.dart';

import 'core/db/app_database.dart';
import 'app/ana_ekran.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase.instance.ac();
  runApp(const EnglishCoachApp());
}

class EnglishCoachApp extends StatelessWidget {
  const EnglishCoachApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Coach',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const AnaEkran(),
    );
  }
}
