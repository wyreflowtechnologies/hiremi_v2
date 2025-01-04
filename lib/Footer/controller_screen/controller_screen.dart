import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pre_dashboard/Footer/screens/contact_details.dart';
import 'package:pre_dashboard/Footer/screens/edit_profile_screen.dart';
import 'package:pre_dashboard/Footer/screens/edit_profile_screen2.dart';
import 'package:pre_dashboard/Footer/screens/education_screen.dart';
import 'package:pre_dashboard/Footer/screens/experience_screen.dart';
import 'package:pre_dashboard/Footer/screens/languages_screen.dart';
import 'package:pre_dashboard/Footer/screens/project_screen.dart';
import 'package:pre_dashboard/Footer/screens/resume_screen.dart';
import 'package:pre_dashboard/Footer/widget/custom_bottom_bar.dart';
import 'package:pre_dashboard/Footer/widget/custom_circular_progress.dart';
import 'package:pre_dashboard/Footer/widget/custom_text_field3.dart';

import '../widget/horizontal_line.dart';
//Changes by PY
class ControllerScreen extends StatefulWidget {
  final Map<String, String> basicDetails;
  const ControllerScreen({super.key, required this.basicDetails});

  @override
  State<ControllerScreen> createState() => _ControllerScreenState();
}

class _ControllerScreenState extends State<ControllerScreen> {
  TextEditingController fullName = TextEditingController();
  TextEditingController fatherName = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController birthPlace = TextEditingController();
  TextEditingController currentCity = TextEditingController();
  TextEditingController differentlyDisabled = TextEditingController();
  TextEditingController maritalStatus = TextEditingController();
  TextEditingController careerBreak = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController whatsAppNumber = TextEditingController();
  TextEditingController project = TextEditingController();
  TextEditingController languages = TextEditingController();
  List<Map<String, String>> educationDetails = [];
  List<Map<String, String>> experienceDetails = [];
  List<Map<String, String>> projectDetails = [];
  List<Map<String, String>> languageDetails = [];
  Map<String, String> socialLinksDetails = {};
  Map<String, String> profileDetails = {};
  Map<String, String> contactDetails = {};
  int currentIndex = 0;
  int currentScreen = 0;
  final appBarTitle = [
    'Resume',
    'Edit Profile',
    'Education',
    'Experience',
    'Projects',
    'Languages',
    'Edit Profile',
    'Contact details'
  ];

  @override
  Widget build(BuildContext context) {
    var screens = [
      ResumeScreen(),
      EditProfileScreen(
        profileDetails: (p0) {
          setState(() {
            profileDetails = p0;
          });
        },
      ),
      EducationScreen(
        educationDetails: (p0) {
          setState(() {
            educationDetails.add(p0);
          });
        },
      ),
      ExperienceScreen(
        educationDetails: (p0) {
          setState(() {
            experienceDetails.add(p0);
          });
        },
      ),
      ProjectScreen(
        projectDetails: (p0) {
          setState(() {
            projectDetails.add(p0);
          });
        },
      ),
      LanguagesScreen(
        languageDetail: (p0) {
          setState(() {
            languageDetails.add(p0);
          });
        },
      ),
      EditProfileScreen2(
        socialLinksDetails: (p0) {
          setState(() {
            socialLinksDetails = p0;
          });
        },
      ),
      ContactDetails(
        contactDetail: (p0) {
          setState(() {
            contactDetails = p0;
          });
        },
      ),
    ];
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Review and Verify Your Profile',
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
            children: [
              SizedBox(
                  height: size.height * 0.24,
                  child: CustomCircularProgress(progress: 100)),
              const HorizontalLine(),
              SizedBox(
                height: size.height * 0.01,
              ),
              DottedBorder(
                borderType: BorderType.RRect,
                strokeWidth: 1,
                radius: const Radius.circular(8),
                color: const Color(0xff808080),
                dashPattern: const [3, 1],
                child: SizedBox(
                  height: 91,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                            foregroundColor:
                                const WidgetStatePropertyAll(Color(0xff0F3CC9)),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                side:
                                    const BorderSide(color: Color(0xff788DCE)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => screens[0],
                              ));
                        },
                        child: Text(
                          "Update resume",
                          style: GoogleFonts.poppins(
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        "Supported Format: URL",
                        style: GoogleFonts.poppins(
                          fontSize: MediaQuery.of(context).size.width * 0.035,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff808080),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Personal Details',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF0F3CC9),
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                          color: const Color(0xff0F3CC9),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => screens[1],
                          ));
                    },
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                          color: const Color(0xff0F3CC9),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField3(
                labelText: 'Full name',
                hintText: 'Kritish Bokde',
                text: (p0) {
                  setState(() {
                    fullName.text = p0;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField3(
                labelText: "Father's Full Name",
                hintText: 'Subhash Bokde',
                text: (p0) {
                  setState(() {
                    fatherName.text = p0;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField3(
                labelText: 'Gender',
                hintText: 'male',
                text: (p0) {
                  setState(() {
                    gender.text = p0;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField3(
                labelText: 'Date of Birth',
                hintText: '01/08/2005',
                text: (p0) {
                  setState(() {
                    dob.text = p0;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField3(
                labelText: 'Birth Place',
                hintText: 'Maharashtra',
                text: (p0) {
                  setState(() {
                    birthPlace.text = p0;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField3(
                labelText: 'Current City',
                hintText: profileDetails.isEmpty
                    ? "${widget.basicDetails['currentCity']}, ${widget.basicDetails['currentState']}"
                    : "${profileDetails['city']}, ${profileDetails['state']}",
                text: (p0) {
                  setState(() {
                    currentCity.text = p0;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField3(
                labelText: 'Differently Abled',
                hintText: profileDetails.isEmpty
                    ? widget.basicDetails['differentlyAbled']
                    : profileDetails['differentlyAbled'],
                text: (p0) {
                  setState(() {
                    differentlyDisabled.text = p0;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField3(
                labelText: 'Marital Status',
                hintText: profileDetails.isEmpty
                    ? widget.basicDetails['maritalStatus']
                    : profileDetails['maritalStatus'],
                text: (p0) {
                  setState(() {
                    maritalStatus.text = p0;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField3(
                labelText: 'Career Break',
                hintText: profileDetails.isEmpty
                    ? widget.basicDetails['careerBreak']
                    : profileDetails['careerBreak'],
                text: (p0) {
                  setState(() {
                    careerBreak.text = p0;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Contact Details',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF0F3CC9),
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => screens[7],
                          ));
                    },
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                          color: const Color(0xff0F3CC9),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField3(
                labelText: 'Email',
                hintText: 'kritishbokde.official@gmail.com',
                text: (p0) {
                  setState(() {
                    email.text = p0;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField3(
                labelText: 'Contact Number',
                hintText: contactDetails.isEmpty
                    ? widget.basicDetails['contactNumber']
                    : contactDetails['contactNumber'],
                text: (p0) {
                  setState(() {
                    contactNumber.text = p0;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField3(
                labelText: 'WhatsApp Number',
                hintText: contactDetails.isEmpty
                    ? widget.basicDetails['whatsAppNumber']
                    : contactDetails['whatsAppNumber'],
                text: (p0) {
                  setState(() {
                    whatsAppNumber.text = p0;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Education Details',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF0F3CC9),
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                          color: const Color(0xff0F3CC9),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => screens[2],
                          ));
                    },
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                          color: const Color(0xff0F3CC9),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              educationDetails.isEmpty
                  ? Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${widget.basicDetails['degree']}, ${widget.basicDetails['branch']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${widget.basicDetails['collegeCity']}, ${widget.basicDetails['collegeState']}",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.chevron_right_sharp,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            Text(
                              "${widget.basicDetails['passOutYear']} | Percentage: ${widget.basicDetails['percentage']}",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: educationDetails.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 0.5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${educationDetails[index]['degree']!}, ${educationDetails[index]['branch']}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${educationDetails[index]['city']}, ${educationDetails[index]['state']}",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Icon(
                                          Icons.chevron_right_sharp,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "${educationDetails[index]['passOutYear']} | Percentage: ${educationDetails[index]['percentage']}",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Experience',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF0F3CC9),
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => screens[3],
                          ));
                    },
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                          color: const Color(0xff0F3CC9),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              experienceDetails.isEmpty
                  ? Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.basicDetails['jobTitle']!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.basicDetails['organization']!,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Icon(
                                  Icons.chevron_right_sharp,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            Text(
                              widget.basicDetails['jobTitle']!,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: experienceDetails.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 0.5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      experienceDetails[index]['jobTitle']!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          experienceDetails[index]
                                              ['organization']!,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Icon(
                                          Icons.chevron_right_sharp,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      experienceDetails[index]['duration']!,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Projects',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF0F3CC9),
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => screens[4],
                          ));
                    },
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                          color: const Color(0xff0F3CC9),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              projectDetails.isEmpty
                  ? Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.basicDetails['projectTitle']!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.basicDetails['projectLink']!,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Icon(
                                  Icons.chevron_right_sharp,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            Text(
                              widget.basicDetails['projectDescription']!,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: projectDetails.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 0.5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      projectDetails[index]['projectTitle']!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          projectDetails[index]['projectLink']!,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Icon(
                                          Icons.chevron_right_sharp,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      projectDetails[index]
                                          ['projectDescription']!,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Social Links',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF0F3CC9),
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => screens[6],
                          ));
                    },
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                          color: const Color(0xff0F3CC9),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.black,
                          width: 0.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.linkedin,
                            color: Color(0xFF0076B2),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            socialLinksDetails.isEmpty
                                ? widget.basicDetails['linkedIn']!
                                : socialLinksDetails['linkedIn']!,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.black,
                          width: 0.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.github,
                            color: Color(0xFF000000),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            socialLinksDetails.isEmpty
                                ? widget.basicDetails['gitHub']!
                                : socialLinksDetails['gitHub']!,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Languages',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF0F3CC9),
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => screens[5],
                          ));
                    },
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                          color: const Color(0xff0F3CC9),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              languageDetails.isEmpty
                  ? Container(
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border:
                  Border.all(color: Colors.black, width: 0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 20.0, left: 10, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.basicDetails['language']!,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text(
                        widget.basicDetails['proficiency']!,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
              )
                  : SizedBox(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: languageDetails.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 0.5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0, left: 10, top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      languageDetails[index]['language']!,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      languageDetails[index]['proficiency']!,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F3CC9),
                    fixedSize: Size(size.width * 0.5, size.height * 0.05),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.download,
                        color: Colors.white,
                      ),
                      const Text(
                        'Download Resume',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
          currentIndex: currentIndex,
          onTabSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          }),
    );
  }
}
