import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:pre_dashboard/predashboard/DegreeAndBranches/DegreeAndBranches.dart';
import 'package:pre_dashboard/predashboard/Model/cities_model.dart';
import 'package:pre_dashboard/predashboard/StatesAndDistrict/StatesAndDistrict.dart';
import 'package:pre_dashboard/predashboard/repositories/country_state_city_repo.dart';
import 'package:pre_dashboard/predashboard/widgets/custom_dropdown_field.dart';
import 'package:pre_dashboard/predashboard/widgets/custom_input_field.dart';
import 'package:pre_dashboard/predashboard/Model/country_state_model.dart' as cs_model;
import 'package:pre_dashboard/predashboard/widgets/custom_text_field.dart';

import '../../constants/constants.dart';

class Step3Content extends StatefulWidget {
   Step3Content({super.key,
  required this.formKey,
  required this.collegeNameController,
  required this.branchNameController,
  required this.courseNameController,
  required this.yearController,
  required this.stateControllerinEdu,
     required this.cityControllerinEdu,

  });

  final GlobalKey<FormState> formKey;
   final TextEditingController collegeNameController ;
  final TextEditingController branchNameController;
  final TextEditingController courseNameController ;
  final TextEditingController yearController ;
  final TextEditingController stateControllerinEdu;
   final TextEditingController cityControllerinEdu;

  @override
  State<Step3Content> createState() => _Step3ContentState();
}

class _Step3ContentState extends State<Step3Content> {
  String selectedCountry = 'India';
  String? selectedDegree;
  String? selectedBranch;
  String selectedState = 'Select State';
  String selectedCity = 'Select City';
  String countryValue = "India"; // Default country set to India
  String? stateValue;
  String? cityValue;
  String finalTextToBeDisplayed = '';
  bool isDataLoaded = false;
  final CountryStateCityRepo _countryStateCityRepo = CountryStateCityRepo();
  cs_model.CountryStateModel countryStateModel =
  cs_model.CountryStateModel(error: false, msg: '', data: []);

  CitiesModel citiesModel = CitiesModel(error: false, msg: '', data: []);
  List<String> countries = [];
  List<String> states = [];
  List<String> cities = [];
    getCountries() async {
    //
    countryStateModel = await _countryStateCityRepo.getCountriesStates();
    countries.add('Select Country');
    states.add('Select State');
    cities.add('Select City');
    for (var element in countryStateModel.data) {
      countries.add(element.name);
    }
    getStates();

    isDataLoaded = true;
    setState(() {});
    //
  }

  getStates() async {
    //
    for (var element in countryStateModel.data) {
      if (selectedCountry == element.name) {
        print("Selected");
        //
        setState(() {
          resetStates();
          resetCities();
        });
        //
        for (var state in element.states) {
          states.add(state.name);
        }
      }


    }
    //
  }

  getCities() async {
    print("selectedState is $selectedState");
    //
    isDataLoaded = false;
    citiesModel = await _countryStateCityRepo.getCities(
        country: selectedCountry, state: selectedState);
    setState(() {
      resetCities();
    });
    for (var city in citiesModel.data) {
      cities.add(city);
    }
    isDataLoaded = true;
    setState(() {});
    //
  }
  resetCities() {
    cities = [];
    cities.add('Select City');
    selectedCity = 'Select City';
    finalTextToBeDisplayed = '';
  }
  resetCities1() {
    cities = ['Select City'];
    selectedCity = 'Select City';
    widget.cityControllerinEdu.text = ''; // Reset the text in the city text field
    finalTextToBeDisplayed = ''; // Optional, if you are showing additional text
  }

  resetStates() {
    states = [];
    states.add('Select State');
    selectedState = 'Select State';
    finalTextToBeDisplayed = '';
  }
  Future<void> fetchStates() async {
    final response = await http.get(
      Uri.parse("https://example.com/api/states?country=India"),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        states = List<String>.from(data['states']); // Update with actual API response structure
      });
    }
  }

  Future<void> fetchCities(String state) async {
    final response = await http.get(
      Uri.parse("https://example.com/api/cities?state=$state"),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        cities = List<String>.from(data['cities']); // Update with actual API response structure
      });
    }
  }


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
                      widget.stateControllerinEdu.text = selectedState; // Update state controller
                      widget.cityControllerinEdu.clear();  // Clear the city controller text
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
                      widget.cityControllerinEdu.text = selectedCity;
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
    super.initState();
    getCountries();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: screenWidth*0.05),
        child: Form(
          key: widget.formKey,
          child:   Column(

            children: [

              CustomInputField(
                controller: widget.collegeNameController,
                label: "College Name",

              validator: (value) {
                if(value == null || value.isEmpty)
                {
                  return 'Please enter college name';
                }
                return null;
              },
              ),

              // CustomDropdownField(
              //   controller: widget.branchNameController,
              //   items: AppColors.branches,
              //   label: "Select Degree",
              //  validator: (value) {
              //   if(value == null || value.isEmpty)
              //   {
              //     return 'Please specify your Degree';
              //
              //   }
              //   return null;
              // },
              // ),

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _showStateSelection(context), // Show state list when tapped
                      child: AbsorbPointer(
                        child: CustomTextField(
                          controller: widget.stateControllerinEdu,
                          hintText: 'Select State',
                          isDropdown: false,
                          value: selectedState,
                          labelText: 'College State',
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
                          controller: widget.cityControllerinEdu,
                          hintText: 'Select District',
                          isDropdown: false,
                          value: selectedCity,
                          labelText: 'District',
                          validator: (value) {
                            if (value == null || value.isEmpty || value == 'Select City') {
                              return 'Please select a District';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),

                ],
              ),


              CustomDropdownField(
                controller: widget.branchNameController,
                items: degreeBranches.keys.toList(), // List of degrees
                label: "Select Degree",
                value: selectedDegree, // Current selected degree
                onDropdownChanged: (value) {
                  setState(() {
                    selectedDegree = value; // Update selected degree
                    widget.branchNameController.text=value!;
                    selectedBranch = null; // Reset the selected branch
                    widget.courseNameController.text = ''; // Clear the branch controller
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please specify your Degree';
                  }
                  return null;
                },
              ),


                CustomDropdownField(
                  key: ValueKey(selectedDegree), // Force rebuild when degree changes
                  controller: widget.courseNameController,
                  items: degreeBranches[selectedDegree]?.toSet().toList() ?? [], // Unique branches
                  label: "Select Branch",
                  value: selectedBranch, // Current selected branch
                  onDropdownChanged: (value) {
                    setState(() {
                      widget.courseNameController.text=value!;
                      selectedBranch = value; // Update selected branch
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a branch';
                    }
                    return null;
                  },
                ),
              // CustomInputField(label: "Enter Passing Year",
              //   controller: widget.yearController,
              //   keyboardType: TextInputType.numberWithOptions(),
              //   validator: (value) {
              //   if(value == null || value.isEmpty)
              //   {
              //     return 'Please enter year';
              //   }
              //
              //   return null;
              // },
              // ),
              CustomInputField(
                label: "Enter Passing Year",
                controller: widget.yearController,
                isDropdown: true,
                dropdownItems: List.generate(33, (index) => 2000 + index), // Years 2000-2032
                dropdownValidator: (value) {
                  if (value == null) {
                    return 'Please select a year';
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