import 'package:flutter/material.dart';
import 'package:pre_dashboard/Footer/widget/custom_bottom_bar.dart';

import 'package:pre_dashboard/Hiremi360/screens/enquiry_training_internship.dart';
import 'package:pre_dashboard/Hiremi360/screens/training_subscribe.dart';
import 'package:pre_dashboard/Hiremi360/widgets/custom_banner.dart';
import 'package:pre_dashboard/Hiremi360/widgets/custom_bottom_bar.dart';
import 'package:pre_dashboard/Hiremi360/widgets/custom_course_profile.dart';
import 'package:pre_dashboard/Hiremi360/widgets/custom_hiremi_program.dart';
import 'package:pre_dashboard/Hiremi360/widgets/custom_select_program.dart';

class TrainingInternshipScreen extends StatefulWidget {
  const TrainingInternshipScreen({super.key});

  @override
  State<TrainingInternshipScreen> createState() =>
      _TrainingInternshipScreenState();
}

class _TrainingInternshipScreenState extends State<TrainingInternshipScreen> {
  int currentIndex = 0;
  final List<String> title = [
    'Personalized Guidance',
    'Industry Insights',
    'Skill Development',
    'Networking Opportunity',
    'Confidence Building',
    'Guaranteed Internship'
  ];
  final List<String> logo = [
    'assets/images/personalized_guidance.png',
    'assets/images/industry_insights.png',
    'assets/images/skill_development.png',
    'assets/images/networking_opportunity.png',
    'assets/images/confidence_building.png',
    'assets/images/guaranteed_internship.png',
  ];
  final List<String> subTitle = [
    'Receive tailored mentorship aligned with your career goals and aspirations.',
    'Gain practical knowledge from industry experts, diving deep into the corporate world.',
    'Enhance your skill set with curated programs designed to make you job-ready.',
    'Expand your professional network with connections that can influence your career trajectory.',
    'Build confidence in your abilities through ongoing support and constructive feedback.',
    'Secure internships in your chosen field and gain hands-on experience to kickstart your professional journey.'
  ];
  final List<String> image = ['assets'];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(colors: [
            Color(0xFFC1272D),
            Color(0xFF5B509B),
            Color(0xFF0075FF)
          ], stops: [
            0.37,
            0.78,
            1.0
          ], begin: Alignment.bottomLeft, end: Alignment.topRight)
              .createShader(bounds),
          child: Text(
            'Training + Internship',
            style: TextStyle(fontSize: size.height*0.023, color: Colors.white),
          ),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.chevron_left)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Stack(
              children: [
                 Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: size.height*0.04,
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
        padding:  EdgeInsets.symmetric(horizontal:size.height*0.022),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              SizedBox(),
              CustomBanner(
                title: 'Training + internship',
                pana: 'assets/images/pana.png',
                eclipse: 'assets/images/eclipse.png',
                colors: [Color(0xFF95152F), Color(0xFFEFC59B)],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Programs',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.044,
                        color: Colors.black),
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(colors: [
                      Color(0xFF0075FF),
                      Color(0xFF5B509B),
                      Color(0xFFC1272D),
                    ], stops: [
                      0.37,
                      0.68,
                      1.0
                    ], begin: Alignment.bottomLeft, end: Alignment.topRight)
                        .createShader(bounds),
                    child: Text(
                      'Mentorship',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  )
                ],
              ),
              CustomSelectProgram(),
              CustomCourseProfile(
                image: 'assets/images/training_internship4.png',
                subTitle:
                    "Our Training + Internship assists students in navigating their academic journey, making informed career choices, and preparing for the professional world.",
                status1: 'Not Active Program',
                status2: "Please enroll now to jumpstart your journey!",
                subHeadline: 'Addon for College Students',
                backgroundColor1: Color(0xFFEFC59B),
                backgroundColor2: Color(0xFFFC3C3C),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Why Choose Hiremi Training + Internship?',
                    style: TextStyle(
                        fontSize: size.width * 0.055,
                        fontWeight: FontWeight.bold),
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(colors: [
                      Color(0xFF0075FF),
                      Color(0xFF5B509B),
                      Color(0xFFC1272D),
                    ], stops: [
                      0.37,
                      0.68,
                      1.0
                    ], begin: Alignment.bottomLeft, end: Alignment.topRight)
                        .createShader(bounds),
                    child: Text(
                      "The Advantages of Hiremi 360's Mentorship Program",
                      style: TextStyle(fontSize: size.height*0.01, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                child: ListView.builder(
                  itemCount: title.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CustomHiremiProgram(
                        colors: [Color(0xFFC1272D), Color(0xFFC1272D)],
                        logo: logo[index],
                        title: title[index],
                        subTitle: subTitle[index]);
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TrainingSubscribe(),));
                },
                child: Container(
                    width: size.width * 0.92,
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [Color(0xFFEFC59B), Color(0xFFC1272D)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    child: Center(
                        child: Text(
                      'Enroll Now',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ))),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EnquiryTrainingInternship(),));
                },
                child: Container(
                    width: size.width * 0.92,
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFFC1272D))),
                    child: Center(
                        child: Text(
                      'Enquire Now',
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFFC1272D),
                          fontWeight: FontWeight.bold),
                    ))),
              ),
              SizedBox(),
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
