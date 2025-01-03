import 'package:flutter/material.dart';

class CustomTextField3 extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final Function(String) text;

  const CustomTextField3({
    super.key,
    required this.labelText,
    this.hintText,
    this.keyboardType,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: hintText);
    return Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Text(
              labelText,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
        TextField(
          controller: controller,
          onChanged: (p0) {
            text(p0);
          },
          autofocus: false,
          readOnly: true,
          decoration: InputDecoration(
              hintText: hintText,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              floatingLabelStyle: TextStyle(
                  color: Color(0xFF000000), fontWeight: FontWeight.bold),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF808080), width: 2),
              )),
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
