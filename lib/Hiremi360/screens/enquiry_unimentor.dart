import 'package:flutter/material.dart';

import '../widgets/background.dart';
import '../widgets/card.dart';

class EnquiryUnimentor extends StatefulWidget {
  const EnquiryUnimentor({super.key});

  @override
  State<EnquiryUnimentor> createState() => _EnquiryOneState();
}

class _EnquiryOneState extends State<EnquiryUnimentor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          BaseLayout(
            image: "assets/images/Rectangle 34624655.png",
          ),
          CardLayout(
            foreground: "assets/images/rafiki.png",
            background: "assets/images/Vector1.png",
            onClick: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}