import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pre_dashboard/screens/LoginScreen.dart';
import 'package:pre_dashboard/screens/register_screen.dart';
import '../constants/constants.dart';

import '../screens/new.dart';

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
  bool isDragged = false;
  Color trackColor = Colors.white;


   final TextConstants textConstants = TextConstants();
  final ImageDirectoryConstants imageConstants = ImageDirectoryConstants();  

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      // if (_currentPageIndex < _totalPages - 1) {
      //   _currentPageIndex++;
      //   _pageController.animateToPage(
      //     _currentPageIndex,
      //     duration: const Duration(milliseconds: 500),
      //     curve: Curves.easeInOut,
      //   );
      // } else {
      //   _timer.cancel();
      // }
      if (_currentPageIndex < _totalPages - 1) {
  _currentPageIndex++;
} else {
  _currentPageIndex = 0; 
}
_pageController.animateToPage(
  _currentPageIndex,
  duration: const Duration(milliseconds: 500),
  curve: Curves.easeInOut,
);

    });
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
        actions:  [
        
      IconButton(
        icon:  Icon(Icons.chevron_left,
         size: screenWidth * 0.05,
        ),
        onPressed: () {
          
        },
        
      ),
    Expanded(
      child: Center(
        child: Image.asset(imageConstants.kBannerImage), 
      ),
    ),
     Icon(
      Icons.chevron_right,
      size: screenWidth * 0.05,
    ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(
          screenWidth * 0.025
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children:  [
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
            CustomSlideIndicator(pageController: _pageController),
            CustomSwipedButton(isDragged: isDragged, 
            onSwipeStart: (){
                setState(() {
                      isDragged = true;
                      // trackColor = Colors.blue;
                    });
            }, 
              onSwipeEnd: () {
                    setState(() {
                      isDragged = false;
                      trackColor = Colors.white;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreenUpdated()));
                  },
            ),
          
          ],
        ),
      ),
    );
  }
}


