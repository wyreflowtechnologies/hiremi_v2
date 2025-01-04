import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pre_dashboard/predashboard/constants/constants.dart';

class CustomLoadingBar extends StatefulWidget {
  // final VoidCallback onComplete;
  final double progress;
  const CustomLoadingBar({super.key, required this.progress});

  @override
  State<CustomLoadingBar> createState() => _CustomLoadingBarState();
}

class _CustomLoadingBarState extends State<CustomLoadingBar> {
  double _progress = 0.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    const duration = Duration(milliseconds: 20);
    const totalTime = 5000; // 3 seconds
    int elapsed = 0;

    _timer = Timer.periodic(duration, (timer) {
      elapsed += duration.inMilliseconds;
      setState(() {
        _progress = elapsed / totalTime;
      });

      if (_progress >= 1.0) {
        _timer.cancel();
      //  widget.onComplete();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8, // 80% of the screen width
      height: MediaQuery.of(context).size.height * 0.01, // Adjust height relative to screen height
      child: ClipRRect(
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
        child: LinearProgressIndicator(
          value: _progress,
          backgroundColor: Colors.grey.shade300,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
        ),
      ),
    );
  }
}
