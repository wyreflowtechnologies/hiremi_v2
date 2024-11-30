import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdownField extends StatelessWidget {
  final String label;


  CustomDropdownField({required this.label, 
  
  required this.validator,
  required this.items,
   this.onDropdownChanged,
   required this.controller,

  Key? key}) : super(key: key);


  final String? Function(String?)? validator;
  final List<String> items;
   final Function(String?)? onDropdownChanged;
   final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: screenHeight * 0.018, // Responsive font size
              color: Color(0xff626262)
            ),
            children:const [
               TextSpan(
                text: "*",
                style: TextStyle(color: Color(0xff0F3CC9)),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
      DropdownButtonFormField<String>(
  items: items.map((String state) {
    return DropdownMenuItem<String>(
      alignment: Alignment.centerLeft,
      value: state, // Explicitly set the value
      child: SizedBox(
        width: screenWidth * 0.6,
        child: Text(
          state,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
            fontSize: screenWidth * 0.04,
          ),
        ),
      ),
    );
  }).toList(),
  value: items.contains(controller.text) ? controller.text : null, // Validate value
  onChanged: (value) {
    if (value != null) {
      controller.text = value;
      if (onDropdownChanged != null) onDropdownChanged!(value);
    }
  },
          decoration: InputDecoration(
            hintText: label,
            filled: true,
            fillColor:  Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                screenHeight*0.01
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffB6B6B6)),
              borderRadius: BorderRadius.circular(
                screenWidth * 0.01
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(screenWidth * 0.015),
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
        SizedBox(height: screenHeight * 0.02), // Responsive spacing
      ],
    );
  }
}
