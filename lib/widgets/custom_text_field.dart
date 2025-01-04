// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../constants/constants.dart';
//
// class CustomTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final String? labelText;
//   final bool isPassword;
//   final String? Function(String?)? validator;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final TextInputType? inputType;
//   final bool isDatePicker;
//   final Function()? onTap;
//   final bool isDropdown;
//   final List<String>? dropdownItems;
//   final Function(String?)? onDropdownChanged;
//
//   const CustomTextField({
//     Key? key,
//     required this.controller,
//     required this.hintText,
//     this.labelText,
//     this.isPassword = false,
//     this.validator,
//     this.prefixIcon,
//     this.inputType,
//     this.suffixIcon,
//     this.isDatePicker = false,
//     this.onTap,
//     this.isDropdown = false,
//     this.dropdownItems,
//     this.onDropdownChanged,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (labelText != null)
//             Padding(
//               padding: const EdgeInsets.only(bottom: 4.0),
//               child: RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: labelText!,
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                     TextSpan(
//                       text: '*',
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: const Color(0xff0F3CC9),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           isDropdown
//               ? DropdownButtonFormField<String>(
//                   value: controller.text.isNotEmpty ? controller.text : null,
//                   onChanged: (value) {
//                     controller.text = value!;
//                     if (onDropdownChanged != null) onDropdownChanged!(value);
//                   },
//                   items: dropdownItems?.map((item) {
//                     return DropdownMenuItem<String>(
//                       value: item,
//                       child: Text(
//                         item,
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.black,
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                   decoration: InputDecoration(
//                     hintText: hintText,
//                     filled: true,
//                     fillColor: const Color(0xffFFFFFF),
//                     contentPadding: const EdgeInsets.symmetric(
//                       vertical: 16,
//                       horizontal: 12,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   validator: validator,
//                 )
//               : TextFormField(
//                   controller: controller,
//                   obscureText: isPassword,
//                   keyboardType: inputType ?? TextInputType.text,
//                   readOnly: isDatePicker,
//                   decoration: InputDecoration(
//                     hintText: hintText,
//                     filled: true,
//                     fillColor: const Color(0xffFFFFFF),
//                     contentPadding: const EdgeInsets.symmetric(
//                       vertical: 16,
//                       horizontal: 12,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   validator: validator,
//                   onTap: isDatePicker ? onTap : null,
//                 ),
//         ],
//       ),
//     );
//   }
// }
