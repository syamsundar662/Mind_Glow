import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_glow_test/utils/constants.dart';
import 'package:mind_glow_test/view/get%20start/screen_three.dart';
import 'package:mind_glow_test/view/widgets/sub_heading.dart';

class GetStartedScreenTwo extends StatelessWidget {
  const GetStartedScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              kHeight100,
              kHeight100,
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(
                  'assets/Group 2-2.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              kHeight10,
              const SizedBox(
                width: double.infinity,
                child: SubHeadings(
                  title: "Intelligent Mood Tracking",
                  align: TextAlign.center,
                ),
              ),
              kHeight20,
              Text(
                getStartedDescriptions[1],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              kHeight100,
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const GetStartedScreenThree()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
