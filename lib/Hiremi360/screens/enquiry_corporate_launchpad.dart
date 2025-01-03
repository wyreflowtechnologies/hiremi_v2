import 'package:flutter/material.dart';

import '../widgets/background.dart';
import '../widgets/card.dart';

class EnquiryCorporateLaunchpad extends StatefulWidget {
  const EnquiryCorporateLaunchpad({super.key});

  @override
  State<EnquiryCorporateLaunchpad> createState() => _EnquiryTwoState();
}

class _EnquiryTwoState extends State<EnquiryCorporateLaunchpad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Expanded(
          child: BaseLayout(
            image: "assets/images/Rectangle 34624655 (1).png",
          ),
        ),
        CardLayout(
          foreground: "assets/images/rafiki2.png",
          background: "assets/images/Vector2.png",
          onClick: () {
            Navigator.pop(context);
          },
        )
      ],
    ));
  }
}
