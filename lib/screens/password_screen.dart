import 'package:flutter/material.dart';
import 'package:pre_dashboard/screens/LoginScreen.dart';
import 'package:pre_dashboard/screens/password_recovery_page_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Create Account",
          style: TextStyle(
            color: Color(0xff0F3CC9),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const Center(
                          child: Text(
                            "Set your Password",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Progress Indicator
                        Center(
                          child: SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(4, (index) {
                                return Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: index < 4
                                            ? const Color(0xff002496)
                                            : Colors.white,
                                        border: Border.all(
                                          color: const Color(0xff002496),
                                          width: 2,
                                        ),
                                      ),
                                      child: index < 4
                                          ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 18,
                                      )
                                          : const SizedBox(),
                                    ),
                                    if (index < 3)
                                      Container(
                                        width: 40,
                                        height: 2,
                                        color: const Color(0xff002496),
                                      ),
                                  ],
                                );
                              }),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        // Password Requirements Hint
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text.rich(
                            TextSpan(
                              text: "Min 8 characters",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFF0F3CC9)),
                              children: [
                                TextSpan(
                                  text:
                                  ", 1 uppercase, 1 digit, 1 special character",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Password Field
                        CustomPasswordField(
                          label: "Password",
                          hintText: "**********",
                          isPasswordVisible: isPasswordVisible,
                          onToggleVisibility: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        // Confirm Password Field
                        CustomPasswordField(
                          label: "Confirm Password",
                          hintText: "**********",
                          isPasswordVisible: isConfirmPasswordVisible,
                          onToggleVisibility: () {
                            setState(() {
                              isConfirmPasswordVisible =
                              !isConfirmPasswordVisible;
                            });
                          },
                        ),
                        //const Spacer(),
                        SizedBox(height: 285,),
                        // Action Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Back Button
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Back",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            // Submit Button with Glow Effect
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context)=> LoginScreenUpdated()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff0F3CC9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                shadowColor: Colors.blue.withOpacity(0.5),
                                elevation: 8,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 12.0),
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomPasswordField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isPasswordVisible;
  final VoidCallback onToggleVisibility;

  const CustomPasswordField({
    required this.label,
    required this.hintText,
    required this.isPasswordVisible,
    required this.onToggleVisibility,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
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
        const SizedBox(height: 8),
        TextField(
          obscureText: !isPasswordVisible, // Toggle visibility
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: onToggleVisibility,
            ),
            filled: true,
            fillColor: const Color(0xFFF1F4FF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xff0F3CC9),
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
      ],
    );
  }
}
