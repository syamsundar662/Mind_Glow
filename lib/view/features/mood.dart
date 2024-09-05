// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mind_glow_test/utils/constants.dart';
// import 'package:mind_glow_test/view/features/home.dart';

// class MoodTrackerScreen extends StatelessWidget {
//   const MoodTrackerScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final mood = Provider.of<RootScreenProvider>(context).mood;

//     return SafeArea(
//       child: Scaffold(
//           body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: homeSymmetricPadding,
//             child: CustomText(
//               title: 'How are you Feeling \ntoday..!',
//               fontWeight: FontWeight.w500,
//               size: 25,
//             ),
//           ),
//           kHeight10,
//           Padding(
//             padding: homeSymmetricPadding,
//             child: SizedBox(
//               height: 280,
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     childAspectRatio: 1,
//                     crossAxisSpacing: 3,
//                     mainAxisSpacing: 3),
//                 itemCount: 6,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(18),
//                         color: quoteAccentColors[index]),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           moodIcons[index],
//                           size: 70,
//                           color: Colors.black,
//                         ),
//                         CustomText(
//                           title: moodDescriptions[index],
//                           fontWeight: FontWeight.w500,
//                           size: 15,
//                         )
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           SubHeadings(
//             title: 'Mood History',
//           )
//         ],
//       )),
//     );
//   }
// }

// class CustomText extends StatelessWidget {
//   const CustomText({
//     super.key,
//     required this.title,
//     required this.size,
//     required this.fontWeight,
//     this.align,
//   });
//   final String title;
//   final double size;
//   final FontWeight fontWeight;
//   final TextAlign? align;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       title,
//       textAlign: align,
//       style: GoogleFonts.poppins(
//         fontSize: size,
//         fontWeight: fontWeight,
//       ),
//     );
//   }
// }import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mind_glow_test/view%20model/mood_provider.dart';
// import 'package:provider/provider.dart'; // Make sure to import this
// import 'package:mind_glow_test/utils/constants.dart';

// class MoodTrackerScreen extends StatelessWidget {
//   const MoodTrackerScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final moodProvider = Provider.of<MoodProvider>(context); // Access MoodProvider

//     return SafeArea(
//       child: Scaffold(
//           body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: homeSymmetricPadding,
//             child: CustomText(
//               title: 'How are you Feeling \ntoday..!',
//               fontWeight: FontWeight.w500,
//               size: 25,
//             ),
//           ),
//           kHeight10,
//           Padding(
//             padding: homeSymmetricPadding,
//             child: SizedBox(
//               height: 280,
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     childAspectRatio: 1,
//                     crossAxisSpacing: 3,
//                     mainAxisSpacing: 3),
//                 itemCount: moodIcons.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       moodProvider.addMood(moodDescriptions[index]);
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(18),
//                         color: moodColors[index],
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             moodIcons[index],
//                             size: 70,
//                             color: Colors.black,
//                           ),
//                           CustomText(
//                             title: moodDescriptions[index],
//                             fontWeight: FontWeight.w500,
//                             size: 15,
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Padding(
//             padding: homeSymmetricPadding,
//             child: Column(
//               children: [
//                 Text(
//                   'Mood History:',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: 150,
//                   child: ListView.builder(
//                     itemCount: moodProvider.moodHistory.length,
//                     itemBuilder: (context, index) {
//                       final moodEntry = moodProvider.moodHistory[index];
//                       return ListTile(
//                         title: Text(moodEntry.mood),
//                         subtitle: Text(moodEntry.dateTime.toString()),
//                       );
//                     },
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: moodProvider.deleteLastMood,
//                   child: Text('Delete Last Mood'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       )),
//     );
//   }
// }

// class CustomText extends StatelessWidget {
//   const CustomText({
//     super.key,
//     required this.title,
//     required this.size,
//     required this.fontWeight,
//     this.align,
//   });
//   final String title;
//   final double size;
//   final FontWeight fontWeight;
//   final TextAlign? align;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       title,
//       textAlign: align,
//       style: GoogleFonts.poppins(
//         fontSize: size,
//         fontWeight: fontWeight,
//       ),
//     );
//   }
// }

// class CustomText extends StatelessWidget {
//   const CustomText({
//     super.key,
//     required this.title,
//     required this.size,
//     required this.fontWeight,
//     this.align,
//   });
//   final String title;
//   final double size;
//   final FontWeight fontWeight;
//   final TextAlign? align;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       title,
//       textAlign: align,
//       style: GoogleFonts.poppins(
//         fontSize: size,
//         fontWeight: fontWeight,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_glow_test/view%20model/mood_provider.dart';
import 'package:mind_glow_test/view/features/home.dart';
import 'package:mind_glow_test/view/widgets/custom_text.dart';
import 'package:mind_glow_test/view/widgets/sub_heading.dart';
import 'package:provider/provider.dart'; // Make sure to import this
import 'package:mind_glow_test/utils/constants.dart';

class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({super.key});

  @override
  _MoodTrackerScreenState createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  int? selectedMoodIndex; // To keep track of the selected mood index

  @override
  Widget build(BuildContext context) {
    final moodProvider =
        Provider.of<MoodProvider>(context); // Access MoodProvider

    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: homeSymmetricPadding,
            child: CustomText(
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
                    mainAxisSpacing: 5),
                itemCount: moodIcons.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedMoodIndex ==
                      index; // Check if the mood is selected
                  return GestureDetector(
                    onTap: () {
                      if (selectedMoodIndex == null) {
                        setState(() {
                          selectedMoodIndex =
                              index; // Update selected mood index
                          moodProvider.addMood(
                              moodDescriptions[index], moodIcons[index]);
                        });
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: isSelected
                            ? quoteAccentColors[index]
                            : Colors.grey[300], // Change color if selected
                      ),
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
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Row(
            children: [
              const SubHeadings(
                title: 'Mood History',
              ),
              ElevatedButton(
                onPressed: () {
                  if (selectedMoodIndex != null) {
                    moodProvider.deleteLastMood();
                    setState(() {
                      selectedMoodIndex = null; // Reset selected mood index
                    });
                  }
                },
                child: const Text('Delete Last Mood'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: homeSymmetricPadding,
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: moodProvider.moodHistory.length,
                    itemBuilder: (context, index) {
                      final moodEntry = moodProvider.moodHistory[index];
                      return ListTile(
                        title: Text(
                          moodEntry.mood,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        subtitle: Text(moodEntry.dateTime.toString()),
                        trailing: Icon(moodEntry.iconData),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
