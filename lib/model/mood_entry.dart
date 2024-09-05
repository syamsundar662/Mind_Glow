
import 'package:flutter/material.dart';

class MoodEntry {
  final String mood;
  final DateTime dateTime;
  final IconData icon;
  final Color moodColor;

  MoodEntry({
    required this.mood,
    required this.dateTime,
    required this.icon,
    required this.moodColor,
  });
}
