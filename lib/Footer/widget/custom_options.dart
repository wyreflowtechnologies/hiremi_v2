import 'package:flutter/material.dart';

class CustomOptions extends StatefulWidget {
  final Function(String) option;
  const CustomOptions({super.key, required this.option});

  @override
  State<CustomOptions> createState() => _CustomOptionsState();
}

class _CustomOptionsState extends State<CustomOptions> {
  bool isTapped = false;
  String selectedOption = '';
  @override
  Widget build(BuildContext context) {
    return Row(
     // spacing: 10,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedOption = 'Yes';
              widget.option('Yes');
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: selectedOption == 'Yes' ? Color(0xFF0F3CC9).withOpacity(0.2) : Colors.transparent,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.black, width: 1)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Text('Yes', style: TextStyle(fontSize: 16),),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedOption = 'No';
              widget.option('No');
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: selectedOption == 'No' ? Color(0xFF0F3CC9).withOpacity(0.2) : Colors.transparent,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.black, width: 1)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Text('No', style: TextStyle(fontSize: 16),),
            ),
          ),
        )
      ],
    );
  }
}
