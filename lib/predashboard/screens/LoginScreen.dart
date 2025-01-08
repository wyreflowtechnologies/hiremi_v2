
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pre_dashboard/HomePage/screens/HomeScreen.dart';
import 'package:pre_dashboard/Non_verified_changes/screens/profile_verification_screen1.dart';
import 'package:http/http.dart' as http;

import 'package:pre_dashboard/predashboard/screens/password_recovery_page_screen.dart';
import 'package:pre_dashboard/predashboard/screens/register_screen.dart';
import 'package:pre_dashboard/predashboard/widgets/LoginAnimation.dart';
import '../../API.dart';
import '../constants/constants.dart';
import '../widgets/custom_text_field.dart';
// import '../screens/RegistrationScreen.dart';

class LoginScreenUpdated extends StatefulWidget {
  @override
  _LoginScreenUpdatedState createState() => _LoginScreenUpdatedState();
}
//Yash
class _LoginScreenUpdatedState extends State<LoginScreenUpdated> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _showAnimation = false;

  final String apiUrl = "${ApiUrls.baseurl}/login/";


  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _showAnimation = true;
      });

      try {
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            'email': _emailController.text.trim(),
            'password': _passwordController.text.trim(),
          }),
        );

        if (response.statusCode == 200) {
          // Assuming the API returns a success response with a JSON body
          final responseData = json.decode(response.body);
          print('Login Successful: ${responseData['message']}');
            setState(() {
            _isLoading = false;
            _showAnimation = false;
          });
        

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(isVerified: false,
                animation: true, // Pass the value here
              ),
            ),
          );
        } else {
          // Handle login failure
          final errorBody = response.body; // Entire response body
          final errorData = json.decode(errorBody);

          print('Login Failed: ${errorData['error'] ?? 'Unknown error'}');

          setState(() {
            _isLoading = false;
            _showAnimation = false;
          });

          // Show error message with the entire response body
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Login Failed: $errorBody',
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        print('An error occurred: $e');

        setState(() {
          _isLoading = false;
          _showAnimation = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'An error occurred. Please try again.',
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Building");
    final size = MediaQuery.of(context).size;

    return WillPopScope(
        onWillPop: () async {
          // Return false to prevent back navigation
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: _showAnimation
              ? LoginAnimation(nextScreen: HomeScreen(isVerified: false,
               animation: false, // Pass the value here
          ))
              : SafeArea(
      child: SingleChildScrollView(
        child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.02,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Hire',
                                style: TextStyle(color: Colors.black,
                                    fontSize: size.height*0.034,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              TextSpan(
                                text: 'mi',
                                style: TextStyle(color: Colors.blue,
                                    fontSize: size.height*0.034,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.015),
                      Text(
                        'Login here',
                        style: GoogleFonts.poppins(
                          fontSize: size.width * 0.08,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff0F3CC9),
                        ),
                      ),
                      SizedBox(height: size.height * 0.015),
                      Text(
                        'Welcome back you’ve \nbeen missed!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _emailController,
                              hintText: 'Email',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                                    .hasMatch(value)) {
                                  return 'Enter a valid email';
                                }
                                return null;
                              },
                            ),
                            CustomTextField(
                              controller: _passwordController,

                              hintText: 'Password',
                              isPassword: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }
                                return null;
                              },
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {

                                Navigator.push(context,MaterialPageRoute(builder: (context)=> PasswordRecoveryPageScreen()));


                                },
                                child: Text(
                                  'Forgot password?',
                                  style: GoogleFonts.poppins(
                                    fontSize: size.width * 0.03,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff0f3cc9),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      SizedBox(
                        height: size.height * 0.08,
                        width: size.width * 0.9,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff0F3CC9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 6,
                          ),
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Sign in',
                                  style: GoogleFonts.poppins(
                                    fontSize: size.width * 0.05,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      SizedBox(
                        height: size.height * 0.07,
                        width: size.width * 0.9,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreenEducational(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffffffff),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Create new account',
                            style: GoogleFonts.poppins(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff494949),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    ),
          ),

    );
  }
}
