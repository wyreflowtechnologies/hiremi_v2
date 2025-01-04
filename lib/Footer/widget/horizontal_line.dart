import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.9,
      child: Row(
        children: [
          // Starting circle
          Container(
            width: width * 0.01,
            height: height * 0.01,
            decoration: const BoxDecoration(
              color: Color(0xFF0F3CC9), // Circle color
              shape: BoxShape.circle,
            ),
          ),
          // Horizontal line
          Expanded(
            child: Container(
              height: height * 0.002, // Thickness of the line
              color: const Color(0xFF0F3CC9),
            ),
          ),
          // Ending circle
          Container(
            width: width * 0.01, // Diameter of the circle
            height: height * 0.01,
            decoration: const  BoxDecoration(
              color: Color(0xFF0F3CC9), // Circle color
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
