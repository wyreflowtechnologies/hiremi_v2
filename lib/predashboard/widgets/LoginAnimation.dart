//
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:pre_dashboard/HomePage/screens/HomeScreen.dart';
//
// class LoginAnimation extends StatefulWidget {
//   final Widget nextScreen;
//
//   const LoginAnimation({Key? key, required this.nextScreen}) : super(key: key);
//
//   @override
//   State<LoginAnimation> createState() => _LoginAnimationState();
// }
//
// class _LoginAnimationState extends State<LoginAnimation>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late AnimationController _expansionController;
//   late Animation<double> _rotationAnimation;
//   late Animation<double> _scaleAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Controller for the initial rotation animation
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..repeat(reverse: false);
//
//     _rotationAnimation = Tween<double>(begin: 0, end: 1 * pi).animate(_controller);
//
//     // Controller for the expansion animation
//     _expansionController = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );
//
//     _scaleAnimation = Tween<double>(begin: 0.3, end: 10).animate(
//       CurvedAnimation(
//         parent: _expansionController,
//         curve: Curves.easeInOut,
//       ),
//     );
//
//     // Start expansion after rotation finishes
//     Future.delayed(const Duration(seconds: 2), () {
//       _controller.stop();
//       _expansionController.forward();
//     });
//
//     // Navigate to the next screen after expansion
//     print("widget.nextScreen  is ${widget.nextScreen}");
//     Future.delayed(const Duration(seconds: 5), () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => widget.nextScreen), // Use widget.nextScreen
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     _expansionController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//
//       body: Center(
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             AnimatedBuilder(
//               animation: Listenable.merge([_controller, _expansionController]),
//               builder: (context, child) {
//                 final scale = _scaleAnimation.value;
//                 return Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Transform.scale(
//                       scale: scale,
//                       child: Transform.rotate(
//                         angle: _rotationAnimation.value,
//                         child: Container(
//                           width: size.width * 0.5,
//                           height: size.width * 0.5,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: const Color(0xFF234DCE),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Transform.rotate(
//                       angle: _rotationAnimation.value,
//                       child: CustomPaint(
//                         size: Size(
//                           size.width * 0.5 * scale + 20,
//                           size.width * 0.5 * scale + 20,
//                         ),
//                         painter: QuarterCirclePainter(gap: 10.0),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//             Container(
//               width: 89,
//               height: 89,
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Color(0xFF234DCE),
//               ),
//               child: Center(
//                 child: Image.asset('assets/images/enhancedlogo_3.png'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class QuarterCirclePainter extends CustomPainter {
//   final double gap;
//
//   QuarterCirclePainter({this.gap = 10.0});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = const Color(0xFF234DCE)
//       ..strokeWidth = 6
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;
//
//     final radius = (size.width / 2) + gap;
//     final rect = Rect.fromCircle(
//       center: Offset(size.width / 2, size.height / 2),
//       radius: radius,
//     );
//
//     canvas.drawArc(rect, -pi / 2, pi / 2, false, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class LoginAnimation extends StatefulWidget {
  final Widget nextScreen;

  const LoginAnimation({Key? key, required this.nextScreen}) : super(key: key);

  @override
  State<LoginAnimation> createState() => _LoginAnimationState();
}

class _LoginAnimationState extends State<LoginAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _expansionController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();

    // Controller for the initial rotation animation
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _rotationAnimation =
        Tween<double>(begin: 0, end: 1 * pi).animate(_controller);

    // Controller for the expansion animation
    _expansionController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.3, end: 10).animate(
      CurvedAnimation(
        parent: _expansionController,
        curve: Curves.easeInOut,
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Start the expansion animation
        _expansionController.forward();

        // Initialize the navigation timer after expansion starts
        _navigationTimer = Timer(const Duration(seconds: 5), () {
          if (mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget.nextScreen),
            );
          }
        });
      }
    });
  }

  @override
  void dispose() {
    // Cancel timers or any ongoing Future calls
    _navigationTimer?.cancel();
    _controller.dispose();
    _expansionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: Listenable.merge([_controller, _expansionController]),
              builder: (context, child) {
                final scale = _scaleAnimation.value;
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.scale(
                      scale: scale,
                      child: Transform.rotate(
                        angle: _rotationAnimation.value,
                        child: Container(
                          width: size.width * 0.5,
                          height: size.width * 0.5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF234DCE),
                          ),
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: _rotationAnimation.value,
                      child: CustomPaint(
                        size: Size(
                          size.width * 0.5 * scale + 20,
                          size.width * 0.5 * scale + 20,
                        ),
                        painter: QuarterCirclePainter(
                            gap: 10.0, rotationAngle: _rotationAnimation.value),
                      ),
                    ),
                  ],
                );
              },
            ),
            Container(
              width: 89,
              height: 89,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF234DCE),
              ),
              child: Center(
                child: Image.asset('assets/images/enhancedlogo_3.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuarterCirclePainter extends CustomPainter {
  final double gap;
  final double rotationAngle;

  QuarterCirclePainter({this.gap = 10.0, required this.rotationAngle});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF234DCE)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final radius = (size.width / 2) + gap;
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius,
    );

    // Update start angle using rotationAngle to rotate the arc
    double startAngle =
        -pi / 2 + rotationAngle; // Initial offset at -pi/2 + dynamic rotation

    // Draw the arc with the updated start angle
    canvas.drawArc(
      rect,
      startAngle, // The start angle progresses over time
      pi / 2, // Sweep angle stays as pi / 2 (quarter-circle)
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
