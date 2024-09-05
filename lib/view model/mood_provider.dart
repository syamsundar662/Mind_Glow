import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mind_glow_test/model/mood_entry.dart';

class MoodProvider extends ChangeNotifier {
  final List<MoodEntry> _moodHistory = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<MoodEntry> get moodHistory => _moodHistory;

  Future<void> addMood(String mood, IconData icon, Color color) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      MoodEntry newEntry = MoodEntry(
        mood: mood,
        dateTime: DateTime.now(),
        icon: icon,
        moodColor: color,
      );

      await _firestore.collection('users').doc(uid).collection('moods').add({
        'mood': mood,
        'dateTime': newEntry.dateTime.toIso8601String(),
        'iconCode': icon.codePoint,
        // ignore: deprecated_member_use
        'color': color.value,
      });

      _moodHistory.add(newEntry);
      notifyListeners();
    } catch (e) {
      log('Error adding mood: $e');
    }
  }

  Future<void> fetchMoodHistory() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .doc(uid)
          .collection('moods')
          .orderBy('dateTime', descending: true)
          .get();

      _moodHistory.clear();

      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        MoodEntry moodEntry = MoodEntry(
          moodColor: Color(data['color']),
          mood: data['mood'],
          dateTime: DateTime.parse(data['dateTime']),
          icon: IconData(data['iconCode'], fontFamily: 'MaterialIcons'),
        );
        _moodHistory.add(moodEntry);
      }

      notifyListeners();
    } catch (e) {
      log('Error fetching mood history: $e');
    }
  }

  void deleteMood(int index) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .doc(uid)
          .collection('moods')
          .get();

      await _firestore
          .collection('users')
          .doc(uid)
          .collection('moods')
          .doc(snapshot.docs[index].id)
          .delete();

      _moodHistory.removeAt(index);
      notifyListeners();
    } catch (e) {
      log('Error deleting mood: $e');
    }
  }
}
