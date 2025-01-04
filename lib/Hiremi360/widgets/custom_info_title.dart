import 'package:flutter/material.dart';

class CustomInfoTitle extends StatelessWidget {
  final String title;
  final String subTitle1;
  final String subTitle2;
  const CustomInfoTitle(
      {super.key, required this.title, required this.subTitle1, required this.subTitle2});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: size.height*0.025, fontWeight: FontWeight.bold),
        ),
        Text(
          subTitle1,
          style: TextStyle(fontSize: size.height*0.018, color: Color(0xFF7D7D7D)),
        ),
        Text(
          subTitle2,
          style: TextStyle(fontSize: size.height*0.018, color: Color(0xFF7D7D7D)),
        ),
      ],
    );
  }
}
