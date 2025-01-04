import 'package:flutter/material.dart';

class CustomTextField2 extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final Function(String) text;

  const CustomTextField2({
    super.key,
    required this.labelText,
    this.hintText,
    this.keyboardType,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Text(
              labelText,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )),
        const SizedBox(
          height: 10,
        ),
        TextField(
          onChanged: (p0) {
            text(p0);
          },
          decoration: InputDecoration(
              hintText: hintText,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              floatingLabelStyle: TextStyle(
                  color: Color(0xFF000000), fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFF808080), width: 2),
              )),
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
