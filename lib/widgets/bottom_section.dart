
import 'package:flutter/material.dart';

class BottomTextSection extends StatelessWidget {
  const BottomTextSection({required this.bottomText});

  final String bottomText;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      bottomText,
      textAlign: TextAlign.center,
      style: textTheme.bodySmall!.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
