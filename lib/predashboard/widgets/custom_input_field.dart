//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class CustomInputField extends StatelessWidget {
//   final String label;
//   final TextInputType? keyboardType;
//   final TextEditingController controller;
//   final String? Function(String?)? validator;
//   final List<TextInputFormatter>? inputFormatters;
//   final bool isDropdown; // Flag to enable dropdown
//   final List<int>? dropdownItems; // List of dropdown items
//
//   const CustomInputField({
//     required this.label,
//     required this.validator,
//     required this.controller,
//     this.keyboardType,
//     this.inputFormatters,
//     this.isDropdown = false, // Default to false for non-dropdown usage
//     this.dropdownItems,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         RichText(
//           text: TextSpan(
//             text: label,
//             style: GoogleFonts.poppins(
//               fontWeight: FontWeight.w600,
//               fontSize: screenHeight * 0.018, // Responsive font size
//               color: const Color(0xff626262),
//             ),
//             children: const [
//               TextSpan(
//                 text: "*",
//                 style: TextStyle(color: Color(0xff0F3CC9)),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: screenHeight * 0.01), // Responsive spacing
//         isDropdown
//             ? DropdownButtonFormField<int>(
//           decoration: InputDecoration(
//             hintText: label,
//             filled: false,
//             fillColor: const Color(0xFFF1F4FF),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: const BorderSide(color: Color(0xff0F3CC9)),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(
//                 color: Color(0xff0F3CC9),
//                 width: 1.5,
//               ),
//             ),
//             contentPadding: EdgeInsets.symmetric(
//               horizontal: MediaQuery.of(context).size.width * 0.03,
//             ),
//           ),
//           value: controller.text.isNotEmpty
//               ? int.tryParse(controller.text)
//               : null,
//           items: dropdownItems
//               ?.map(
//                 (year) => DropdownMenuItem<int>(
//               value: year,
//               child: Text(year.toString()),
//             ),
//           )
//               .toList(),
//           onChanged: (value) {
//             if (value != null) {
//               controller.text = value.toString();
//             }
//           },
//           validator: validator,
//         )
//             : TextFormField(
//           controller: controller,
//           keyboardType: keyboardType,
//           inputFormatters: inputFormatters,
//           decoration: InputDecoration(
//             hintText: label,
//             filled: false,
//             fillColor: const Color(0xFFF1F4FF),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: const BorderSide(color: Color(0xff0F3CC9)),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(
//                 color: Color(0xff0F3CC9),
//                 width: 1.5,
//               ),
//             ),
//             contentPadding: EdgeInsets.symmetric(
//               horizontal: MediaQuery.of(context).size.width * 0.03,
//             ),
//           ),
//           validator: validator,
//         ),
//         SizedBox(height: screenHeight * 0.02), // Responsive spacing
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator; // For TextFormField
  final String? Function(int?)? dropdownValidator; // For Dropdown validation
  final List<TextInputFormatter>? inputFormatters;
  final bool isDropdown;
  final List<int>? dropdownItems;

  const CustomInputField({
    required this.label,
    this.validator,
    this.dropdownValidator, // Add dropdown validator
    required this.controller,
    this.keyboardType,
    this.inputFormatters,
    this.isDropdown = false,
    this.dropdownItems,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: screenHeight * 0.018,
              color: const Color(0xff626262),
            ),
            children: const [
              TextSpan(
                text: "*",
                style: TextStyle(color: Color(0xff0F3CC9)),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        isDropdown
            ? DropdownButtonFormField<int>(
          decoration: InputDecoration(
            hintText: label,
            filled: false,
            fillColor: const Color(0xFFF1F4FF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff0F3CC9)),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xff0F3CC9),
                width: 1.5,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
            ),
          ),
          value: controller.text.isNotEmpty
              ? int.tryParse(controller.text)
              : null,
          items: dropdownItems
              ?.map(
                (year) => DropdownMenuItem<int>(
              value: year,
              child: Text(year.toString()),
            ),
          )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              controller.text = value.toString();
            }
          },
          validator: dropdownValidator, // Use dropdownValidator for int
        )
            : TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: label,
            filled: false,
            fillColor: const Color(0xFFF1F4FF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff0F3CC9)),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xff0F3CC9),
                width: 1.5,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
            ),
          ),
          validator: validator,
        ),
        SizedBox(height: screenHeight * 0.02),
      ],
    );
  }
}
