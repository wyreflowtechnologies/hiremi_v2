import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pre_dashboard/Footer/widget/custom_text_field1.dart';
import 'package:pre_dashboard/Footer/widget/custom_text_field_2.dart';

import '../widget/custom_bottom_bar.dart';

class EducationScreen extends StatefulWidget {
  final Function(Map<String, String>) educationDetails;
  const EducationScreen({super.key, required this.educationDetails});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  TextEditingController collegeName = TextEditingController();
  TextEditingController branch = TextEditingController();
  TextEditingController collegeCity = TextEditingController();
  TextEditingController passOutYear = TextEditingController();
  TextEditingController percentage = TextEditingController();
  int currentIndex = 0;
  bool passOut = false;
  bool percent = false;
  String? selectedDegree;
  bool isVisible = false;
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
  String? selectedState;
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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Education',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              Visibility(
                visible: isVisible,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text(
                    'Required fields are incomplete.\nFill them out to move forward.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (collegeName.text.isEmpty ||
                        selectedDegree == null ||
                        branch.text.isEmpty ||
                        selectedState == null ||
                        collegeCity.text.isEmpty ||
                        passOutYear.text.isEmpty ||
                        percentage.text.isEmpty) {
                      setState(() {
                        isVisible = true;
                      });
                    } else {
                      if (passOutYear.text.length == 4 &&
                          RegExp(r'^\d{2}\.\d{2}$').hasMatch(percentage.text)) {
                        setState(() {
                          isVisible = false;
                        });
                        widget.educationDetails(
                          {
                            'degree': selectedDegree!,
                            'branch': branch.text,
                            'city': collegeCity.text,
                            'state': selectedState!,
                            'passOutYear': passOutYear.text,
                            'percentage': percentage.text,
                          },
                        );
                        Navigator.pop(context);
                      } else {
                        if (passOutYear.text.length != 4) {
                          setState(() {
                            passOut = true;
                          });
                        }
                        if (!RegExp(r'^\d{2}\.\d{2}$').hasMatch(percentage.text)) {
                          setState(() {
                            percent = true;
                          });
                        }
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
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
