import 'package:flutter/material.dart';

class CustomLearnMoreAboutProgram extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  const CustomLearnMoreAboutProgram({super.key, required this.title, required this.subTitle, required this.image});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.14,
      width: size.width * 0.92,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300]!, spreadRadius: 0.5, blurRadius: 2)
          ]),
      child: Stack(
        children: [
          Padding(
            padding:
                 EdgeInsets.only(left: size.height*0.02, top: 13, bottom: 20, right: 60),
            child: Column(
              spacing: size.height * 0.01,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.04),
                ),
                Expanded(
                    child: Text(
                  subTitle,
                  softWrap: true,
                  style: TextStyle(fontSize: size.width * 0.024),
                )),
                Text(
                  'Learn More',
                  style: TextStyle(
                      fontSize: size.width * 0.03,
                      color: Color(0xFF0870FF),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset(image)
          ),
        ],
      ),
    );
  }
}
