import 'package:flutter/material.dart';

class MindGlowProvider extends ChangeNotifier {
  String _mood = 'Neutral';

  String get mood => _mood;

  void updateMood(String newMood) {
    _mood = newMood;
    notifyListeners();
  }

}
