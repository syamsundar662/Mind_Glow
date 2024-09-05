import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_glow_test/utils/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a YoutubePlayerController
    final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId('https://www.youtube.com/watch?v=inpok4MKVLM') ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight10,
              Padding(
                padding: homeSymmetricPadding,
                child: Text(
                  'Hey Syam',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 30),
                ),
              ),
              SubHeadings(title: getGreeting(), align: TextAlign.start),
              kHeight10,
              CarouselSlider.builder(
                  itemCount: homeQuotes1.length,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      margin: homeSymmetricPadding,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              homeQuotesHeadings[index],
                              style: GoogleFonts.poppins(
                                  fontSize: 23, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              homeQuotes[index],
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 120,
                    viewportFraction: 1,
                    aspectRatio: 3 / 1,
                  )),
              kHeight10,
              const SubHeadings(
                  title: 'Daily Activities', align: TextAlign.start),
              kHeight10,
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: homeSymmetricPadding,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: quoteAccentColors[index]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            kHeight40,
                            Icon(
                              icons[index],
                              size: 50,
                            ),
                            Text(
                              dailyActivityHeadings[index],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              kHeight10,
              SubHeadings(
                title: 'Mindful Resources',
                align: TextAlign.start,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  onReady: () {
                    // Do something when the player is ready
                  },
                ),
              ),
              kHeight10,
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: mindfullResourses.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: homePaddingAll5,
                    width: double.infinity,
                    height: 80,
                    child: Center(
                        child: SubHeadings(
                      title: mindfullResourses[index],
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black12),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<String> mindfullResourses = [
  'Books',
  'Websites',
  'Videos',
  'Social Media Accounts'
];

class SubHeadings extends StatelessWidget {
  const SubHeadings({
    super.key,
    required this.title,
    this.align,
  });
  final String title;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: homeSymmetricPadding,
      child: Text(
        title,
        textAlign: align,
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

List<IconData> icons = [
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
