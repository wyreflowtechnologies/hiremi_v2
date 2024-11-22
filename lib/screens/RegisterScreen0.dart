import 'package:flutter/material.dart';
import 'package:pre_dashboard/screens/register_screen.dart';

import 'OtpVerificationScreen.dart';
import 'RegisterScreenVerified.dart';
//import 'register_screen_verified.dart';

class RegisterScreen0 extends StatefulWidget {
  @override
  _RegisterScreen0State createState() => _RegisterScreen0State();
}

class _RegisterScreen0State extends State<RegisterScreen0> {
  final _emailController = TextEditingController(text: 'JohnDoe@gmail.com');
  final _phoneController = TextEditingController(text: '+91');

  bool _isEmailVerified = false;
  bool _verifyOTP = false;

  int currentStep = 1;

  void _verifyEmail() {
    setState(() {
      _isEmailVerified = true;
      if (_isEmailVerified) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterScreenEducational()),
        );
      }
    });
  }

  void _proceed() {
    setState(() {
      _verifyOTP = true;
      if (_isEmailVerified && _phoneController.text.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterScreenVerified()),
        );
      }
    });
  }

  Widget _buildStep(int index, int currentStep) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index <= currentStep ? Color(0xff002496) : Colors.grey,
            border: Border.all(
              color: index <= currentStep ? Color(0xff002496) : Colors.grey,
            ),
          ),
          child: Center(
            child: index <= currentStep
                ? Icon(Icons.check, color: Colors.white)
                : null,
          ),
        ),
        if (index < currentStep)
          Container(
            width: 40,
            height: 4,
            color: Color(0xff002496),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Create Account',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Color(0xff0F3CC9),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Contact Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),

            // Progress Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStep(0, currentStep),
                _buildStep(1, currentStep),
                _buildStep(2, currentStep),
                _buildStep(3, currentStep),
              ],
            ),
            SizedBox(height: 20),

            Column(
              children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email Address*',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xff0F3CC9)),
                    ),
                    errorText: _isEmailVerified ? null : 'Email is not verified',
                    suffixIcon: _isEmailVerified
                        ? Icon(Icons.check, color: Color(0xff0F3CC9))
                        : Icon(Icons.error_outline, color: Color(0xff0F3CC9)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 14),
            Container(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: _verifyEmail,
                child: Text('Verify Now'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0F3CC9),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number*',
                labelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xff0F3CC9)),
                ),
                errorText: _phoneController.text.isEmpty
                    ? 'Phone Number is Required'
                    : null,
                suffixIcon: _phoneController.text.isNotEmpty
                    ? Icon(Icons.check, color: Color(0xff0F3CC9))
                    : Icon(Icons.error_outline, color: Color(0xff0F3CC9)),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: null, // The back button is disabled
                  child: Text('Back'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    minimumSize: Size(128, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _proceed,
                  child: Text('Proceed'),
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    backgroundColor: Color(0xff0F3CC9),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}