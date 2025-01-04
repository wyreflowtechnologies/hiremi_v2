import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets/gradient_button.dart';

class UnimentorsOnboard extends StatefulWidget {
  const UnimentorsOnboard({super.key});

  @override
  State<UnimentorsOnboard> createState() => _UnimentorsOnboardState();
}

class _UnimentorsOnboardState extends State<UnimentorsOnboard> {
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
                  child: Image.asset('assets/images/ic_pana_celebration.png',
                      height: 240.0, width: 315.0),
                ),
              ),
              SizedBox(height: 22.0),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Congratulations!',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF9928B1),
                      )),
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0,),
                  child: Text(
                    'Welcome to the '
                        '\n UniMentor Program!',
                    style: TextStyle(
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
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' enrolled',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF9928B1),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {},
                          ),
                          TextSpan(
                            text: ' in the program!',
                            style: TextStyle(
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
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' registered email.',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF9928B1),
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
                      'Get ready for',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' personalised mentoring',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF9928B1),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {},
                        ),
                        TextSpan(
                          text: ' and',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: ' strategic insights',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF9928B1),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {},
                        ),
                        TextSpan(
                          text: ' to make the most of your\ncollege years.',
                          style: TextStyle(
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
                    gradientColors: [Color(0xFFA92AB4), Color(0xFF4720A3)],
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => UnimentorsSubscribe()));
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
