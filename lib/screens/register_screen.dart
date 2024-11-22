import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pre_dashboard/screens/LoginScreen.dart';
import 'package:pre_dashboard/widgets/custom_password_field.dart';
import 'package:pre_dashboard/widgets/content_pages/step1_content.dart';
import 'package:pre_dashboard/widgets/content_pages/step2_content.dart';
import 'package:pre_dashboard/widgets/content_pages/step3_content.dart';

import '../constants/constants.dart';
import '../widgets/custom_text_field.dart';
import 'OtpVerificationScreen.dart';

class RegisterScreenEducational extends StatefulWidget {
  const RegisterScreenEducational({Key? key}) : super(key: key);

  @override
  State<RegisterScreenEducational> createState() => _RegisterScreenEducationalState();
}

class _RegisterScreenEducationalState extends State<RegisterScreenEducational> {

//Zaidi's 
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController birthPlaceController = TextEditingController();

  String? selectedGender;
  int currentStep = 0;

  List<String> heading = ["Personal Information","Contact Information","Educational Information","Set New Password"];


  //Sameers 
  final _emailController = TextEditingController(text: 'JohnDoe@gmail.com');
  final _phoneController = TextEditingController(text: '+91');
  bool _isEmailVerified = false;
  bool _verifyOTP = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;


   String email = "JohnDoe@gmail.com"; // Default email value
  String phoneNumber = "+91"; // Default phone number value
  bool isEmailVerified = false;
  bool showOtpScreen = false;
  String otpInput = "";

  bool shouldMove = false;
  final String validOtp = "1234"; 

   // Set the current step (third step in this case)
  final PageController _pageController = PageController();
  void _verifyEmail() {
    setState(() {
      _isEmailVerified = true;
      if (_isEmailVerified) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OTPVerificationScreen()),
        );
      }
    });
  }

  

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title:Text(
                'Create Account',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff0f3cc9),
                ),
              ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.02,
            ),
            child: Column(
              children: [
                Text(
                  
                  currentStep>1? heading[currentStep-1]: heading[currentStep],
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                SizedBox(height: screenHeight * 0.03),
          
                // Animated Step Progress Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Distribute circles evenly
                  children: List.generate(4, (index) {
                    bool isActive = index < currentStep;
                    bool isCurrent = index == currentStep;
          
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle step change on tap
                            setState(() {
                              currentStep = index + 1;
                              _pageController.jumpToPage(currentStep - 1);
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            width: screenHeight * 0.04,
                            height: screenHeight * 0.04,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isActive
                                  ? const Color(0xff002496) // Active steps in blue
                                  : Colors.transparent,
                              border: Border.all(
                                color: isCurrent
                                    ? const Color(0xff0F3CC9) // Current step border
                                    : Colors.grey,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: isActive
                                  ? Icon(
                                Icons.check,
                                color: Colors.white,
                                size: screenHeight * 0.02,
                              )
                                  : isCurrent
                                  ? Container(
                                width: screenHeight * 0.02,
                                height: screenHeight * 0.02,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffCBD6FF), // Light blue
                                ),
                              )
                                  : null,
                            ),
                          ),
                        ),
                        if (index < 3)
                          Container(
                            width: screenWidth * 0.15, // Adjust width to span between circles
                            height: screenHeight * 0.003,
                            color: isActive
                                ? const Color(0xff002496) // Active steps in blue
                                : Colors.grey, // Inactive steps in grey
                          ),
                      ],
                    );
                  }),
                ),
                SizedBox(height: screenWidth * 0.003),
          
                // PageView for dynamic content
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (pageIndex) {
                      setState(() {
                        currentStep = pageIndex + 1;
                      });
                    },
                    children: [
                      Step1ContentWidget(
                        fullNameController: fullNameController,
                        fatherNameController: fatherNameController, 
                        birthPlaceController: birthPlaceController, 
                        dobController: dobController, 
                        selectedGender: selectedGender,
                        onGenderChanged: (value) {
                          setState(() {
                            // print(value);
                            selectedGender = value;
                            print(selectedGender);
                              });
                        }),
                        Step2Content(
                          email: email, 
                          isEmailVerified: isEmailVerified, 
                          phoneNumber: phoneNumber, 
                          showOtpScreen: showOtpScreen,
                          onChangedEmail: (value){
                            setState(() {
                              email = value;                              
                            });
                          },
                          onChangedPhone: (value){
                            setState(() {
                              phoneNumber = value;
                            });
                          },
                          onVerifyTap: (){
                            setState(() {
                              showOtpScreen = true;
                            });
                          },
                          ),
                      
                     const Step3Content(),
                      _buildPasswordScreenPlaceholder(screenHeight),
                      // Placeholder for PasswordScreen
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
          
                // Navigation Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (currentStep > 1) {
                          setState(() {
                            currentStep--;
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          });
                        }
                        else {
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        "Back",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: screenHeight * 0.02,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if(currentStep == 2)
                        {
                          print("yaay");
                            if(shouldMove){
                               setState(() {
                            currentStep++;
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          });
                            }
                        }
                       else if (currentStep != 2 && currentStep < 4) {
                          // Animate and move to the next step
                          print(currentStep);
                          setState(() {
                            currentStep++;
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          });
                        }
                        else{
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreenUpdated()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0F3CC9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.08,
                          vertical: screenHeight * 0.015,
                        ),
                        child: Text(
                          currentStep < 4 ? "Proceed" : "Submit",
                          style: TextStyle(
                            fontSize: screenHeight * 0.02,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
           if (showOtpScreen) _buildOtpOverlay(context),
        ],
      ),

    );
  }

  
 

  
  Widget _buildOtpOverlay(BuildContext context) {
  return GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard
    child: BackdropFilter(
       filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: SingleChildScrollView(
        child: Container(
          // height: double.infinity,
          color: Colors.white.withOpacity(0.35), // Translucent background
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image at the top
                  SizedBox(
                    height: MediaQuery.of(context).size.width*0.5,
                    child: Image.asset(
                      'assets/images/logo (2).png', // Replace with your asset image
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 16),
            
                  // OTP Title
                  const Text(
                    "OTP Verification",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
            
                  // Subtitle
                  const Text(
                    "Enter the verification code we have sent to your e-mail",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
            
                  // OTP Input Fields
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        4, // Number of OTP fields
                        (index) => SizedBox(
                          width: 60,
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            onChanged: (value) {
                              if (value.length == 1 && index < 3) {
                                FocusScope.of(context).nextFocus();
                              } else if (value.isEmpty && index > 0) {
                                FocusScope.of(context).previousFocus();
                              }
                              otpInput = otpInput.replaceRange(0,0,value);
                            },
                            decoration: const InputDecoration(
                              counterText: "", // Hides the character count
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
            
                  // Verify OTP Button
                  ElevatedButton(
                    onPressed: () {
                      if (otpInput.split('').reversed.join() == validOtp) {
                        // Valid OTP
                        setState(() {
                          shouldMove = true;
                          isEmailVerified = true;
                          showOtpScreen = false;
                        });
                      } else {
                        // Invalid OTP
                        print(otpInput);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Invalid OTP"),
                            backgroundColor: AppColors.primaryColor,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: AppColors.primaryColor,
                    ),
                    child: const Text(
                      "Verify OTP",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}


  

  Widget _buildPasswordScreenPlaceholder(double screenHeight) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: screenHeight*0.05),
           Padding(
            padding: EdgeInsets.only(left: screenHeight*0.001),
            child: Text.rich(
              TextSpan(
                text: "Min 8 characters",
                style: TextStyle(fontSize: screenHeight*0.02, color: Color(0xFF0F3CC9)),
                children: [
                  TextSpan(
                    text: ", 1 uppercase, 1 digit, 1 special character",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight*0.02),
          // Password Field
          CustomPasswordField(

            label: "Password",
            hintText: "****",
            isPasswordVisible: isPasswordVisible,
            onToggleVisibility: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
          ),
            SizedBox(height: screenHeight*0.02),
          // Confirm Password Field
          CustomPasswordField(
            label: "Confirm Password",
            hintText: "****",
            isPasswordVisible: isConfirmPasswordVisible,
            onToggleVisibility: () {
              setState(() {
                isConfirmPasswordVisible = !isConfirmPasswordVisible;
              });
            },
          ),
        ],
      ),
    );
    
  }
  

}






