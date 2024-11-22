import 'package:flutter/material.dart';
import '../screens/RegisterScreenVerified.dart';
import '../screens/password_screen.dart';

class RegisterScreenEducational extends StatefulWidget {
  const RegisterScreenEducational({Key? key}) : super(key: key);

  @override
  State<RegisterScreenEducational> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreenEducational> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Create Account",
          style: TextStyle(
            color: const Color(0xff0F3CC9),
            fontSize: screenHeight * 0.022, // Responsive font size
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05, // Responsive horizontal padding
          vertical: screenHeight * 0.01, // Responsive vertical padding
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.01), // Responsive spacing
            Text(
              "Educational Information",
              style: TextStyle(
                fontSize: screenHeight * 0.02, // Responsive font size
                fontWeight: FontWeight.w600,
                color: const Color(0xff555555),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.02), // Responsive spacing
            // Progress Indicator
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Row(
                    children: [
                      Container(
                        height: screenHeight * 0.04, // Responsive size
                        width: screenHeight * 0.04, // Responsive size
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index < 3
                              ? const Color(0xff002496)
                              : Colors.white,
                          border: Border.all(
                            color: const Color(0xff002496),
                            width: 2,
                          ),
                        ),
                        child: index < 3
                            ? Icon(
                          Icons.check,
                          color: Colors.white,
                          size: screenHeight * 0.02, // Responsive size
                        )
                            : const SizedBox(),
                      ),
                      if (index < 3)
                        Container(
                          width: screenWidth * 0.1, // Responsive width
                          height: screenHeight * 0.003, // Responsive height
                          color: const Color(0xff002496),
                        ),
                    ],
                  );
                }),
              ),
            ),
            SizedBox(height: screenHeight * 0.03), // Responsive spacing
            // Input Fields
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: const [
                  CustomInputField(label: "College Name"),
                  CustomDropdownField(label: "Select State"),
                  CustomDropdownField(label: "Select Branch"),
                  CustomDropdownField(label: "Select Course"),
                  CustomInputField(label: "Select Year"), // Changed this line
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.05), // Responsive spacing
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => RegisterScreenVerified()),
                    );
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenHeight * 0.02, // Responsive font size
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PasswordScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0F3CC9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadowColor: const Color(0xffCBD6FF),
                    elevation: 8,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.08, // Responsive padding
                      vertical: screenHeight * 0.015, // Responsive padding
                    ),
                    child: Text(
                      "Proceed",
                      style: TextStyle(
                        fontSize: screenHeight * 0.02, // Responsive font size
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Input Field
class CustomInputField extends StatelessWidget {
  final String label;

  const CustomInputField({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: screenHeight * 0.018, // Responsive font size
              color: const Color(0xff626262),
            ),
            children: [
              const TextSpan(
                text: "*",
                style: TextStyle(color: Color(0xff0F3CC9)),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.01), // Responsive spacing
        TextField(
          decoration: InputDecoration(
            hintText: label,
            filled: true,
            fillColor: const Color(0xFFF1F4FF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff0F3CC9)),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xff0F3CC9),
                width: 1.5,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.02), // Responsive spacing
      ],
    );
  }
}

// Custom Dropdown Field
class CustomDropdownField extends StatelessWidget {
  final String label;

  const CustomDropdownField({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: screenHeight * 0.018, // Responsive font size
              color: Colors.black,
            ),
            children: [
              const TextSpan(
                text: "*",
                style: TextStyle(color: Color(0xff0F3CC9)),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.01), // Responsive spacing
        DropdownButtonFormField<String>(
          items: [
            DropdownMenuItem(value: "1", child: Text(label)),
          ],
          onChanged: (value) {},
          decoration: InputDecoration(
            hintText: label,
            filled: true,
            fillColor: const Color(0xFFF1F4FF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffB6B6B6)),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xff0F3CC9),
                width: 1.5,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.02), // Responsive spacing
      ],
    );
  }
}
