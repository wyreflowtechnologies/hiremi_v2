import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pre_dashboard/screens/RegisterScreen0.dart';
import '../constants/constants.dart';
import '../widgets/custom_text_field.dart';
import '../screens/LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController birthPlaceController = TextEditingController();

  String? selectedGender;
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.05),
            Center(
              child: Text(
                'Create Account',
                style: GoogleFonts.poppins(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff0f3cc9),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Center(
              child: Text(
                'Personal Information',
                style: GoogleFonts.poppins(
                  fontSize: size.width * 0.045,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            HorizontalStepper(
              currentStep: currentStep,
              onStepTap: (index) {
                setState(() {
                  currentStep = index;
                });
              },
            ),
            SizedBox(height: size.height * 0.03),
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
            SizedBox(height: size.height * 0.02),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Gender',
                    style: GoogleFonts.poppins(
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '*',
                    style: GoogleFonts.poppins(
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff0F3CC9),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildGenderRadio('Male'),
                SizedBox(width: size.width * 0.02),
                _buildGenderRadio('Female'),
                SizedBox(width: size.width * 0.02),
                _buildGenderRadio('Other'),
              ],
            ),
            SizedBox(height: size.height * 0.02),
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
            SizedBox(height: size.height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreenUpdated(),
                      ),
                    );
                  },
                  child: Text(
                    'Back',
                    style: GoogleFonts.poppins(
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff0F3CC9),
                    ),
                  ),
                ),
                SizedBox(width: size.width * 0.1),
                ElevatedButton(
                  onPressed: () {
                    debugPrint('Gender: $selectedGender');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen0()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.015,
                        horizontal: size.width * 0.1),
                    backgroundColor: const Color(0xff0F3CC9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
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

  Widget _buildGenderRadio(String gender) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        height: size.height * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.width * 0.02),
          border: Border.all(
            color: AppColors.primaryColor,
          ),
          color: const Color(0xffF1F4FF),
        ),
        child: RadioListTile<String>(
          value: gender,
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value;
            });
          },
          title: Text(
            gender,
            style: TextStyle(
              fontSize: size.width * 0.035,
              fontWeight: FontWeight.w500,
              color:
                  selectedGender == gender ? const Color(0xff0F3CC9) : Colors.black,
            ),
          ),
          activeColor: const Color(0xff0F3CC9),
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        ),
      ),
    );
  }
}

class HorizontalStepper extends StatelessWidget {
  final int currentStep;
  final Function(int) onStepTap;

  const HorizontalStepper({
    required this.currentStep,
    required this.onStepTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return GestureDetector(
          onTap: () => onStepTap(index),
          child: Row(
            children: [
              Container(
                height: size.height * 0.04,
                width: size.height * 0.04,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: const Color(0xff0F3CC9),
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    currentStep > index ? Icons.check : Icons.circle,
                    color: const Color(0xff0F3CC9),
                    size: size.width * 0.03,
                  ),
                ),
              ),
              if (index != 3)
                Container(
                  width: size.width * 0.08,
                  height: size.height * 0.003,
                  color: currentStep > index ? const Color(0xff0F3CC9) : Colors.grey,
                ),
            ],
          ),
        );
      }),
    );
  }
}
