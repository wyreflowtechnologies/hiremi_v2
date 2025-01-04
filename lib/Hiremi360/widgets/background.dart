import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  final String image;
  const BaseLayout({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
