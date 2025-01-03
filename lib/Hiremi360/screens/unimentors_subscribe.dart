import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pre_dashboard/Hiremi360/screens/payment_processing_unimentor.dart';
// import 'package:hiremi_t5/screens/payment_processing_unimentor.dart';
// import 'package:hiremi_t5/screens/unimentors_onboard.dart';

import '../widgets/gradient_button.dart';
import '../widgets/gradient_card.dart';

class UnimentorsSubscribe extends StatefulWidget {
  const UnimentorsSubscribe({super.key});

  @override
  State<UnimentorsSubscribe> createState() => _UnimentorsSubscribeState();
}

class _UnimentorsSubscribeState extends State<UnimentorsSubscribe> {
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
            'Unimentors',
            style: TextStyle(fontSize: 20, color: Colors.white),
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
                const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                Positioned(
                  top: size.height * 0.001,
                  right: size.width * 0.008,
                  child: Container(
                    height: size.height * 0.015,
                    width: size.width * 0.033,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.5),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12.0),
              Center(
                child: Image.asset('assets/images/ic_violate_walet.png',
                    height: 180.0, width: 177.0),
              ),
              const SizedBox(height: 12.0),
              Text('Hiremi 360 Unimentor',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )),
              const SizedBox(height: 10.0),
              Text(
                'The Hiremi 360° Mentorship Program guides you through your college journey with expert mentors, career advice, and a guaranteed internship in your preferred field, ensuring both academic and professional success.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(height: 20),
              const GradientCard(
                  gradientColors: [Color(0xFFA92AB4), Color(0xFF4720A3)],
                  title: 'Subscribe to this mentorship\nprogram',
                  discountPriceColor: Color(0xFFBFBFBF),
                  price: '10,000',
                  discountPrice: '25,000',
                  offPercentage: '40',
                  textLines: [
                    'Certificate of completion',
                    'Working on live projects',
                    'Portfolio Building',
                    'Guaranteed Internship with client Companies'
                  ]),
              const SizedBox(height: 45),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/ic_lock.png'),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text:
                            'By enrolling, you agree to be charged the amount shown, plus applicable taxes, starting today. You also agree to Hiremi',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Terms of Use, Refund Policy,',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFC1272D),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {},
                          ),
                          const TextSpan(text: ' and acknowledge our'),
                          TextSpan(
                            text: ' Privacy Notice',
                            style: TextStyle(
                              color: const Color(0xFFC1272D),
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {},
                          ),
                          TextSpan(
                              text: 'Please note that no refunds are available for purchases made through the Play Store. You will receive a confirmation email upon completion.',
                          style: TextStyle(
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
              const SizedBox(height: 35),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: GradientButton(
                    text: "Enroll Now",
                    gradientColors: const <Color>[Color(0xFFA92AB4), Color(0xFF4720A3)],
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentProcessingUnimentor()));
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
