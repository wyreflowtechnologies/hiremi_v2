import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pre_dashboard/Non_verified_changes/screens/profile_verification_screen.dart';
import 'package:pre_dashboard/Non_verified_changes/screens/profile_verification_screen1.dart';


void showCustomPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Blur effect
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Rounded corners
          ),
          child: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "IMPORTANT",
                      style: GoogleFonts.poppins(
                        fontSize:  MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF0F3CC9),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the popup
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(height:  MediaQuery.of(context).size.width * 0.02),
                // Image/Illustration
                Image.asset(
                  'assets/images/pana23.png',
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                SizedBox(height:  MediaQuery.of(context).size.width * 0.03),
                // Title Text
                Text(
                  "Unlock Exclusive Benefits",
                  style: GoogleFonts.poppins(
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height:  MediaQuery.of(context).size.width * 0.03),
                // Subtitle Text
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue.withOpacity(0.1)
                  ),
                  child: Center(
                    child: Text(
                      "Verify now for exclusive lifetime Perks",
                      style: GoogleFonts.poppins(
                        fontSize:  MediaQuery.of(context).size.width * 0.035,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF0F3CC9),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height:  MediaQuery.of(context).size.width * 0.03),
                // Pricing Info
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "₹2999 ",
                        style: GoogleFonts.poppins(
                          fontSize:  MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0F3CC9),
                        ),
                      ),
                      TextSpan(
                        text: "for Lifetime Access\n",
                        style: GoogleFonts.poppins(
                          fontSize:  MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "(One-time verification fee)",
                        style: GoogleFonts.poppins(
                          fontSize:  MediaQuery.of(context).size.width * 0.025,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.03),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Note: ",
                        style: GoogleFonts.poppins(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0F3CC9),
                        ),
                      ),
                      TextSpan(
                        text: "Verification is required for special content access.",
                        style: GoogleFonts.poppins(
                          fontSize: MediaQuery.of(context).size.width * 0.025,
                          fontWeight: FontWeight.w400,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.width * 0.03),
                // "Verify & Unlock Now" Button
                ElevatedButton(
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileVerificationScreen1()),
                      );
                    //Navigator.of(context).pop(); // Close the popup
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize:  Size(
                        MediaQuery.of(context).size.width * 0.6,
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
                    "Verify & Unlock Now",
                    style: GoogleFonts.poppins(
                      fontSize:  MediaQuery.of(context).size.width * 0.035,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
