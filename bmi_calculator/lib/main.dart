import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          centerTitle: true,
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF0A0E21),
          brightness: Brightness.dark,
        ),
        // textTheme: GoogleFonts.merriweatherTextTheme(
        textTheme: GoogleFonts.robotoTextTheme(
          ThemeData.dark().textTheme,
        ).apply(bodyColor: Colors.white),
      ),
      home: InputPage(),
    );
  }
}
