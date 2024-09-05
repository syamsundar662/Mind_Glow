import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_glow_test/utils/constants.dart';
import 'package:mind_glow_test/view/widgets/sub_heading.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a YoutubePlayerController
    final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
              'https://www.youtube.com/watch?v=inpok4MKVLM') ??
          '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.blueGrey,
        backgroundColor: Colors.white,
        title: Text(
          'Hey Syam',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 30),
        ),
        actions: [const Icon(Icons.notifications_active_outlined), kWidth10],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHeight10,
            SubHeadings(title: getGreeting(), align: TextAlign.start),
            kHeight10,
            _homeMainCarouselSlider(),
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
                            dailyActivitiesIcons[index],
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
            const SubHeadings(
              title: 'Mindful Resources',
              align: TextAlign.start,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: YoutubePlayer(
            //     controller: _controller,
            //     showVideoProgressIndicator: true,
            //     onReady: () {
            //       // Do something when the player is ready
            //     },
            //   ),
            // ),
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
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5.0,
                            offset: const Offset(0.0, 2.0)),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Row(
                    children: [
                      kWIdth20,
                      Icon(mindfullResoursesIcon[index]),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SubHeadings(
                            title: mindfullResourses[index],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  CarouselSlider _homeMainCarouselSlider() {
    return CarouselSlider.builder(
        itemCount: homeQuotes1.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            margin: homeSymmetricPadding,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black87,
                  Colors.blueGrey[200]!,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
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
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Text(
                      homeQuotes[index],
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          height: 120,
          viewportFraction: 1,
          aspectRatio: 3 / 1,
        ));
  }
}




