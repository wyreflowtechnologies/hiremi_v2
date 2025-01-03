import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/animation.dart';
import 'package:pre_dashboard/Footer/widget/custom_bottom_bar.dart';
import 'package:pre_dashboard/HomePage/constants/constantsColor.dart';
import '../Widget/carouselSection.dart';
import '../Widget/customAppBar.dart';
import '../Widget/customBottomNavbar.dart';
import '../Widget/customDrawer.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../Widget/featuredGrid.dart';
import '../Widget/jobsForYouSection.dart';
import '../Widget/verificationCard.dart';
import 'askExpertScreen.dart';
import 'hiremi360Screen.dart';
import 'jobsScreen.dart';
import 'statusScreen.dart';

class HomeScreen extends StatefulWidget {
  final bool isVerified;
  const HomeScreen({Key? key, required this.isVerified}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with TickerProviderStateMixin {
  bool _isFeaturedSectionVisible = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
     _showAlertBox(context);
    });
  }







  // void _showAlertBox(BuildContext context) {
  //   // Initialize the confetti controller
  //   ConfettiController _confettiController =
  //   ConfettiController(duration: const Duration(seconds: 6));
  //
  //   // Start the confetti animation
  //   _confettiController.play();
  //
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) {
  //       // Get screen size using MediaQuery
  //       double screenHeight = MediaQuery.of(context).size.height;
  //       double screenWidth = MediaQuery.of(context).size.width;
  //
  //       // Animation controller to control fade-in effect
  //       AnimationController _animationController = AnimationController(
  //         duration: const Duration(seconds: 3), // Duration of the fade-in effect
  //         vsync: this, // Use `this` because `TickerProviderStateMixin` is mixed in
  //       );
  //
  //       // Fade animation
  //       Animation<double> _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
  //           .animate(CurvedAnimation(
  //         parent: _animationController,
  //         curve: Curves.easeIn,
  //       ));
  //
  //       // Start the animation when the dialog is built
  //       _animationController.forward();
  //
  //       return AlertDialog(
  //         contentPadding: EdgeInsets.zero, // Remove default padding
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             // Upper blue part with confetti animation
  //             ClipRRect(
  //               borderRadius: const BorderRadius.only(
  //                 topLeft: Radius.circular(20.0),
  //                 topRight: Radius.circular(20.0),
  //               ),
  //
  //               child: Stack(
  //                 children: [
  //                   Container(
  //                     color:Color(0xFF163EC8),
  //                     height: screenHeight * 0.22,
  //                     width: screenWidth * 0.8,
  //                     child: Center(
  //                       child: Padding(
  //                         padding:  EdgeInsets.only(left: screenWidth*0.28),
  //                         child: Text(
  //                           "Not just a milestone, but \na masterpiece of\nsuccess!",
  //                           style:  TextStyle(
  //                             color: Colors.white,
  //                             fontSize:screenWidth*0.04,
  //                             fontWeight: FontWeight.bold, // Make text bold
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //
  //                   // Gap between the container and the image
  //                   Positioned(
  //                     top: screenHeight * 0.04, // Position this below the container
  //                     left: screenHeight * 0.02, // Position this below the container
  //
  //                     child: Image.asset("assets/images/award.png",
  //                     height: screenWidth*0.29,
  //                       width: screenWidth*0.2,
  //                     ),
  //                   ),
  //
  //                   Positioned.fill(
  //                     child: Align(
  //                       alignment: Alignment.center,
  //                       child: ConfettiWidget(
  //                         confettiController: _confettiController,
  //                         blastDirectionality: BlastDirectionality.explosive,
  //                         maxBlastForce: 40, // Lower blast force for slower movement
  //                         minBlastForce: 30, // Lower blast force for slower movement
  //                         emissionFrequency: 0.05, // Slightly slower frequency
  //                         numberOfParticles: 50, // Keep intensity the same
  //                         gravity: 0.7, // Reduced gravity for slower rain effect
  //                         shouldLoop: true, // Keep animation looping
  //                         colors: const [
  //                           Colors.red,
  //                           Colors.green,
  //                           Colors.blue,
  //                           Colors.yellow,
  //                           Colors.orange,
  //                           Colors.purple,
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               )
  //               ,
  //             ),
  //             // White part with a button and animated text
  //             Container(
  //               color: Colors.transparent,
  //               height: screenHeight * 0.18,
  //               width: screenWidth * 0.8,
  //               child: Padding(
  //                 padding: EdgeInsets.only(top: screenWidth * 0.05),
  //                 child: Column(
  //                   children: [
  //                     FadeTransition(
  //                       opacity: _fadeAnimation,
  //                       child: RichText(
  //                         textAlign: TextAlign.center,
  //                         text: TextSpan(
  //                           style: const TextStyle(
  //                             fontSize: 18.0,
  //                             fontWeight: FontWeight.bold,
  //                             color: Colors.black,
  //                           ),
  //                           children: [
  //                             TextSpan(
  //                               text: "Congratulations!\n",
  //                               style: TextStyle(color: Color(0xFF163EC8),), // Change this color as needed
  //                             ),
  //                             TextSpan(
  //                               text: "Your account has been created",
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //
  //                     const SizedBox(height: 10),
  //
  //                     ElevatedButton(
  //                       onPressed: () {
  //                         Navigator.of(context).pop();
  //                         setState(() {
  //                           _isFeaturedSectionVisible = true; // Show FeaturedSection
  //                         });
  //                       },
  //                       style: ElevatedButton.styleFrom(
  //                         foregroundColor: Colors.blue, backgroundColor: Colors.white, // Text color
  //                         side: BorderSide(color: Color(0xFF163EC8),), // Border color
  //                       ),
  //                       child: Text("Continue",
  //                         style: TextStyle(
  //                           color: Color(0xFF163EC8),
  //                         ),
  //                       ),
  //                     )
  //
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  //
  //   // Dispose of the controller after animation
  //   Future.delayed(const Duration(seconds: 4), () {
  //     _confettiController.dispose();
  //   });
  // }
  void _showAlertBox(BuildContext context) {
    // Initialize the confetti controller
    ConfettiController _confettiController =
    ConfettiController(duration: const Duration(seconds: 6));

    // Start the confetti animation
    _confettiController.play();

    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            // Return false to prevent closing when back button is pressed
            return false;
          },
          child: Builder(
            builder: (context) {
              // Get screen size using MediaQuery
              double screenHeight = MediaQuery.of(context).size.height;
              double screenWidth = MediaQuery.of(context).size.width;

              // Animation controller to control fade-in effect
              AnimationController _animationController = AnimationController(
                duration: const Duration(seconds: 3), // Duration of the fade-in effect
                vsync: this, // Use `this` because `TickerProviderStateMixin` is mixed in
              );

              // Fade animation
              Animation<double> _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
                  .animate(CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeIn,
              ));

              // Start the animation when the dialog is built
              _animationController.forward();

              return AlertDialog(
                contentPadding: EdgeInsets.zero, // Remove default padding
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Upper blue part with confetti animation
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            color: Color(0xFF163EC8),
                            height: screenHeight * 0.22,
                            width: screenWidth * 0.8,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: screenWidth * 0.28),
                                child: Text(
                                  "Not just a milestone, but \na masterpiece of\nsuccess!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.bold, // Make text bold
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Gap between the container and the image
                          Positioned(
                            top: screenHeight * 0.04, // Position this below the container
                            left: screenHeight * 0.02, // Position this below the container
                            child: Image.asset(
                              "assets/images/award.png",
                              height: screenWidth * 0.29,
                              width: screenWidth * 0.2,
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: ConfettiWidget(
                                confettiController: _confettiController,
                                blastDirectionality: BlastDirectionality.explosive,
                                maxBlastForce: 40, // Lower blast force for slower movement
                                minBlastForce: 30, // Lower blast force for slower movement
                                emissionFrequency: 0.05, // Slightly slower frequency
                                numberOfParticles: 50, // Keep intensity the same
                                gravity: 0.7, // Reduced gravity for slower rain effect
                                shouldLoop: true, // Keep animation looping
                                colors: const [
                                  Colors.red,
                                  Colors.green,
                                  Colors.blue,
                                  Colors.yellow,
                                  Colors.orange,
                                  Colors.purple,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // White part with a button and animated text
                    Container(
                      color: Colors.transparent,
                      height: screenHeight * 0.18,
                      width: screenWidth * 0.8,
                      child: Padding(
                        padding: EdgeInsets.only(top: screenWidth * 0.05),
                        child: Column(
                          children: [
                            FadeTransition(
                              opacity: _fadeAnimation,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Congratulations!\n",
                                      style: TextStyle(
                                        color: Color(0xFF163EC8),
                                      ), // Change this color as needed
                                    ),
                                    TextSpan(
                                      text: "Your account has been created",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  _isFeaturedSectionVisible = true; // Show FeaturedSection
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.blue,
                                backgroundColor: Colors.white, // Text color
                                side: BorderSide(color: Color(0xFF163EC8)), // Border color
                              ),
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  color: Color(0xFF163EC8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );

    // Dispose of the controller after animation
    Future.delayed(const Duration(seconds: 4), () {
      _confettiController.dispose();
    });
  }






  int _selectedIndex = 0;
  int currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // Move _screens to the build method or make it a getter
    final List<Widget> screens = [

      SingleChildScrollView(

        child: Column(
          children: [

            VerificationSection(),
            CarouselSection(),
            // FeaturedSection(),
            Container(
              color: Colors.white,
              height: screenHeight * 0.420, // Use a percentage of screen height (e.g., 30% of screen height)

              child: _isFeaturedSectionVisible
                  ? FeaturedSection(isVerified:widget.isVerified) // Show the FeaturedSection when true
                  : Container(), // Empty container when false (still preserves the space)
            ),
            JobsForYouSection(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),

      const JobsScreen(),
      const AskExpertPage(),
      const StatusScreen(),
      const Hiremi360Screen(),
    ];

    return WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: Scaffold(
        appBar: const CustomAppBar(),
        drawer: const CustomDrawer(),
        body: IndexedStack(
          index: _selectedIndex,
          children: screens,
        ),
        bottomNavigationBar: CustomBottomBar(
          currentIndex: currentIndex,
          onTabSelected: (value) {
            setState(() {
              currentIndex = value;
            });
          },
        ),
      ),
    );
  }
}
