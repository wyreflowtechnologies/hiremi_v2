import 'package:flutter/material.dart';

class CustomHiremiFeatured extends StatelessWidget {
  final String image;
  final String logo;
  final String title;
  final GestureTapCallback onTap;
  const CustomHiremiFeatured(
      {super.key,
      required this.image,
      required this.logo,
      required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.height*0.01),
        ),
        child: Stack(
          children: [
            Image.asset(image),
            Positioned(
                left: size.width * 0.025,
                bottom: size.height * 0.04,
                child: Container(
                  height: size.height * 0.035,
                  width: size.height * 0.035,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset(logo),
                )),
            Positioned(
              left: size.width * 0.025,
              bottom: size.height * 0.022,
              child: Text(
                title,
                style:
                    TextStyle(fontSize: size.width * 0.024, color: Colors.white),
              ),
            ),
            Positioned(
              left: size.width * 0.025,
              bottom: size.height * 0.01,
              child: Text(
                "Hiremi 360's Featured Program",
                style:
                    TextStyle(fontSize: size.width * 0.0147, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
