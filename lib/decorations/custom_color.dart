import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
    const CustomColors({
      // required this.swipeGradient,
      required this.swipeBorderColor,
      required this.swipeThumbColor,
    });
    
    
    
    // final LinearGradient swipeGradient;
    final Color swipeBorderColor;
    final Color swipeThumbColor;

    @override
    CustomColors copyWith({
      // LinearGradient? swipeGradient,
      Color? swipeBorderColor,
      Color? swipeThumbColor,
    }) {
      return CustomColors(
        // swipeGradient: swipeGradient ?? this.swipeGradient, 
        swipeBorderColor: swipeBorderColor ?? this.swipeBorderColor,
        swipeThumbColor: swipeThumbColor ?? this.swipeThumbColor,
        );
    }

    @override
    CustomColors lerp(ThemeExtension<CustomColors>? other,double t) {
      if(other is! CustomColors) return this;
      return CustomColors(
      // swipeGradient: LinearGradient.lerp(swipeGradient,other.swipeGradient,t)!, 
      swipeBorderColor: Color.lerp( swipeBorderColor, other.swipeBorderColor,t)!,
      swipeThumbColor: Color.lerp(swipeThumbColor,other.swipeThumbColor,t)!, 
      );
    }


}