
import 'package:flutter/material.dart';
import '../constants/constants.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final ValueChanged<String> onChanged;

  const PasswordField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
    required this.onChanged,
  });

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  String? _errorText; // For storing error text if any

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    // Calculate values once for readability and performance
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(width * 0.02),
      child: SizedBox(
        width: width * 0.9,
        child: TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          onChanged: widget.onChanged,
          validator: (value) {
            // Validation logic for empty field
            if (value == null || value.isEmpty) {
              return 'Password cannot be empty';
            }
            return null; // No error if the field is not empty
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            errorText: _errorText, // Show error text
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textField),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textField),
            ),
            prefixIcon: Container(
              width: width * 0.15,
              padding: EdgeInsets.only(right: width * 0.02), // Adjust padding
              decoration: const BoxDecoration(
                border: Border(right: BorderSide(color: AppColors.textField)),
              ),
              child: Icon(
                Icons.lock,
                color: AppColors.lockIcon,
              ),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
