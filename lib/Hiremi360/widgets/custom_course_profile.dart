import 'package:flutter/material.dart';

class CustomCourseProfile extends StatelessWidget {
  final String image;
  final String subTitle;
  final String subHeadline;
  final String status1;
  final String status2;
  final Color backgroundColor1;
  final Color backgroundColor2;
  const CustomCourseProfile(
      {super.key,
      required this.image,
      required this.subTitle,
      required this.status1,
      required this.status2,
      required this.subHeadline,
      required this.backgroundColor1,
      required this.backgroundColor2});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Who Does it Help?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ShaderMask(
                shaderCallback: (bounds) => LinearGradient(colors: [
                      Color(0xFF0075FF),
                      Color(0xFF6D4988),
                      Color(0xFFC1272D)
                    ], stops: [
                      0.55,
                      0.69,
                      1.00
                    ]).createShader(bounds),
                child: Text(
                  subHeadline,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          ],
        ),
        SizedBox(),
        Center(
          child: CircleAvatar(
            radius: size.width * 0.3,
            backgroundColor: backgroundColor1.withOpacity(0.3),
            child: Image.asset(image),
          ),
        ),
        SizedBox(),
        Text(
          'College Students',
          style: TextStyle(
              fontSize: size.width * 0.04, fontWeight: FontWeight.w600),
        ),
        Text(subTitle),
        Text(
          'Program Status',
          style: TextStyle(
              fontSize: size.width * 0.04, fontWeight: FontWeight.w600),
        ),
        Container(
          decoration: BoxDecoration(
            color: backgroundColor2.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
            child: Column(
              children: [
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/hiremi360.png',
                      color: Colors.white,
                    ),
                    Text(
                      status1,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '360',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                    Text(
                      status2,
                      style: TextStyle(
                        fontSize: size.height*0.013,
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
