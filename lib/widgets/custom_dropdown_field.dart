// import 'package:flutter/material.dart';
//
// class CustomDropdownField extends StatelessWidget {
//   final String label;
//
//   const CustomDropdownField({required this.label, Key? key}) : super(key: key);
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
//             style: TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: screenHeight * 0.018, // Responsive font size
//               color: Colors.black,
//             ),
//             children:const [
//                TextSpan(
//                 text: "*",
//                 style: TextStyle(color: Color(0xff0F3CC9)),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: screenHeight * 0.01), // Responsive spacing
//         DropdownButtonFormField<String>(
//           items: [
//             DropdownMenuItem(value: "1", child: Text(label)),
//           ],
//           onChanged: (value) {},
//           decoration: InputDecoration(
//             hintText: label,
//             filled: false,
//             fillColor: const Color(0xFFF1F4FF),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(
//                 screenHeight*0.01
//               ),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: const BorderSide(color: Color(0xffB6B6B6)),
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
//         ),
//         SizedBox(height: screenHeight * 0.02), // Responsive spacing
//       ],
//     );
//   }
// }
