import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/input_screen.dart';

void main() {
  runApp(ClimateChangeHelperApp());
}

class ClimateChangeHelperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Climate Change Helper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.lightGreen[50],
        appBarTheme: AppBarTheme(
          color: Colors.green[700],
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        ),
        textTheme: TextTheme(
          bodyText1: GoogleFonts.lato(color: Colors.green[900], fontSize: 18),
          bodyText2: GoogleFonts.lato(color: Colors.green[800], fontSize: 16),
          headline6: GoogleFonts.lato(color: Colors.white, fontSize: 20),
        ),
      ),
      home: InputScreen(),
    );
  }
}
