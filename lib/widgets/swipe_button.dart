
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';

import '../constants/constants.dart';



class CustomSwipedButton extends StatelessWidget {
  const CustomSwipedButton({super.key,required this.isDragged,required this.onSwipeStart,required this.onSwipeEnd});

  final bool isDragged;
  final VoidCallback onSwipeStart,onSwipeEnd;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    


    return   Padding(
              padding: EdgeInsets.symmetric(
                vertical: 
                MediaQuery.of(context).size.width * 0.07
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: isDragged ? null : Colors.white,
                  // gradient: isDragged
                  //     // ?customColors.swipeGradient
                  //     : null,
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: MediaQuery.of(context).size.width * 0.005,
                  ),
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.1
                  ),
                ),
                child: SwipeButton(
                  height: MediaQuery.of(context).size.width * 0.15,
                  width: MediaQuery.of(context).size.width * 0.8,
                  thumbPadding: EdgeInsets.all(
                    MediaQuery.of(context).size.width * 0.02,
                    
                  ),
                  thumb: const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                  activeThumbColor: AppColors.primaryColor,
                  activeTrackColor: Colors.transparent,
                  
                  onSwipe: () {},
                  onSwipeStart: onSwipeStart,
                  onSwipeEnd: onSwipeEnd,
                  child: Text(
                    isDragged? "Lets Go": "Swipe To start",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  )
                ),
                
              ),
            );
  }
}




                