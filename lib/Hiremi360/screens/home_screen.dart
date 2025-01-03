import 'package:flutter/material.dart';
import 'package:pre_dashboard/Footer/widget/custom_bottom_bar.dart';
import 'package:pre_dashboard/Hiremi360/screens/corporate_launchpad_screen.dart';
import 'package:pre_dashboard/Hiremi360/screens/training_internship_screen.dart';
import 'package:pre_dashboard/Hiremi360/screens/unimentor_screen.dart';
import 'package:pre_dashboard/Hiremi360/widgets/custom_bottom_bar.dart';
import 'package:pre_dashboard/Hiremi360/widgets/custom_hiremi_featured.dart';
import 'package:pre_dashboard/Hiremi360/widgets/custom_learn_more_about_program.dart';
import 'package:pre_dashboard/Hiremi360/widgets/popupmsgfor360.png.dart';
import 'package:pre_dashboard/HomePage/Widget/customDrawer.dart';


class HomeScreen360 extends StatefulWidget {
  const HomeScreen360({super.key});

  @override
  State<HomeScreen360> createState() => _HomeScreen360State();
}

class _HomeScreen360State extends State<HomeScreen360> {
  int currentIndex = 4;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
                  colors: [Color(0xFFC1272D), Color(0xFF0075FF)],
                  stops: [0.78, 1.0],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight)
              .createShader(bounds),
          child: Text(
            'Hiremi 360',
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
        centerTitle: true,

        // leading: Container(
        //     decoration: BoxDecoration(
        //       color: Color(0xFFECF5FF),
        //       borderRadius: BorderRadius.circular(100),
        //     ),
        //     child: Center(child: Image.asset('assets/images/appBarMenu.png'))),
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
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 20,
            children: [
               SizedBox(
                height: size.height*0.02,
              ),
              Image.asset('assets/images/top_banner.png'),
              Text(
                "Hiremi 360's Featured",
                style: TextStyle(
                    fontSize: size.height*0.02,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8,
                  children: [
                     SizedBox(
                      width: size.width*0.001,
                    ),
                    CustomHiremiFeatured(
                      image: 'assets/images/unimentor1.png',
                      logo: 'assets/images/unimentor2.png',
                      title: 'Unimentor Program',
                      onTap: () {
                        showCustomPopupfor360(context);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => UnimentorScreen(),
                        //     ));
                      },
                    ),
                    CustomHiremiFeatured(
                      image: 'assets/images/training_internship1.png',
                      logo: 'assets/images/training_internship2.png',
                      title: 'Training + Internship',
                      onTap: () {
                        showCustomPopupfor360(context);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => TrainingInternshipScreen(),
                        //     ));
                      },
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right: size.height*0.001),
                      child: CustomHiremiFeatured(
                        image: 'assets/images/corporate_launchpad1.png',
                        logo: 'assets/images/corporate_launchpad2.png',
                        title: 'Corporate Launchpad',
                        onTap: () {
                          showCustomPopupfor360(context);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => CorporateLaunchpadScreen(),
                          //     ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Learn More About Programs",
                style: TextStyle(
                    fontSize: size.width*0.03,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              CustomLearnMoreAboutProgram(
                title: 'Training + Internship Program',
                subTitle:
                    'Practical internship experience to equip participants with essential skills and real-world knowledge.',
                image: 'assets/images/training_internship3.png',
              ),
              CustomLearnMoreAboutProgram(
                title: 'Unimentor Program',
                subTitle:
                    'Personalized guidance from industry experts to help individuals achieve their career goals.',
                image: 'assets/images/unimentor3.png',
              ),
              CustomLearnMoreAboutProgram(
                title: 'Corporate Launchpad',
                subTitle:
                    "Customized training solutions designed to enhance the skills and productivity of a company's workforce.",
                image: 'assets/images/corporate_launchpad3.png',
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
