
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pre_dashboard/Footer/widget/custom_bottom_bar.dart';
import 'package:pre_dashboard/HomePage/Widget/app_bar.dart';
import 'package:pre_dashboard/HomePage/Widget/app_drawer.dart';
import 'package:pre_dashboard/HomePage/Widget/ask_expert_chat_structureWidget.dart';
import 'package:pre_dashboard/HomePage/screens/Drawer/query2.dart';
import 'package:pre_dashboard/HomePage/screens/Query.dart';


class AskExpertPage extends StatefulWidget {
  const AskExpertPage({super.key});

  @override
  State<AskExpertPage> createState() => _AskExpertPageState();
}

class _AskExpertPageState extends State<AskExpertPage> {
  int currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Ask Expert"),
      drawer: const AppDrawer(),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: currentIndex,
        onTabSelected: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 15,),
            FlutterCarousel(
              options: FlutterCarouselOptions(
                height: MediaQuery.of(context).size.height * 0.15,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                // scrollPhysics: BouncingScrollPhysics(),
              ),
              items: [
                // First Slide
                _buildSliderItem(
                  context: context,
                  title: "Career gap ki \ntension lo?",
                  imagePath: "assets/images/ask_expert_page.png",
                ),
                // Second Slide
                _buildSliderItem(
                  context: context,
                  title: "Pahli job ki\ntayari?",
                  imagePath: "assets/images/banner (10) 1.png",
                ),
                // Third Slide
                _buildSliderItem(
                  context: context,
                  title: "Interview me\nkya bole?",
                  imagePath: "assets/images/Frame 427319481.png",
                ),
                _buildSliderItem(
                  context: context,
                  title: "Career badlane\nka plan hai?",
                  imagePath: "assets/images/ask_expert3.png",
                ),
                _buildSliderItem(
                  context: context,
                  title: "Confused ho\ncareer ko lekar?",
                  imagePath: "assets/images/banner (14) 2.png",
                ),
              ],
            ),
            SizedBox(height: 10,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height:  MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Purpose:\n",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: const Color(0xFF0F3CC9),
                                        )
                                    ),

                                    TextSpan(
                                      text: "\nTo address all your career-related queries and offer the best possible guidance, customized to fit your needs.",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    )
                                  ]
                              )
                          ),
                        )
                    ),
                    SizedBox(height: 20,),
                    CustomCard(
                      title: "Submit Your Query -\nAsk anything",
                      isSender: false,
                    ),
                    CustomCard(
                      title: "Receive One-on-One Expert \nGuidance in Your Language",
                      isSender: true,
                    ),
                    CustomCard(
                      title: "Stay Connected –\nGet Expert Guidance \nEvery 2 Weeks",
                      isSender: false,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: Align(
                          child: Text("For more advanced mentorship, personalized guidance, and roadmap creation throughout your academic journey, enroll in the Mentorship Plan.",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                                color: Colors.black
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        // Add your verification logic here
                         // Close the popup
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Query2(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize:  Size(
                            MediaQuery.of(context).size.width * 0.9,
                            MediaQuery.of(context).size.height * 0.05
                        ), // Increased width
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.06,
                        ),
                        backgroundColor: const Color(0xFF0F3CC9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Continue",
                        style: GoogleFonts.inter(
                          fontSize:   MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),


    );
  }

  Widget _buildSliderItem({
    required String title,
    required BuildContext context,
    required String imagePath,

  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SizedBox(width: 10,),
        RichText(
          text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: GoogleFonts.roboto(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                TextSpan(
                  text: "\nPuch lo!",
                  style: GoogleFonts.workSans(
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0F3CC9),
                  ),
                ),
              ]
          ),
        ),
        Image.asset(
          imagePath,
          fit: BoxFit.contain,
          //height,
          width: MediaQuery.of(context).size.width * 0.4,
        )

      ],
    );
  }
}