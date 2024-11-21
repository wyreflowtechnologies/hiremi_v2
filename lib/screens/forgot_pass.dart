
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/constants.dart';

import '../widgets/background.dart';
import '../widgets/password_field.dart';
import '../widgets/reset_button.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _errorMessage;
  bool _isPasswordMismatch = false; // Flag for mismatched passwords
  bool _areBothPasswordsValid = false; // Flag for valid and matching passwords
  bool _isBothEmpty = true; // Flag for empty password fields

  // Regular expression to validate password strength
  bool _isPasswordValidFunction(String password) {
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    return passwordRegExp.hasMatch(password);
  }

  // Validation logic for both password fields
  void _validateFields() {
    final newPassword = _newPasswordController.text;
    final confirmPassword = _confirmPasswordController.text;

    setState(() {
      _isBothEmpty = newPassword.isEmpty && confirmPassword.isEmpty;

      if (!_isBothEmpty) {
        _areBothPasswordsValid =
            _isPasswordValidFunction(newPassword) &&
                newPassword == confirmPassword &&
                _isPasswordValidFunction(confirmPassword);

        _isPasswordMismatch = !_areBothPasswordsValid;
      } else {
        _areBothPasswordsValid = false;
        _isPasswordMismatch = false;
      }

      // Set error message
      if (_isPasswordMismatch) {
        _errorMessage = "Enter same password in both textfields.";
      } else if (!_isBothEmpty && !_areBothPasswordsValid) {
        _errorMessage = 'Password must be at least 8 characters, include 1 uppercase, 1 digit, and 1 special character.';
      } else {
        _errorMessage = null;
      }
    });
  }

  void _onPasswordChange(String value) {
    _validateFields();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundCircle(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03,),
                  child: Image.asset(
                    'assets/images/logo (1).png',
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                ),
                Text(
                  'Create new Password,',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                  child: Image.asset(
                    'assets/images/forgot password.png',
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.8,
                  )
                ),

                Padding(
                  padding:  EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03, // 3% of screen height
                    left: MediaQuery.of(context).size.width * 0.05, // 5% of screen width
                  ),

                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.black,
                        ),
                        children: const [
                          TextSpan(text: 'New Password'),
                          TextSpan(
                            text: ' *',
                            style: TextStyle(color: AppColors.textField),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                PasswordField(
                  controller: _newPasswordController,
                  obscureText: true,
                  hintText: '********',
                  onChanged: _onPasswordChange,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02, // 3% of screen height
                    left: MediaQuery.of(context).size.width * 0.05, // 5% of screen width
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.black,
                        ),
                        children: const [
                          TextSpan(text: 'Confirm New Password'),
                          TextSpan(
                            text: ' *',
                            style: TextStyle(color: AppColors.textField),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                PasswordField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  hintText: '********',
                  onChanged: _onPasswordChange,
                ),
                Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 30,
                    child: Text(
                      _errorMessage ?? 'Min 8 characters, 1 upper case, 1 digit, 1 special character',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        color: _errorMessage != null ? AppColors.error :  Colors.black,
                      ),
                    ),
                  ),
                ),
                ResetButton(onPressed: (){}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
