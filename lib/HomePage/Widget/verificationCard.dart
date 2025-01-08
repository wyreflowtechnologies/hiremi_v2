import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:pre_dashboard/HomePage/Widget/customPopup.dart';

class VerificationSection extends StatelessWidget {
  final List<VerificationStep> steps;
  final int currentStep;
  final VoidCallback? onVerifyPressed;

  const VerificationSection({
    super.key,
    this.steps = const [
      VerificationStep(
        number: 1,
        label: 'Complete Profile',
        isCompleted: true,
        isActive: true,
      ),
      VerificationStep(
        number: 2,
        label: 'Verification Payment',
        isCompleted: false,
        isActive: false,
      ),
      VerificationStep(
        number: 3,
        label: 'Wait for Verification',
        isCompleted: false,
        isActive: false,
      ),
      VerificationStep(
        number: 4,
        label: 'Get Lifetime Access',
        isCompleted: false,
        isActive: false,
      ),
    ],
    this.currentStep = 1,
    this.onVerifyPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          width: screenWidth,
          height: screenHeight * 0.26,
          decoration: BoxDecoration(
            color: const Color(0xFF0F3CC9),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(screenWidth * 0.1),
              bottomRight: Radius.circular(screenWidth * 0.1),
            ),
          ),
        ),
        Positioned(
          left: screenWidth * 0.063,
          top: screenHeight * 0.03,
          child: GestureDetector(
            onTap: () {
              showCustomPopup(context);
            },
            child: Container(
              width: screenWidth * 0.874,
              height: screenHeight * 0.21,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.18),
                borderRadius: BorderRadius.circular(screenWidth * 0.025),
                border: Border.all(color: Colors.white),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(screenWidth * 0.025),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.5, sigmaY: 10.5),
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.015),
                      Text(
                        'Verify Your Account Today!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.019),
                      _buildProgressIndicator(context),
                      SizedBox(height: screenHeight * 0.019),
                      _buildVerifyButton(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressIndicator(BuildContext context) {
    return CustomPaint(
      painter: StepLinePainter(
        steps: steps,
        currentStep: currentStep,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: steps.map((step) => _buildStep(context, step)).toList(),
      ),
    );
  }

  Widget _buildStep(BuildContext context, VerificationStep step) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          width: screenWidth * 0.1,
          height: screenWidth * 0.1,
          decoration: BoxDecoration(
            color: step.isActive ? const Color(0xFF002496) : Colors.white,
            borderRadius: BorderRadius.circular(screenWidth * 0.0675),
            border: Border.all(color: const Color(0xFF0874E3)),
          ),
          child: Center(
            child: step.isCompleted
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                    size: screenWidth * 0.05,
                  )
                : Text(
                    step.number.toString(),
                    style: TextStyle(
                      color: step.isActive
                          ? Colors.white
                          : const Color(0xFF0174C8),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ),
        SizedBox(height: screenHeight * 0.005),
        SizedBox(
          width: screenWidth * 0.18,
          child: Text(
            step.label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.023,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVerifyButton(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onVerifyPressed,
      child: Container(
        width: screenWidth * 0.75,
        height: screenHeight * 0.0385,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 0.0105),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0472E3).withOpacity(0.5),
              blurRadius: screenWidth * 0.037,
              offset: Offset(0, screenHeight * 0.005),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.verified,
              color: const Color(0xFF0F3CC9),
              size: screenWidth * 0.046,
            ),
            SizedBox(width: screenWidth * 0.007),
            Text(
              'Get Verified',
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF0F3CC9),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: const Color(0xFF0F3CC9),
              size: screenWidth * 0.035,
            ),
          ],
        ),
      ),
    );
  }
}

class VerificationStep {
  final int number;
  final String label;
  final bool isCompleted;
  final bool isActive;

  const VerificationStep({
    required this.number,
    required this.label,
    this.isCompleted = false,
    this.isActive = false,
  });
}

class StepLinePainter extends CustomPainter {
  final List<VerificationStep> steps;
  final int currentStep;

  StepLinePainter({
    required this.steps,
    required this.currentStep,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD9D9D9)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final activePaint = Paint()
      ..color = const Color(0xFF3334A1)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final stepWidth = size.width / (steps.length);
    final y = size.height * 0.3;

    for (var i = 0; i < steps.length - 1; i++) {
      final startX = stepWidth * (i + 0.5);
      final endX = stepWidth * (i + 1.5);

      canvas.drawLine(
        Offset(startX, y),
        Offset(endX, y),
        i < currentStep - 1 ? activePaint : paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
