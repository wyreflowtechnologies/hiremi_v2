import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pre_dashboard/bloc/user_bloc.dart';
import 'package:pre_dashboard/widgets/custom_text_field.dart';
import 'package:pre_dashboard/widgets/gender_radio.dart';

import '../../constants/constants.dart';

class Step1ContentWidget extends StatefulWidget {
  Step1ContentWidget({
    super.key,
    required this.formKey,
    required this.fullNameController,
    required this.fatherNameController,
    required this.birthPlaceController,
    required this.dobController,
    required this.onGenderChanged,
    this.selectedGender,
    required this.isValidated,
    required this.onValidation,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController fullNameController;
  final TextEditingController fatherNameController;
  final TextEditingController dobController;
  final TextEditingController birthPlaceController;
  final ValueChanged<String?> onGenderChanged;
  final String? selectedGender;
  final bool isValidated;
  final Function(bool) onValidation;

  @override
  State<Step1ContentWidget> createState() => _Step1ContentWidgetState();
}

class _Step1ContentWidgetState extends State<Step1ContentWidget> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
        if(state is UserDataState)
        {
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
                      controller: widget.fullNameController,
                      labelText: "Full Name",
                      hintText: 'John Doe',
                      validator: (value) {
                        if (value!.length < 3 || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
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
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select your date of birth';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      controller: widget.birthPlaceController,
                      hintText: 'Select State',
                      labelText: 'State',
                      isDropdown: true,
                      dropdownItems: const [
                        'Andhra Pradesh',
                        'Arunachal Pradesh',
                        'Assam',
                        'Bihar',
                        'Chhattisgarh',
                        'Goa',
                        'Gujarat',
                        'Haryana',
                        'Himachal Pradesh',
                        'Jharkhand',
                        'Karnataka',
                        'Kerala',
                        'Madhya Pradesh',
                        'Maharashtra',
                        'Manipur',
                        'Meghalaya',
                        'Mizoram',
                        'Nagaland',
                        'Odisha',
                        'Punjab',
                        'Rajasthan',
                        'Sikkim',
                        'Tamil Nadu',
                        'Telangana',
                        'Tripura',
                        'Uttar Pradesh',
                        'Uttarakhand',
                        'West Bengal',
                        'Chandigarh',
                        'Delhi',
                        'Jammu and Kashmir',
                        'Ladakh',
                        'Lakshadweep',
                        'Puducherry',
                        'Andaman and Nicobar Islands',
                        'Dadra and Nagar Haveli',
                        'Daman and Diu',
                      ],
                      onDropdownChanged: (value) {
                        print('Selected State: $value');
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select your state';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        else 
        {
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
                      hintText: 'John Doe',
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
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select your date of birth';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      value: state.user.state,
                      controller: widget.birthPlaceController,
                      hintText: 'Select State',
                      labelText: 'State',
                      isDropdown: true,
                      dropdownItems: const [
                        'Andhra Pradesh',
                        'Arunachal Pradesh',
                        'Assam',
                        'Bihar',
                        'Chhattisgarh',
                        'Goa',
                        'Gujarat',
                        'Haryana',
                        'Himachal Pradesh',
                        'Jharkhand',
                        'Karnataka',
                        'Kerala',
                        'Madhya Pradesh',
                        'Maharashtra',
                        'Manipur',
                        'Meghalaya',
                        'Mizoram',
                        'Nagaland',
                        'Odisha',
                        'Punjab',
                        'Rajasthan',
                        'Sikkim',
                        'Tamil Nadu',
                        'Telangana',
                        'Tripura',
                        'Uttar Pradesh',
                        'Uttarakhand',
                        'West Bengal',
                        'Chandigarh',
                        'Delhi',
                        'Jammu and Kashmir',
                        'Ladakh',
                        'Lakshadweep',
                        'Puducherry',
                        'Andaman and Nicobar Islands',
                        'Dadra and Nagar Haveli',
                        'Daman and Diu',
                      ],
                      onDropdownChanged: (value) {
                        print('Selected State: $value');
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select your state';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        }
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
