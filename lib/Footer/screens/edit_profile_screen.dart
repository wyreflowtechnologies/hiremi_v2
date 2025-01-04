import 'package:flutter/material.dart';
import 'package:pre_dashboard/Footer/widget/custom_bottom_bar.dart';
import 'package:pre_dashboard/Footer/widget/custom_options.dart';
import 'package:pre_dashboard/Footer/widget/custom_text_field1.dart';


class EditProfileScreen extends StatefulWidget {
  final Function(Map<String, String>) profileDetails;
  const EditProfileScreen({super.key, required this.profileDetails});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController currentCity = TextEditingController();
  TextEditingController currentPinCode = TextEditingController();
  int currentIndex = 0;
  String differentlyAbled = '';
  bool pinCode = false;
  bool isVisible = false;
  String? selectedState;
  String? careerBreak;
  String? maritalStatus;
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
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
                          borderSide: BorderSide(color: Color(0xFF808080), width: 2),
                        ),
                        floatingLabelStyle:
                        TextStyle(color: Color(0xFF000000), fontWeight: FontWeight.bold),
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
                    error: pinCode ? Text('Please Enter 6 digit pincode') : null,
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFFC1272D), width: 1),
                    ),
                    hintText: '609609',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFF808080), width: 2),
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
                        differentlyAbled.isEmpty ||
                        careerBreak!.isEmpty) {
                      if (currentPinCode.text.length != 6) {
                        setState(() {
                          isVisible = true;
                        });
                      }
                    } else {
                      setState(() {
                        isVisible = false;
                      });
                      widget.profileDetails(
                        {
                          'state': selectedState!,
                          'city': currentCity.text,
                          'maritalStatus': maritalStatus!,
                          'differentlyAbled': differentlyAbled,
                          'careerBreak': careerBreak!
                        }
                      );
                      Navigator.pop(context);
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
      bottomNavigationBar: CustomBottomBar(currentIndex: currentIndex, onTabSelected: (value) {
        setState(() {
          currentIndex = value;
        });
      },),
    );
  }
}
