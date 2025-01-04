// import 'package:flutter/material.dart';
//
// import '../constants/constants.dart';
//
// class GenderRadio extends StatelessWidget {
//   final String gender;
//   final String? selectedGender;
//   final ValueChanged<String?> onChanged;
//
//   const GenderRadio({
//     super.key,
//     required this.gender,
//     this.selectedGender,
//     required this.onChanged,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Expanded(
//       child: Container(
//         height: MediaQuery.of(context).size.width * 0.1,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(screenWidth * 0.025),
//           border: Border.all(
//             color: AppColors.textField,
//           ),
//           color: const Color(0xffF1F4FF),
//         ),
//         child: Row(
//           children: [
//             Radio<String>(
//               value: gender,
//               groupValue: selectedGender,
//               onChanged: onChanged,
//               activeColor: const Color(0xff0F3CC9),
//             ),
//             Text(
//               gender,
//               style: TextStyle(
//                 fontSize: screenWidth * 0.03,
//                 fontWeight: FontWeight.w500,
//                 color: selectedGender == gender
//                     ? const Color(0xff0F3CC9)
//                     : Colors.black,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }