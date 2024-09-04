
import 'package:flutter/material.dart';
import 'package:mind_glow_test/view%20model/auth_provider.dart';
import 'package:mind_glow_test/view/auth/signin.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Provider.of<AuthProvider>(context).user != null
                  ? SignInScreen() // Change this to your home screen if user is authenticated
                  : SignInScreen(),
        ),
      );
    });

    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to MyApp!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}