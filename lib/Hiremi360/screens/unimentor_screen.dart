import 'package:flutter/material.dart';
import 'package:pre_dashboard/Footer/widget/custom_bottom_bar.dart';
import 'package:pre_dashboard/Hiremi360/screens/unimentors_subscribe.dart';
import 'package:pre_dashboard/Hiremi360/widgets/custom_banner.dart';
import 'package:pre_dashboard/Hiremi360/widgets/custom_bottom_bar.dart';
import 'package:pre_dashboard/Hiremi360/widgets/custom_course_profile.dart';
import 'package:pre_dashboard/Hiremi360/widgets/custom_hiremi_program.dart';

import 'package:pre_dashboard/Hiremi360/widgets/custom_info_title.dart';

import 'enquiry_unimentor.dart';

class UnimentorScreen extends StatefulWidget {
  const UnimentorScreen({super.key});

  @override
  State<UnimentorScreen> createState() => _UnimentorScreenState();
}

class _UnimentorScreenState extends State<UnimentorScreen> {
  int currentIndex = 0;
  final List<String> title = [
    'Guaranteed Internship',
    'Internship Certification',
    'Personalized Guidance',
    'Industry Insights',
    'Skill Development',
    'Networking Opportunities',
    'College to Corporate',
    'Personal Branding',
    'Confidence Building',
    'Career Growth Analytics',
    'Referral Program'
  ];
  final List<String> subTitle = [
    'Secure internships in your chosen field and gain hands-on experience to kickstart your professional journey.',
    'Verified internship completion certificates from partner companies.',
    'Receive tailored mentorship aligned with your career goals and aspirations.',
    'Gain practical knowledge from industry experts, diving deep into the corporate world.',
    'Enhance your skill set with curated programs designed to make you job-ready.',
    'Expand your professional network with connections that can influence your career trajectory.',
    'Our program prepares students for corporate life with training in culture, office environment, job readiness, and work-life balance.',
    'Social media and LinkedIn profile optimization to enhance visibility to recruiters.',
    'Build confidence in your abilities through ongoing support and constructive feedback.',
    'Our mentorship program provides personalized growth tracking with detailed progress reports and regular skill feedback.',
    'Earn rewards and discounts by referring friends and peers to the Hiremi mentorship plan.'
  ];
  final List<String> logo = [
    'assets/images/guaranteed_internship.png',
    'assets/images/internship_certification.png',
    'assets/images/personalized_guidance.png',
    'assets/images/industry_insights.png',
    'assets/images/skill_development.png',
    'assets/images/networking_opportunity.png',
    'assets/images/college_to_corporate.png',
    'assets/images/personal_branding.png',
    'assets/images/confidence_building.png',
    'assets/images/career_growth_analytics.png',
    'assets/images/referral_programming.png',
  ];
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
            'Unimentors',
            style: TextStyle(fontSize: size.height*0.025, color: Colors.white),
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
                  size: size.height*0.03,
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
        padding:  EdgeInsets.symmetric(horizontal: size.height*0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              SizedBox(),
              CustomInfoTitle(
                title: 'Why Choose Hiremi Unimentors Program?',
                subTitle1:
                    "Hiremi 360° Unimentors Program is designed to guide you through your entire college journey. Our expert mentors will help you stay updated on market trends, make informed academic decisions, and provide career advice. ",
                subTitle2:
                    "we offer a guaranteed Unimentors in your preferred domain, ensuring you gain practical experience to kickstart your career. With Hiremi, you’ll have the support you need to succeed both academically and professionally.",
              ),
              CustomBanner(
                title: 'Unimentors',
                pana: 'assets/images/pana2.png',
                eclipse: 'assets/images/eclipse2.png',
                colors: [Color(0xFFBE2CB8), Color(0xFF251D9D)],
              ),
              CustomCourseProfile(
                image: 'assets/images/unimentor4.png',
                subTitle:
                    "Our mentorship program assists students in navigating their academic journey, making informed career choices, and preparing for the professional world.",
                status1: "Active Program",
                status2: "You're already enrolled in this program",
                subHeadline: 'Only for 1st & 2nd Year Students',
                backgroundColor1: Color(0xFFF9E1FF),
                backgroundColor2: Color(0xFFA3DE83),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'One-Time Program Pricing',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(colors: [
                            Color(0xFF0075FF),
                            Color(0xFF6D4988),
                            Color(0xFFC1272D)
                          ], stops: [
                            0.55,
                            0.69,
                            1.00
                          ]).createShader(bounds),
                      child: Text(
                        'Mentorship',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ],
              ),
              Container(
                width: size.width * 0.92,
                padding: const EdgeInsets.only(left: 15, top: 30, bottom: 15),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFA72AB4),
                      Color(0xFF4720A3)
                    ], // Purple gradient
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Subscribe to this Unimentors program',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Text(
                          '₹10,000',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          '₹25,000',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            '40% Off',
                            style: TextStyle(
                              fontSize: 9.66,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        const Text(
                          '• Certificate of completion\n'
                          '• Working on live projects\n'
                          '• Portfolio Building\n'
                          '• Guaranteed Internship with client Companies',
                          style: TextStyle(
                            fontSize: 11.07,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.white38,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Note: This program offers mentorship and support throughout the '
                      'candidate\'s college journey, providing guidance every step of the way.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Why Choose Hiremi Mentorship?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(colors: [
                            Color(0xFF0075FF),
                            Color(0xFF6D4988),
                            Color(0xFFC1272D)
                          ], stops: [
                            0.55,
                            0.69,
                            1.00
                          ]).createShader(bounds),
                      child: Text(
                        "The Advantages of Hiremi 360's Mentorship Program.",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ],
              ),
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: title.length,
                  itemBuilder: (context, index) {
                    return CustomHiremiProgram(
                        colors: [
                          Color(0xFFF249DC),
                          Color(0xFF742FB6),
                          Color(0xFF1B1D9C)
                        ],
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UnimentorsSubscribe(),));
                },
                child: Container(
                    width: size.width * 0.92,
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [Color(0xFFA42AB3), Color(0xFF5F22A7)],
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EnquiryUnimentor(),));
                },
                child: Container(
                    width: size.width * 0.92,
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFF6122A7))),
                    child: Center(
                        child: Text(
                          'Enquire Now',
                          style: TextStyle(
                              fontSize: 17,
                              color: Color(0xFF6122A7),
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
