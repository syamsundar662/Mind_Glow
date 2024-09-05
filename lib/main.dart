import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mind_glow_test/firebase_options.dart';
import 'package:mind_glow_test/utils/theme.dart';

import 'package:mind_glow_test/view%20model/auth_provider.dart';
import 'package:mind_glow_test/view%20model/community_provider.dart';
import 'package:mind_glow_test/view%20model/mood_provider.dart';
import 'package:mind_glow_test/view%20model/resources_provider.dart';
import 'package:mind_glow_test/view%20model/root_screen_provider.dart';
import 'package:mind_glow_test/view/root/root_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => RootScreenProvider()),
        ChangeNotifierProvider(create: (context)=>MoodProvider()),
        ChangeNotifierProvider(create: (context)=>CommentsProvider()),
        ChangeNotifierProvider(create: (context)=>UserProvider ())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:lightTheme,
        
        home: RootScreen(),
      ),
    );
  }
}
