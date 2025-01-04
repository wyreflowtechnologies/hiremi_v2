import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final bool isSender; // Determines alignment (left or right)

  const CustomCard({
    super.key,
    required this.title,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    // Access the screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
        left: isSender ? screenWidth * 0.15 : screenWidth * 0.05, // Dynamic left padding
        right: isSender ? screenWidth * 0.05 : screenWidth * 0.15, // Dynamic right padding
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01), // Dynamic vertical spacing
        child: Row(
          mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!isSender) ...[
              // Add radio button-like design for the receiver
              Container(
                width: screenWidth * 0.06, // Dynamic width for the outer circle
                height: screenWidth * 0.06, // Dynamic height for the outer circle
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF0F3CC9),
                ),
                child: Center(
                  child: Container(
                    width: screenWidth * 0.03, // Dynamic width for the inner circle
                    height: screenWidth * 0.03, // Dynamic height for the inner circle
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.025),
            ],
            // Text container with dynamic width
            Container(
              width: screenWidth * 0.65,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03,
                vertical: screenHeight * 0.015,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            if (isSender) ...[
              SizedBox(width: screenWidth * 0.025), // Dynamic spacing between the text container and circle
              // Add radio button-like design for the sender
              Container(
                width: screenWidth * 0.06,
                height: screenWidth * 0.06,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF0F3CC9),
                ),
                child: Center(
                  child: Container(
                    width: screenWidth * 0.03,
                    height: screenWidth * 0.03,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
