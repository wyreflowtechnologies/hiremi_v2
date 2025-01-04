import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pre_dashboard/Hiremi360/screens/payment_processing_corporate_launchpad.dart';
import '../widgets/gradient_button.dart';
import '../widgets/gradient_card.dart';

class CorporateSubscribe extends StatefulWidget {
  const CorporateSubscribe({super.key});

  @override
  State<CorporateSubscribe> createState() => _CorporateSubscribeState();
}

class _CorporateSubscribeState extends State<CorporateSubscribe> {
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
            'Corporate Launchpad',
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
                child: Image.asset('assets/images/ic_pana_walet.png',
                    height: 180.0, width: 177.0),
              ),
              SizedBox(height: 12.0),
              Text('Hiremi 360 Corporate Training',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )),
              SizedBox(height: 10.0),
              Text(
                'The Hiremi 360° Corporate Training Program helps college graduates build essential skills, gain real-world experience, and secure internships with top companies, ensuring a smooth transition into the corporate world.',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(height: 20),
              const GradientCard(
                  gradientColors: [Color(0xFF4577A6), Color(0xFF273389)],
                  title: 'Subscribe to this mentorship\nprogram',
                  discountPriceColor: Color(0xFFBFBFBF),
                  price: '₹2,50,000',
                  discountPrice: '3,97,500',
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
                  SizedBox(width: 10),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text:
                        'By enrolling, you agree to be charged the amount shown, plus applicable taxes, starting today. You also agree to Hiremi',
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Terms of Use, Refund Policy,',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
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
                              fontSize: 10,
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
              const SizedBox(height: 35),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: GradientButton(
                    text: "Enroll Now",
                    gradientColors: [Color(0xFF4577A6), Color(0xFF273389)],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentProcessingCorporateLaunchpad(),
                        ),
                      );
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
