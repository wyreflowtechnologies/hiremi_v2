import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
        bottom: screenHeight * 0.01,
        right: screenWidth * 0.02,
        left: screenWidth * 0.02,
      ),
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.085,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, -1),
              blurRadius: 4,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(screenWidth * 0.04),
            topRight: Radius.circular(screenWidth * 0.04),
            bottomLeft: Radius.circular(screenWidth * 0.08),
            bottomRight: Radius.circular(screenWidth * 0.08),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(context, Icons.home, "Home", 0),
            _buildNavItem(context, Icons.business_center, "Jobs", 1),
            _buildNavItem(context, Icons.explore, "Ask Expert", 2),
            _buildNavItem(context, Icons.assignment , "Status", 3),
            _buildNavItemWithBadge(
                context, Icons.all_inclusive, "HireMi", "360", 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context, IconData icon, String label, int index) {
    bool isSelected = selectedIndex == index;
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.grey,
            size: screenWidth * 0.06,
          ),
          SizedBox(height: screenWidth * 0.01),
          Text(
            label,
            style: TextStyle(
              fontSize: screenWidth * 0.028,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItemWithBadge(BuildContext context, IconData icon,
      String label, String subLabel, int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 9, 40, 133),
          borderRadius: BorderRadius.circular(50),
          border: Border.all()
        ),

        child: CircleAvatar(
          radius: screenWidth * 0.07,
          backgroundColor: Color(0xFF0F3CC9),
          child: CircleAvatar(
            backgroundColor: const Color(0xffffffff),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    icon,
                    color: Color(0xFF0188EA),
                    size: screenWidth * 0.05,
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: screenWidth * 0.02,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    height: screenHeight * 0.0007,
                  ),
                ),
                Text(
                  subLabel,
                  style: TextStyle(
                    fontSize: screenWidth * 0.019,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
