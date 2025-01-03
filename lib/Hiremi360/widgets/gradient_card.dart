import 'package:flutter/material.dart';

class GradientCard extends StatelessWidget {
  final List<Color> gradientColors;
  final Color discountPriceColor;
  final String title;
  final String price;
  final String discountPrice;
  final String offPercentage;
  final List<String> textLines;

  const GradientCard({
    super.key,
    required this.gradientColors,
    required this.discountPriceColor,
    required this.title,
    required this.price,
    required this.discountPrice,
    required this.offPercentage,
    required this.textLines
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading Text
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Text(
                "₹$price ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "₹$discountPrice",
                style: TextStyle(
                  color: discountPriceColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const SizedBox(width: 10.0),

              // Gradient Button (for discount)
              GradientCardButton(
                text: "$offPercentage% OFF",
                gradientColors: gradientColors,
              ),
            ],
          ),
          const SizedBox(height: 14.0),
          ...textLines.map((feature) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("\u2022",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.0,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      feature,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class GradientCardButton extends StatelessWidget {
  final String text;
  final List<Color> gradientColors;

  const GradientCardButton({
    super.key,
    required this.text,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: gradientColors.last,
          width: 1.5,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
          foreground: Paint()
            ..shader = LinearGradient(
              colors: gradientColors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(Rect.fromLTWH(0, 0, 200, 16)),
        ),
      ),
    );
  }
}
