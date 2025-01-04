import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pre_dashboard/Footer/widget/custom_bottom_bar.dart';

import 'package:pre_dashboard/Hiremi360/widgets/custom_bottom_bar.dart';

class CongratsTrainingInternship extends StatefulWidget {
  const CongratsTrainingInternship({super.key});

  @override
  State<CongratsTrainingInternship> createState() => _CongrtasState();
}

class _CongrtasState extends State<CongratsTrainingInternship> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(colors: [
            Color(0xFFC1272D),
            Color(0xFF5B509B),
            Color(0xFF0075FF)
          ], stops: [
            0.37,
            0.78,
            1.0
          ], begin: Alignment.bottomLeft, end: Alignment.topRight)
              .createShader(bounds),
          child: Text(
            'Training + Internship',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.chevron_left)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Stack(
              children: [
                const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                Positioned(
                  top: size.height * 0.001,
                  right: size.width * 0.008,
                  child: Container(
                    height: size.height * 0.015,
                    width: size.width * 0.033,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.5),
                        color: const Color(0xFFDBE4FF)),
                    child: Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                              fontSize: size.width * 0.023,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF0F3CC9)),
                        )),
                  ),
                )
              ],
            ),
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              "Congratulations on Starting Your",
              style: GoogleFonts.poppins(
                color: Color(0xffC99778),
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            )),
            Center(
                child: Text(
              "Corporate Journey",
              style: GoogleFonts.poppins(
                color: Color(0xffC99778),
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            )),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              "Welcome to the Corporate Launchpad",
              style: GoogleFonts.poppins(
                color: Color(0xff333333),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            )),
            Center(
                child: Text(
              "Program",
              style: GoogleFonts.poppins(
                color: Color(0xff333333),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            )),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Image.asset(
                'assets/images/congrats_training_internship.png',
                scale: 1.1,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
                child: Text(
              "Your program details and guidance roadmap",
              style: GoogleFonts.poppins(
                color: Color(0xff333333),
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            )),
            Center(
                child: Text(
              " have been sent to your registered email",
              style: GoogleFonts.poppins(
                color: Color(0xff333333),
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC99778),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.58))),
                  child: const Text(
                    'Go to Dashboard',
                    style: TextStyle(
                        fontSize: 13.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  )),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
          currentIndex: currentIndex,
          onTabSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          }),
    );
  }
}
