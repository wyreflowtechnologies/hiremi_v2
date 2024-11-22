import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/constants.dart';
import '../decorations/custom_color.dart';


class CustomSlideIndicator extends StatelessWidget {
   const CustomSlideIndicator({super.key,required this.pageController});

 final PageController pageController;

  @override
  Widget build(BuildContext context) {

    final themeWidth = MediaQuery.of(context).size.width;

    return   Padding(
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.width * 0.01,
              ),
              child: SmoothPageIndicator(
                
                controller: pageController, count: 3,
               effect:  SlideEffect(    
                      spacing:  themeWidth * 0.025,    
                      radius:  themeWidth * 0.05,    
                      dotWidth:  themeWidth * 0.175,    
                      dotHeight:  themeWidth * 0.02,    
                      paintStyle:  PaintingStyle.fill,    
                      // strokeWidth:  1.5,    
                      
                      dotColor:  const Color(0xFFD4D4D4),    
                      activeDotColor:  AppColors.primaryColor,  
                        ), 
                        
              ),
            );
        
  }
}