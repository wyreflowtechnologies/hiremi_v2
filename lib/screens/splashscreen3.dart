import 'package:flutter/material.dart';
import 'package:pre_dashboard/screens/swipable_start.dart';

class FinalScreen extends StatefulWidget {
  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SwipableStartScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/hireme_logo.png',
          width: screenWidth * 0.5, // Dynamic width
          height: screenWidth * 0.5, // Dynamic height
        ),
      ),
    );
  }
}


