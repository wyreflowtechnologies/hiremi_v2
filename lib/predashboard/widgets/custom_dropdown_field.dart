
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdownField extends StatefulWidget {
  final String label;
  final String? Function(String?)? validator;
  final List<String> items;
  final Function(String?)? onDropdownChanged;
  final TextEditingController controller;
  final String? value; // Add this for current selected value

  const CustomDropdownField({
    required this.label,
    required this.validator,
    required this.items,
    this.onDropdownChanged,
    required this.controller,
    this.value, // Pass value here
    Key? key,
  }) : super(key: key);

  @override
  _CustomDropdownFieldState createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  late String? selectedValue;

  @override
  void initState() {
    super.initState();
    // Initialize with null if you want an empty value initially, or with the first item
    selectedValue = widget.controller.text.isEmpty ? null : widget.controller.text;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: widget.label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: screenHeight * 0.018, // Responsive font size
              color: Color(0xff626262),
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
        DropdownButtonFormField<String>(
          items: widget.items.map((String state) {
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
          value: selectedValue, // Handle null or default value
          onChanged: (value) {
            setState(() {
              selectedValue = value; // Update the selected value
              widget.controller.text = ""; // Update the controller text
              if (widget.onDropdownChanged != null) widget.onDropdownChanged!(value);
            });
          },
          decoration: InputDecoration(
            hintText: widget.label,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(screenHeight * 0.01),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffB6B6B6)),
              borderRadius: BorderRadius.circular(screenWidth * 0.01),
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
          validator: widget.validator,
        ),
        // If "Other" is selected, show the TextField for user input
        if (selectedValue == 'Other')
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.01),
            child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: 'Please specify your degree',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.01),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffB6B6B6)),
                  borderRadius: BorderRadius.circular(screenWidth * 0.01),
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
              validator: widget.validator,
            ),
          ),
        SizedBox(height: screenHeight * 0.02), // Responsive spacing
      ],
    );
  }
}
