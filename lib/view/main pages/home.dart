import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_glow_test/utils/constants.dart';
import 'package:mind_glow_test/view/main%20pages/features%20/book.dart';
import 'package:mind_glow_test/view/main%20pages/features%20/social_media.dart';
import 'package:mind_glow_test/view/main%20pages/features%20/videos.dart';
import 'package:mind_glow_test/view/main%20pages/features%20/website.dart';
import 'package:mind_glow_test/view/widgets/sub_heading.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    // final YoutubePlayerController _controller = YoutubePlayerController(
    //   initialVideoId: YoutubePlayer.convertUrlToId(
    //           'https://www.youtube.com/watch?v=inpok4MKVLM') ??
    //       '',
    //   flags: const YoutubePlayerFlags(
    //     autoPlay: false,
    //     mute: false,
    //   ),
    // );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.blueGrey,
        backgroundColor: Colors.white,
        title: Text(
          'Hey Syam',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 30),
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookPage()),
                );
              },
              child: const Icon(Icons.notifications_active_outlined)),
          kWidth10
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHeight10,
            SubHeadings(title: getGreeting(), align: TextAlign.start),
            kHeight10,
            _homeMainCarouselSlider(context),
            kHeight10,
            const SubHeadings(
                title: 'Daily Activities', align: TextAlign.start),
            kHeight10,
            _homeDailyActivityList(),
            kHeight10,
            _homeDailyTipContainer(),
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

            // _homeMindfullResourseList(context),
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
                    border: Border.all(width: .2),
                    borderRadius: BorderRadius.circular(20),
                  ),
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
                      const Spacer(),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios_rounded),
                        onPressed: () {
                          // Navigate to the respective page based on index
                          switch (index) {
                            case 0:
                              // Navigate to BookPage
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookPage()),
                              );
                              break;
                            case 1:
                              // Navigate to WebsitePage
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => WebsitePage()) ,
                              );
                              break;
                            case 2:
                              // Navigate to VideoPage
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => VideosPage()),
                              );
                              break;
                            case 3:
                              // Navigate to SocialMediaPage
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SocialMedia()),
                              );
                              break;
                          }
                        },
                      ),
                      kWidth10,
                    ],
                  ),
                );
              },
            ),
            kHeight20,
          ],
        ),
      ),
    );
  }

  Container _homeDailyTipContainer() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              quoteAccentColors[0],
              quoteAccentColors[3],
              // Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          color: Colors.blueAccent[100],
          borderRadius: BorderRadius.circular(20)),
      margin: homeSymmetricPadding,
      height: 120,
      width: double.infinity,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Daily Tips',
                style: GoogleFonts.poppins(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  // color: Colors.white
                ),
              ),
              Text(
                homeQuotes[1],
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  // color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ListView _homeMindfullResourseList(BuildContext context) {
  // return ListView.builder(
  //   physics: const NeverScrollableScrollPhysics(),
  //   shrinkWrap: true,
  //   itemCount: mindfullResourses.length,
  //   itemBuilder: (context, index) {
  //     return Container(
  //       margin: homePaddingAll5,
  //       width: double.infinity,
  //       height: 80,
  //       decoration: BoxDecoration(
  //         border: Border.all(width: .2),
  //         borderRadius: BorderRadius.circular(20),
  //       ),
  //       child: Row(
  //         children: [
  //           kWIdth20,
  //           Icon(mindfullResoursesIcon[index]),
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               SubHeadings(
  //                 title: mindfullResourses[index],
  //               ),
  //             ],
  //           ),
  //           const Spacer(),
  //            IconButton(icon: Icon(Icons.arrow_forward_ios_rounded),
  //             onPressed: () {

  //             },
  //            ),
  //           kWidth10,
  //         ],
  //       ),
  //     );
  //   },
  // );

  // }

  SizedBox _homeDailyActivityList() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: homeSymmetricPadding,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: dailyActivityHeadings.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(dailyActivityHeadings[index]),
                      content: Text(dailtActivityDescriptions[index]),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text(
                            'OK',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
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
                          fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  CarouselSlider _homeMainCarouselSlider(BuildContext context) {
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
