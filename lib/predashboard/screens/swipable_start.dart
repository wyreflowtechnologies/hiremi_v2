import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pre_dashboard/predashboard/screens/LoginScreen.dart';
import 'package:pre_dashboard/predashboard/widgets/custom_loading_bar.dart';
import '../constants/constants.dart';
import '../widgets/swipable_element.dart';
import '../widgets/slide_indicator.dart';
import '../widgets/swipe_button.dart';

///State will be managed better with Global and Scalable State management tools (BLoC || Provider)
///For Representational purposed setState is used here.
///Following that more refactoring can be achieved hence clearer code
///left app bar arrow is not managed as state yet.



class SwipableStartScreen extends StatefulWidget {
  const SwipableStartScreen({super.key});

  @override
  State<SwipableStartScreen> createState() => _SwipableStartScreenState();
}

class _SwipableStartScreenState extends State<SwipableStartScreen> {
  final PageController _pageController = PageController();

  late Timer _timer;
  int _currentPageIndex = 0;
  final int _totalPages = 3;
  double _loadingProgress = 0.0;
  bool isDragged = false;
  Color trackColor = Colors.white;
  bool _hasNavigated = false; // Flag to track if navigation happened

  final TextConstants textConstants = TextConstants();
  final ImageDirectoryConstants imageConstants = ImageDirectoryConstants();

  static const int totalTime = 5500; // 3 seconds
  static const int durationPerPage = totalTime ~/ 3; // 1000ms per page for 3 pages

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(milliseconds: durationPerPage), (Timer timer) {
      if (_currentPageIndex < _totalPages - 1) {
        _currentPageIndex++;
        _pageController.animateToPage(
          _currentPageIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _timer.cancel();
        _navigateToLogin();
      }
    });
  }
  void _navigateToLogin() {
    if (!_hasNavigated) {  // Check if navigation has already occurred
      setState(() {
        _hasNavigated = true;  // Set the flag to true after navigation
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreenUpdated(),
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: screenWidth * 0.05,
            ),
            onPressed: () {},
          ),
          Expanded(
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Hire',
                      style: TextStyle(color: Colors.black,
                        fontSize: screenWidth*0.064,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    TextSpan(
                      text: 'mi',
                      style: TextStyle(color: Colors.blue,
                          fontSize: screenWidth*0.064,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Icon(
            Icons.chevron_right,
            size: screenWidth * 0.05,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.025),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  SwipableElement(
                    isFirst: true,
                    topTextfirst: textConstants.kPage1TopTextFirst,
                    topTextsecond: textConstants.kPage1TopTextSecond,
                    foreground: imageConstants.kPage1Image,
                    bottomText: textConstants.kPage1BottomText,
                  ),
                  SwipableElement(
                    isFirst: false,
                    topTextfirst: textConstants.kPage2TopTextFirst,
                    topTextsecond: textConstants.kPage2TopTextSecond,
                    foreground: imageConstants.kPage2Image,
                    bottomText: textConstants.kPage2BottomText,
                  ),
                  SwipableElement(
                    isFirst: false,
                    topTextfirst: textConstants.kPage3TopTextFirst,
                    topTextsecond: textConstants.kPage3TopTextSecond,
                    foreground: imageConstants.kPage3Image,
                    bottomText: textConstants.kPage3BottomText,
                  ),
                ],
              ),
            ),
            // CustomLoadingBar(
            //   onComplete: () {
            //     print("Loading complete!");
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => LoginScreenUpdated(),
            //       ),
            //     );
            //   },
            // ),
            CustomLoadingBar(progress: _loadingProgress),
            CustomSwipedButton(
              onSwipeEnd: () {
                setState(() {
                  isDragged = false;
                  trackColor = Colors.white;
                });
                _navigateToLogin();  // Trigger navigation
              },
            ),
          ],
        ),
      ),
    );
  }
}

