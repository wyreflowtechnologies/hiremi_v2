import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pre_dashboard/Footer/widget/custom_bottom_bar.dart';
import 'package:pre_dashboard/Hiremi360/screens/payment_verification_unimentor.dart';
import 'package:pre_dashboard/Hiremi360/widgets/custom_bottom_bar.dart';

class PaymentVerificationFailScreenUnimentor extends StatefulWidget {
  const PaymentVerificationFailScreenUnimentor({super.key});

  @override
  State<PaymentVerificationFailScreenUnimentor> createState() =>
      _PaymentFailureScreenState();
}

class _PaymentFailureScreenState extends State<PaymentVerificationFailScreenUnimentor> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
                colors: [Color(0xFFC1272D), Color(0xFF0075FF)],
                stops: [0.78, 1.0],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight)
                .createShader(bounds),
            child: Text(
              'Profile Verification',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          centerTitle: true,
          leading: Container(
              decoration: BoxDecoration(
                color: Color(0xFFECF5FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Image.asset('assets/images/appBarMenu.png'))),
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
        body: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                fit: StackFit.loose,
                alignment: Alignment.bottomCenter,
                children: [
                  Center(
                    child: Image.asset("assets/images/Ellipse.png"),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/Illustration.png',
                      height: 195,
                      width: 212,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.04),
              Text(
                "Your payment was not\nsuccessful. Please try again",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Color(0xffDB5A61),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                "We encountered an issue with your payment\nPlease try again",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Color(0xFF030303),
                  fontSize: 14,
                ),
              ),
              SizedBox(height: size.height * 0.06),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentVerificationScreenUnimentor()));
                },
                icon: const Icon(Icons.refresh, color: Colors.white),
                label: Text(
                  "Try again",
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7825AB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
            currentIndex: currentIndex,
            onTabSelected: (index) => setState(() {
                  currentIndex = index;
                })));
  }
}
