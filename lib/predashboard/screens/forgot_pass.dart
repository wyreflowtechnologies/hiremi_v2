
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pre_dashboard/API.dart';
import 'package:pre_dashboard/predashboard/Services/user_service.dart';
import 'package:pre_dashboard/predashboard/screens/LoginScreen.dart';
import 'package:pre_dashboard/predashboard/widgets/password_succesfully_changed_dialogBox.dart';
import '../constants/constants.dart';

import '../widgets/background.dart';
import '../widgets/password_field.dart';
import '../widgets/reset_button.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

// class _ForgotPassState extends State<ForgotPass> {
//   final TextEditingController _newPasswordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//
//   String? _errorMessage;
//   bool _isPasswordMismatch = false; // Flag for mismatched passwords
//   bool _areBothPasswordsValid = false; // Flag for valid and matching passwords
//   bool _isBothEmpty = true; // Flag for empty password fields
//
//   // Regular expression to validate password strength
//   bool _isPasswordValidFunction(String password) {
//     final RegExp passwordRegExp = RegExp(
//       r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
//     );
//     return passwordRegExp.hasMatch(password);
//   }
//
//   // Validation logic for both password fields
//   void _validateFields() {
//     final newPassword = _newPasswordController.text;
//     final confirmPassword = _confirmPasswordController.text;
//
//     setState(() {
//       _isBothEmpty = newPassword.isEmpty && confirmPassword.isEmpty;
//
//       if (!_isBothEmpty) {
//         _areBothPasswordsValid =
//             _isPasswordValidFunction(newPassword) &&
//                 newPassword == confirmPassword &&
//                 _isPasswordValidFunction(confirmPassword);
//
//         _isPasswordMismatch = !_areBothPasswordsValid;
//       } else {
//         _areBothPasswordsValid = false;
//         _isPasswordMismatch = false;
//       }
//
//       // Set error message
//       if (_isPasswordMismatch) {
//         _errorMessage = "Passwords do not match!";
//       } else if (!_isBothEmpty && !_areBothPasswordsValid) {
//         _errorMessage =
//         'Password must be at least 8 characters, include 1 uppercase, 1 lowercase, 1 digit, and 1 special character.';
//       } else if (_isBothEmpty) {
//         _errorMessage = "Please enter both passwords.";
//       } else {
//         _errorMessage = null;
//       }
//     });
//   }
//
//   void _onPasswordChange(String value) {
//     _validateFields();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           const BackgroundCircle(),
//           SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
//                   child: Image.asset(
//                     'assets/images/logo (1).png',
//                     width: MediaQuery.of(context).size.width * 0.6,
//                   ),
//                 ),
//                 Text(
//                   'Create new Password,',
//                   style: GoogleFonts.poppins(
//                     fontWeight: FontWeight.w500,
//                     fontSize: MediaQuery.of(context).size.width * 0.06,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
//                   child: Image.asset(
//                     'assets/images/forgot password.png',
//                     width: MediaQuery.of(context).size.width * 0.8,
//                     height: MediaQuery.of(context).size.width * 0.8,
//                   ),
//                 ),
//
//                 Padding(
//                   padding:  EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.03,
//                     left: MediaQuery.of(context).size.width * 0.05,
//                   ),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: RichText(
//                       text: TextSpan(
//                         style: GoogleFonts.poppins(
//                           fontSize: MediaQuery.of(context).size.width * 0.04,
//                           color: Colors.black,
//                         ),
//                         children: const [
//                           TextSpan(text: 'New Password'),
//                           TextSpan(
//                             text: ' *',
//                             style: TextStyle(color: AppColors.textField),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 PasswordField(
//                   controller: _newPasswordController,
//                   obscureText: true,
//                   hintText: '********',
//                   onChanged: _onPasswordChange,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.02,
//                     left: MediaQuery.of(context).size.width * 0.05,
//                   ),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: RichText(
//                       text: TextSpan(
//                         style: GoogleFonts.poppins(
//                           fontSize: MediaQuery.of(context).size.width * 0.04,
//                           color: Colors.black,
//                         ),
//                         children: const [
//                           TextSpan(text: 'Confirm New Password'),
//                           TextSpan(
//                             text: ' *',
//                             style: TextStyle(color: AppColors.textField),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 PasswordField(
//                   controller: _confirmPasswordController,
//                   obscureText: true,
//                   hintText: '********',
//                   onChanged: _onPasswordChange,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
//                   child: SizedBox(
//                     width: MediaQuery.of(context).size.width - 30,
//                     child: Text(
//                       _errorMessage ?? 'Min 8 characters, 1 upper case, 1 digit, 1 special character',
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.poppins(
//                         fontWeight: FontWeight.w400,
//                         fontSize: MediaQuery.of(context).size.width * 0.03,
//                         color: _errorMessage != null ? AppColors.error :  Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//                 ResetButton(
//                   onPressed: _areBothPasswordsValid
//                       ? () {
//                     // Reset button functionality here
//                     print("Clicking");
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return CongratulationsDialog();
//                       },
//                     );
//                   }
//                       : () {}, // Pass an empty function instead of null
//                 ),
//
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _ForgotPassState extends State<ForgotPass> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final UserService _userService = UserService();

  String? _errorMessage;

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
      if (newPassword.isEmpty || confirmPassword.isEmpty) {
        _errorMessage = "Please enter both passwords.";
      } else if (!_isPasswordValidFunction(newPassword)) {
        _errorMessage =
        'Password must be at least 8 characters, include 1 uppercase, 1 digit, and 1 special character.';
      } else if (newPassword != confirmPassword) {
        _errorMessage = "Passwords do not match!";
      } else {
        _errorMessage = null; // Clear the error message
      }
    });
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
                // Logo and Title
                //Reset password-bro (1)
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
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
                // Padding(
                //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                //   child: Image.asset(
                //     'assets/images/forgot password.png',
                //     width: MediaQuery.of(context).size.width * 0.8,
                //     height: MediaQuery.of(context).size.width * 0.8,
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                  child: Image.asset(
                    'assets/images/Reset password-bro (1).png',
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),

                // New Password Field
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                    left: MediaQuery.of(context).size.width * 0.05,
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
                  onChanged: (value) {}, // No error shown during typing
                ),

                // Confirm Password Field
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.width * 0.05,
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
                  onChanged: (value) {}, // No error shown during typing
                ),

                // Error Message (conditionally displayed)
                if (_errorMessage != null)
                  Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 30,
                      child: Text(
                        _errorMessage!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          color: AppColors.error,
                        ),
                      ),
                    ),
                  ),

                // Reset Button
                ResetButton(
                  onPressed: () async {
                    _validateFields(); // Validate when reset is clicked
                    if (_errorMessage == null) {
                      // Perform reset password action
                      print("Passwords are valid. Proceeding...");
                      bool isPasswordValid =true;

                      if(isPasswordValid) {
                        Map<String, dynamic> body = {
                          "pass1": _newPasswordController.text.toString(),
                          "pass2": _confirmPasswordController.text.toString()
                        };
                        var response = await _userService.createPostApi(
                            body, ApiUrls.passwordReset);
                        if (response.statusCode == 200) {
                          // ignore: use_build_context_synchronously
                          print("HDJHDDC");
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CongratulationsDialog();
                            },
                          );

                        }
                        else {
                          String errorMessage = response.body;
                          // ignore: use_build_context_synchronously
                          print(response.body);
                          print("---------");
                          print(response.statusCode);

                        }
                      }
                      // showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return CongratulationsDialog();
                      //   },
                      // );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

