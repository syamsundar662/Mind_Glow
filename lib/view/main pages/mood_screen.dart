import 'package:flutter/material.dart';
import 'package:mind_glow_test/view%20model/mood_provider.dart';
import 'package:mind_glow_test/view/widgets/custom_text.dart';
import 'package:mind_glow_test/view/widgets/sub_heading.dart';
import 'package:provider/provider.dart';
import 'package:mind_glow_test/utils/constants.dart';

class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({super.key});

  @override
  MoodTrackerScreenState createState() => MoodTrackerScreenState();
}

class MoodTrackerScreenState extends State<MoodTrackerScreen> {
  int? selectedMoodIndex;

  @override
  void initState() {
    super.initState();
    // Fetch the mood history when the screen is loaded
    Provider.of<MoodProvider>(context, listen: false).fetchMoodHistory();
  }

  @override
  Widget build(BuildContext context) {
    final moodProvider = Provider.of<MoodProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const SubHeadings(title: 'Mood Tracker')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: homeSymmetricPadding + homeSymmetricPadding,
              child: const CustomText(
                title: 'How are you Feeling \ntoday..!',
                fontWeight: FontWeight.w500,
                size: 25,
              ),
            ),
            kHeight10,
            Padding(
              padding: homeSymmetricPadding,
              child: SizedBox(
                height: 280,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: moodIcons.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedMoodIndex = index;
                          moodProvider.addMood(moodDescriptions[index],
                              moodIcons[index], quoteAccentColors[index]);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: quoteAccentColors[index]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              moodIcons[index],
                              size: 70,
                              color: Colors.black,
                            ),
                            CustomText(
                              title: moodDescriptions[index],
                              fontWeight: FontWeight.w500,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SubHeadings(title: 'Mood History'),
            Expanded(
              child: ListView.builder(
                itemCount: moodProvider.moodHistory.length,
                itemBuilder: (context, index) {
                  final moodEntry = moodProvider.moodHistory[index];
                  return Container(
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: moodEntry.moodColor),
                    margin: homePaddingAll5,
                    child: Row(
                      children: [
                        kWidth10,
                        Icon(moodEntry.icon, size: 35),
                        kWidth10,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              moodEntry.mood,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            Text(moodEntry.dateTime.toString()),
                          ],
                        ),
                        const Spacer(),
                        IconButton( 
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              moodProvider.deleteMood(index);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

