import 'package:flutter/material.dart';

class MoodEntry {
  final String mood;
  final DateTime dateTime;
  final IconData iconData;

  MoodEntry(this.iconData, {required this.mood, required this.dateTime});
}
