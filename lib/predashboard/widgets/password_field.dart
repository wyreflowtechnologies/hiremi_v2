
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

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextField(
          controller: widget.controller,
          obscureText: _obscureText,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: widget.hintText,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textField),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textField),
            ),
            prefixIcon: Padding(
              padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.02),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.15,
                decoration: const BoxDecoration(
                  border: Border(right: BorderSide(color: AppColors.textField)), // Static grey border
                ),
                child:  Icon(
                  Icons.lock,
                  color: AppColors.lockIcon,
                ),
              ),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
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

