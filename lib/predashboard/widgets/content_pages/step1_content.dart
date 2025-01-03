import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pre_dashboard/predashboard/StatesAndDistrict/StatesAndDistrict.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pre_dashboard/predashboard/Model/cities_model.dart' ;
import 'package:pre_dashboard/predashboard/Model/country_state_model.dart' as cs_model;

import 'package:pre_dashboard/predashboard/bloc/user_bloc.dart';
import 'package:pre_dashboard/predashboard/repositories/country_state_city_repo.dart';
import 'package:pre_dashboard/predashboard/widgets/custom_text_field.dart';
import 'package:pre_dashboard/predashboard/widgets/gender_radio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/constants.dart';

class Step1ContentWidget extends StatefulWidget {
  Step1ContentWidget({
    super.key,
    required this.formKey,
    required this.fullNameController,
    required this.fatherNameController,
    required this.birthPlaceController,
    required this.dobController,
    required this.cityController,
    required this.stateController,
    required this.onGenderChanged,
    required this.onCityChanged,
    required this.onStateChanged,
    this.selectedGender,
    required this.isValidated,
    required this.onValidation,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController fullNameController;
  final TextEditingController fatherNameController;
  final TextEditingController dobController;
  final TextEditingController stateController;
  final TextEditingController cityController;
  final TextEditingController birthPlaceController;
  final ValueChanged<String?> onGenderChanged;
  final ValueChanged<String?> onCityChanged;
  final ValueChanged<String?> onStateChanged;

  final String? selectedGender;
  final bool isValidated;
  final Function(bool) onValidation;



  @override
  State<Step1ContentWidget> createState() => _Step1ContentWidgetState();
}

class _Step1ContentWidgetState extends State<Step1ContentWidget> {
  String selectedCountry = 'India';
  String selectedState = 'Select State';
  String selectedCity = 'Select District';
  String countryValue = "India"; // Default country set to India




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
                      widget.stateController.text = selectedState; // Update state controller
                      widget.cityController.clear();  // Clear the city controller text
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
                      widget.cityController.text = selectedCity;
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



  @override
  void initState() {
    // TODO: implement initState
    // getCountries();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: widget.formKey, // Attach the form key here
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: screenHeight * 0.03),
                    CustomTextField(
                      value: state.user.name,
                      controller: widget.fullNameController,
                      labelText: "Full Name",
                      hintText: 'Full Name',
                      validator: (value) {
                        if (value!.length < 3 || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      value: state.user.fathersName,
                      controller: widget.fatherNameController,
                      labelText: "Father’s Full Name",
                      hintText: 'Father Name',
                      validator: (value) {
                        if (value!.length < 3 || value.isEmpty) {
                          return 'Please enter your father\'s full name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Gender',
                            style: GoogleFonts.poppins(
                              fontSize: screenHeight * 0.02,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: '*',
                            style: GoogleFonts.poppins(
                              fontSize: screenHeight * 0.02,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff0F3CC9),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.002),
                    GenderInput(widget: widget, screenHeight: screenHeight),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextField(
                      controller: widget.dobController,
                      labelText: 'Date of Birth',
                      hintText: 'DD/MM/YYYY',
                      prefixIcon: const Icon(Icons.calendar_today,
                          color: AppColors.secondaryTextColor),
                      isDatePicker: true,
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (selectedDate != null) {
                          widget.dobController.text =
                              '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
                       //   widget.dobController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select your date of birth';
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _showStateSelection(context), // Show state list when tapped
                            child: AbsorbPointer(
                              child: CustomTextField(
                                controller: widget.stateController,
                                hintText: 'Select State',
                                isDropdown: false,
                                value: selectedState,
                                labelText: 'Current State',
                                validator: (value) {
                                  if (value == null || value.isEmpty || value == 'Select State') {
                                    return 'Please select a state';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10), // Adjust space between the fields to fit better
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _showCitySelection(context), // Show city list when tapped
                            child: AbsorbPointer(
                              child: CustomTextField(
                                controller: widget.cityController,
                                hintText: 'Select District',
                                value: selectedCity,
                                labelText: 'District',
                                validator: (value) {
                                  if (value == null || value.isEmpty || value == 'Select District') {
                                    return 'Please select a district';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        // Expanded(
                        //   child: CustomTextField(
                        //     controller: widget.cityController,
                        //     hintText: 'Enter District',
                        //     labelText: 'Current District',
                        //     validator: (value) {
                        //       if (value == null || value.isEmpty) {
                        //         return 'Please enter a district';
                        //       }
                        //       return null;
                        //     },
                        //   ),
                        // ),



                      ],
                    )

                  ],
                ),
              ),
            ),
          );
        }
       // }
      ));
   
  }
}

class GenderInput extends StatefulWidget {
  const GenderInput({
    super.key,
    required this.widget,
    required this.screenHeight,

  });

  final Step1ContentWidget widget;
  final double screenHeight;

  @override
  State<GenderInput> createState() => _GenderInputState();
}

class _GenderInputState extends State<GenderInput> {
  final List<bool> selectionState = [false, false, false];
  String? validateGender(String? gender) {
    if (gender == null || gender.isEmpty) {
      return 'Please select a gender.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
        initialValue: widget.widget.selectedGender,
        validator: validateGender,
        builder: (field) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GenderRadio(
                    gender: 'Male',
                    selectedGender: field.value,
                    onChanged: (value) {
                      _updateSelection(0);
                      field.didChange(value);
                      widget.widget.onGenderChanged(value);
                    },
                    isSelected: selectionState[0],
                  ),
                  SizedBox(width: widget.screenHeight * 0.01),
                  // GenderRadio(
                  //   gender: 'Female',
                  //   selectedGender: field.value,
                  //   onChanged: (value) {
                  //     _updateSelection(1);
                  //     field.didChange(value);
                  //     widget.widget.onGenderChanged(value);
                  //   },
                  //   isSelected: selectionState[1],
                  // ),
                  GenderRadio(
                    gender: 'Female',
                    selectedGender: field.value,
                    onChanged: (value) {
                      _updateSelection(1);
                      field.didChange(value);
                      widget.widget.onGenderChanged(value);
                    },
                    isSelected: selectionState[1],

                  ),
                  SizedBox(width: widget.screenHeight * 0.01),
                  GenderRadio(
                    gender: 'Other',
                    selectedGender: field.value,
                    onChanged: (value) {
                      _updateSelection(2);
                      field.didChange(value);
                      widget.widget.onGenderChanged(value);
                    },
                    isSelected: selectionState[2],
                  ),
                ],
              ),
              if (field.hasError)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    field.errorText!,
                    style: TextStyle(
                        color: Colors.red[900],
                        fontSize: widget.screenHeight * 0.0125),
                  ),
                ),
            ],
          );
        });
  }

  void _updateSelection(int selectedIndex) {
    for (int i = 0; i < selectionState.length; i++) {
      setState(() {
        selectionState[i] = (i == selectedIndex);
      });
      // Set only the tapped index to true
    }
  }
}



