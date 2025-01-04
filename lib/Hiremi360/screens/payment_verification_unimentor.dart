import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pre_dashboard/Footer/widget/custom_bottom_bar.dart';
// import 'package:hiremi_t5/widgets/custom_bottom_bar.dart';
import 'package:pre_dashboard/Hiremi360/widgets/custom_bottom_bar.dart';

import 'congrats_unimentor.dart';

class PaymentVerificationScreenUnimentor extends StatefulWidget {
  const PaymentVerificationScreenUnimentor({super.key});

  @override
  State<PaymentVerificationScreenUnimentor> createState() =>
      _PaymentVerificationScreenState();
}

class _PaymentVerificationScreenState extends State<PaymentVerificationScreenUnimentor> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            'Payment Failed',
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
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/payment_successful_unimentor.png',
              height: 200,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Image.asset('assets/images/payment_successful_unimentor2.png'),
            SizedBox(
              height: size.height * 0.025,
            ),
            Text(
              'Payment & Verification',
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF6924A9)),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Congrtas(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6924A9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.58))),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ))
          ],
        ),
      )),
      bottomNavigationBar: CustomBottomBar(
          currentIndex: currentIndex,
          onTabSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          }),
    );
  }
}
