import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  final String title;
  final String pana;
  final String eclipse;
  final List<Color> colors;
  const CustomBanner(
      {super.key,
      required this.title,
      required this.pana,
      required this.eclipse,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.13,
      width: size.width * 0.92,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: colors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight),
        borderRadius: BorderRadius.circular(size.height*0.01),
      ),
      child: Stack(
        children: [
          Positioned(
            top: size.height * 0.02,
            left: size.width * 0.04,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: size.height * 0.0007,
              children: [
                Image.asset(eclipse),
                SizedBox(
                  height: size.height * 0.014,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: size.width * 0.035,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Text(
                  "Hiremi 360's Featured Program",
                  style: TextStyle(
                      fontSize: size.width * 0.025,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
              top: size.height * 0.012,
              right: size.width * 0.05,
              child: Image.asset(pana)),
        ],
      ),
    );
  }
}
