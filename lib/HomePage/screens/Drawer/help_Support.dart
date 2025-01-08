import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pre_dashboard/HomePage/Widget/customBottomNavbar.dart';



class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({super.key});

  @override
  _HelpAndSupportState createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
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
            'Help & Support',
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.height * 0.05,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Image.asset(
                'assets/help&support.png',
              ),
            ),
             SizedBox(height:  MediaQuery.of(context).size.height * 0.01,),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width * 0.05,),
              child: Text(
                'NNN: No New Notifications! Please explore the Hiremi application for a while.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
   //   bottomNavigationBar: CustomBottomNavBar(selectedIndex: selectedIndex, onItemTapped: onItemTapped)
    );
  }
}
