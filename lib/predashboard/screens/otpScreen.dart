import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/svg.dart';
import 'package:pre_dashboard/API.dart';
import 'package:pre_dashboard/predashboard/Services/user_service.dart';
import 'package:pre_dashboard/predashboard/screens/forgot_pass.dart';
import 'package:pre_dashboard/predashboard/widgets/otpInput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/constants.dart';
import '../Model/enum.dart';
// import '../Widgets/otpInput.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  final UserService _userService = UserService();
  OtpStatus _otpStatus = OtpStatus.normal;
  Timer? _timer;
  bool isLoading = false;
  int _timeLeft = 120;
  final String _correctOtp = "123456";
  bool _isVerified = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  void startTimer() {
    setState(() {
      _timeLeft = 120;
      _isVerified = false;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void resendOtp() {
    startTimer();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('OTP has been resent to your email address.'),
      ),
    );
  }

  // void validateOtp() {
  //   setState(() {
  //     if (_otpController.text.length != 6) {
  //       _otpStatus = OtpStatus.error;
  //       return;
  //     }
  //
  //     if (_otpController.text == _correctOtp) {
  //       _otpStatus = OtpStatus.success;
  //       _isVerified = true;
  //       _timer?.cancel();
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => const ForgotPass()),
  //       );
  //     } else {
  //       _otpStatus = OtpStatus.error;
  //     }
  //   });
  // }
  Future<void> validateOtp(String otp) async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await _userService.createPostApi({"otp": otp}, ApiUrls.otpValidation);
      setState(() {
        isLoading = false;
      });

      if (response.statusCode == 200) {
        // Store the OTP in shared preferences (example usage)
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('otp', otp);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ForgotPass()),
        );

      } else {
        print(response.statusCode);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid OTP. Please try again.')),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again later.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                SvgPicture.asset(
                  'assets/images/main.svg',
                  height: 50,
                ),
                Image.asset(
                  'assets/images/main.png',
                  height: 50,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Verify your Email address",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 40),
                // SvgPicture.asset(
                //   'assets/images/optImage.svg',
                //   height: 250,
                // ),
                Image.asset(
                  'assets/images/Enter OTP-bro (1).png',
                  height: 250,
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Enter One Time Password",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          TextSpan(
                            text: "*",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.primaryDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                OtpInputField(
                  controller: _otpController,
                  otpStatus: _otpStatus,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        _otpStatus = OtpStatus.normal;
                      });
                    }
                  },
                ),
                if (_otpStatus == OtpStatus.error &&
                    _otpController.text.isNotEmpty)
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Invalid OTP Number.',
                      style: TextStyle(
                        color: AppColors.primaryDark,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textColor,
                    ),
                    children: [
                      const TextSpan(text: 'Please, Enter your '),
                      const TextSpan(
                        text: 'six digit',
                        style: TextStyle(
                          color: AppColors.swipeScreenTopTextFirst,
                        ),
                      ),
                      const TextSpan(
                        text: ' code that you have received in your mail box. ',
                      ),
                      // TextSpan(
                      //   text: 'Resend OTP',
                      //   style: const TextStyle(
                      //     color: AppColors.linkUnderline,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      //   recognizer: TapGestureRecognizer()..onTap = (){
                      //
                      //   },
                      // ),
                    ],
                  ),
                ),
                 SizedBox(height: 20),
                ElevatedButton(
                  onPressed: (){
                    validateOtp(_otpController.text.toString().trim());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryDark,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.background,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
