import 'package:flutter/material.dart';

class DomainChip extends StatefulWidget {
  final Function(String) toggleDomainSelection;
  final String domain;
  final bool isSelected;
  const DomainChip({super.key, required this.domain, required this.isSelected, required this.toggleDomainSelection});

  @override
  State<DomainChip> createState() => _DomainChipState();
}

class _DomainChipState extends State<DomainChip> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.toggleDomainSelection(widget.domain),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: widget.isSelected ? const  Color(0xFF0F3CC9).withOpacity(0.1) : const Color(0xFFB5B5B5).withOpacity(0.3),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.blueAccent, width: 1.5),
          boxShadow: [
            if (widget.isSelected)
              BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                blurRadius: 6.0,
                offset: const Offset(0, 3),
              ),
          ],
        ),
        child: Text(
          widget.domain,
          style: const TextStyle(
            color: Color(0xFF0F3CC9),
            fontWeight: FontWeight.w500,
            fontSize: 9,
          ),
        ),
      ),
    );
  }
}
