import 'package:flutter/material.dart';
import 'package:mind_glow_test/view/features/community.dart';
import 'package:mind_glow_test/view/features/home.dart';
import 'package:mind_glow_test/view/features/mood.dart';
import 'package:mind_glow_test/view/features/resources.dart';

class RootScreenProvider extends ChangeNotifier {
  // String _mood = 'Neutral';
  int currentIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const MoodTrackerScreen(),
     ResourcesPage(),
    const CommunityPage(),
  ];

  Widget get currentScreen => _screens[currentIndex];

  void updateIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }

  // String get mood => _mood;

  // void updateMood(String newMood) {
  //   _mood = newMood;
  //   notifyListeners();
  // }
}
