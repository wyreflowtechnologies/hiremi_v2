import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pre_dashboard/widgets/custom_text_field.dart';
import 'package:pre_dashboard/widgets/gender_radio.dart';

import '../../constants/constants.dart';

class Step1ContentWidget extends StatelessWidget {
  const Step1ContentWidget({
    super.key,
    required this.fullNameController,
    required this.fatherNameController,
    required this.birthPlaceController,
    required this.dobController,
    required this.onGenderChanged,
    this.selectedGender,
    });

   final TextEditingController fullNameController;
  final TextEditingController fatherNameController;
  final TextEditingController dobController;
  final TextEditingController birthPlaceController;
  final ValueChanged<String?> onGenderChanged;
  final String? selectedGender;


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(height: screenHeight*0.03),
           
            CustomTextField(
              controller: fullNameController,
              labelText: "Full Name",
              hintText: 'John Doe',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
            ),
            CustomTextField(
              controller: fatherNameController,
              labelText: "Father’s Full Name",
              hintText: 'Father Name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your father\'s full name';
                }
                return null;
              },
            ),
          SizedBox(height: screenHeight*0.015),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Gender',
                    style: GoogleFonts.poppins(
                      fontSize: screenHeight* 0.02,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '*',
                    style: GoogleFonts.poppins(
                      fontSize: screenHeight* 0.02,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff0F3CC9),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight*0.002),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GenderRadio(gender: 'Male',selectedGender: selectedGender,onChanged: onGenderChanged,),
                SizedBox(width: screenHeight*0.01 ),
                GenderRadio(gender: 'Female',selectedGender: selectedGender, onChanged: onGenderChanged,),
                SizedBox(width: screenHeight*0.01),
                GenderRadio(gender: 'Other',selectedGender: selectedGender ,onChanged: onGenderChanged,),
              ],
            ),
            SizedBox(height:  screenHeight* 0.02,),
            CustomTextField(
              controller: dobController,
              labelText: 'Date of Birth',
              hintText: 'DD/MM/YYYY',
              prefixIcon: const Icon(Icons.calendar_today,
                  color: AppColors.secondaryTextColor),
              isDatePicker: true,
              onTap: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (selectedDate != null) {
                  dobController.text =
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select your date of birth';
                }
                return null;
              },
            ),
            CustomTextField(
            controller: birthPlaceController,
            hintText: 'Select State',
            labelText: 'State',
            isDropdown: true,
            dropdownItems: const [
              'Uttar Pradesh',
              'Maharashtra',
              'Delhi',
              'Karnataka',
              'Tamil Nadu',
              'Gujarat',
              'Rajasthan',
            ],
            onDropdownChanged: (value) {
              print('Selected State: $value');
            },
          ),
            
         
          ],
        ),
      ));
  }
}