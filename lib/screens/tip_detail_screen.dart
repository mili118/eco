import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TipDetailScreen extends StatelessWidget {
  final String title;
  final String details;

  TipDetailScreen({required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: GoogleFonts.lato(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green[900]),
            ),
            SizedBox(height: 20),
            Text(
              details,
              style: GoogleFonts.lato(fontSize: 16, color: Colors.green[800]),
            ),
          ],
        ),
      ),
    );
  }
}
