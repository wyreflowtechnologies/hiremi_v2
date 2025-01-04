import 'package:flutter/material.dart';

class CustomAdvantageSuccess extends StatelessWidget {
  final String title1;
  final String subTitle1;
  const CustomAdvantageSuccess({super.key, required this.title1, required this.subTitle1});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: screenWidth * 0.92,
        padding: EdgeInsets.only(left: 16.0, top: 16, bottom: 16, right: 50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Color(0xFF283489),
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              subTitle1,
              style: TextStyle(
                fontSize: 10,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
