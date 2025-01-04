
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';

import '../constants/constants.dart';










class CustomSwipedButton extends StatefulWidget {
  const CustomSwipedButton({
    Key? key,
    required this.onSwipeEnd,
  }) : super(key: key);

  final VoidCallback onSwipeEnd;

  @override
  State<CustomSwipedButton> createState() => _CustomSwipedButtonState();
}

class _CustomSwipedButtonState extends State<CustomSwipedButton> {
  double _dragPosition = 0.0; // Position of the thumb during drag.

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonHeight = screenWidth * 0.15;
    final buttonWidth = screenWidth * 0.8;
    final thumbSize = screenWidth * 0.12;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.07),
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          setState(() {
            _dragPosition = (_dragPosition + details.delta.dx)
                .clamp(0.0, buttonWidth - thumbSize);
          });
        },
        // onHorizontalDragEnd: (details) {
        //   if (_dragPosition >= buttonWidth - thumbSize) {
        //     widget.onSwipeEnd();
        //   }
        //   setState(() {
        //     _dragPosition = 0.0;
        //   });
        // },
        onHorizontalDragEnd: (details) {
          // Trigger the function when at least 80% of the button is swiped
          if (_dragPosition >= 0.65 * (buttonWidth - thumbSize)) {
            widget.onSwipeEnd();
          }
          setState(() {
            _dragPosition = 0.0; // Reset the drag position
          });
        },

        child: Stack(
          children: [

            Container(
              width: buttonWidth,
              height: buttonHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.1),
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: screenWidth * 0.005,
                ),
               ),
            ),

            Positioned(
              left: 0,
               child: Container(
                width: _dragPosition==0?0: _dragPosition + thumbSize,
                height: buttonHeight,
                 decoration: BoxDecoration(
                
                  gradient: AppColors.swipeGradient,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(screenWidth * 0.1),
                    right: Radius.circular(
                       // _dragPosition + thumbSize >= buttonWidth
                           screenWidth * 0.1
                           ),
                   ),
                 ),
             
              ),
            ),

           Positioned.fill(
             child: Center(
                child: Text(
                  _dragPosition >= buttonWidth - thumbSize
                      ? "Let's Go"
                      : "Swipe To Start",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: _dragPosition >= buttonWidth - thumbSize
                        ? Colors.white
                       : AppColors.primaryColor,
                   ),
               
                 ),

               ),
           
            ),

            Positioned(
              left: _dragPosition==0?_dragPosition + screenWidth*0.02:_dragPosition,
              child: Container(
                width: thumbSize,
                height: buttonHeight,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ));
    
   }
 }