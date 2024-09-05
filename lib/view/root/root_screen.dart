import 'package:flutter/material.dart';
import 'package:mind_glow_test/view%20model/root_screen_provider.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final homeScreenProvider = Provider.of<RootScreenProvider>(context);
    return Scaffold(
      body: homeScreenProvider.currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.grey,
        useLegacyColorScheme: false,
        items: const [ 
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mood),
          label: 'Mood Tracker',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
          label: 'Resources',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Community',
        ),
      ], currentIndex: homeScreenProvider.currentIndex,
      onTap: (value) {
        homeScreenProvider.updateIndex(value);
      },
      ),
      
    );
  }
}
