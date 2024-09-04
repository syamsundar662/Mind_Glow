
import 'package:flutter/material.dart';
import 'package:mind_glow_test/view%20model/home_view_model.dart';
import 'package:provider/provider.dart';

class MoodTrackerScreen extends StatelessWidget {
  const MoodTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mood = Provider.of<MindGlowProvider>(context).mood;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mood Tracker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Current Mood: $mood'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<MindGlowProvider>(context, listen: false).updateMood('Happy');
              },
              child: Text('Log Mood as Happy'),
            ),
          ],
        ),
      ),
    );
  }
}
