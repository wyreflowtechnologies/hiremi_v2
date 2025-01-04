import 'package:flutter/material.dart';

import '../custom_text_field.dart';

class CustomFormWidget3 extends StatefulWidget {
  final Function(bool, int) onContinue;

  const CustomFormWidget3({super.key, required this.onContinue});

  @override
  State<CustomFormWidget3> createState() => _ReviewDetailsFormState();
}

class _ReviewDetailsFormState extends State<CustomFormWidget3> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _birthPlaceController = TextEditingController();
  bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.01),
        Padding(
          padding: EdgeInsets.only(left: width * 0.05),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Review and Verify your details',
              style: TextStyle(
                fontSize: width * 0.05,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0F3CC9),
              ),
            ),
          ),
        ),
        SizedBox(height: height * 0.02),
        CustomTextField(
          title: 'Full Name',
          hText: 'Jae Doe',
          controller: _fullNameController,
        ),
        SizedBox(height: height * 0.02),
        CustomTextField(
          title: "Father's Full Name",
          hText: 'John Copper',
          controller: _fatherNameController,
        ),
        SizedBox(height: height * 0.02),
        CustomTextField(
          title: "Gender",
          hText: 'Male',
          controller: _genderController,
        ),
        SizedBox(height: height * 0.02),
        CustomTextField(
          title: "Birth Date",
          hText: '1/1/1999',
          controller: _birthDateController,
          readOnly: true, // Set read-only to true
          onTap: () async {
            print("HE");
            DateTime? selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (selectedDate != null) {
              _birthDateController.text =
              '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
            }
          },
        ),

        SizedBox(height: height * 0.02),
        // CustomTextField(
        //   title: "Birth Place",
        //   hText: 'Mumbai',
        //   controller: _birthPlaceController,
        // ),
        SizedBox(height: height * 0.05),
        Center(
          child: ElevatedButton(
            onPressed: _handleContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F3CC9),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(height*0.012),
              ),
              minimumSize: Size(width * 0.8, height * 0.06),
            ),
            child:
                const Text('Review and next', style: TextStyle(fontSize: 16)),
          ),
        ),
        SizedBox(height: height * 0.02),
      ],
    );
  }

  void _handleContinue() {
    if (_fullNameController.text.isEmpty ||
        _fatherNameController.text.isEmpty ||
        _genderController.text.isEmpty ||
        _birthDateController.text.isEmpty
      //  _birthPlaceController.text.isEmpty
         ) {
      setState(() {
        _isValid = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('All fields must be filled!'),
          backgroundColor: Colors.red,
        ),
      );
      widget.onContinue(false, 2);
    } else {
      setState(() {
        _isValid = true;
      });
      widget.onContinue(true, 3);
    }
  }

  @override
  void dispose() {
    // Dispose controllers
    _fullNameController.dispose();
    _fatherNameController.dispose();
    _genderController.dispose();
    _birthDateController.dispose();
    _birthPlaceController.dispose();
    super.dispose();
  }
}
