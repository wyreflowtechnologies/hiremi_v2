import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pre_dashboard/HomePage/screens/HomeScreen.dart';
import 'package:pre_dashboard/predashboard/widgets/custom_password_field.dart';
import 'package:pre_dashboard/predashboard/widgets/content_pages/step1_content.dart';
import 'package:pre_dashboard/predashboard/widgets/content_pages/step2_content.dart';
import 'package:pre_dashboard/predashboard/widgets/content_pages/step3_content.dart';
import '../bloc/user_bloc.dart';
import '../constants/constants.dart';
import 'package:http/http.dart' as http;

class RegisterScreenEducational extends StatefulWidget {
  const RegisterScreenEducational({Key? key}) : super(key: key);

  @override
  State<RegisterScreenEducational> createState() =>
      _RegisterScreenEducationalState();
}

class _RegisterScreenEducationalState extends State<RegisterScreenEducational> {
//Zaidi's

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  final TextEditingController dobController = TextEditingController();
  final TextEditingController birthPlaceController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController collegeNameController = TextEditingController();
  final TextEditingController branchNameController = TextEditingController();
  final TextEditingController courseNameController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController collegeStateController = TextEditingController();
  final TextEditingController collegeCityController = TextEditingController();

  String? password;
  String? passwordError;
  String? confirmPasswordError;

  String? selectedGender;
  int currentStep = 1;
  String countryValue = "India"; // Default country set to India
  String? stateValue;
  String? cityValue;

  List<String> heading = [
    "Personal Information",
    "Contact Information",
    "Educational Information",
    "Set New Password"
  ];
  // Future<void> registerUser(Map<String, String> userData) async {
  //   final url = Uri.parse('http://13.127.246.196:8000/api/registers/');
  //   try {
  //     final response = await http.post(
  //       url,
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode(userData),
  //     );
  //
  //     if (response.statusCode == 201) {
  //       print("User registered successfully");
  //     } else {
  //       print("Registration failed: ${response.body}");
  //     }
  //   } catch (e) {
  //     print("Error: $e");
  //   }
  // }

  // Future<void> registerUser(Map<String, String> userData) async {
  //   final url = Uri.parse('http://13.127.246.196:8000/api/registers/');
  //   try {
  //     // Ensure the date is in the correct format before making the API call
  //     if (userData.containsKey("date_of_birth")) {
  //       final inputDate = userData["date_of_birth"]!;
  //       final parsedDate = DateFormat('yyyy-MM-dd').parse(inputDate);
  //       final formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
  //       userData["date_of_birth"] = formattedDate;
  //     }
  //
  //     final response = await http.post(
  //       url,
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode(userData),
  //     );
  //
  //     if (response.statusCode == 201) {
  //       print("User registered successfully");
  //     } else {
  //       print("Registration failed: ${response.body}");
  //     }
  //   } catch (e) {
  //     print("Error: $e");
  //   }
  // }

  // Future<void> registerUser(Map<String, String> userData) async {
  //   final url = Uri.parse('http://13.127.246.196:8000/api/registers/');

  //   try {
  //     // Ensure the date is in the correct format before making the API call
  //     if (userData.containsKey("date_of_birth")) {
  //       final inputDate = userData["date_of_birth"]!; // e.g., "30/12/2024"
  //       final parsedDate = DateFormat('dd/MM/yyyy').parse(inputDate);
  //       final formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
  //       userData["date_of_birth"] = formattedDate; // Update the date in the payload
  //     }

  //     // Make the API POST request
  //     final response = await http.post(
  //       url,
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode(userData),
  //     );

  //     // Handle the API response
  //     if (response.statusCode == 201) {

  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => HomeScreen(isVerified: true,
  //           animation: true, // Pass the value here
  //         )),
  //       );
  //       print("User registered successfully");
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //          SnackBar(
  //           content: Text("${response.body}"),
  //            behavior: SnackBarBehavior.floating,
  //           duration: Duration(seconds: 30),
  //            backgroundColor: Colors.redAccent,
  //            action: SnackBarAction(
  //              label: 'CLOSE', // You can customize the label to use a cross or any text
  //              onPressed: () {
  //                ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Close the SnackBar when clicked
  //              },
  //            ),
  //         ),
  //       );
  //       print("Registration failed: ${response.body}");
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text("$e"),
  //       duration: Duration(seconds: 30),
  //         behavior: SnackBarBehavior.floating,
  //         backgroundColor: Colors.redAccent,
  //         action: SnackBarAction(
  //           label: 'CLOSE', // You can customize the label to use a cross or any text
  //           onPressed: () {
  //             ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Close the SnackBar when clicked
  //           },
  //         ),
  //       ),
  //     );
  //     print("Error: $e");
  //   }
  // }

  Future<void> registerUser(Map<String, String> userData) async {
    final url = Uri.parse('http://13.127.246.196:8000/api/registers/');

    try {
      if (userData.containsKey("date_of_birth")) {
        userData["date_of_birth"] = _formatDate(userData["date_of_birth"]!);
      }

      // API POST request
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(userData),
      );

      // To Reduce Redundancy
      _handleApiResponse(response);
    } catch (e) {
      _showErrorSnackBar(e.toString());
      print("Error: $e");
    }
  }

// Helper function to format date
  String _formatDate(String inputDate) {
    try {
      final parsedDate = DateFormat('dd/MM/yyyy').parse(inputDate);
      return DateFormat('yyyy-MM-dd').format(parsedDate);
    } catch (e) {
      return inputDate;
    }
  }

// Helper function to handle API responses efficiently
  void _handleApiResponse(http.Response response) {
    if (response.statusCode == 201) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                  isVerified: true,
                  animation: true,
                )),
      );
      print("User registered successfully");
    } else {
      _showErrorSnackBar(response.body);
      print("Registration failed: ${response.body}");
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 30),
        backgroundColor: Colors.redAccent,
        action: SnackBarAction(
          label: 'CLOSE',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  //Sameers
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  // bool _isEmailVerified = false;
  // bool _verifyOTP = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  String email = "JohnDoe@gmail.com";
  String phoneNumber = "+91";
  bool isEmailVerified = false;
  bool showOtpScreen = false;
  String otpInput = "";
  String? selectedState;
  String? selectedCity;
  bool shouldMove = false;
  final String validOtp = "1234";

  List<GlobalKey<FormState>> stepKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  bool isValidated = false;

  final PageController _pageController = PageController();
  final GlobalKey<FormState> step1Key = GlobalKey<FormState>();

  DateFormat format = DateFormat("dd/MM/yyyy");

  @override
  Widget build(BuildContext context) {
    // bool isActive = true;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return PopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: showOtpScreen
            ? null
            : AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                centerTitle: true,
                title: Text(
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
            PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                if (didPop) return;
                if (_pageController.hasClients && _pageController.page == 0.0) {
                  Navigator.pop(context);
                } else {
                  setState(() {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  });
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02,
                ),
                child: Column(
                  children: [
                    Text(
                      currentStep > 1
                          ? heading[currentStep - 1]
                          : heading[currentStep],
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        bool isActive = index < currentStep;
                        bool isCurrent = index == currentStep;
                        // print(isActive);
                        // print('index $index');
                        // print('current Step $currentStep');

                        return Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                              width: screenHeight * 0.04,
                              height: screenHeight * 0.04,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isActive
                                    ? const Color(0xff002496)
                                    : Colors.transparent,
                                border: Border.all(
                                  color: isCurrent
                                      ? const Color(0xff0F3CC9)
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
                                              color: Color(0xffCBD6FF),
                                            ),
                                          )
                                        : null,
                              ),
                            ),
                            if (index < 3)
                              Container(
                                width: screenWidth * 0.15,
                                height: screenHeight * 0.003,
                                color: isActive
                                    ? const Color(0xff002496)
                                    : Colors.grey,
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
                        // physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (pageIndex) {
                          setState(() {
                            currentStep = pageIndex + 1;
                          });
                        },
                        children: [
                          Step1ContentWidget(
                            formKey: stepKeys[0],
                            fullNameController: fullNameController,
                            fatherNameController: fatherNameController,
                            birthPlaceController: birthPlaceController,
                            dobController: dobController,
                            cityController: cityController,
                            stateController: stateController,
                            onStateChanged: (value) {
                              setState(() {
                                selectedState =
                                    value; // Update selectedState in parent
                              });
                            },
                            onCityChanged: (value) {
                              setState(() {
                                selectedCity =
                                    value; // Update selectedCity in parent
                              });
                            },
                            selectedGender: selectedGender,
                            onGenderChanged: (value) {
                              print("CityController is ${cityController.text}");
                              setState(() {
                                // print(value);
                                selectedGender = value;
                                print(selectedGender);
                              });
                            },
                            isValidated: isValidated,
                            onValidation: (bool isValid) {
                              setState(() {
                                isValidated = isValid;
                              });
                            },
                          ),
                          Step2Content(
                            formKey: stepKeys[1],
                            emailController: emailController,
                            phoneController: phoneController,
                            email: email,
                            isEmailVerified: isEmailVerified,
                            phoneNumber: phoneNumber,
                            showOtpScreen: showOtpScreen,
                            onChangedPhone: (value) {
                              setState(() {
                                phoneNumber = value;
                              });
                            },
                            onVerifyTap: () {
                              setState(() {
                                showOtpScreen = true;
                              });
                            },
                          ),
                          Step3Content(
                            collegeNameController: collegeNameController,
                            branchNameController: branchNameController,
                            courseNameController: courseNameController,
                            yearController: yearController,
                            stateControllerinEdu: collegeStateController,
                            cityControllerinEdu: collegeCityController,
                            formKey: stepKeys[2],
                          ),
                          _buildPasswordScreenPlaceholder(screenHeight),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    Padding(
                      padding: EdgeInsets.only(left: screenHeight * 0.035),
                      child: Row(
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
                              } else {
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
                              if (currentStep < 4) {
                                print("Proceed pressed at step: $currentStep");

                                // Step 1: Validate current step form
                                if (stepKeys[currentStep - 1]
                                        .currentState
                                        ?.validate() ??
                                    false) {
                                  if (currentStep == 1) {
                                    // Page 1: Update the UserBloc state and move to next page
                                    context.read<UserBloc>().add(UpdatePage1(
                                          name: fullNameController.text,
                                          fathersName:
                                              fatherNameController.text,
                                          gender: selectedGender!,
                                          dob: format.parse(dobController.text),
                                          state: birthPlaceController.text,
                                        ));
                                    setState(() {
                                      _pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                      );
                                    });
                                  } else if (currentStep == 2) {
                                    // Page 2: Validate for condition and move forward
                                    if (shouldMove) {
                                      print(
                                          "Moving to the next page at step 2");

                                      context.read<UserBloc>().add(UpdatePage2(
                                          email: email,
                                          phoneNumber: phoneNumber));
                                      setState(() {
                                        _pageController.nextPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeInOut,
                                        );
                                      });
                                    } else {
                                      //ScaffoldMessenger.of(context).showSnackBar(
                                      // SnackBar(
                                      //   backgroundColor: Colors.white,
                                      //   content: Text(
                                      //     "Please verify to move forward.",
                                      //     style: GoogleFonts.poppins(
                                      //     color: AppColors.primaryColor,
                                      //       fontSize: screenWidth * 0.04,
                                      //     ),
                                      //   ),
                                      //   duration: const Duration(seconds: 2),
                                      // ),
                                      //   );
                                    }
                                  } else if (currentStep == 3) {
                                    // Page 3: Update UserBloc state and move to next page
                                    context.read<UserBloc>().add(UpdatePage3(
                                          collegeName:
                                              collegeNameController.text,
                                          branch: branchNameController.text,
                                          course: courseNameController.text,
                                          year: yearController.text,
                                        ));
                                    setState(() {
                                      _pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                      );
                                    });
                                  }
                                } else {
                                  print('Please fill out all required fields.');
                                }
                              } else if (currentStep == 4) {
                                // Step 4: Final form submission or transition to the next screen
                                if (stepKeys[currentStep - 1]
                                        .currentState
                                        ?.validate() ??
                                    false) {
                                  registerUser({
                                    "full_name": fullNameController.text,
                                    "father_name": fatherNameController.text,
                                    "college_state":
                                        collegeStateController.text,
                                    "birth_place": stateController.text,
                                    "password": passwordController.text,
                                    "college_name": collegeNameController.text,
                                    "branch_name": branchNameController.text,
                                    "degree_name": courseNameController.text,
                                    "passing_year": yearController.text,
                                    "date_of_birth": dobController.text,
                                    "gender": selectedGender.toString(),
                                    "email": emailController.text,
                                    "phone_number": phoneNumber.toString(),
                                    "whatsapp_number": phoneNumber.toString()
                                  });
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (_) => HomeScreen(isVerified: false,)),
                                  // );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Please try again'),
                                      duration: const Duration(seconds: 2),
                                      backgroundColor: AppColors.primaryColor,
                                    ),
                                  );
                                }
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
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (showOtpScreen) _buildOtpOverlay(context),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpOverlay(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: SingleChildScrollView(
          child: Container(
            // height: double.infinity,
            color: Colors.white.withOpacity(0.90), // Translucent background
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenWidth * 0.02,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.5,
                      child: Image.asset(
                        'assets/images/logo (2).png',
                        height: screenWidth * 0.1,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.01),

                    // OTP Title
                    Text(
                      "OTP Verification",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                        // fontFamily: "Poppins"
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenWidth * 0.01),

                    // Subtitle
                    Text(
                      "Enter the verification code we have sent to your Gmail-${emailController.text}",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.035,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenWidth * 0.04),

                    // OTP Input Fields
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.035,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          4, // Number of OTP fields
                          (index) => SizedBox(
                            width: screenWidth * 0.15,
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
                                otpInput = otpInput.replaceRange(0, 0, value);
                              },
                              decoration: InputDecoration(
                                counterText: "",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(screenWidth * 0.04)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(screenWidth * 0.04)),
                                  borderSide: BorderSide(
                                      color: Colors.black,
                                      width: screenWidth * 0.0035),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(screenWidth * 0.04)),
                                  borderSide: BorderSide(
                                      color: AppColors.primaryColor,
                                      width: screenWidth * 0.0035),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.2),

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
                        minimumSize: Size(double.infinity, screenWidth * 0.15),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.05),
                        ),
                        backgroundColor: AppColors.primaryColor,
                      ),
                      child: Text(
                        "Verify OTP",
                        style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: screenWidth * 0.04,
                        ),
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
    return SingleChildScrollView(
      child: Center(
        child: Form(
          key: stepKeys[3],
          child: Column(
            children: [
              // ElevatedButton(onPressed: (){
              //   print(branchNameController.text);
              // }, child: Text("he")),
              SizedBox(height: screenHeight * 0.05),
              Padding(
                padding: EdgeInsets.only(left: screenHeight * 0.001),
                child: Text.rich(
                  TextSpan(
                    text: "Min 8 characters",
                    style: TextStyle(
                        fontSize: screenHeight * 0.02,
                        color: Color(0xFF0F3CC9)),
                    children: const [
                      TextSpan(
                        text: ", 1 uppercase, 1 digit, 1 special character",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Password Field
              CustomPasswordField(
                passwordController: passwordController,
                label: "Password",
                hintText: "********",
                isPasswordVisible: isPasswordVisible,
                onToggleVisibility: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    password = value; // Store the password value
                    passwordError = _validatePassword(value);
                  });
                },
                errorText: passwordError,
                validator: _validatePassword,
              ),
              SizedBox(height: screenHeight * 0.02),
              // Confirm Password Field
              CustomPasswordField(
                passwordController: confirmPasswordController,
                label: "Confirm Password",
                hintText: "********",
                isPasswordVisible: isConfirmPasswordVisible,
                onToggleVisibility: () {
                  setState(() {
                    isConfirmPasswordVisible = !isConfirmPasswordVisible;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    confirmPasswordError =
                        value == password ? null : "Passwords do not match";
                  });
                },
                errorText: confirmPasswordError,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Confirm password is required";
                  }
                  if (value != password) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

// Validation Method
  String? _validatePassword(String? password) {
    if (!RegExp(r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$')
        .hasMatch(password!)) {
      return "Password must include at least 1 uppercase letter";
    }
    return null;
  }
}
