import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pre_dashboard/screens/splashscreen3.dart';
import '../screens/splash_screen2.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  late double endScale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 1), // Animation speed doubled
      vsync: this,
    );

    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        _controller.forward().then((_) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => FinalScreen()),
          );
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    endScale = MediaQuery.of(context).size.height /
        (MediaQuery.of(context).size.width * 0.15);

    _scaleAnimation = Tween<double>(begin: .5, end: endScale).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 0.6,
            colors: [Color(0xFF234CE6), Color(0xFF132A80)],
            stops: [0.18, 1.0],
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: SvgPicture.asset(
                  'assets/images/tie.svg',
                  width: screenWidth * 0.15,
                  height: screenHeight * 0.15,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
