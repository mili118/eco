import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'home_screen.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  double _busynessLevel = 5;

  void _navigateToHomeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(busynessLevel: _busynessLevel),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMMd().format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text('How busy are you today?', style: TextStyle(color: Colors.white),),
        
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formattedDate,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'On a scale of 1 to 10, how busy are you today?',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                valueIndicatorColor: Colors.green,
                activeTrackColor: Colors.green,
                inactiveTrackColor: Colors.green[100],
                thumbColor: Colors.green,
                overlayColor: Colors.green.withAlpha(32),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
              ),
              child: Slider(
                value: _busynessLevel,
                min: 1,
                max: 10,
                divisions: 9,
                label: _busynessLevel.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _busynessLevel = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateToHomeScreen,
              child: Text(
                'Get Task Suggestion',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
