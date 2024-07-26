import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskDetailScreen extends StatelessWidget {
  final String task;
  final String explanation;
  final String image;

  TaskDetailScreen({required this.task, required this.explanation, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details', style: GoogleFonts.lato(color: Colors.white)),
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
            Image.asset(image),
            SizedBox(height: 20),
            Text(
              task,
              style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green[900]),
            ),
            SizedBox(height: 20),
            Text(
              explanation,
              style: GoogleFonts.lato(fontSize: 16, color: Colors.green[800]),
            ),
          ],
        ),
      ),
    );
  }
}
