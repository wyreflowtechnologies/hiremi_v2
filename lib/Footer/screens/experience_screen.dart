import 'package:flutter/material.dart';
import 'package:pre_dashboard/Footer/widget/custom_text_field_2.dart';

import '../widget/custom_bottom_bar.dart';
import '../widget/custom_options.dart';

class ExperienceScreen extends StatefulWidget {
  final Function(Map<String, String>) educationDetails;
  const ExperienceScreen({super.key, required this.educationDetails});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  TextEditingController organizationName = TextEditingController();
  TextEditingController jobTitle = TextEditingController();
  TextEditingController joiningDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  String? currentCompany;
  int currentIndex = 0;
  List<String> employmentType = [
    'Full time',
    'Part time',
    'Internship',
    'Freelance'
  ];
  String selectedEmploymentType = '';
  bool isVisible = false;
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
          'Experience',
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
              CustomOptions(option: (p0) => setState(() {
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
                      borderSide: BorderSide(color: Color(0xFF808080), width: 2),
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
              const SizedBox(height: 20,),
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
                            color: selectedEmploymentType == employmentType[index] ? Color(0xFFC7CFEB) : Colors.transparent,
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
                    if (organizationName.text.isEmpty ||
                        jobTitle.text.isEmpty ||
                        joiningDate.text.isEmpty ||
                        currentCompany == null ||
                        (isCurrentCompany ? false : endDate.text.isEmpty) ||
                        employmentType.isEmpty) {
                      setState(() {
                        isVisible = true;
                      });
                      return;
                    }
                    widget.educationDetails(
                        {
                          'organization': organizationName.text,
                          'jobTitle': jobTitle.text,
                          'duration': isCurrentCompany
                              ? 'Currently working from ${joiningDate.text}'
                              : '${joiningDate.text} to ${endDate.text}',
                          'employmentType': selectedEmploymentType,
                        }
                    );
                    Navigator.pop(context);
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
