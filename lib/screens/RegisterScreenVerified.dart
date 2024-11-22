import 'package:flutter/material.dart';
import 'package:pre_dashboard/screens/RegistrationScreen.dart';
import '../screens/register_screen.dart';

class RegisterScreenVerified extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int currentStep = 2; // Assume current step is 2 for this screen

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
        centerTitle: true,
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

            Text(
              'Email Address*',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              enabled: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'JohnDoe@gmail.com',
                suffixIcon: Icon(Icons.check, color: Color(0xff0F3CC9)),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Your Email have been Verified',
              style: TextStyle(
                color: Color(0xff0F3CC9),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Phone Number*',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              enabled: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: '+91 68683-38827',
                suffixIcon: Icon(Icons.check, color: Color(0xff0F3CC9)),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
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
      ),
    );
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
}
