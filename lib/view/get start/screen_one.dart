import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_glow_test/utils/constants.dart';
import 'package:mind_glow_test/view/get%20start/screen_two.dart';
import 'package:mind_glow_test/view/widgets/sub_heading.dart';

class GetStartedScreenOne extends StatelessWidget {
  const GetStartedScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                'assets/Group-5.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            kHeight10,
            const SizedBox(
              width: double.infinity,
              child: SubHeadings(
                title: "Personalize Your Mental\n Health State",
                align: TextAlign.center,
              ),
            ),
            kHeight20,
            Text(
              getStartedDescriptions[0],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            kHeight100,
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const GetStartedScreenTwo()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                'next',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
