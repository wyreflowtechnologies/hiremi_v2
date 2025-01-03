import 'package:flutter/material.dart';
import 'package:pre_dashboard/predashboard/DegreeAndBranches/DegreeAndBranches.dart';
import 'package:pre_dashboard/predashboard/StatesAndDistrict/StatesAndDistrict.dart';
import 'package:pre_dashboard/predashboard/widgets/custom_dropdown_field.dart';

import '../custom_text_field.dart';

class CustomFormWidget4 extends StatefulWidget {
  final Function(bool, int) onContinue;

  const CustomFormWidget4({super.key, required this.onContinue});

  @override
  State<CustomFormWidget4> createState() => _ReviewDetailsFormState();
}

class _ReviewDetailsFormState extends State<CustomFormWidget4> {
  String selectedState = 'Select State';
  String selectedCity = 'Select District';
  String? selectedDegree;
  String? selectedBranch;
  final TextEditingController _collegeNameController = TextEditingController();
  late TextEditingController _collegeStateController = TextEditingController();
  late TextEditingController _collegeCityController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _passoutYearController = TextEditingController();
  bool _isValid = true;


  // void _showStateSelection(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Select State'),
  //         content: SingleChildScrollView(
  //           child: Column(
  //             children: statesAndDistricts.map((stateMap) {
  //               String state = stateMap.keys.first;
  //               return ListTile(
  //                 title: Text(state),
  //                 onTap: () {
  //                   setState(() {
  //                     // Update the controller's text property directly
  //                     _collegeStateController.text = state;
  //                     _collegeCityController.text = 'Select District'; // Reset city field
  //                   });
  //                   Navigator.pop(context); // Close the dialog
  //                 },
  //               );
  //             }).toList(),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
  // void _showCitySelection(BuildContext context) {
  //   // Ensure `selectedState` is valid before proceeding
  //   if (selectedState == null || selectedState.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Please select a state first.")),
  //     );
  //     return;
  //   }
  //
  //   // Find the districts for the selected state
  //   List<String> districts = [];
  //   for (var stateMap in statesAndDistricts) {
  //     if (stateMap.containsKey(selectedState)) {
  //       districts = stateMap[selectedState]!;
  //       break;
  //     }
  //   }
  //
  //   // Show dialog for selecting a district
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Select District'),
  //         content: districts.isNotEmpty
  //             ? SingleChildScrollView(
  //           child: Column(
  //             children: districts.map((district) {
  //               return ListTile(
  //                 title: Text(district),
  //                 onTap: () {
  //                   setState(() {
  //                     selectedCity = district;
  //                     _collegeCityController.text = selectedCity; // Update the city
  //                   });
  //                   Navigator.pop(context); // Close the dialog
  //                 },
  //               );
  //             }).toList(),
  //           ),
  //         )
  //             : Text("No districts available for the selected state."),
  //       );
  //     },
  //   );
  // }
  void _showStateSelection(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select State'),
          content: SingleChildScrollView(
            child: Column(
              children: statesAndDistricts.map((stateMap) {
                String state = stateMap.keys.first;
                return ListTile(
                  title: Text(state),
                  onTap: () {
                    setState(() {
                      selectedState = state; // Update the selectedState variable
                      _collegeStateController.text = state; // Update the controller's text property
                      _collegeCityController.text = ''; // Reset city field
                    });
                    Navigator.pop(context); // Close the dialog
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  void _showCitySelection(BuildContext context) {
    // Ensure `selectedState` is valid before proceeding
    if (selectedState == null || selectedState.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select a state first.")),
      );
      return;
    }

    // Find the districts for the selected state
    List<String> districts = [];
    for (var stateMap in statesAndDistricts) {
      if (stateMap.containsKey(selectedState)) {
        districts = stateMap[selectedState]!;
        break;
      }
    }

    // Show dialog for selecting a district
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select District'),
          content: districts.isNotEmpty
              ? SingleChildScrollView(
            child: Column(
              children: districts.map((district) {
                return ListTile(
                  title: Text(district),
                  onTap: () {
                    setState(() {
                      selectedCity = district; // Update the selectedCity variable
                      _collegeCityController.text = selectedCity; // Update the city
                    });
                    Navigator.pop(context); // Close the dialog
                  },
                );
              }).toList(),
            ),
          )
              : Text("No districts available for the selected state."),
        );
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.01),
        Padding(
          padding: EdgeInsets.only(left: width * 0.05),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Review and Verify your details',
              style: TextStyle(
                fontSize: width * 0.05,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0F3CC9),
              ),
            ),
          ),
        ),
        SizedBox(height: height * 0.02),
        CustomTextField(title: 'College Name', hText: "St John's University", controller: _collegeNameController,),
        SizedBox(height: height * 0.02),
        CustomTextField(
          title: "College's State",
          hText: 'Kolkata',
          controller: _collegeStateController,
          onTap: () => _showStateSelection(context), // Show state list when tapped
          readOnly: true,

        ),
        SizedBox(height: height * 0.02),

        CustomTextField(
          title: "College's City",
          hText: 'Kolkata',
          controller: _collegeCityController,
          onTap: () => _showCitySelection(context), // Show state list when tapped
          readOnly: true,

        ),

        SizedBox(height: height * 0.02),


        CustomTextField(
          title: "Degree",
          hText: 'Bachelor Degree',
          isDropdown: true,
          value: selectedDegree,
          dropdownItems: degreeBranches.keys.toList(),
          controller: _degreeController,
          onChanged: (value) {
            setState(() {
              selectedDegree = value; // Update selected degree
              selectedBranch = null; // Reset the selected branch
              _branchController.text = ''; // Clear the branch controller text
            });
           // print('Selected degree: $selectedDegreeValue');
            print('Selected degree: $selectedDegree');
          },
        ),


        CustomTextField(
          title: "Branch",
          hText: 'Computer Science',
          isDropdown: true,
          dropdownItems: degreeBranches[selectedDegree]?.toSet().toList() ?? [], // Ensure unique list
          controller: _branchController,
          value: selectedBranch,
          onChanged: (value) {
            setState(() {
              selectedBranch = value; // Update the selected branch
            });
         //   print('Selected branch: $selectedBranchValue');
          },
        ),


        SizedBox(height: height * 0.02),
        CustomTextField(
          title: "Passout Year",
          hText: '2022',
          isDropdown: true,
          dropdownItems: ['Computer Science', 'Mechanical', 'Electrical', 'Civil'],
          controller: _passoutYearController,),
        SizedBox(height: height * 0.05),
        Center(
          child: ElevatedButton(
            onPressed: _handleContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F3CC9),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: Size(width * 0.8, height * 0.06),
            ),
            child: const Text('Review and next', style: TextStyle(fontSize: 16)),
          ),
        ),
        SizedBox(height: height * 0.02),
      ],
    );
  }

  void _handleContinue() {
    if (_collegeNameController.text.isEmpty ||
        _collegeStateController.text.isEmpty ||
        _branchController.text.isEmpty ||
        _degreeController.text.isEmpty ||
        _passoutYearController.text.isEmpty ||
        _collegeCityController.text.isEmpty
    ) {
      setState(() {
        _isValid = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('All fields must be filled!'),
          backgroundColor: Colors.red,
        ),
      );
      widget.onContinue(false, 3);
    } else {
      setState(() {
        _isValid = true;
      });
      widget.onContinue(true, 4);
    }
  }

  @override
  void dispose() {
    _collegeStateController.dispose();
    _collegeNameController.dispose();
    _branchController.dispose();
    _degreeController.dispose();
    _passoutYearController.dispose();
    super.dispose();
  }
}