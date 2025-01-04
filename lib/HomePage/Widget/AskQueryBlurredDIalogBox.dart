import 'dart:ui'; // For the BackdropFilter widget
import 'package:flutter/material.dart';
import 'package:pre_dashboard/Non_verified_changes/screens/profile_verification_screen1.dart';

class BlurredDialog extends StatelessWidget {
  final String message; // The message to be shown in the dialog
//ProfileVerificationScreen1
  BlurredDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.8;
    return Dialog(

      backgroundColor: Colors.transparent, // Transparent background to show blur effect
      child: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Apply blur effect
              child: Container(
                color: Colors.black.withOpacity(0), // Transparent background with blur
              ),
            ),
          ),
          Center(
            child: Container(
              width: size*1.28,
              height: size*1.6,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                 Image.asset("assets/images/Lock.png"),
                  Text("Sorry You dont't have access",textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  SizedBox(
                    height: size*0.03,
                  ),
                  Text("Complete Your Profile and Get Verified to access exclusive features ",
                  textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: size*0.03,

                    ),
                  ),
                  SizedBox(
                    height: size*0.075,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Your onPressed logic here
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileVerificationScreen1()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0F3CC9), // Blue color for the button
                      minimumSize: Size(size*0.746, size*0.14), // Fixed width (200) and height (50)
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(size*0.03), // Curved edges with 20 radius
                      ),
                    ),
                    child: Text(
                      "Verify Now",
                      style: TextStyle(
                        fontSize: size*0.045,
                        color: Colors.white, // White text color
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size*0.075,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Note",
                          style: TextStyle(
                            color: Color(0xFF0F3CC9), // Blue color for 'Note'
                            fontSize: size * 0.03,
                          ),
                        ),
                        TextSpan(
                          text: ": Verification is required for special content access.",
                          style: TextStyle(
                            color: Colors.grey, // Default color for the rest of the text
                            fontSize: size * 0.03,
                          ),
                        ),
                      ],
                    ),
                  )



                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
