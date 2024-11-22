// // import 'dart:ui';
// // import 'package:flutter/material.dart';
// // import 'package:pre_dashboard/screens/OTPNewVerified.dart';

// // class OTPNew extends StatelessWidget {
// //   const OTPNew({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     // Get screen dimensions using MediaQuery
// //     final screenHeight = MediaQuery.of(context).size.height;
// //     final screenWidth = MediaQuery.of(context).size.width;

// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           // White background
// //           Container(
// //             color: Colors.white, // White base background
// //           ),
// //           // Blur effect
// //           BackdropFilter(
// //             filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
// //             child: Container(
// //               color: Colors.white
// //                   .withOpacity(0.1), // Slight transparency over blur
// //             ),
// //           ),
// //           // Centered OTP section
// //           Center(
// //             child: Padding(
// //               padding: EdgeInsets.symmetric(
// //                 horizontal: screenWidth * 0.08, // Responsive horizontal padding
// //               ),
// //               child: Column(
// //                 mainAxisSize:
// //                     MainAxisSize.min, // Centers the section vertically
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: [
// //                   // Logo (replacing shield icon)
// //                   SizedBox(
// //                     height: screenHeight * 0.2, // Adjust logo size
// //                     child: Image.asset(
// //                       'assets/images/logo (2).png', // Replace with your logo path
// //                       fit: BoxFit.contain,
// //                     ),
// //                   ),
// //                   SizedBox(height: screenHeight * 0.02),
// //                   Text(
// //                     'OTP Verification',
// //                     style: TextStyle(
// //                       fontSize: screenWidth * 0.08, // Responsive font size
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                   SizedBox(height: screenHeight * 0.015),
// //                   Text(
// //                     'Enter the verification code we have sent to your e-mail',
// //                     textAlign: TextAlign.center,
// //                     style: TextStyle(
// //                       fontSize: screenWidth * 0.045, // Responsive font size
// //                       color: Colors.black54,
// //                     ),
// //                   ),
// //                   SizedBox(height: screenHeight * 0.04),
// //                   // OTP Input fields
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                     children: [
// //                       for (int i = 0; i < 4; i++)
// //                         SizedBox(
// //                           width: screenWidth * 0.15,
// //                           child: TextFormField(
// //                             textAlign: TextAlign.center,
// //                             style: TextStyle(fontSize: screenWidth * 0.05),
// //                             keyboardType: TextInputType.number,
// //                             maxLength: 1,
// //                             decoration: InputDecoration(
// //                               counterText: '',
// //                               border: OutlineInputBorder(
// //                                 borderRadius: BorderRadius.circular(12),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                     ],
// //                   ),
// //                   SizedBox(height: screenHeight * 0.04),
// //                   // Verify OTP Button
// //                   ElevatedButton(
// //                     onPressed: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (context) => OTPNewVerified(),
// //                         ),
// //                       );
// //                     },
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: Colors.blue.shade900,
// //                       foregroundColor: Colors.white,
// //                       minimumSize: Size(screenWidth * 0.8, screenHeight * 0.07),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(8),
// //                       ),
// //                     ),
// //                     child: Text(
// //                       'Verify OTP',
// //                       style: TextStyle(fontSize: screenWidth * 0.05),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'dart:ui';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: OTPNew(),
//     );
//   }
// }

// class OTPNew extends StatefulWidget {
//   @override
//   _OTPNewState createState() => _OTPNewState();
// }

// class _OTPNewState extends State<OTPNew> {
//   String email = "JohnDoe@gmail.com"; // Default email value
//   String phoneNumber = "+91"; // Default phone number value
//   bool isEmailVerified = false;
//   bool showOtpScreen = false;
//   String otpInput = "";

//   final String validOtp = "1234"; // Hardcoded valid OTP

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Register Screen")),
//       body: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
              
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Email Address*",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   onChanged: (value) {
//                     setState(() {
//                       email = value;
//                     });
//                   },
//                   controller: TextEditingController(text: email),
//                   decoration: InputDecoration(
//                     hintText: "Enter your email",
//                     suffixIcon: Icon(
//                       isEmailVerified
//                           ? Icons.check_circle
//                           : Icons.error_outline,
//                       color: isEmailVerified ? Colors.green : Colors.red,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(16), // Rounded border
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(16),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(16),
//                       borderSide: const BorderSide(color: Colors.blue),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Spacer(),
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           showOtpScreen = true;
//                         });
//                       },
//                       child: const Text("Verify Now"),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   "Phone Number*",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   onChanged: (value) {
//                     setState(() {
//                       phoneNumber = value;
//                     });
//                   },
//                   controller: TextEditingController(text: phoneNumber),
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(
//                     hintText: "Enter your phone number",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(16), // Rounded border
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(16),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(16),
//                       borderSide: const BorderSide(color: Colors.blue),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           if (showOtpScreen) _buildOtpOverlay(context),
//         ],
//       ),
//     );
//   }


  
// }
