import 'package:flutter/material.dart';
import 'package:mind_glow_test/view%20model/auth_provider.dart';
import 'package:mind_glow_test/view/root/root_screen.dart';
import 'package:mind_glow_test/view/get%20start/get_started.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => Provider.of<AuthProvider>(context).user != null
              ? const RootScreen()
              : const GetStartedPage(),
        ),
      );
    });

    return Scaffold(
      body: Center(
          child: SizedBox(
              height: 170, child: Image.asset('assets/Group 1-2.png'))),
    );
  }
}
