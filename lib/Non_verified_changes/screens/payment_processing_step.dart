import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pre_dashboard/Non_verified_changes/screens/payment_verification_fail_screen.dart';


import '../widgets/custombottombar.dart';

class PaymentProcessingStep extends StatefulWidget {
  const PaymentProcessingStep({super.key});

  @override
  State<PaymentProcessingStep> createState() => _PaymentProcessingStepState();
}

class _PaymentProcessingStepState extends State<PaymentProcessingStep>
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
            builder: (context) => const PaymentVerificationFailScreen(),
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          "Payment processing",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
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
      ),
      body: Container(

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
                    color: Color(0xFF234DCE),
                  ),
                  child: Center(
                    child: Image.asset('assets/images/logo2.png'),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            const Text(
              "Your payment is currently\nbeing processed",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F3CC9),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            const Text(
              "This process might take around 10 minutes\nplease wait",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Color(0xFF333333)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Custombottombar(
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
      ..color = const Color(0xFF234DCE)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final radius = size.width / 2;
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius,
    );
    canvas.drawArc(rect, -pi / 2, pi / 2, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}




