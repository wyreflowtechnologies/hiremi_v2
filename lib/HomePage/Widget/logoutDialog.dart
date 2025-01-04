import 'package:flutter/material.dart';
import 'dart:ui';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Stack(children: [

      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          width: width,
          height: height,
          color: Colors.transparent,
        ),
      ),
      Dialog(
        backgroundColor: Colors.white.withOpacity(0.95),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(width * 0.04),
        ),
        child: Container(
          width: width * 0.8,
          padding: EdgeInsets.all(width * 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Are you sure you want to log out?',
                style: TextStyle(
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF1F1F1F),
                ),
              ),
              SizedBox(height: width * 0.06),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.08,
                        vertical: width * 0.025,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.02),
                        side: const BorderSide(
                          color: Color(0xFF0F3CC9),
                        ),
                      ),
                    ),
                    child: Text(
                      'No',
                      style: TextStyle(
                        fontSize: width * 0.038,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF0F3CC9),
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0F3CC9),
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.08,
                        vertical: width * 0.025,
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.02),
                      ),
                    ),
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: width * 0.038,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
