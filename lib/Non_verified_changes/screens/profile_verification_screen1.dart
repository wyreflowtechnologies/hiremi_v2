// import 'package:flutter/material.dart';
// import 'package:pre_dashboard/Non_verified_changes/widgets/custom_circular_progress.dart';
// import 'package:pre_dashboard/Non_verified_changes/widgets/custom_drawer.dart';
// import 'package:pre_dashboard/Non_verified_changes/widgets/custombottombar.dart';
// import 'package:pre_dashboard/Non_verified_changes/widgets/horizontal_line.dart';
// import 'package:pre_dashboard/Non_verified_changes/widgets/profile_verification_steps/custom_form_widget1.dart';
// import 'package:pre_dashboard/Non_verified_changes/widgets/profile_verification_steps/custom_form_widget2.dart';
// import 'package:pre_dashboard/Non_verified_changes/widgets/profile_verification_steps/custom_form_widget3.dart';
// import 'package:pre_dashboard/Non_verified_changes/widgets/profile_verification_steps/custom_form_widget4.dart';
// import 'package:pre_dashboard/Non_verified_changes/widgets/profile_verification_steps/custom_form_widget5.dart';
// import 'package:pre_dashboard/Non_verified_changes/widgets/profile_verification_steps/custom_form_widget6.dart';
//
// class ProfileVerificationScreen1 extends StatefulWidget {
//   const ProfileVerificationScreen1({super.key});
//
//   @override
//   State<ProfileVerificationScreen1> createState() =>
//       _ProfileVerificationPageState();
// }
//
// class _ProfileVerificationPageState extends State<ProfileVerificationScreen1> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   int _selectedIndex = 0;
//   int verificationStep = 0;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   void _onFormComplete(bool isComplete, int statusCode) {
//     if (isComplete) {
//       setState(() {
//         verificationStep = statusCode;
//       });
//     } else {
//       print("Form not completed. Status Code: $statusCode");
//     }
//   }
//
//   Future<bool> _onWillPop() async {
//     if(verificationStep > 0) {
//       setState(() {
//         verificationStep--;
//       });
//       return false;
//     }
//     return true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final size = MediaQuery.of(context).size;
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       child: Scaffold(
//         drawer: const CustomDrawer(),
//         appBar: AppBar(
//           elevation: 0,
//           title: const Text(
//             'Review & Verify Your Profile',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           centerTitle: true,
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: Stack(
//                 children: [
//                   const Icon(
//                     Icons.notifications_outlined,
//                     color: Colors.black,
//                     size: 30,
//                   ),
//                   Positioned(
//                     top: size.height * 0.001,
//                     right: size.width * 0.008,
//                     child: Container(
//                       height: size.height * 0.015,
//                       width: size.width * 0.033,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(7.5),
//                           color: const Color(0xFFDBE4FF)),
//                       child: Center(
//                           child: Text(
//                         '3',
//                         style: TextStyle(
//                             fontSize: size.width * 0.023,
//                             fontWeight: FontWeight.bold,
//                             color: const Color(0xFF0F3CC9)),
//                       )),
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Form(
//             key: formKey,
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: screenHeight * 0.03,
//                 ),
//                 SizedBox(
//                   height: screenHeight * 0.24,
//                   child: CustomCircularProgress(
//                       progress: verificationStep == 0 || verificationStep == 1
//                           ? 25
//                           : (verificationStep == 2 ? 45 : (verificationStep == 3 ? 65 : (verificationStep == 4 ? 85 : 99)))),
//                 ),
//                 SizedBox(height: screenHeight * 0.01),
//                 const HorizontalLine(),
//                 verificationStep == 0
//                     ? CustomFormWidget1(onComplete: _onFormComplete)
//                     : (verificationStep == 1
//                         ? CustomFormWidget2(onContinue: _onFormComplete)
//                         : (verificationStep == 2
//                             ? CustomFormWidget3(onContinue: _onFormComplete)
//                             : (verificationStep == 3
//                                 ? CustomFormWidget4(onContinue: _onFormComplete)
//                                 : (verificationStep == 4 ? CustomFormWidget5(
//                     onProceed: _onFormComplete) : CustomFormWidget6(onSubmit: _onFormComplete))))),
//               ],
//             ),
//           ),
//         ),
//         bottomNavigationBar: Custombottombar(
//             currentIndex: _selectedIndex, onTabSelected: _onItemTapped),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:pre_dashboard/Footer/widget/custom_bottom_bar.dart';
import 'package:pre_dashboard/Non_verified_changes/widgets/custom_circular_progress.dart';
import 'package:pre_dashboard/Non_verified_changes/widgets/custom_drawer.dart';
import 'package:pre_dashboard/Non_verified_changes/widgets/custombottombar.dart';
import 'package:pre_dashboard/Non_verified_changes/widgets/horizontal_line.dart';
import 'package:pre_dashboard/Non_verified_changes/widgets/profile_verification_steps/custom_form_widget1.dart';
import 'package:pre_dashboard/Non_verified_changes/widgets/profile_verification_steps/custom_form_widget2.dart';
import 'package:pre_dashboard/Non_verified_changes/widgets/profile_verification_steps/custom_form_widget3.dart';
import 'package:pre_dashboard/Non_verified_changes/widgets/profile_verification_steps/custom_form_widget4.dart';
import 'package:pre_dashboard/Non_verified_changes/widgets/profile_verification_steps/custom_form_widget5.dart';
import 'package:pre_dashboard/Non_verified_changes/widgets/profile_verification_steps/custom_form_widget6.dart';

class ProfileVerificationScreen1 extends StatefulWidget {
  const ProfileVerificationScreen1({super.key});

  @override
  State<ProfileVerificationScreen1> createState() =>
      _ProfileVerificationPageState();
}

class _ProfileVerificationPageState extends State<ProfileVerificationScreen1> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int _selectedIndex = 0;
  int verificationStep = 0;
  int currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onFormComplete(bool isComplete, int statusCode) {
    if (isComplete) {
      setState(() {
        verificationStep = statusCode;
      });
    } else {
      print("Form not completed. Status Code: $statusCode");
    }
  }

  Future<bool> _onWillPop() async {
    if(verificationStep > 0) {
      setState(() {
        verificationStep--;
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Review & Verify Your Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Stack(
                children: [
                  const Icon(
                    Icons.notifications_outlined,
                    color: Colors.black,
                    size: 30,
                  ),

                ],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                SizedBox(
                  height: screenHeight * 0.24,
                  child: CustomCircularProgress(
                      progress: verificationStep == 0 || verificationStep == 1
                          ? 25
                          : (verificationStep == 2 ? 45 : (verificationStep == 3 ? 65 : (verificationStep == 4 ? 85 : 99)))),
                ),
                SizedBox(height: screenHeight * 0.01),
                const HorizontalLine(),
                verificationStep == 0
                    ? CustomFormWidget1(onComplete: _onFormComplete)
                    : (verificationStep == 1
                    ? CustomFormWidget2(onContinue: _onFormComplete)
                    : (verificationStep == 2
                    ? CustomFormWidget3(onContinue: _onFormComplete)
                    : (verificationStep == 3
                    ? CustomFormWidget4(onContinue: _onFormComplete)
                    : (verificationStep == 4 ? CustomFormWidget5(
                    onProceed: _onFormComplete) : CustomFormWidget6(onSubmit: _onFormComplete))))),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          currentIndex: currentIndex,
          onTabSelected: (value) {
            setState(() {
              currentIndex = value;
            });
          },
        ),
      ),
    );
  }
}
