import 'package:flutter/material.dart';
import 'package:pre_dashboard/widgets/bottom_section.dart';
import 'package:pre_dashboard/widgets/middle_section.dart';
import 'package:pre_dashboard/widgets/topText_section.dart';



class SwipableElement extends StatelessWidget {
  const SwipableElement({
    super.key,
    required this.topTextfirst,
    required this.topTextsecond,
    required this.foreground,
    required this.bottomText,
    required this.isFirst,
  });

  final String topTextfirst;
  final String topTextsecond;
  final String foreground;
  final String bottomText;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TopTextSection(
          topTextfirst: topTextfirst,
          topTextsecond: topTextsecond,
          isFirst: isFirst,
        ),
        SizedBox(height: 
        MediaQuery.of(context).size.width * 0.1
        ),
        MiddleImageSection(foreground: foreground),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        BottomTextSection(bottomText: bottomText),
      ],
    );
  }
}

