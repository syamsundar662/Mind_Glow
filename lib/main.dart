import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mind_glow_test/firebase_options.dart';
import 'package:mind_glow_test/utils/theme.dart';
import 'package:mind_glow_test/view%20model/auth_provider.dart';
import 'package:mind_glow_test/view%20model/home_view_model.dart';
import 'package:mind_glow_test/view/features/splash.dart';
import 'package:mind_glow_test/view/home/home_screen.dart';
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
        ChangeNotifierProvider(create: (context) => RootScreenProvider())
      ],
      child: MaterialApp(
        theme:lightTheme,
        home: RootScreen(),
      ),
    );
  }
}
