import 'package:flutter/material.dart';
import 'dart:async';
import '../constants/constantsImage.dart';

class CarouselSection extends StatefulWidget {
  const CarouselSection({super.key});

  @override
  State<CarouselSection> createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 1);
  Timer? _timer;

  final List<String> carouselImages = [
    AppImages.completeProfile,
    AppImages.verificationPayment,
    AppImages.waitVerification,
    AppImages.lifetimeAccess,
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < carouselImages.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _handlePageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: const Color(0xFFF5F5F5),
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.02,
          ),
          SizedBox(
            height: screenHeight * 0.15,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _handlePageChanged,
              itemCount: carouselImages.length,
              itemBuilder: (context, index) =>
                  _buildCarouselItem(context, carouselImages[index]),
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
          _buildIndicators(),
          SizedBox(
            height: screenHeight * 0.02,
          ),
        ],
      ),
    );
  }

  Widget _buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        carouselImages.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: _currentPage == index ? 12 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: _currentPage == index
                ? const Color(0xFF0F3CC9)
                : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context, String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: 1,
        ),
      ),
    );
  }
}
