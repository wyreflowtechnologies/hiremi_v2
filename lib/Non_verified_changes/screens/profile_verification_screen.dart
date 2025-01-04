import 'package:flutter/material.dart';
import 'package:pre_dashboard/Non_verified_changes/widgets/custom_drawer.dart';
import 'package:pre_dashboard/Non_verified_changes/widgets/custombottombar.dart';
import 'package:pre_dashboard/Non_verified_changes/widgets/gradient_progress_bar.dart';


import '../widgets/gradient_text.dart';

class ProfileVerificationScreen extends StatefulWidget {
  final int currentIndex;
  const ProfileVerificationScreen({super.key, required this.currentIndex});

  @override
  State<ProfileVerificationScreen> createState() =>
      _ProfileVerificationScreenState();
}

class _ProfileVerificationScreenState extends State<ProfileVerificationScreen>
    with SingleTickerProviderStateMixin {
  late int realIndex;
  late bool isAnimate = false;
  late AnimationController _controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    realIndex = widget.currentIndex;
    isAnimate = true;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Profile Verification',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
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
                          style:
                          TextStyle(fontSize: size.width * 0.023, fontWeight: FontWeight.bold, color: const Color(0xFF0F3CC9)),
                        )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.03),
              Image.asset('assets/images/profile_verification_icon.png',
              height: size.height*0.12,
              ),
              SizedBox(height: size.height * 0.02),
              const GradientText(
                'Verification in Progress',
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF163EC8),
                    Color(0xFF0870FF),
                    Color(0xFF378EFF),
                    Color(0xFF89C1FF),
                  ],
                ),
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.02),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'Our team is currently verifying your profile, and this\n',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF163EC8)),
                  children: [
                    TextSpan(
                      text: 'process typically takes between 12 to 36 hours.',
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "Once the verification is complete, you'll have full\n",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF163EC8)),
                  children: [
                    TextSpan(
                      text: 'access to the application.',
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.04),
              const GradientProgressBar(),
              SizedBox(height: size.height * 0.02),
              Image.asset('assets/images/PV2.png'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Custombottombar(
        currentIndex: realIndex,
        onTabSelected: (index) => setState(() {
          realIndex = index;
        }),
      ),
    );
  }
}
