import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pre_dashboard/HomePage/Widget/customBottomNavbar.dart';


class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
    int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'About',
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.04,  
              width: MediaQuery.of(context).size.width * 0.10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image.asset(
                'assets/Group 288905.png',
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05, 
              child: Image.asset(
                'assets/image 61.png',
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            Container(

              alignment: Alignment.center,
              child: Text(
                'Elevate Your Career, Empower Your Business',
                textAlign: TextAlign.center, 
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: Container(

                alignment: Alignment.center,
                child: Text(
                  'Hiremi is a platform designed for business growth, providing recruitment solutions and a hiring platform.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                    fontWeight: FontWeight.w500,
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'We provide career guidance for college students and graduates, supporting them throughout their journey and helping them achieve their desired career goals. Additionally, we provide internship and job opportunities.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                    fontWeight: FontWeight.w500,
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,

              child: GestureDetector(
                onTap: () { },
                child: Text(
                  'Learn More',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),
              ),
            )

          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: selectedIndex, onItemTapped: onItemTapped),
    );
  }
}
