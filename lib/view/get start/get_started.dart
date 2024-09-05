import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_glow_test/utils/constants.dart';
import 'package:mind_glow_test/view/auth/signin.dart';
import 'package:mind_glow_test/view/get%20start/screen_one.dart';
import 'package:mind_glow_test/view/widgets/sub_heading.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image from assets
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(
                  'assets/Frame.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),
              // Title text
              const SubHeadings(
                title: 'Welcome to MindGlow',
              ),
              const SizedBox(height: 20),
              // Description text
              const Text(
                'Your personal guide to mindfulness and well-being. Get started today and improve your mental health.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Get Started Button
               kHeight100,
               kHeight60,
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const GetStartedScreenOne()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
             
              TextButton(
                style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.white)),
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => const SignInScreen()));
                },
                child: const Text(
                  'Already have an account? Log In',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              kHeight20
            ],
          ),
        ),
      ),
    );
  }
}
