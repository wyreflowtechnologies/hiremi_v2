import 'package:flutter/material.dart';

class UnlockExclusiveFeatures extends StatelessWidget {
  final String image;
  final String title;
  const UnlockExclusiveFeatures(
      {super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.05),
      child: Row(
        children: [
          Image.asset(image,
          height: size.height*0.025,
          ),
          const SizedBox(width: 10,),
          Text(title, style: const TextStyle(fontSize: 13),)
        ],
      ),
    );
  }
}
