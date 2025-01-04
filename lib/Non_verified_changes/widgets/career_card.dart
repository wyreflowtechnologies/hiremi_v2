import 'package:flutter/material.dart';

class CareerCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;
  final Function() onTap;

  const CareerCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.9,
        padding:  EdgeInsets.all(height*0.02),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ?  Color(0xFF0F3CC9): Colors.grey.withOpacity(0.1),
          ),
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.grey.withOpacity(0.1), // Selected card color
          borderRadius: BorderRadius.circular(height*0.01), // Rounded corners

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.03,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: MediaQuery.of(context).size.width * 0.03,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
