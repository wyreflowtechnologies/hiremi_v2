import 'package:flutter/material.dart';
import 'package:pre_dashboard/Non_verified_changes/screens/final_step_screen.dart';
import 'package:pre_dashboard/Non_verified_changes/widgets/domain_chip.dart';

class CustomFormWidget6 extends StatefulWidget {
  final Function(bool, int) onSubmit;

  const CustomFormWidget6({super.key, required this.onSubmit});

  @override
  State<CustomFormWidget6> createState() => _DomainSelectionWidgetState();
}

class _DomainSelectionWidgetState extends State<CustomFormWidget6> {
  // Maximum allowed selections
  final int _maxSelection = 5;

  // List of available domains
  final List<String> _domains = [
    "Product Development",
    "Systems Analyst",
    "Machine Learning/AI",
    "Business Analysis",
    "UI/UX designer",
    "Full stack development",
    "Front-End Development",
    "Back-End Development",
    "Blockchain",
    "Sales & Marketing",
    "Content Writing",
    "Financial Analysis",
    "Graphic Design",
    "Strategy & Consulting",
    "Network Engineering",
    "Game Development",
    "Technical Support",
    "Project Management",
    "Human Resources (HR)",
    "Operations Management",
  ];

  // Selected domains
  final List<String> _selectedDomains = [];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Interested area Domain",
            style: TextStyle(
              fontSize: width * 0.05,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: height * 0.005),
          Text(
            "Select maximum five ${_selectedDomains.length}/$_maxSelection",
            style: TextStyle(
              fontSize: width * 0.04,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(height: height * 0.02),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: _domains.map((domain) {
              final isSelected = _selectedDomains.contains(domain);
              return DomainChip(domain: domain, isSelected: isSelected, toggleDomainSelection: _toggleDomainSelection);
            }).toList(),
          ),
          SizedBox(height: height * 0.04),
          Center(
            child: ElevatedButton(
              onPressed: _handleSubmit,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F3CC9),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: Size(width * 0.8, height * 0.06),
              ),
              child: const Text("Submit", style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  void _toggleDomainSelection(String domain) {
    setState(() {
      if (_selectedDomains.contains(domain)) {
        _selectedDomains.remove(domain);
      } else if (_selectedDomains.length < _maxSelection) {
        _selectedDomains.add(domain);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("You can select up to 5 options only."),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    });
  }

  void _handleSubmit() {
    if (_selectedDomains.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select at least one domain."),
          backgroundColor: Colors.redAccent,
        ),
      );
      widget.onSubmit(false, 5);
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FinalStepScreen(),));
      widget.onSubmit(true, 6);
    }
  }
}
