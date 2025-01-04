import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:hiremi_t5/screens/payment_processing_training_internship.dart';
// import 'package:hiremi_t5/screens/training_onboard.dart';
import 'package:pre_dashboard/Hiremi360/screens/payment_processing_training_internship.dart';

import '../widgets/gradient_button.dart';
import '../widgets/gradient_card.dart';

class TrainingSubscribe extends StatefulWidget {
  const TrainingSubscribe({super.key});

  @override
  State<TrainingSubscribe> createState() => _TrainingSubscribeState();
}

class _TrainingSubscribeState extends State<TrainingSubscribe> {
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
            style: TextStyle(fontSize: size.height*0.023, color: Colors.white),
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
                 Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: size.height*0.032,
                ),
                Positioned(
                  top: size.height * 0.001,
                  right: size.width * 0.008,
                  child: Container(
                    height: size.height * 0.015,
                    width: size.width * 0.033,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.height*0.022),
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
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(size.height*0.023),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(height: size.height*0.025),
              Center(
                child: Image.asset('assets/images/ic_wallet.png',
                    height: size.height*0.222, width:size.height),
              ),
              SizedBox(height: size.height*0.023),
              Text('Hiremi 360 Training + Internship',
                  style: GoogleFonts.poppins(
                    fontSize:size.height*0.023,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )),
              SizedBox(height: size.height*0.023),
              Text(
                'The Hiremi 360° Corporate Training Program helps college graduates build essential skills, gain real-world experience, and secure internships with top companies, ensuring a smooth transition into the corporate world.',
                style: GoogleFonts.poppins(
                  fontSize: size.height*0.018,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                ),
              ),
               SizedBox(height:size.height*0.023),
               GradientCard(
                  gradientColors: [Color(0xFFC08B6C), Color(0xFFF5D2B0)],
                  discountPriceColor: Color(0xFF58311D),
                  title: 'Subscribe to this mentorship\nprogram',
                  price: '₹2,50,000',
                  discountPrice: '3,97,500',
                  offPercentage: '40',
                  textLines: [
                    'Certificate of completion',
                    'Working on live projects',
                    'Portfolio Building',
                    'Guaranteed Internship with client Companies'
                  ]),
               SizedBox(height: size.height*0.023),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/ic_lock.png'),
                  SizedBox(width: size.height*0.028),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text:
                        'By enrolling, you agree to be charged the amount shown, plus applicable taxes, starting today. You also agree to Hiremi',
                        style: GoogleFonts.poppins(
                            fontSize: size.height*0.014,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Terms of Use, Refund Policy,',
                            style: GoogleFonts.poppins(
                              fontSize: size.height*0.014,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFC1272D),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {},
                          ),
                          const TextSpan(text: ' and acknowledge our'),
                          TextSpan(
                            text: ' Privacy Notice',
                            style: GoogleFonts.poppins(
                              color: Color(0xFFC1272D),
                              fontSize: size.height*0.013,
                              fontWeight: FontWeight.w400,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {},
                          ),
                          TextSpan(
                            text: 'Please note that no refunds are available for purchases made through the Play Store. You will receive a confirmation email upon completion.',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                  )
                ],
              ),
               SizedBox(height: size.height*0.023),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: GradientButton(
                    text: "Enroll Now",
                    gradientColors: [Color(0xFFEFC59B), Color(0xFFC1272D)],
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentProcessingTrainingInternship()));
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
