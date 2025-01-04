import 'package:flutter/material.dart';

import '../constants/constants.dart';

class GenderRadio extends StatelessWidget {
  final String gender;
  final String? selectedGender;
  final ValueChanged<String?> onChanged;
  final bool isSelected;
  final TextStyle? genderTextStyle;

  const GenderRadio({
    super.key,
    required this.gender,
    this.selectedGender,
    required this.onChanged,
    required this.isSelected,
    this.genderTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.width * 0.1,
        // width: screenWidth*1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenWidth * 0.025),
          border: Border.all(
            color: isSelected?AppColors.textField:AppColors.black,
          ),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Radio<String>(
              value: gender,
              groupValue: selectedGender,
              onChanged: onChanged,
              activeColor: const Color(0xff0F3CC9),
            ),
            Flexible(
              child: Text(
                gender,
                style:genderTextStyle ??  TextStyle(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.w500,
                  color: selectedGender == gender
                      ? const Color(0xff0F3CC9)
                      : Colors.black,
                ),
                overflow: TextOverflow.ellipsis, // Add ellipsis if text is too long
                maxLines: 1,
              ),

            ),
          ],
        ),
      ),
    );
  }
}