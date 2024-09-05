import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookPage extends StatelessWidget {
  BookPage({super.key});

  final List<String> bookTitles = [
    "The Miracle of Mindfulness",
    "Wherever You Go, There You Are",
    "The Power of Now",
    "Radical Acceptance",
    "10% Happier"
  ];

  final List<String> bookDescriptions = [
    "A classic guide to mindfulness that offers practical exercises and teachings.",
    "An introduction to mindfulness meditation and its benefits.",
    "Focuses on the importance of living in the present moment and overcoming anxiety.",
    "Explores how mindfulness and self-compassion can help in overcoming feelings of unworthiness.",
    "A personal account of how mindfulness and meditation can improve life."
  ];

  final List<String> bookLinks = [
    "https://www.google.co.in/books/edition/The_Miracle_of_Mindfulness/oXmSCwAAQBAJ?hl=en&gbpv=1&printsec=frontcover",
    "https://www.google.co.in/books/edition/Wherever_You_Go_There_You_Are/kVHhCwAAQBAJ?hl=en&gbpv=1&printsec=frontcover",
    "https://www.google.co.in/books/edition/The_Power_of_Now/sQYqRCIhFAMC?hl=en&gbpv=1&printsec=frontcover.",
    "https://www.google.co.in/books/edition/Radical_Acceptance/njUp-vfM5DoC?hl=en&gbpv=1",
    "https://www.google.co.in/books/edition/10_Happier/Yc2ZAwAAQBAJ?hl=en&gbpv=1&printsec=frontcover"
  ];

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url); 
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      log('Error launching URL: $e'); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mindfulness Books'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: bookTitles.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: InkWell(
                onTap: () {
                  _launchURL(bookLinks[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bookTitles[index],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue, // Indicating it's clickable
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        bookDescriptions[index],
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
