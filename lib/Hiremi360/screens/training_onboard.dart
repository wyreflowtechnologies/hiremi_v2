import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/gradient_button.dart';

class TrainingOnboard extends StatefulWidget {
  const TrainingOnboard({super.key});

  @override
  State<TrainingOnboard> createState() => _TrainingOnboardState();
}

class _TrainingOnboardState extends State<TrainingOnboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60.0),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Image.asset('assets/images/ic_congratulation.png',
                      height: 240.0, width: 315.0),
                ),
              ),
              SizedBox(height: 22.0),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Congratulations!',
                      style: GoogleFonts.poppins(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF95152F),
                      )),
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0,),
                  child: Text(
                    'Welcome to the '
                        '\n Training + Internship Program!',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Expanded(
                    child: Text.rich(
                      TextSpan(
                        text:
                        'You’ve successfully',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' enrolled',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFC1272D),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {},
                          ),
                          TextSpan(
                            text: ' in the program!',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Center(child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Expanded(
                  child: Text.rich(
                    TextSpan(
                      text:
                      'Program details and next steps have been sent to your',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' registered email.',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFC1272D),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {},
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
              const SizedBox(height: 6),
              Center(child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Expanded(
                  child: Text.rich(
                    TextSpan(
                      text:
                      'Prepare to gain',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' hands-on skills',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFC1272D),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {},
                        ),
                        TextSpan(
                          text: ' and real-\nworld experience that will set you apart.',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
              const SizedBox(height: 80),
              Center(
                child: SizedBox(
                  width: 230,
                  child: GradientButton(
                    text: "Go to Dashboard",
                    gradientColors: [Color(0xFFEFC59B), Color(0xFF95152F)],
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => CorporateOnboard()));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
