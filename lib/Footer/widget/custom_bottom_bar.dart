import 'package:flutter/material.dart';
import 'package:pre_dashboard/Hiremi360/controller_screen/controller_screen.dart';
import 'package:pre_dashboard/Hiremi360/screens/home_screen.dart';
import 'package:pre_dashboard/HomePage/screens/HomeScreen.dart';
import 'package:pre_dashboard/HomePage/screens/askExpertScreen.dart';
import 'package:pre_dashboard/HomePage/screens/hiremi360Screen.dart';

class CustomBottomBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  State<CustomBottomBar> createState() => _CustombottombarState();
}

class _CustombottombarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 17.0, bottom: 20.0, left: 17.0),
      child: Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16),
            bottom: Radius.circular(32),
          ),
          boxShadow: [
            BoxShadow(
              //     color: Colors.black.withValues(alpha: 0.1),
              color: Colors.black,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image.asset("assets/images/home.png"),
              _buildNavItem(
                assetPath: 'assets/images/home.png',
                label: 'Home',
                index: 0,
              ),
              _buildNavItem(
                assetPath: 'assets/images/job.png',
                label: 'Jobs',
                index: 1,
              ),
              _buildNavItem(
                assetPath: 'assets/images/expert.png',
                label: 'Ask Expert',
                index: 2,
              ),
              _buildNavItem(
                assetPath: 'assets/images/status.png',
                label: 'Status',
                index: 3,
              ),
              _buildNavItem(
                  assetPath: 'assets/images/Hiremi360.png',
                  label: '360',
                  index: 4)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String assetPath,
    required String label,
    required int index,
  }) {
    final isSelected = widget.currentIndex == index;

    return GestureDetector(
      onTap: () {
        // Log details only for the tapped item
        print("Tapped Item: Label=$label, Index=$index, AssetPath=$assetPath");
        print("widget.currentIndex is ${widget.currentIndex}");
        print("Is Selected: $isSelected");

        // Handle navigation or other actions based on the index
        if (!isSelected) {
          widget.onTabSelected(index); // Update the index
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen(isVerified: false)),
            );
          }

          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AskExpertPage()),
            );
          }
          if (index == 3) {
            print("HElldss");
          }
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ControllerScreen()),
            );
          }
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            assetPath,
            height: 24.0,
            width: 24.0,
            color: isSelected ? Colors.blue : const Color(0xFF616161),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isSelected ? Colors.blue : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
