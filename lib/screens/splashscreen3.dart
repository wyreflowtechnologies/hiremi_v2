import 'package:flutter/material.dart';

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
          MaterialPageRoute(builder: (context) => TaskOfAkshajScreen()),
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
          'lib/assets/hireme_logo.png',
          width: screenWidth * 0.5, // Dynamic width
          height: screenWidth * 0.5, // Dynamic height
        ),
      ),
    );
  }
}

class TaskOfAkshajScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task of Akshaj Screen')),
      body: Center(child: Text('This is the task of Akshaj screen!')),
    );
  }
}
