//
// import 'package:flutter/material.dart';
//
// class CustomTextField extends StatefulWidget {
//   final String title;
//   final String hText;
//   final TextEditingController controller;
//   final bool readOnly;
//   final VoidCallback? onTap;
//   final bool isDropdown;
//   final List<String>? dropdownItems;
//   final ValueChanged<String>? onChanged; // Added onChanged callback
//
//   const CustomTextField({
//     super.key,
//     required this.title,
//     required this.hText,
//     required this.controller,
//     this.readOnly = false,
//     this.onTap,
//     this.isDropdown = false,
//     this.dropdownItems,
//     this.onChanged, // Added onChanged parameter
//   });
//
//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   String? _selectedValue;
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.dropdownItems != null &&
//         widget.dropdownItems!.contains(widget.controller.text)) {
//       _selectedValue = widget.controller.text;
//     } else {
//       _selectedValue = null;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.only(left: width * 0.05),
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               widget.title,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: width * 0.04,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(height: height * 0.01),
//         SizedBox(
//           width: width * 0.9,
//           child: widget.isDropdown
//               ? DropdownButtonFormField<String>(
//             value: _selectedValue,
//             hint: Text(
//               widget.hText,
//               style: TextStyle(
//                 fontSize: width * 0.03,
//                 color: Colors.black54,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             onChanged: (value) {
//               setState(() {
//                 _selectedValue = value;
//                 widget.controller.text = value!;
//               });
//               if (widget.onChanged != null) {
//                 widget.onChanged!(value!); // Call the onChanged callback
//               }
//             },
//             items: widget.dropdownItems
//                 ?.map((item) => DropdownMenuItem<String>(
//               value: item,
//               child: Text(item),
//             ))
//                 .toList(),
//           //   decoration: InputDecoration(
//           //     border: OutlineInputBorder(
//           //       borderRadius: BorderRadius.circular(8.0),
//           //     ),
//           //   ),
//           // )
//                 decoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(vertical: 0),
//               border: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.black, width: 1),
//               ),
//             ),
//           )
//
//         : TextField(
//             controller: widget.controller,
//             readOnly: widget.readOnly,
//             onTap: widget.onTap,
//             decoration: InputDecoration(
//               hintText: widget.hText,
//               hintStyle: TextStyle(
//                 fontSize: width * 0.03,
//                 color: Colors.black54,
//                 fontWeight: FontWeight.w500,
//               ),
//               suffixIcon: widget.readOnly
//                   ? const Icon(
//                 Icons.edit_outlined,
//                 color: Color(0xFF0F3CC9),
//               )
//                   : null,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class CustomTextField extends StatefulWidget {
//   final String title;
//   final String hText;
//   final TextEditingController controller;
//   final bool readOnly;
//   final VoidCallback? onTap;
//   final bool isDropdown;
//   final bool isNumeric; // Added isNumeric parameter
//   final List<String>? dropdownItems;
//   final ValueChanged<String>? onChanged; // Added onChanged callback
//   final String? value;
//
//   const CustomTextField({
//     super.key,
//     required this.title,
//     required this.hText,
//     required this.controller,
//     this.readOnly = false,
//     this.onTap,
//     this.isDropdown = false,
//     this.isNumeric = false, // Default value set to false
//     this.dropdownItems,
//     this.onChanged, // Added onChanged parameter
//     this.value,
//   });
//
//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   String? _selectedValue;
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.dropdownItems != null &&
//         widget.dropdownItems!.contains(widget.controller.text)) {
//       _selectedValue = widget.controller.text;
//     } else {
//       _selectedValue = null;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.only(left: width * 0.05),
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               widget.title,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: width * 0.04,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(height: height * 0.01),
//         SizedBox(
//           width: width * 0.9,
//           child: widget.isDropdown
//               ? DropdownButtonFormField<String>(
//             value: _selectedValue,
//             hint: Text(
//               widget.hText,
//               style: TextStyle(
//                 fontSize: width * 0.03,
//                 color: Colors.black54,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             onChanged: (value) {
//               setState(() {
//                 _selectedValue = value;
//                 widget.controller.text = value!;
//               });
//               if (widget.onChanged != null) {
//                 widget.onChanged!(value!); // Call the onChanged callback
//               }
//             },
//             items: widget.dropdownItems
//                 ?.map((item) => DropdownMenuItem<String>(
//               value: item,
//               child: Text(item),
//             ))
//                 .toList(),
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//             )
//               : TextField(
//             controller: widget.controller,
//             readOnly: widget.readOnly,
//             onTap: widget.onTap,
//             keyboardType: widget.isNumeric
//                 ? TextInputType.number
//                 : TextInputType.text, // Adjust keyboard type
//             decoration: InputDecoration(
//               hintText: widget.hText,
//               hintStyle: TextStyle(
//                 fontSize: width * 0.03,
//                 color: Colors.black54,
//                 fontWeight: FontWeight.w500,
//               ),
//               suffixIcon: widget.readOnly
//                   ? const Icon(
//                 Icons.edit_outlined,
//                 color: Color(0xFF0F3CC9),
//               )
//                   : null,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String hText;
  final TextEditingController controller;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool isDropdown;
  final bool isNumeric; // Added isNumeric parameter
  final List<String>? dropdownItems;
  final ValueChanged<String>? onChanged; // Added onChanged callback
  final String? value; // Added value for selected value

  const CustomTextField({
    super.key,
    required this.title,
    required this.hText,
    required this.controller,
    this.readOnly = false,
    this.onTap,
    this.isDropdown = false,
    this.isNumeric = false, // Default value set to false
    this.dropdownItems,
    this.onChanged, // Added onChanged parameter
    this.value, // Added value for selected value
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    if (widget.dropdownItems != null &&
        widget.dropdownItems!.contains(widget.value ?? widget.controller.text)) {
      _selectedValue = widget.value ?? widget.controller.text;
    } else {
      _selectedValue = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.05),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: width * 0.04,
              ),
            ),
          ),
        ),
        SizedBox(height: height * 0.01),
        SizedBox(
          width: width * 0.9,
          child: widget.isDropdown
          //     ? DropdownButtonFormField<String>(
          //   value: _selectedValue,
          //   hint: Text(
          //     widget.hText,
          //     style: TextStyle(
          //       fontSize: width * 0.03,
          //       color: Colors.black54,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          //   onChanged: (value) {
          //     setState(() {
          //       _selectedValue = value;
          //       widget.controller.text = value!; // Update controller text
          //     });
          //     if (widget.onChanged != null) {
          //       widget.onChanged!(value!); // Call the onChanged callback
          //     }
          //   },
          //   items: widget.dropdownItems
          //       ?.map((item) => DropdownMenuItem<String>(
          //     value: item,
          //     child: Text(item),
          //   ))
          //       .toList(),
          //   decoration: InputDecoration(
          //     contentPadding: EdgeInsets.symmetric(vertical: 0),
          //     border: UnderlineInputBorder(
          //       borderSide: BorderSide(color: Colors.black, width: 1),
          //     ),
          //   ),
          //
          // )
          ?DropdownButtonFormField<String>(
            value: widget.dropdownItems?.contains(_selectedValue) == true
                ? _selectedValue
                : null, // Reset if the selected value is no longer valid
            hint: Text(
              widget.hText,
              style: TextStyle(
                fontSize: width * 0.03,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            onChanged: (value) {
              setState(() {
                _selectedValue = value;
                widget.controller.text = value ?? ''; // Update controller text
              });
              if (widget.onChanged != null) {
                widget.onChanged!(value!); // Call the onChanged callback
              }
            },
            items: widget.dropdownItems
                ?.map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            ))
                .toList(),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          )
              : TextField(
            controller: widget.controller,
            readOnly: widget.readOnly,
            onTap: widget.onTap,
            keyboardType: widget.isNumeric
                ? TextInputType.number
                : TextInputType.text, // Adjust keyboard type
            decoration: InputDecoration(
              hintText: widget.hText,
              hintStyle: TextStyle(
                fontSize: width * 0.03,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
              suffixIcon: widget.readOnly
                  ? const Icon(
                Icons.edit_outlined,
                color: Color(0xFF0F3CC9),
              )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
