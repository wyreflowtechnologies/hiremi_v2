
import 'package:flutter/material.dart';

class MiddleImageSection extends StatelessWidget {
  const MiddleImageSection({required this.foreground});

  final String foreground;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      foreground,
      height: MediaQuery.of(context).size.height * .4,
    );
  }
}
