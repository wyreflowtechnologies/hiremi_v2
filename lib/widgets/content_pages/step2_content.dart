// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';

class Step2Content extends StatefulWidget {
  Step2Content({
    super.key,
    required this.formKey,
    required this.email,
    required this.isEmailVerified,
    required this.phoneNumber,
    required this.showOtpScreen,
    
    required this.onChangedPhone,
    required this.onVerifyTap,
  });


  final GlobalKey<FormState> formKey;
  final bool isEmailVerified;
  final String email;
  final String phoneNumber;
  final bool showOtpScreen;
  
  final ValueChanged<String> onChangedPhone;
  final VoidCallback onVerifyTap;

  @override
  State<Step2Content> createState() => _Step2ContentState();
}

class _Step2ContentState extends State<Step2Content> {
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
 bool isEmailFilled = false;

 void _validateEmail() {
  final email = _emailController.text;
  if (email.isNotEmpty && 
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email)) {
    setState(() {
  isEmailFilled = true;
    });
  } else {
    setState(() {
      isEmailFilled = false;
    });
  }
}

  

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
   
    
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: widget.formKey, // Assign the GlobalKey to the Form
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email Address*",
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: screenWidth * 0.015),
              
              // Use TextFormField instead of TextField
              TextFormField(
                // onChanged: widget.onChangedEmail,
                onChanged: (value) {
                _validateEmail();
                },
                controller: _emailController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(screenWidth * 0.05),
                  hintText: "JohnDoe@gmail.com",
                  hintStyle: GoogleFonts.poppins(fontSize: screenWidth * 0.04),
                  suffixIcon: widget.isEmailVerified
                      ? Image.asset('assets/images/check.png')
                      : Image.asset('assets/images/exclaim.png'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        screenWidth * 0.02), // Rounded border
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    borderSide: const BorderSide(color: AppColors.primaryColor),
                  ),
                ),
                // Add Email Validation
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  // Simple email validation regex
                  if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
).hasMatch(value)) {
                  return 'Please enter a valid email';
                  }
                 
                 
                  return null;
                },
              ),
              
              SizedBox(height: screenWidth * 0.01),
              
              Row(
                children: [
                  Spacer(),
                  widget.isEmailVerified
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.001)),
                          child: Text(
                            "Your Email has been verified",
                            style: GoogleFonts.poppins(
                              color: AppColors.linkUnderline,
                            ),
                          ))
                      : ElevatedButton(
                          onPressed: isEmailFilled? widget.onVerifyTap:null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff0F3CC9),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.02),
                            ),
                          ),
                          child: Text(
                            "Verify Now",
                            style: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                ],
              ),
              
              SizedBox(height: screenWidth * 0.03),
              
              Text(
                "Phone Number*",
                style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.04, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: screenWidth * 0.02),
              
              // Use TextFormField instead of TextField
              TextFormField(
                onChanged: widget.onChangedPhone,
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "+91 ",
                  suffixIcon: widget.phoneNumber.length == 10
                      ? Image.asset('assets/images/check.png')
                      : Image.asset('assets/images/exclaim.png'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        screenWidth * 0.02), // Rounded border
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                ),
                // Add Phone Number Validation
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone number is required';
                  }
                  if (value.length != 10) {
                    return 'Phone number must be 10 digits';
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
}
