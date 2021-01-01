import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:sudoku_game/giris_sayfasi.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter('sudoku');
  // Box => sql veritabanları tablolara denk gelir.
  await Hive.openBox('ayarlar');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
        valueListenable:
            Hive.box('ayarlar').listenable(keys: ['karanlik_tema', 'dil']),
        builder: (context, kutu, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: kutu.get('karanlik_tema', defaultValue: false)
                ? ThemeData.dark()
                : ThemeData.light(),
            /* theme: ThemeData(
                textTheme: GoogleFonts.lobsterTextTheme(),
                appBarTheme:
                    AppBarTheme(textTheme: GoogleFonts.lobsterTextTheme())), */
            home: GirisSayfasi(),
          );
        });
  }
}
