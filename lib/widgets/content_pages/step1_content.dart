// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pre_dashboard/widgets/custom_text_field.dart';
// import 'package:pre_dashboard/widgets/gender_radio.dart';
//
// import '../../constants/constants.dart';
//
// class Step1ContentWidget extends StatefulWidget {
//   const Step1ContentWidget({
//     super.key,
//     required this.fullNameController,
//     required this.fatherNameController,
//     required this.birthPlaceController,
//     required this.dobController,
//     required this.onGenderChanged,
//     this.selectedGender,
//   });
//
//   final TextEditingController fullNameController;
//   final TextEditingController fatherNameController;
//   final TextEditingController dobController;
//   final TextEditingController birthPlaceController;
//   final ValueChanged<String?> onGenderChanged;
//   final String? selectedGender;
//
//   @override
//   State<Step1ContentWidget> createState() => _Step1ContentWidgetState();
// }
//
// class _Step1ContentWidgetState extends State<Step1ContentWidget> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey, // Attach the form key here
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: screenHeight * 0.03),
//                 CustomTextField(
//                   controller: widget.fullNameController,
//                   labelText: "Full Name",
//                   hintText: 'John Doe',
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your full name';
//                     }
//                     return null;
//                   },
//                 ),
//                 CustomTextField(
//                   controller: widget.fatherNameController,
//                   labelText: "Father’s Full Name",
//                   hintText: 'Father Name',
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your father\'s full name';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: screenHeight * 0.015),
//                 RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: 'Gender',
//                         style: GoogleFonts.poppins(
//                           fontSize: screenHeight * 0.02,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                         ),
//                       ),
//                       TextSpan(
//                         text: '*',
//                         style: GoogleFonts.poppins(
//                           fontSize: screenHeight * 0.02,
//                           fontWeight: FontWeight.w500,
//                           color: const Color(0xff0F3CC9),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.002),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GenderRadio(
//                       gender: 'Male',
//                       selectedGender: widget.selectedGender,
//                       onChanged: widget.onGenderChanged,
//                     ),
//                     SizedBox(width: screenHeight * 0.01),
//                     GenderRadio(
//                       gender: 'Female',
//                       selectedGender: widget.selectedGender,
//                       onChanged: widget.onGenderChanged,
//                     ),
//                     SizedBox(width: screenHeight * 0.01),
//                     GenderRadio(
//                       gender: 'Other',
//                       selectedGender: widget.selectedGender,
//                       onChanged: widget.onGenderChanged,
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: screenHeight * 0.02),
//                 CustomTextField(
//                   controller: widget.dobController,
//                   labelText: 'Date of Birth',
//                   hintText: 'DD/MM/YYYY',
//                   prefixIcon: const Icon(Icons.calendar_today,
//                       color: AppColors.secondaryTextColor),
//                   isDatePicker: true,
//                   onTap: () async {
//                     DateTime? selectedDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(1900),
//                       lastDate: DateTime.now(),
//                     );
//                     if (selectedDate != null) {
//                       widget.dobController.text =
//                           '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
//                     }
//                   },
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please select your date of birth';
//                     }
//                     return null;
//                   },
//                 ),
//                 CustomTextField(
//                   controller: widget.birthPlaceController,
//                   hintText: 'Select State',
//                   labelText: 'State',
//                   isDropdown: true,
//                   dropdownItems: const [
//                     'Uttar Pradesh',
//                     'Maharashtra',
//                     'Delhi',
//                     'Karnataka',
//                     'Tamil Nadu',
//                     'Gujarat',
//                     'Rajasthan',
//                   ],
//                   onDropdownChanged: (value) {
//                     print('Selected State: $value');
//                   },
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please select your state';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: screenHeight * 0.02),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         // Form is valid
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('All fields are valid!'),
//                           ),
//                         );
//                       } else {
//                         // Form is invalid
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text(
//                                 'Please fill in all required fields before proceeding.'),
//                           ),
//                         );
//                       }
//                     },
//                     child: const Text('Submit'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
