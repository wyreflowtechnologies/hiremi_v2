import 'package:flutter/material.dart';

import 'RegisterScreenVerified.dart';
//import 'register_screen_verified.dart';

class OTPVerificationScreen extends StatelessWidget {
  const OTPVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Hire Me Contact OTP Verification'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'OTP Verification',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 18),
            const Text(
              'Enter the verification code we have sent to your e-mail',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < 4; i++)
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(16),)),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreenVerified()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff0F3CC9),
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text('Verify OTP'),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}