// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pre_dashboard/screens/LoginScreen.dart';
// import 'package:pre_dashboard/widgets/custom_password_field.dart';
// import 'package:pre_dashboard/widgets/content_pages/step1_content.dart';
// import 'package:pre_dashboard/widgets/content_pages/step2_content.dart';
// import 'package:pre_dashboard/widgets/content_pages/step3_content.dart';
//
// import '../constants/constants.dart';
//
//
// class RegisterScreenEducational extends StatefulWidget {
//   const RegisterScreenEducational({Key? key}) : super(key: key);
//
//   @override
//   State<RegisterScreenEducational> createState() => _RegisterScreenEducationalState();
// }
//
// class _RegisterScreenEducationalState extends State<RegisterScreenEducational> {
//
// //Zaidi's
//   final TextEditingController fullNameController = TextEditingController();
//   final TextEditingController fatherNameController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController birthPlaceController = TextEditingController();
//
//   String? selectedGender;
//   int currentStep = 1;
//
//   List<String> heading = ["Personal Information","Contact Information","Educational Information","Set New Password"];
//
//
//   //Sameers
//   final _emailController = TextEditingController(text: 'JohnDoe@gmail.com');
//   final _phoneController = TextEditingController(text: '+91');
//   bool _isEmailVerified = false;
//   bool _verifyOTP = false;
//   bool isPasswordVisible = false;
//   bool isConfirmPasswordVisible = false;
//
//
//    String email = "JohnDoe@gmail.com";
//   String phoneNumber = "+91";
//   bool isEmailVerified = false;
//   bool showOtpScreen = false;
//   String otpInput = "";
//
//   bool shouldMove = false;
//   final String validOtp = "1234";
//
//
//   final PageController _pageController = PageController();
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     // bool isActive = true;
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: showOtpScreen?null: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         title:Text(
//                 'Create Account',
//                 style: GoogleFonts.poppins(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: const Color(0xff0f3cc9),
//                 ),
//               ),
//       ),
//       body: Stack(
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: screenWidth * 0.05,
//               vertical: screenHeight * 0.02,
//             ),
//             child: Column(
//               children: [
//                 Text(
//
//                   currentStep>1? heading[currentStep-1]: heading[currentStep],
//                     style: GoogleFonts.poppins(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                 SizedBox(height: screenHeight * 0.03),
//
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: List.generate(4, (index) {
//                  bool  isActive =  index < currentStep;
//                     bool isCurrent = index == currentStep;
//                     // print(isActive);
//                     // print('index $index');
//                     // print('current Step $currentStep');
//
//
//                     return Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//
//                             setState(() {
//
//                               currentStep = index + 1;
//                               _pageController.jumpToPage(currentStep - 1);
//                             });
//                           },
//                           child: AnimatedContainer(
//                             duration: const Duration(milliseconds: 500),
//                             curve: Curves.easeInOut,
//                             width: screenHeight * 0.04,
//                             height: screenHeight * 0.04,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: isActive
//                                   ? const Color(0xff002496)
//                                   : Colors.transparent,
//                               border: Border.all(
//                                 color: isCurrent
//                                     ? const Color(0xff0F3CC9)
//                                     : Colors.grey,
//                                 width: 2,
//                               ),
//                             ),
//                             child: Center(
//                               child: isActive
//                                   ? Icon(
//                                 Icons.check,
//                                 color: Colors.white,
//                                 size: screenHeight * 0.02,
//                               )
//                                   : isCurrent
//                                   ? Container(
//                                 width: screenHeight * 0.02,
//                                 height: screenHeight * 0.02,
//                                 decoration: const BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Color(0xffCBD6FF),
//                                 ),
//                               )
//                                   : null,
//                             ),
//                           ),
//                         ),
//                         if (index < 3)
//                           Container(
//                             width: screenWidth * 0.15,
//                             height: screenHeight * 0.003,
//                             color: isActive
//                                 ? const Color(0xff002496)
//                                 : Colors.grey,
//                           ),
//                       ],
//                     );
//                   }),
//                 ),
//                 SizedBox(height: screenWidth * 0.003),
//
//                 // PageView for dynamic content
//                 Expanded(
//                   child: PageView(
//                     controller: _pageController,
//                     physics: const NeverScrollableScrollPhysics(),
//                     onPageChanged: (pageIndex) {
//                       setState(() {
//                         currentStep = pageIndex+1;
//                       });
//                     },
//                     children: [
//                       Step1ContentWidget(
//                         fullNameController: fullNameController,
//                         fatherNameController: fatherNameController,
//                         birthPlaceController: birthPlaceController,
//                         dobController: dobController,
//                         selectedGender: selectedGender,
//                         onGenderChanged: (value) {
//                           setState(() {
//                             // print(value);
//                             selectedGender = value;
//                             print(selectedGender);
//                               });
//                         }),
//                         Step2Content(
//                           email: email,
//                           isEmailVerified: isEmailVerified,
//                           phoneNumber: phoneNumber,
//                           showOtpScreen: showOtpScreen,
//                           onChangedEmail: (value){
//                             setState(() {
//                               email = value;
//                             });
//                           },
//                           onChangedPhone: (value){
//                             setState(() {
//                               phoneNumber = value;
//                             });
//                           },
//                           onVerifyTap: (){
//                             setState(() {
//                               showOtpScreen = true;
//                             });
//                           },
//                           ),
//
//                      const Step3Content(),
//                       _buildPasswordScreenPlaceholder(screenHeight),
//                       // Placeholder for PasswordScreen
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.03),
//
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         if (currentStep > 1) {
//                           setState(() {
//                             currentStep--;
//                             _pageController.previousPage(
//                               duration: const Duration(milliseconds: 500),
//                               curve: Curves.easeInOut,
//                             );
//                           });
//                         }
//                         else {
//                           Navigator.pop(context);
//                         }
//                       },
//                       child: Text(
//                         "Back",
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: screenHeight * 0.02,
//                         ),
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         if(currentStep == 2)
//                         {
//                           print("proceed pressed at 1");
//                             if(shouldMove)
//                             {
//                               setState(() {
//                             // currentStep++;
//                             _pageController.nextPage(
//                               duration: const Duration(milliseconds: 500),
//                               curve: Curves.easeInOut,
//                             );
//                           });
//                             }
//
//
//
//                         }
//                        else if ( currentStep < 4) {
//                           // Animate and move to the next step
//                           // print(currentStep);
//
//                           print("procedd pressed cureent Stepp $currentStep");
//                           setState(() {
//                             // currentStep++;
//                             _pageController.nextPage(
//                               duration: const Duration(milliseconds: 500),
//                               curve: Curves.easeInOut,
//                             );
//                           });
//                         }
//                         else{
//                           Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreenUpdated()));
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xff0F3CC9),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: screenWidth * 0.08,
//                           vertical: screenHeight * 0.015,
//                         ),
//                         child: Text(
//                           currentStep < 4 ? "Proceed" : "Submit",
//                           style: TextStyle(
//                             fontSize: screenHeight * 0.02,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//            if (showOtpScreen) _buildOtpOverlay(context),
//         ],
//       ),
//
//     );
//   }
//
//
//
//
//
//   Widget _buildOtpOverlay(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//   return GestureDetector(
//     onTap: () => FocusScope.of(context).unfocus(),
//     child: BackdropFilter(
//        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
//       child: SingleChildScrollView(
//         child: Container(
//           // height: double.infinity,
//           color: Colors.white.withOpacity(0.90), // Translucent background
//           child: Center(
//             child: Padding(
//               padding:  EdgeInsets.symmetric(
//                 horizontal: screenWidth*0.05,
//                 vertical:  screenWidth*0.02,
//                 ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 // mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height*0.2,
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.width*0.5,
//                     child: Image.asset(
//                       'assets/images/logo (2).png',
//                       height: screenWidth * 0.1,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                   SizedBox(height:
//                   MediaQuery.of(context).size.width * 0.01
//                   ),
//
//                   // OTP Title
//                   Text(
//                     "OTP Verification",
//                     style: GoogleFonts.poppins(
//                       fontSize: screenWidth * 0.05,
//                       fontWeight: FontWeight.bold,
//                       // fontFamily: "Poppins"
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: screenWidth*0.01),
//
//                   // Subtitle
//                    Text(
//                     "Enter the verification code we have sent to your e-mail",
//                     style: GoogleFonts.poppins(
//                       fontSize: screenWidth*0.035,
//                       color: Colors.grey,
//
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                    SizedBox(height: screenWidth*0.04),
//
//                   // OTP Input Fields
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: screenWidth*0.035,
//                       ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: List.generate(
//                         4, // Number of OTP fields
//                         (index) => SizedBox(
//                           width: screenWidth*0.15,
//                           child: TextField(
//                             textAlign: TextAlign.center,
//                             keyboardType: TextInputType.number,
//                             maxLength: 1,
//                             onChanged: (value) {
//                               if (value.length == 1 && index < 3) {
//                                 FocusScope.of(context).nextFocus();
//                               } else if (value.isEmpty && index > 0) {
//                                 FocusScope.of(context).previousFocus();
//                               }
//                               otpInput = otpInput.replaceRange(0,0,value);
//                             },
//                             decoration: InputDecoration(
//                               counterText: "",
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.all(Radius.circular(screenWidth*0.04)),
//
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.all(Radius.circular(screenWidth*0.04)),
//                                 borderSide: BorderSide(
//                                   color: Colors.black,
//                                   width: screenWidth*0.0035
//                                 ),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.all(Radius.circular(screenWidth*0.04)),
//                                 borderSide: BorderSide(
//                                   color: AppColors.primaryColor,
//                                   width: screenWidth*0.0035
//                                 ),
//                               ),
//
//
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height:
//                   screenWidth * 0.2
//                   ),
//
//                   // Verify OTP Button
//                   ElevatedButton(
//                     onPressed: () {
//                       if (otpInput.split('').reversed.join() == validOtp) {
//                         // Valid OTP
//                         setState(() {
//                           shouldMove = true;
//                           isEmailVerified = true;
//                           showOtpScreen = false;
//                         });
//                       } else {
//                         // Invalid OTP
//                         print(otpInput);
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text("Invalid OTP"),
//                             backgroundColor: AppColors.primaryColor,
//                           ),
//                         );
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       minimumSize:  Size(double.infinity, screenWidth * 0.15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(
//                           screenWidth * 0.05
//                         ),
//                       ),
//                       backgroundColor: AppColors.primaryColor,
//                     ),
//                     child: Text(
//                       "Verify OTP",
//                       style: GoogleFonts.poppins(
//                         color: AppColors.white,
//                         fontWeight: FontWeight.w700,
//                         fontSize: screenWidth * 0.04,
//                         ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
//
//
//
//
//   Widget _buildPasswordScreenPlaceholder(double screenHeight) {
//     return Center(
//       child: Column(
//         children: [
//           SizedBox(height: screenHeight*0.05),
//            Padding(
//             padding: EdgeInsets.only(left: screenHeight*0.001),
//             child: Text.rich(
//               TextSpan(
//                 text: "Min 8 characters",
//                 style: TextStyle(fontSize: screenHeight*0.02, color: Color(0xFF0F3CC9)),
//                 children: [
//                   TextSpan(
//                     text: ", 1 uppercase, 1 digit, 1 special character",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: screenHeight*0.02),
//           // Password Field
//           CustomPasswordField(
//
//             label: "Password",
//             hintText: "****",
//             isPasswordVisible: isPasswordVisible,
//             onToggleVisibility: () {
//               setState(() {
//                 isPasswordVisible = !isPasswordVisible;
//               });
//             },
//           ),
//             SizedBox(height: screenHeight*0.02),
//           // Confirm Password Field
//           CustomPasswordField(
//             label: "Confirm Password",
//             hintText: "****",
//             isPasswordVisible: isConfirmPasswordVisible,
//             onToggleVisibility: () {
//               setState(() {
//                 isConfirmPasswordVisible = !isConfirmPasswordVisible;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//
//   }
//
//
// }
//
//
//
//
//
//
