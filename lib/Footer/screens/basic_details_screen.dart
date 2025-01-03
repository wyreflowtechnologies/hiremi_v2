import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pre_dashboard/Footer/controller_screen/controller_screen.dart';
import 'package:pre_dashboard/Footer/widget/custom_bottom_bar.dart';
import '../widget/custom_options.dart';
import '../widget/custom_text_field1.dart';
import '../widget/custom_text_field_2.dart';

class BasicDetailsScreen extends StatefulWidget {
  const BasicDetailsScreen({super.key});

  @override
  State<BasicDetailsScreen> createState() => _BasicDetailsScreenState();
}

class _BasicDetailsScreenState extends State<BasicDetailsScreen> {
  TextEditingController collegeName = TextEditingController();
  TextEditingController branch = TextEditingController();
  TextEditingController collegeCity = TextEditingController();
  TextEditingController passOutYear = TextEditingController();
  TextEditingController percentage = TextEditingController();
  TextEditingController currentCity = TextEditingController();
  TextEditingController currentPinCode = TextEditingController();
  TextEditingController projectTitle = TextEditingController();
  TextEditingController projectLink = TextEditingController();
  TextEditingController projectDescription = TextEditingController();
  TextEditingController linkedIn = TextEditingController();
  TextEditingController gitHub = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController whatsAapNumber = TextEditingController();
  bool contact = false;
  bool whatsApp = false;
  String? _selectedLanguage;
  String? _selectedLevel;
  final List<String> _languages = [
    'Hindi',
    'English',
    'Spanish',
    'French',
    'German'
  ];
  final List<String> _levels = ['Beginner', 'Intermediate', 'Fluent', 'Native'];
  int currentIndex = 0;
  String? differentlyAbled;
  bool pinCode = false;
  bool isVisible = false;
  String? selectedState;
  String? collegeState;
  String? careerBreak;
  String? maritalStatus;
  bool passOut = false;
  bool percent = false;
  String? selectedDegree;
  List<String> degrees = [
    'Bachelor of Science (BSc)',
    'Bachelor of Engineering (BE)',
    'Bachelor of Technology (BTech)',
    'Bachelor of Computer Applications (BCA)',
    'Master of Science (MSc)',
    'Master of Engineering (ME)',
    'Master of Technology (MTech)',
    'Master of Business Administration (MBA)',
    'Master of Computer Applications (MCA)',
    'Doctor of Philosophy (PhD)',
    'Diploma in Computer Applications (DCA)',
    'Chartered Accountancy (CA)',
    'Certified Management Accountant (CMA)',
    'Certificate Programs',
  ];
  List<String> states = [
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
    'Lakshadweep',
    'Puducherry'
  ];
  final List<String> maritalStatusOptions = ['Single', 'Married', 'Divorced'];
  TextEditingController organizationName = TextEditingController();
  TextEditingController jobTitle = TextEditingController();
  TextEditingController joiningDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  String? currentCompany;
  List<String> employmentType = [
    'Full time',
    'Part time',
    'Internship',
    'Freelance'
  ];
  String selectedEmploymentType = '';
  bool isCurrentCompany = false;

  String? validateDate(String value) {
    RegExp regExp = RegExp(r'^\d{2}/\d{2}/\d{4}$');
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid date (dd/mm/yyyy)';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Basic Detail',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        leading: Container(
            decoration: BoxDecoration(
              color: Color(0xFFECF5FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Image.asset('assets/images/appBarMenu.png'))),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Stack(
              children: [
                const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                Positioned(
                  top: size.height * 0.001,
                  right: size.width * 0.008,
                  child: Container(
                    height: size.height * 0.015,
                    width: size.width * 0.033,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.5),
                        color: const Color(0xFFDBE4FF)),
                    child: Center(
                        child: Text(
                      '3',
                      style: TextStyle(
                          fontSize: size.width * 0.023,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0F3CC9)),
                    )),
                  ),
                )
              ],
            ),
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      value: selectedState,
                      onChanged: (String? value) {
                        setState(() {
                          selectedState = value!;
                        });
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0xFF808080), width: 2),
                        ),
                        floatingLabelStyle: TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold),
                        labelText: 'Current State*',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      items: states.map((String state) {
                        return DropdownMenuItem<String>(
                          value: state,
                          child: Text(state),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextField1(
                      labelText: 'Current city',
                      hintText: 'e.g: Kolkata',
                      keyboardType: TextInputType.text,
                      text: (p0) => setState(() {
                        currentCity.text = p0;
                      }),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Current pincode*',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: currentPinCode,
                onChanged: (p0) {
                  if (p0.length != 6) {
                    setState(() {
                      pinCode = true;
                    });
                  } else if (p0.length == 6) {
                    setState(() {
                      pinCode = false;
                    });
                  }
                },
                decoration: InputDecoration(
                    error:
                        pinCode ? Text('Please Enter 6 digit pincode') : null,
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFFC1272D), width: 1),
                    ),
                    hintText: '609609',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFF808080), width: 2),
                    )),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                dropdownColor: Colors.white,
                value: maritalStatus,
                onChanged: (String? value) {
                  setState(() {
                    maritalStatus = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Marital Status*',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: maritalStatusOptions.map((String status) {
                  return DropdownMenuItem<String>(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Text(
                'Are you differently abled?*',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CustomOptions(
                option: (p0) => setState(() {
                  differentlyAbled = p0;
                }),
              ),
              const SizedBox(height: 20),
              Text(
                'Do you have career break?*',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CustomOptions(
                option: (p0) => setState(() {
                  careerBreak = p0;
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField2(
                labelText: 'College name*',
                hintText: 'j.r.r college',
                text: (p0) => setState(() {
                  collegeName.text = p0;
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Degree',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField<String>(
                dropdownColor: Colors.white,
                style: TextStyle(fontSize: 16, color: Colors.black),
                value: selectedDegree,
                onChanged: (String? value) {
                  setState(() {
                    selectedDegree = value!;
                  });
                },
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFF808080), width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: degrees.map((String state) {
                  return DropdownMenuItem<String>(
                    value: state,
                    child: Text(state),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField2(
                labelText: 'Branch*',
                hintText: 'computer science',
                text: (p0) => setState(() {
                  branch.text = p0;
                }),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      value: collegeState,
                      onChanged: (String? value) {
                        setState(() {
                          collegeState = value!;
                        });
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0xFF808080), width: 2),
                        ),
                        floatingLabelStyle: TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold),
                        labelText: 'College State*',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      items: states.map((String state) {
                        return DropdownMenuItem<String>(
                          value: state,
                          child: Text(state),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomTextField1(
                      labelText: 'College district',
                      hintText: 'Kolkata',
                      text: (p0) => setState(() {
                        collegeCity.text = p0;
                      }),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Passing Out Year',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: passOutYear,
                onChanged: (p0) {
                  if (p0.length != 4) {
                    setState(() {
                      passOut = true;
                    });
                  } else if (p0.length == 4) {
                    setState(() {
                      passOut = false;
                    });
                  }
                },
                decoration: InputDecoration(
                    error: passOut ? Text('Please Enter Correct Year') : null,
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFFC1272D), width: 1),
                    ),
                    hintText: '2024',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFF808080), width: 2),
                    )),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Percentage/CGPA',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: percentage,
                onChanged: (p0) {
                  if (p0.length != 5 ||
                      !RegExp(r'^\d{2}\.\d{2}$').hasMatch(p0)) {
                    setState(() {
                      percent = true;
                    });
                  } else {
                    setState(() {
                      percent = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  error: percent
                      ? Text('Please Enter Correct Percentage (xx.xx)')
                      : null,
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFFC1272D), width: 1),
                  ),
                  hintText: '00.00',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFF808080), width: 2),
                  ),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}$')),
                  LengthLimitingTextInputFormatter(5),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomTextField2(
                      labelText: 'Organization name*',
                      hintText: 'XYZ',
                      text: (p0) {
                        setState(() {
                          organizationName.text = p0;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomTextField2(
                      labelText: 'Job title*',
                      hintText: 'PM',
                      text: (p0) {
                        setState(() {
                          jobTitle.text = p0;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Joining Date',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: joiningDate,
                onChanged: (value) {
                  if (value.length == 2 || value.length == 5) {
                    joiningDate.text = '$value/';
                    joiningDate.selection = TextSelection.fromPosition(
                        TextPosition(offset: joiningDate.text.length));
                  }
                  if (value.length <= 10 &&
                      RegExp(r'[^0-9/]').hasMatch(value)) {
                    joiningDate.text = value.replaceAll(RegExp(r'[^0-9/]'), '');
                    joiningDate.selection = TextSelection.fromPosition(
                        TextPosition(offset: joiningDate.text.length));
                  }
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: '00/00/0000',
                  errorText: validateDate(joiningDate.text),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  floatingLabelStyle: TextStyle(
                      color: Color(0xFF000000), fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFF808080), width: 2),
                  ),
                ),
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Is this your current company?*',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              CustomOptions(
                  option: (p0) => setState(() {
                        currentCompany = p0;
                      })),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: isCurrentCompany,
                    onChanged: (bool? value) {
                      setState(() {
                        isCurrentCompany = value ?? false;
                      });
                    },
                  ),
                  const Text(
                    'I am currently working here',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (!isCurrentCompany) ...[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'End Date',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: endDate,
                  onChanged: (value) {
                    if (value.length == 2 || value.length == 5) {
                      endDate.text = '$value/';
                      endDate.selection = TextSelection.fromPosition(
                          TextPosition(offset: endDate.text.length));
                    }
                    if (value.length <= 10 &&
                        RegExp(r'[^0-9/]').hasMatch(value)) {
                      endDate.text = value.replaceAll(RegExp(r'[^0-9/]'), '');
                      endDate.selection = TextSelection.fromPosition(
                          TextPosition(offset: endDate.text.length));
                    }
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: '11/11/1111',
                    errorText: validateDate(endDate.text),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    floatingLabelStyle: TextStyle(
                        color: Color(0xFF000000), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFF808080), width: 2),
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ],
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Employment type*',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: employmentType.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedEmploymentType = employmentType[index];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                selectedEmploymentType == employmentType[index]
                                    ? Color(0xFFC7CFEB)
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 15),
                              child: Text(
                                employmentType[index],
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField2(
                labelText: 'Project Title*',
                hintText: 'Landing page',
                text: (p0) {
                  setState(() {
                    projectTitle.text = p0;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField2(
                labelText: 'Project Link*',
                hintText: 'XYZ',
                text: (p0) {
                  setState(() {
                    projectLink.text = p0;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Project Description',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (p0) {
                  projectDescription.text = p0;
                },
                maxLines: 5,
                maxLength: 200,
                decoration: InputDecoration(
                    hintText: '',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    floatingLabelStyle: TextStyle(
                        color: Color(0xFF000000), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFF808080), width: 2),
                    )),
                keyboardType: TextInputType.text,
              ),
              Text(
                'Add Language',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                dropdownColor: Colors.white,
                decoration: InputDecoration(
                  hintText: 'Hindi',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  floatingLabelStyle: TextStyle(
                      color: Color(0xFF000000), fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFF808080), width: 2),
                  ),
                ),
                hint: Text('Select Language'),
                value: _selectedLanguage,
                items: _languages.map((lang) {
                  return DropdownMenuItem<String>(
                    value: lang,
                    child: Text(lang),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a language' : null,
              ),
              SizedBox(height: 20),
              Text(
                'Communication level',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                dropdownColor: Colors.white,
                decoration: InputDecoration(
                  hintText: 'Fluent',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  floatingLabelStyle: TextStyle(
                      color: Color(0xFF000000), fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFF808080), width: 2),
                  ),
                ),
                hint: Text('Select Level'),
                value: _selectedLevel,
                items: _levels.map((level) {
                  return DropdownMenuItem<String>(
                    value: level,
                    child: Text(level),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedLevel = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a level' : null,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: linkedIn,
                    decoration: InputDecoration(
                        hintText: 'https://prak-mish-etc',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        floatingLabelStyle: TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0xFF808080), width: 2),
                        )),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.grey[600]!, width: 1.2)),
                    child: Center(
                        child: FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: Color(0xFF0076B2),
                    )),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: gitHub,
                    decoration: InputDecoration(
                        hintText: 'https://prak-mietc',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        floatingLabelStyle: TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0xFF808080), width: 2),
                        )),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.grey[600]!, width: 1.2)),
                    child: Center(
                        child: FaIcon(
                      FontAwesomeIcons.github,
                      color: Color(0xFF000000),
                    )),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Contact Number*',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: contactNumber,
                onChanged: (value) {
                  if (value.length != 10) {
                    setState(() {
                      contact = true;
                    });
                  } else if (value.length == 10) {
                    setState(() {
                      contact = false;
                    });
                  }
                },
                decoration: InputDecoration(
                    error:
                        contact ? Text('Please Enter 10 Digit Number') : null,
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFFC1272D), width: 1),
                    ),
                    hintText: '0000000000',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    floatingLabelStyle: TextStyle(
                        color: Color(0xFF000000), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFF808080), width: 2),
                    )),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'WhatsApp number*',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: whatsAapNumber,
                onChanged: (value) {
                  if (value.length != 10) {
                    setState(() {
                      whatsApp = true;
                    });
                  } else if (value.length == 10) {
                    setState(() {
                      whatsApp = false;
                    });
                  }
                },
                decoration: InputDecoration(
                    error:
                        whatsApp ? Text('Please Enter 10 Digit Number') : null,
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFFC1272D), width: 1),
                    ),
                    hintText: '0000000000',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    floatingLabelStyle: TextStyle(
                        color: Color(0xFF000000), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFF808080), width: 2),
                    )),
                keyboardType: TextInputType.phone,
              ),
              Visibility(
                visible: isVisible,
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Text(
                      'Required fields are incomplete.\nFill them out to move forward.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedState == null ||
                        currentCity.text.isEmpty ||
                        currentPinCode.text.isEmpty ||
                        maritalStatus == null ||
                        differentlyAbled == null ||
                        careerBreak == null ||
                        collegeName.text.isEmpty ||
                        selectedDegree == null ||
                        branch.text.isEmpty ||
                        collegeState == null ||
                        passOutYear.text.isEmpty ||
                        percentage.text.isEmpty ||
                        organizationName.text.isEmpty ||
                        jobTitle.text.isEmpty ||
                        joiningDate.text.isEmpty ||
                        currentCompany == null ||
                        (isCurrentCompany ? false : endDate.text.isEmpty) ||
                        employmentType.isEmpty ||
                        projectTitle.text.isEmpty ||
                        projectLink.text.isEmpty ||
                        projectDescription.text.isEmpty ||
                        _selectedLanguage == null ||
                        _selectedLevel == null ||
                        linkedIn.text.isEmpty ||
                        gitHub.text.isEmpty ||
                        contactNumber.text.length != 10 ||
                        whatsAapNumber.text.length != 10) {
                      setState(() {
                        isVisible = true;
                      });
                    } else {
                      if (currentPinCode.text.length == 6 &&
                          passOutYear.text.length == 4 &&
                          RegExp(r'^\d{2}\.\d{2}$').hasMatch(percentage.text) &&
                          joiningDate.text.length == 10 &&
                          endDate.text.length == 10 && contactNumber.text.length == 10 && whatsAapNumber.text.length == 10) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          final Map<String, String> personalDetail = {
                            'currentState' : selectedState!,
                            'currentCity' : currentCity.text,
                            'currentPincode' : currentPinCode.text,
                            'maritalStatus' : maritalStatus!,
                            'differentlyAbled' : differentlyAbled!,
                            'careerBreak' : careerBreak!,
                            'collegeName' : collegeName.text,
                            'degree' : selectedDegree!,
                            'branch' : branch.text,
                            'collegeState' : collegeState!,
                            'collegeCity' : collegeCity.text,
                            'passOutYear' : passOutYear.text,
                            'percentage' : percentage.text,
                            'organization' : organizationName.text,
                            'jobTitle' : jobTitle.text,
                            'duration': isCurrentCompany
                                ? 'Currently working from ${joiningDate.text}'
                                : '${joiningDate.text} to ${endDate.text}',
                            'employmentType': selectedEmploymentType,
                            'projectTitle': projectTitle.text,
                            'projectLink': projectLink.text,
                            'projectDescription': projectDescription.text,
                            'language': _selectedLanguage!,
                            'proficiency': _selectedLevel!,
                            'linkedIn': linkedIn.text,
                            'gitHub': gitHub.text,
                            'contactNumber': contactNumber.text,
                            'whatsAppNumber': whatsAapNumber.text
                          };
                          return ControllerScreen(basicDetails: personalDetail);
                        },));
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F3CC9),
                    fixedSize: Size(size.width * 0.4, size.height * 0.05),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: currentIndex,
        onTabSelected: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
