import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pre_dashboard/HomePage/constants/constantsImage.dart';


void showCustomPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (BuildContext context) {
      var screenWidth = MediaQuery.of(context).size.width;
      var screenHeight = MediaQuery.of(context).size.height;
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(screenWidth * 0.04),
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
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF0F3CC9),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Image.asset(
                  AppImages.growthChart,
                  height: screenHeight * 0.1,
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  "Unlock Exclusive Benefits",
                  style: GoogleFonts.poppins(
                    fontSize: screenHeight * 0.022,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.03),
                Container(
                  height: screenHeight * 0.05,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue.withOpacity(0.1)),
                  child: Center(
                    child: Text(
                      "Verify now for exclusive lifetime Perks",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF0F3CC9),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "₹2999 ",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0F3CC9),
                        ),
                      ),
                      TextSpan(
                        text: "for Lifetime Access\n",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "(One-time verification fee)",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.025,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Note: ",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0F3CC9),
                        ),
                      ),
                      TextSpan(
                        text:
                            "Verification is required for special content access.",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.025,
                          fontWeight: FontWeight.w400,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(screenWidth * 0.6,
                        screenHeight * 0.05),
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.01,
                      horizontal: screenWidth * 0.06,
                    ),
                    backgroundColor: const Color(0xFF0F3CC9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Verify & Unlock Now",
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.035,
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
