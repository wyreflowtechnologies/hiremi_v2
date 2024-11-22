import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class Step2Content extends StatefulWidget {
  Step2Content({super.key,
  required this.email,
  required this.isEmailVerified,
  required this.phoneNumber,
  required this.showOtpScreen,
  required this.onChangedEmail,
  required this.onChangedPhone,
  required this.onVerifyTap,
  });

  final bool isEmailVerified;
 final String email;
 final String phoneNumber;
 final bool showOtpScreen;
 final ValueChanged onChangedEmail;
  final ValueChanged onChangedPhone;
  final VoidCallback onVerifyTap;

  @override
  State<Step2Content> createState() => _Step2ContentState();
}

class _Step2ContentState extends State<Step2Content> {
  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

 

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Email Address*",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: widget.onChangedEmail,
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "JohnDoe@gmail.com",
                suffixIcon: widget.isEmailVerified? Image.asset('assets/images/check.png'):Image.asset('assets/images/exclaim.png') ,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16), // Rounded border
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                 Spacer(),
               widget.isEmailVerified? 
                Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  decoration: BoxDecoration(
                    // border: Border.all(
                    //   width: 1.0
                    // ),
                    borderRadius: BorderRadius.circular(2)
                  ),
                  child: Text("Your Email has been verified",
                  style: TextStyle(
                    color: AppColors.linkUnderline,
                  ),
                  )
                ):
                ElevatedButton(
                  onPressed: widget.onVerifyTap,
                  // onPressed: () {
                  //   setState(() {
                  //    widget.showOtpScreen = true;
                  //   });
                  // },
                  style:  ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0F3CC9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                  child: const Text("Verify Now",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Phone Number*",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: widget.onChangedPhone,
              // onChanged: (value) {
              //   setState(() {
              //     widget.phoneNumber = value;
              //   });
              // },
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "+91 ",
                 suffixIcon: widget.phoneNumber.length == 10 ? Image.asset('assets/images/check.png'):Image.asset('assets/images/exclaim.png') ,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16), // Rounded border
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}