import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../widgets/background.dart';
import '../widgets/card.dart';

class EnquiryTrainingInternship extends StatefulWidget {
  const EnquiryTrainingInternship({super.key});

  @override
  State<EnquiryTrainingInternship> createState() => _EnquiryThreeState();
}

class _EnquiryThreeState extends State<EnquiryTrainingInternship> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Expanded(
          child: BaseLayout(
            image: "assets/images/Rectangle 34624655 (2).png",
          ),
        ),
        Card(
          shadowColor: Color(0xff0000004D),
          elevation: 2,
          child: Container(
            height: size.height * 0.44,
            width: size.width * 0.9,
            decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xff0000004D), blurRadius: 10, spreadRadius: 10),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          "assets/images/cancel.png",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset("assets/images/undo.png"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Image.asset(
                    'assets/images/rafiki3.png',
                    height: 160,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image.asset('assets/images/Vector3.png',),
                      Column(
                        children: [
                          GradientText(
                            "Thank You For Enquiry!",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w800),
                            colors: [
                              Color(0xffAF3BD1),
                              Color(0xff671C7D),
                              Color(0xff3D114A),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13.0),
                            child: Text(
                              "Your inquiry has been submitted successfully. Our team will get back to you shortly. Thank you for your patience!",
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Spacer(flex: 1,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "View FAQs",
                        style: TextStyle(
                            color: Color(0xff73208D),
                            fontSize: size.height * 0.016,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline),
                      ),
                      Text(
                        "Contact Support",
                        style: TextStyle(
                            color: Color(0xff73208D),
                            fontSize: size.height * 0.016,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
