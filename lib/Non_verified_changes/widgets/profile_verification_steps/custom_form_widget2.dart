import 'package:flutter/material.dart';

import '../career_card.dart';

class CustomFormWidget2 extends StatefulWidget {
  final Function(bool, int) onContinue;

  const CustomFormWidget2({super.key, required this.onContinue});

  @override
  State<CustomFormWidget2> createState() => _CareerStageSelectorState();
}

class _CareerStageSelectorState extends State<CustomFormWidget2> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.01),
          Text(
            'Choose your career stage',
            style: TextStyle(
              fontSize: width * 0.05,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF0F3CC9),
            ),
          ),
          SizedBox(height: height * 0.02),
          CareerCard(
            title: 'College Student',
            subtitle: '"I am a student preparing for my career."',
            isSelected: _selectedIndex == 0,
            onTap: () {
              setState(() {
                _selectedIndex = (_selectedIndex == 0) ? -1 : 0;
              });
            },
          ),
          SizedBox(height: height * 0.02),
          CareerCard(
            title: 'Fresher',
            subtitle: '"I am a recent graduate exploring opportunities."',
            isSelected: _selectedIndex == 1,
            onTap: () {
              setState(() {
                _selectedIndex = (_selectedIndex == 1) ? -1 : 1;
              });
            },
          ),
          SizedBox(height: height * 0.02),
          CareerCard(
            title: 'Experience',
            subtitle: '"I have work experience and want to grow further."',
            isSelected: _selectedIndex == 2,
            onTap: () {
              setState(() {
                _selectedIndex = (_selectedIndex == 2) ? -1 : 2;
              });
            },
          ),
          SizedBox(height: height * 0.04),
          Center(
            child: ElevatedButton(
              onPressed: _handleContinue,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F3CC9),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: Size(width * 0.8, height * 0.06),
              ),
              child: const Text('Continue', style: TextStyle(fontSize: 16)),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          )
        ],
      ),
    );
  }

  void _handleContinue() {
    if (_selectedIndex == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a career stage!'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      widget.onContinue(true, 2);
    }
  }
}