import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pre_dashboard/Footer/widget/custom_bottom_bar.dart';
// import 'package:hiremi_t5/screens/payment_failed_unimentor.dart';
// import 'package:hiremi_t5/widgets/custom_bottom_bar.dart';
import 'package:pre_dashboard/Hiremi360/screens/payment_failed_unimentor.dart';
import 'package:pre_dashboard/Hiremi360/widgets/custom_bottom_bar.dart';

class PaymentProcessingUnimentor extends StatefulWidget {
  const PaymentProcessingUnimentor({super.key});

  @override
  State<PaymentProcessingUnimentor> createState() => _PaymentProcessingState();
}

class _PaymentProcessingState extends State<PaymentProcessingUnimentor>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: false);

    _rotationAnimation =
        Tween<double>(begin: 0, end: -2 * pi).animate(_controller);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentVerificationFailScreenUnimentor(),
          ));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final indicatorSize = size.width * 0.27;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
              colors: [Color(0xFFC1272D), Color(0xFF0075FF)],
              stops: [0.78, 1.0],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight)
              .createShader(bounds),
          child: Text(
            'Payment Processing',
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
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Outer rotating arc
                AnimatedBuilder(
                  animation: _rotationAnimation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _rotationAnimation.value,
                      child: child,
                    );
                  },
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: indicatorSize,
                        height: indicatorSize,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CustomPaint(
                          painter: QuarterCirclePainter(),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 89,
                  height: 89,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF65389C),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo2.png',
                      scale: 1,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            Text(
              "Your payment is currently\nbeing processed",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xFF65389C),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              "This process might take around 10 minutes",
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.poppins(fontSize: 14, color: Color(0xFF333333)),
            ),
            Text(
              "please wait",
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.poppins(fontSize: 14, color: Color(0xFF333333)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
          currentIndex: currentIndex,
          onTabSelected: (index) => setState(() {
                currentIndex = index;
              })),
    );
  }
}

class QuarterCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF65389C)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final radius = size.width / 2;
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius,
    );
    canvas.drawArc(rect, -pi / 3, pi / 2, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
