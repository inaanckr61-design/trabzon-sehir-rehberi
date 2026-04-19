import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ana_sayfa.dart';

// Uygulamayı buradan başlatıyorum.
void main() {
  runApp(const TrabzonRehberiApp());
}

class TrabzonRehberiApp extends StatelessWidget {
  const TrabzonRehberiApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Projede aynı renkleri tekrar tekrar yazmamak için sabit tuttum.
    const bordo = Color(0xFF7A1E2E);
    const lacivert = Color(0xFF0D3B66);

    return MaterialApp(
      title: 'Trabzon Şehir Rehberi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Genel tema ayarlarını tek noktadan yönetiyorum.
        colorScheme: ColorScheme.fromSeed(
          seedColor: bordo,
          primary: bordo,
          secondary: lacivert,
          surface: const Color(0xFFF4F6F9),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.nunitoTextTheme(),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: bordo,
        ),
      ),
      // Açılışta ilk görünen ekran ana sayfa oluyor.
      home: const AnaSayfa(),
    );
  }
}
