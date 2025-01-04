
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String title;
  final String description;

  const ExpandableText({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: _toggleExpand,
      child: Column(
        children: [
          GestureDetector(
            onTap: _toggleExpand,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                ),
              ],
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: _isExpanded ? null : 0,
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.015),
                Text(
                  widget.description,
                  style: const TextStyle(
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
