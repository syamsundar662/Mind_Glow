import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mind_glow_test/model/mood_entry.dart';


class MoodProvider extends ChangeNotifier {
  List<MoodEntry> _moodHistory = [];
  DateTime? _lastMoodDate; // Track the date of the last mood entry

  List<MoodEntry> get moodHistory => _moodHistory;

  bool canAddMood() {
    if (_lastMoodDate == null) return true; // No mood added yet
    return !isSameDay(_lastMoodDate!, DateTime.now());
  }

  void addMood(String mood,IconData icons) {
    if (!canAddMood()) return; // Prevent adding if mood already set for today
    MoodEntry newEntry = MoodEntry(mood: mood, dateTime: DateTime.now(),icons);
    _moodHistory.add(newEntry);
    _lastMoodDate = DateTime.now(); // Update last mood date
    notifyListeners();
    // _saveMoodToFirebase(newEntry);
  }

  // Future<void> _saveMoodToFirebase(MoodEntry entry) async {
  //   await FirebaseFirestore.instance.collection('moodHistory').add({
  //     'mood': entry.mood,
  //     'dateTime': entry.dateTime.toIso8601String(),
  //   });
  // }

  void deleteLastMood() {
    if (_moodHistory.isNotEmpty) {
      _moodHistory.removeLast(); // Remove the last mood entry
      _lastMoodDate = _moodHistory.isNotEmpty ? _moodHistory.last.dateTime : null; // Update last mood date
      notifyListeners();
      // Optionally, delete from Firebase as well
      // Implement deletion logic if needed
    }
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return DateFormat('yyyy-MM-dd').format(date1) == DateFormat('yyyy-MM-dd').format(date2);
  }
}
