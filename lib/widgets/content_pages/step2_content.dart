// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../constants/constants.dart';
//
// class Step2Content extends StatefulWidget {
//   Step2Content({
//     super.key,
//     required this.email,
//     required this.isEmailVerified,
//     required this.phoneNumber,
//     required this.showOtpScreen,
//     required this.onChangedEmail,
//     required this.onChangedPhone,
//     required this.onVerifyTap,
//   });
//
//   final bool isEmailVerified;
//   final String email;
//   final String phoneNumber;
//   final bool showOtpScreen;
//   final ValueChanged onChangedEmail;
//   final ValueChanged onChangedPhone;
//   final VoidCallback onVerifyTap;
//
//   @override
//   State<Step2Content> createState() => _Step2ContentState();
// }
//
// class _Step2ContentState extends State<Step2Content> {
//   final _emailController = TextEditingController();
//
//   final _phoneController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final ScreenWidth = MediaQuery.of(context).size.width;
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Email Address*",
//               style: GoogleFonts.poppins(
//                   fontSize: ScreenWidth * 0.04, fontWeight: FontWeight.w500),
//             ),
//             SizedBox(height: ScreenWidth * 0.015),
//             TextField(
//               onChanged: widget.onChangedEmail,
//               controller: _emailController,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.all(ScreenWidth * 0.05),
//                 hintText: "JohnDoe@gmail.com",
//                 hintStyle: GoogleFonts.poppins(fontSize: ScreenWidth * 0.04),
//                 suffixIcon: widget.isEmailVerified
//                     ? Image.asset('assets/images/check.png')
//                     : Image.asset('assets/images/exclaim.png'),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(
//                       ScreenWidth * 0.02), // Rounded border
//                   borderSide: const BorderSide(color: Colors.grey),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(ScreenWidth * 0.02),
//                   borderSide: const BorderSide(color: Colors.grey),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(ScreenWidth * 0.02),
//                   borderSide: const BorderSide(color: AppColors.primaryColor),
//                 ),
//               ),
//             ),
//             SizedBox(height: ScreenWidth * 0.01),
//             Row(
//               children: [
//                 Spacer(),
//                 widget.isEmailVerified
//                     ? Container(
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         decoration: BoxDecoration(
//                             // border: Border.all(
//                             //   width: 1.0
//                             // ),
//                             borderRadius:
//                                 BorderRadius.circular(ScreenWidth * 0.001)),
//                         child: Text(
//                           "Your Email has been verified",
//                           style: GoogleFonts.poppins(
//                             color: AppColors.linkUnderline,
//                           ),
//                         ))
//                     : ElevatedButton(
//                         onPressed: widget.onVerifyTap,
//                         // onPressed: () {
//                         //   setState(() {
//                         //    widget.showOtpScreen = true;
//                         //   });
//                         // },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xff0F3CC9),
//                           shape: RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.circular(ScreenWidth * 0.02),
//                           ),
//                         ),
//                         child: Text(
//                           "Verify Now",
//                           style: GoogleFonts.poppins(
//                             color: AppColors.white,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//               ],
//             ),
//             SizedBox(height: ScreenWidth * 0.03),
//             Text(
//               "Phone Number*",
//               style: GoogleFonts.poppins(
//                   fontSize: ScreenWidth * 0.04, fontWeight: FontWeight.w500),
//             ),
//             SizedBox(height: ScreenWidth * 0.02),
//             TextField(
//               onChanged: widget.onChangedPhone,
//               // onChanged: (value) {
//               //   setState(() {
//               //     widget.phoneNumber = value;
//               //   });
//               // },
//               controller: _phoneController,
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                 hintText: "+91 ",
//                 suffixIcon: widget.phoneNumber.length == 10
//                     ? Image.asset('assets/images/check.png')
//                     : Image.asset('assets/images/exclaim.png'),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(
//                       ScreenWidth * 0.02), // Rounded border
//                   borderSide: const BorderSide(color: Colors.grey),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(ScreenWidth * 0.02),
//                   borderSide: const BorderSide(color: Colors.grey),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(ScreenWidth * 0.02),
//                   borderSide: const BorderSide(color: Colors.blue),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
