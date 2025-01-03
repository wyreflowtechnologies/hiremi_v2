import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool isDatePicker;
  final bool isAuthentication;
  final bool isHidden;
  final String? Function(String?)? validator; // Added validator

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.isDatePicker = false,
    this.isAuthentication = false,
    this.isHidden = false,
    this.validator, // Added validator
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? errorMessage;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            color: Color(0xFF555555),
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          obscureText: widget.isHidden == true && isPressed == true,
          onChanged: (value) {
            if (widget.isAuthentication) {
              setState(() {
                errorMessage =
                value.isEmpty ? 'This field cannot be empty' : null;
              });
            }
            if (widget.validator != null) {
              setState(() {
                errorMessage = widget.validator!(value);
              });
            }
          },
          decoration: InputDecoration(
            hintText: widget.hint,
            errorText: errorMessage,
            suffixIcon: widget.isAuthentication && widget.controller.text.isEmpty
                ? const Icon(Icons.error, color: Colors.red)
                : widget.isDatePicker
                ? GestureDetector(
              onTap: () async {
                DateTime? datePicked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1947),
                  lastDate: DateTime.now(),
                );
                if (datePicked != null) {
                  String date =
                      '${datePicked.day}/${datePicked.month}/${datePicked.year}';
                  setState(() {
                    widget.controller.text = date;
                    errorMessage = null;
                  });
                }
              },
              child: const Icon(Icons.calendar_month),
            )
                : widget.isHidden
                ? GestureDetector(
              onTap: () {
                setState(() {
                  isPressed = !isPressed;
                });
              },
              child: Icon(!isPressed
                  ? Icons.visibility
                  : Icons.visibility_off),
            )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onTap: widget.isDatePicker
              ? () {
            // Additional onTap functionality if needed
          }
              : null,
        ),
        if (errorMessage != null && widget.isAuthentication)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              errorMessage!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}