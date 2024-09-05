import 'package:flutter/material.dart';
import 'package:mind_glow_test/view/main%20pages/community_screen.dart';
import 'package:mind_glow_test/view/main%20pages/home_screen.dart';
import 'package:mind_glow_test/view/main%20pages/mood_screen.dart';
import 'package:mind_glow_test/view/main%20pages/resources_screen.dart';

class RootScreenProvider extends ChangeNotifier {
  int currentIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const MoodTrackerScreen(),
    const ResourcesPage(),
    const UsersListPage(),
  ];

  Widget get currentScreen => _screens[currentIndex];

  void updateIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
