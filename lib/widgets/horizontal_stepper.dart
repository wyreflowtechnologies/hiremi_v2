// import 'package:flutter/material.dart';
//
// class HorizontalStepper extends StatelessWidget {
//   final int currentStep;
//   final Function(int) onStepTap;
//
//   const HorizontalStepper({
//     required this.currentStep,
//     required this.onStepTap,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(4, (index) {
//         return GestureDetector(
//           onTap: () => onStepTap(index),
//           child: Row(
//             children: [
//               Container(
//                 height: 30,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     width: 2,
//                     color: const Color(0xff0F3CC9),
//                   ),
//                 ),
//                 child: CircleAvatar(
//                   backgroundColor:
//                       currentStep >= index ? Colors.white : Colors.white,
//                   child: Icon(
//                     currentStep > index ? Icons.check : Icons.circle,
//                     color: const Color(0xff0F3CC9),
//                     size: 10,
//                   ),
//                 ),
//               ),
//               if (index != 3)
//                 Container(
//                   width: 30,
//                   height: 2,
//                   color: currentStep > index ? const Color(0xff0F3CC9) : Colors.grey,
//                 ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }