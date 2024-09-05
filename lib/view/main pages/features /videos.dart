
// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class YoutubeVideoCard extends StatelessWidget {
//   final String videoUrl;
//   final String title;
//   final String description;

//   const YoutubeVideoCard({
//     Key? key,
//     required this.videoUrl,
//     required this.title,
//     required this.description,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final String? videoId = YoutubePlayer.convertUrlToId(videoUrl);

//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           YoutubePlayer(
//             controller: YoutubePlayerController(
//               initialVideoId: videoId ?? '',
//               flags: const YoutubePlayerFlags(autoPlay: false),
//             ),
//             showVideoProgressIndicator: true,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               title,
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text(description),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class YoutubeVideoListPage extends StatelessWidget {
//   final List<String> videoLinks = [
//     'https://www.youtube.com/watch?v=ssss7V1_eyA',
//     // Add more video URLs here
//   ];

//   final List<String> videoTitles = [
//     'Video Title 1',
//     // Add corresponding titles here
//   ];

//   final List<String> videoDescriptions = [
//     'Description for Video 1',
//     // Add corresponding descriptions here
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Top YouTube Videos'),
//       ),
//       body: ListView.builder(
//         itemCount: videoLinks.length,
//         itemBuilder: (context, index) {
//           return YoutubeVideoCard(
//             videoUrl: videoLinks[index],
//             title: videoTitles[index],
//             description: videoDescriptions[index],
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mind_glow_test/view/widgets/sub_heading.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoPage extends StatelessWidget {
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

  VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Videos'),
      ),
      body: ListView.builder(
        itemCount: links.length,
        itemBuilder: (context, index) {
          final videoId = YoutubePlayer.convertUrlToId(links[index]) ?? '';
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: videoId,
                    flags: const YoutubePlayerFlags(
                      autoPlay: false,
                      mute: false,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    descriptions[index],
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
