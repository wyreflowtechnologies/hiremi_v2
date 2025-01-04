import 'package:flutter/material.dart';

class CustomPasswordField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isPasswordVisible;
  final VoidCallback onToggleVisibility;
  final ValueChanged<String> onChanged;
  final String? errorText;
  final String? Function(String?)? validator;
  final TextEditingController passwordController;

  const CustomPasswordField({
    required this.label,
    required this.hintText,
    required this.isPasswordVisible,
    required this.onToggleVisibility,
    required this.onChanged,
    required this.validator,
    required this.passwordController,
    this.errorText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: MediaQuery.of(context).size.width * 0.05,
              color: Colors.black,
            ),
            children: [
              const TextSpan(
                text: "*",
                style: TextStyle(color: Color(0xff0F3CC9)),
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.width * 0.01),
        TextFormField(
          controller: passwordController,
          obscureText: !isPasswordVisible, // Toggle visibility
          onChanged: onChanged, // Trigger validation on input change
          decoration: InputDecoration(
            hintText: hintText,
            errorText: errorText, // Display error message
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: onToggleVisibility,
            ),
            filled: false,
            fillColor: const Color(0xFFF1F4FF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.01),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.01),
              borderSide: BorderSide(
                color: Color(0xff0F3CC9),
                width: MediaQuery.of(context).size.width * 0.01,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
