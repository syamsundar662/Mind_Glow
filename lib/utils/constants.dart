// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetChecker {
  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}

const String url = '';

late double screenFullWidth;
late double screenFullHeight;
void size(BuildContext context) {
  screenFullWidth = MediaQuery.of(context).size.width;
  screenFullHeight = MediaQuery.of(context).size.height;
}

const homeSymmetricPadding = EdgeInsets.symmetric(horizontal: 12);
const homePaddingAll5 = EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5);
List<String> homeQuotes1 = [
  "The mind is everything. What you think, you become. – Buddha",
  "You are stronger than you know, braver than you think, and smarter than you believe. – Unknown",
  "Happiness is not something ready-made. It comes from your own actions. – Dalai Lama",
  "Believe you can, and you’re halfway there. – Theodore Roosevelt",
  "Your life does not get better by chance; it gets better by change. – Jim Rohn",
  "Self-care is not a luxury; it is a necessity. – Audre Lorde",
  "Every day may not be good, but there’s something good in every day. – Alice Morse Earle",
  "In the middle of every difficulty lies opportunity. – Albert Einstein",
  "The only way to do great work is to love what you do. – Steve Jobs",
  "Take a deep breath. It's just a bad day, not a bad life. – Unknown"
];
List<String> homeQuotesHeadings = [
  "Gratitude Journal",
  "Mindful Minutes",
  "Nature Walk",
  "Compliment Challenge",
  "Digital Detox",
  "Acts of Kindness",
  "Positive Affirmations",
  "Creative Expression",
  "Healthy Habit Tracker",
  "Reflection Time",
];
List<String> homeQuotes = [
  "Write down three things you're grateful for each day for a week.",
  "Spend 5-10 minutes each day practicing mindfulness or meditation.",
  "Take a walk in nature and note five things you see or hear.",
  "Give genuine compliments to three people throughout the day.",
  "Spend a day without social media and reflect on how it feels.",
  "Perform three random acts of kindness within a week.",
  "Create and repeat a set of positive affirmations daily for a week.",
  "Dedicate time to a creative activity, like drawing or writing, for 30 minutes.",
  "Start a new healthy habit, like drinking more water or exercising, and track it for a week.",
  "Set aside 10 minutes each evening to reflect on your day and what you learned.",
];




List<Color> quoteAccentColors = [
  Colors.blue.withOpacity(0.3),         // Light blue
  Colors.green.withOpacity(0.3),        // Light green
  Colors.orange.withOpacity(0.3),       // Light orange
  Colors.red.withOpacity(0.3),          // Light red
  Colors.purple.withOpacity(0.3),       // Light purple
  Colors.teal.withOpacity(0.3),         // Light teal
  Colors.amber.withOpacity(0.3),        // Light amber
  Colors.cyan.withOpacity(0.3),         // Light cyan
  Colors.indigo.withOpacity(0.3),       // Light indigo
  Colors.brown.withOpacity(0.3),        // Light brown
];


String getGreeting() {
  final hour = DateTime.now().hour;

  if (hour < 12) {
    return "Good Morning";
  } else if (hour < 17) {
    return "Good Noon";
  } else if (hour < 21) {
    return "Good Evening";
  } else {
    return "Look at the time, Better You Take A Nap :)";
  }
}

const kHeight10 = SizedBox(
  height: 10,
);
const kHeight20 = SizedBox(
  height: 20,
);
const kHeight30 = SizedBox(
  height: 30,
);
const kHeight40 = SizedBox(
  height: 40,
);
const kHeight50 = SizedBox(
  height: 50,
);
const kHeight60 = SizedBox(
  height: 60,
);
const kHeight100 = SizedBox(
  height: 100,
);
const kHeight200 = SizedBox(
  height: 200,
);

const kWidth10 = SizedBox(
  width: 10,
);
const kWIdth20 = SizedBox(
  width: 20,
);
const kWIdth30 = SizedBox(
  width: 30,
);
const kWIdth40 = SizedBox(
  width: 40,
);


List<String> dailyActivityHeadings = [
  "Morning Breath Awareness",
  "Mindful Walking",
  "One-Minute Mindfulness",
  "Mindful Eating",
  "Mindful Listening",
  "Mindful Stretching",
  "Evening Gratitude",
  "Digital Mindfulness",
  "Mindful Observation",
  "Mindful Journaling",
];
List<String> dailtActivityDescriptions = [
  "Start your day by spending five minutes focusing on your breath. Sit up in bed or find a quiet spot, close your eyes, and take deep, calming breaths. This will help set a mindful tone for the day ahead.",
  "As you walk to work, school, or even around your home, focus on the sensation of your feet touching the ground, the movement of your legs, and the rhythm of your breath. Notice your surroundings with a fresh perspective.",
  "At any point during the day, pause for one minute. Close your eyes, take deep breaths, and focus on the present moment. Notice how you feel, the sounds around you, and your breath.",
  "During one meal, eat slowly and mindfully. Pay attention to the taste, texture, and smell of your food. Chew slowly and savor each bite, focusing solely on the act of eating.",
  "When in conversation, practice listening fully. Avoid interrupting, and instead, focus entirely on what the other person is saying. Notice their tone, pace, and body language.",
  "Take a few moments to stretch mindfully. Focus on each movement, noticing how your muscles feel as they stretch and relax. Coordinate your stretches with deep breaths.",
  "Before bed, write down three things you're grateful for. Reflect on these moments, big or small, that brought positivity to your day.",
  "Spend a day being mindful of your digital usage. Notice when and why you reach for your phone or other devices. Try to minimize distractions and focus on being present in the physical world.",
  "Choose an object in your environment (like a plant, a cup, or a picture) and observe it closely for a few minutes. Notice the colors, shapes, and details that you may not have seen before.",
  "At the end of the day, write down your thoughts, feelings, and experiences. Focus on being present in the moment as you write, and let your thoughts flow without judgment.",
];

List<IconData> dailyActivitiesIcons = [
  Icons.self_improvement, // Morning Breath Awareness
  Icons.directions_walk, // Mindful Walking
  Icons.timer, // One-Minute Mindfulness
  Icons.restaurant, // Mindful Eating
  Icons.hearing, // Mindful Listening
  Icons.fitness_center, // Mindful Stretching
  Icons.favorite, // Evening Gratitude
  Icons.phone_disabled, // Digital Mindfulness
  Icons.remove_red_eye, // Mindful Observation
  Icons.book, // Mindful Journaling
];

List<IconData> mindfullResoursesIcon = [
  Icons.menu_book_rounded,
  Icons.video_collection_rounded,
  Icons.web,
  Icons.phone_android_rounded,
];
List<String> mindfullResourses = [
  'Books',
  'Videos',
  'Websites',
  'Social Media Accounts'
];

//mood page

List<IconData> moodIcons = [
  Icons.sentiment_very_dissatisfied, // Depressed
  Icons.sentiment_dissatisfied, // Sad
  Icons.sentiment_neutral, // Neutral
  Icons.sentiment_satisfied, // Happy
  Icons.sentiment_very_satisfied,
  Icons.sentiment_very_dissatisfied
  // Overjoyed
];
List<Color> moodColors = [
  Colors.purpleAccent, // Depressed (dark blue-grey)
  Colors.orangeAccent, // Sad (medium blue-grey)
  Colors.greenAccent, // Neutral (neutral grey)
  Colors.greenAccent, // Happy (light green)
  Colors.yellowAccent, // Overjoyed (bright green)
  Colors.brown
];
List<String> moodDescriptions = [
  'Depressed', // For Icons.sentiment_very_dissatisfied
  'Sad', // For Icons.sentiment_dissatisfied
  'Neutral', // For Icons.sentiment_neutral
  'Happy', // For Icons.sentiment_satisfied
  'Overjoyed',
  'Dissatisfied' // For Icons.sentiment_very_satisfied
];

List<String> bookTitles = [
  "The Miracle of Mindfulness",
  "Wherever You Go, There You Are",
  "The Power of Now",
  "Radical Acceptance",
  "10% Happier"
];

List<String> bookDescriptions = [
  "A classic guide to mindfulness that offers practical exercises and teachings.",
  "An introduction to mindfulness meditation and its benefits.",
  "Focuses on the importance of living in the present moment and overcoming anxiety.",
  "Explores how mindfulness and self-compassion can help in overcoming feelings of unworthiness.",
  "A personal account of how mindfulness and meditation can improve life."
];
List<String> bookLinks = [
  "https://www.google.co.in/books/edition/The_Miracle_of_Mindfulness/oXmSCwAAQBAJ?hl=en&gbpv=1&printsec=frontcover",
  "https://www.google.co.in/books/edition/Wherever_You_Go_There_You_Are/kVHhCwAAQBAJ?hl=en&gbpv=1&printsec=frontcover",
  "https://www.google.co.in/books/edition/The_Power_of_Now/sQYqRCIhFAMC?hl=en&gbpv=1&printsec=frontcover.",
  "https://www.google.co.in/books/edition/Radical_Acceptance/njUp-vfM5DoC?hl=en&gbpv=1",
  "https://www.google.co.in/books/edition/10_Happier/Yc2ZAwAAQBAJ?hl=en&gbpv=1&printsec=frontcover"
];
List<String> getStartedkeyFeatures = [
  "Personalize Your Mental Health State",
  "Intelligent Mood Tracking",
  "Mindful Resources That Make You Happy"
];

List<String> getStartedDescriptions = [
  "Tailor your mental well-being journey by tracking your emotions, setting personalized goals, and receiving insights that help you understand and improve your mental health.",
  "Keep track of your emotional patterns with smart mood tracking, offering data-driven insights and trends that empower you to manage stress, anxiety, and other emotions.",
  "Access a curated collection of mindfulness exercises, articles, and tools designed to promote happiness, relaxation, and emotional balance in your daily life."
];
  List<String> links = [
    'https://www.youtube.com/watch?v=1ZYbU82GVz4', // 10 Minute Guided Meditation
    'https://www.youtube.com/watch?v=ssss7V1_eyA', // Mindfulness Meditation for Beginners
    'https://youtu.be/8BeKhf74fsE?si=Dr6WKaAImfWS-PDh', // Guided Meditation for Anxiety
    'https://youtu.be/DPjB-1OCUMA?si=odcAyfQi903TjA_G', // Guided Meditation for Self-Love
    'https://youtu.be/ztTexqGQ0VI?si=ug1dJFi2bLUUipM3', // Morning Meditation for Positivity
    'https://youtu.be/Rx5X-fo_fEI?si=Gk0WwgdL2gUvpMK-', // 20-Minute Guided Meditation
  ];

  List<String> descriptions = [
    'A simple 10-minute guided meditation to help you relax and focus on your breath.',
    'An introduction to mindfulness meditation for beginners to develop awareness and presence.',
    'This guided meditation is designed to help alleviate anxiety and bring calmness.',
    'A guided session focused on fostering self-love and acceptance within yourself.',
    'A refreshing morning meditation to start your day with positivity and gratitude.',
    'A 20-minute guided meditation to help you release stress and enhance mindfulness.',
  ];