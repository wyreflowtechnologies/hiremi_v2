import 'package:flutter/material.dart';
import 'package:pre_dashboard/Footer/widget/custom_bottom_bar.dart';

import 'package:pre_dashboard/Hiremi360/screens/corporate_subscribe.dart';
import 'package:pre_dashboard/Hiremi360/screens/enquiry_corporate_launchpad.dart';
import 'package:pre_dashboard/Hiremi360/widgets/custom_advantage_success.dart';
import 'package:pre_dashboard/Hiremi360/widgets/custom_banner.dart';
import 'package:pre_dashboard/Hiremi360/widgets/custom_bottom_bar.dart';
import 'package:pre_dashboard/Hiremi360/widgets/custom_course_profile.dart';
import 'package:pre_dashboard/Hiremi360/widgets/custom_info_title.dart';

import '../widgets/custom_hiremi_program.dart';

class CorporateLaunchpadScreen extends StatefulWidget {
  const CorporateLaunchpadScreen({super.key});

  @override
  State<CorporateLaunchpadScreen> createState() =>
      _CorporateLaunchpadScreenState();
}

class _CorporateLaunchpadScreenState extends State<CorporateLaunchpadScreen> {
  int currentIndex = 0;
  final List<String> title1 = [
    'Enrolment in the Program',
    'Document Processing',
    'Corporate Work Environment'
  ];
  final List<String> subTitle2 = [
    'Kickstart your journey to employability by enrolling in our Corporate Training Program. This is your first step towards continuous learning and embarking on a transformative career path.',
    "Begin with a simple and efficient onboarding process. Submit your necessary documents, and once verified, you're officially enrolled in our Corporate Training Program.",
    "Our program isn't just about theoretical knowledge. Gain direct working experience in real corporate settings, ensuring a smooth transition from the classroom to the professional world."
  ];
  final List<String> title = [
    'Guaranteed Internships',
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
            'Corporate Launchpad',
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
                  size: size.height*0.033,
                ),
                Positioned(
                  top: size.height * 0.001,
                  right: size.width * 0.008,
                  child: Container(
                    height: size.height * 0.015,
                    width: size.width * 0.033,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.height*0.023),
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
        padding:  EdgeInsets.symmetric(horizontal: size.height*0.023),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(),
              CustomInfoTitle(
                  title: 'Why Choose Hiremi Corporate Training?',
                  subTitle1:
                      "At Hiremi, our Corporate Training program is designed to foster comprehensive learning, embrace diversity, and promote career excellence. ",
                  subTitle2:
                      "We provide hands-on expertise, practical exercises, and a structured curriculum, equipping individuals with the skills needed to tackle real-world challenges efficiently."),
              CustomBanner(
                  title: 'Corporate Launchpad',
                  pana: 'assets/images/pana3.png',
                  eclipse: 'assets/images/eclipse2.png',
                  colors: [Color(0xFF4F8EB0), Color(0xFF100073)]),
              CustomCourseProfile(
                image: 'assets/images/corporate_launchpad4.png',
                subTitle:
                    "Our mentorship program assists students in navigating their academic journey, making informed career choices, and preparing for the professional world.",
                status1: 'Not active program',
                status2: 'Please enroll now to jumpstart your journey!',
                subHeadline: 'Only for College Pass-Out Students',
                backgroundColor1: Color(0xFF3F6BA1).withOpacity(0.2),
                backgroundColor2: Color(0xFFFC3C3C),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'One-Year Program Pricing',
                    style: TextStyle(fontSize: size.height*0.023, fontWeight: FontWeight.bold),
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
                        'Corporate Training',
                        style: TextStyle(
                            fontSize: size.height*0.023,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ],
              ),
              Container(
                width: size.width * 0.92,
                padding: EdgeInsets.all(size.height*0.023),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  gradient: LinearGradient(
                    colors: [Color(0xFF477BA8), Color(0xFF1E1F80)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Standard Package',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: size.height*0.018,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text(
                          '₹2,50,000',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: size.height*0.023,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          '₹3,97,500',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: size.height*0.013,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(width: size.height*0.01),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.height*0.011,
                            vertical: size.height*0.011,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(size.height*0.023),
                          ),
                          child: Text(
                            '59% Off',
                            style: TextStyle(
                              color: Colors.blue.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: size.height*0.013,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height*0.023),
                    Divider(color: Colors.white.withOpacity(0.7)),
                    SizedBox(height:size.height*0.023),
                    Text(
                      'Note: This program offers mentorship and support throughout the candidate\'s college journey, providing guidance every step of the way.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.height*0.013,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Essential Skills for Success',
                    style: TextStyle(fontSize: size.height*0.019, fontWeight: FontWeight.bold),
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
                      "The Advantages of Hiremi 360's Corporate Training Program.",
                      style: TextStyle(
                          fontSize: size.height*0.018,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
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
                          Color(0xFF4578A6),
                          Color(0xFF2F4791),
                          Color(0xFF1E2181)
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Essential Skills for Success',
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
                      "The Advantages of Hiremi 360's Corporate Training Program.",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: title1.length,
                  itemBuilder: (context, index) {
                    return CustomAdvantageSuccess(
                      title1: title1[index],
                      subTitle1: subTitle2[index],
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CorporateSubscribe(),));
                },
                child: Container(
                  width: size.width * 0.92,
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [Color(0xFF467AA7), Color(0xFF1F2181)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                  child: Center(
                    child: Text(
                      'Enroll Now',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EnquiryCorporateLaunchpad(),));
                },
                child: Container(
                  width: size.width * 0.92,
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFF202382))),
                  child: Center(
                    child: Text(
                      'Enquire Now',
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFF202382),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
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
