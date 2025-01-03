import 'package:flutter/material.dart';
import 'package:pre_dashboard/predashboard/screens/swipable_start.dart';

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
        Navigator.push(
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
      body:  Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Hire',
                style: TextStyle(color: Colors.black,
                    fontSize: screenWidth*0.074,
                    fontWeight: FontWeight.bold
                ),
              ),
              TextSpan(
                text: 'mi',
                style: TextStyle(color: Colors.blue,
                    fontSize: screenWidth*0.074,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


