
import 'package:flutter/material.dart';
import 'package:pre_dashboard/Footer/widget/custom_bottom_bar.dart';
import 'package:pre_dashboard/HomePage/Widget/ExpandableText.dart';



// ignore: camel_case_types
class About_App extends StatefulWidget {
  const About_App({Key? key}) : super(key: key);


  @override
  State<About_App> createState() => _About_AppState();
}


// ignore: camel_case_types
class _About_AppState extends State<About_App> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "About App",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        centerTitle: true,
        actions: [

        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              right: screenWidth * 0.04,
              bottom: screenWidth * 0.04),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/Group_2nd_288905.png',
                //  height: screenHeight * 0.400,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ExpandableText(
                    title: '1. Verification Process',
                    description:
                    'To access the app\'s full functionalities, users need to complete a verification process. Enter your details and pay a minimal fee to get verified. This ensures that all users are genuine, creating a trusted environment for both candidates and recruiters.',
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const ExpandableText(
                      title: '2. App ID',
                      description:
                      'Once verified, each candidate is assigned a unique App ID. This ID signifies your verified status and is used during interviews, form fillings, and other processes, ensuring a smooth and authenticated experience.'),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const ExpandableText(
                      title: '3. Queries Section',
                      description:
                      'Candidates can raise career-related queries by selecting options from a dropdown menu. Each query generates a ticket, and a meeting is scheduled within a specific time limit. Please note that there is a cooldown period of 15 days before you can raise another query, ensuring regular guidance and support.'),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const ExpandableText(
                      title: '4. Interview Application Process',
                      description:
                      'After applying for an internship, your application is reviewed by the HR team. If shortlisted, you will be contacted for an interview within a specified timeframe.'),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const ExpandableText(
                      title: '5. Job Application Process',
                      description:
                      'Similar to the internship process, job applications are reviewed by the HR team. Shortlisted candidates will be called for an interview. If additional documentation or a security fee is required, you will be notified.'),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const ExpandableText(
                      title: '6. Applies Section',
                      description:
                      'This section tracks all your applications and their statuses. Monitor your application progress and view results conveniently in one place.'),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const ExpandableText(
                      title: '7. ⁠Profile Section',
                      description:
                      'Ensure your profile is fully completed with all relevant details. Recruiters prefer candidates with comprehensive profiles, increasing your chances of being shortlisted.'),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const ExpandableText(
                      title: '8. Help and Support',
                      description:
                      'For any queries related to app features, bugs, feedback, or other concerns, visit the Help and Support section. We are here to assist you and ensure a seamless user experience.'),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hiremi 360 Degree Program',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      const Text(
                        'Hiremi 360 Degree provides a variety of opportunities that comprehensively guide, teach, and train candidates in their specific domains. This includes mentorship programs, corporate training, and specialized training, ensuring well-rounded development and career success.',
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const ExpandableText(
                      title: '9. UniMentors Program',
                      description:
                      'Once a candidate enrolls in our Mentorship Program, they\'ll receive continuous guidance from Hiremi throughout their degree. Time to time meetings will be scheduled to provide personalized advice and address all their career-related queries. Additionally, they will gain hands-on experience through internships as part of the mentorship plan.'),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const ExpandableText(
                      title: '10. ⁠Corporate Training',
                      description:
                      'Candidates enrolled in our corporate training program will work with a client company for one year. This experience provides valuable skills and an experience letter upon completion.'),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const ExpandableText(
                      title: '11. Training Program',
                      description:
                      'Our training programs offer comprehensive education tailored to your specific interests, such as frontend development, java development, human resources, marketing, finance and more. Lasting 1-6 months, these programs include internships for hands-on learning,  providing practical experience alongside theoretical knowledge.'),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                ],
              )

            ],
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomBar(
      //   currentIndex: currentIndex,
      //   onTabSelected: (value) {
      //     setState(() {
      //       currentIndex = value;
      //     });
      //   },
      // ),
    );
  }
}
