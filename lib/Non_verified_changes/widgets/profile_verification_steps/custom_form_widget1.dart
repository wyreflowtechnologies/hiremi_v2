
import 'package:flutter/material.dart';
import 'package:pre_dashboard/predashboard/StatesAndDistrict/StatesAndDistrict.dart';

import '../../../predashboard/widgets/custom_text_field.dart';


class CustomFormWidget1 extends StatefulWidget {
  final Function(bool, int) onComplete;

  const CustomFormWidget1({super.key, required this.onComplete});

  @override
  State<CustomFormWidget1> createState() => _CustomFormWidgetState();
}

class _CustomFormWidgetState extends State<CustomFormWidget1> {
  bool _isformCompleted = false;
  bool showErrorMessage = false; // Flag to show error message
  String selectedState = 'Select State';
  String selectedCity = 'Select District';
  final _birthStateController = TextEditingController();
  final _birthCityController = TextEditingController();
  final _pincodeController = TextEditingController();
  bool isDifferentlyAbled = false;


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
                      selectedState = state;
                      selectedCity = 'Select District';  // Reset district when state changes
                      _birthStateController.text = selectedState; // Update state controller
                      _birthCityController.clear();  // Clear the city controller text
                    });
                    Navigator.pop(context);  // Close the dialog
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
    // Find the districts for the selected state
    List<String> districts = [];
    statesAndDistricts.forEach((stateMap) {
      if (stateMap.containsKey(selectedState)) {
        districts = stateMap[selectedState]!;
      }
    });

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select District'),
          content: SingleChildScrollView(
            child: Column(
              children: districts.map((district) {
                return ListTile(
                  title: Text(district),
                  onTap: () {
                    setState(() {
                      selectedCity = district;

                      // Update the cityController text with the selected city
                      _birthCityController.text = selectedCity;
                    });
                    Navigator.pop(context);  // Close the dialog
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  void _validateFields() {
    if (_birthStateController.text.isNotEmpty &&
        _birthCityController.text.isNotEmpty &&
        _pincodeController.text.isNotEmpty) {
      widget.onComplete(true, 1);
      _isformCompleted = true;
      setState(() {
        showErrorMessage = false; // Hide error message after success
      });
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text("Fields are complete! Proceeding...")),
      // );
    } else {
      widget.onComplete(false, 0);
      setState(() {
        showErrorMessage = true; // Show error message if fields are incomplete
      });
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text("Please complete all fields!")),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.01),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Personal Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xff0F3CC9),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          // Row(
          //   children: [
          //     Expanded(
          //       child: GestureDetector(
          //         onTap: () => _showStateSelection(context), // Show state list when tapped
          //         child: AbsorbPointer(
          //           child: CustomTextField(
          //             controller:_birthStateController,
          //             hintText: 'Select State',
          //             isDropdown: false,
          //             value: selectedState,
          //             labelText: 'Current State',
          //             validator: (value) {
          //               if (value == null || value.isEmpty || value == 'Select State') {
          //                 return 'Please select a state';
          //               }
          //               return null;
          //             },
          //           ),
          //         ),
          //       ),
          //     ),
          //     SizedBox(width: 10), // Adjust space between the fields to fit better
          //     Expanded(
          //       child: GestureDetector(
          //         onTap: () => _showCitySelection(context), // Show city list when tapped
          //         child: AbsorbPointer(
          //           child: CustomTextField(
          //             controller: _birthCityController,
          //             hintText: 'Select District',
          //             value: selectedCity,
          //             labelText: 'District',
          //             validator: (value) {
          //               if (value == null || value.isEmpty || value == 'Select District') {
          //                 return 'Please select a district';
          //               }
          //               return null;
          //             },
          //           ),
          //         ),
          //       ),
          //     ),
          //
          //   ],
          // ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap:  () => _showStateSelection(context),

                  child: AbsorbPointer(
                    child: TextField(
                      controller: _birthStateController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xff0056D6)),
                        ),
                        labelText: 'Birth State',
                        hintText: 'eg: West Bengal',
                        labelStyle: const TextStyle(
                          color: Color(0xff0F3CC9),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: GestureDetector(
                  onTap:()=> _showCitySelection(context),
                  child: AbsorbPointer(
                    child: TextField(
                      controller: _birthCityController,
                      decoration: InputDecoration(
                        labelText: 'Birth City',
                        hintText: 'eg: Kolkata',
                        labelStyle: const TextStyle(
                          color: Color(0xff0F3CC9),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xff0056D6)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: InputDecorator(
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Are you differently abled?',
                        contentPadding: EdgeInsets.symmetric(vertical: size.height * 0.005),
                        labelStyle: const TextStyle(
                          color: Color(0xff0F3CC9),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.blue),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: false,
                          groupValue: isDifferentlyAbled,
                          onChanged: (value) {
                            setState(() {
                              isDifferentlyAbled = value as bool;
                            });
                          },
                        ),
                        const Text("No"),
                        Radio(
                          value: true,
                          groupValue: isDifferentlyAbled,
                          onChanged: (value) {
                            setState(() {
                              isDifferentlyAbled = value as bool;
                            });
                          },
                        ),
                        const Text("Yes"),
                      ],
                    )),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _pincodeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Current Pincode',
                    hintText: 'eg: 502032',
                    labelStyle: const TextStyle(
                      color: Color(0xff0F3CC9),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xff0056D6)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // if (showErrorMessage)
          //   const Padding(
          //     padding: EdgeInsets.only(top: 25.0),
          //     child: Text(
          //       ' Required fields are incomplete.\nFill them out to move forward. ',
          //       style: TextStyle(
          //           color: Color(0xffC90F0F),
          //           fontSize: 14,
          //           fontWeight: FontWeight.w600),
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
          Padding(
            padding:  EdgeInsets.all(size.height*0.01),
            child: SizedBox(
              height:size.height*0.1, // Fixed height for the space
              child: Visibility(
                visible: showErrorMessage, // Only shows the error message when true
                child:  Text(
                  'Required fields are incomplete.\nFill them out to move forward.',
                  style: TextStyle(
                      color: Color(0xffC90F0F),
                      fontSize: size.height*0.015,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),


          SizedBox(height: size.height * 0.02),

          ElevatedButton(
            onPressed: _validateFields,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff0F3CC9),
              minimumSize: Size(size.width * 0.7, size.height * 0.06),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Continue',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


