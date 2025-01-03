import 'package:flutter/material.dart';

class CustomSelectProgram extends StatefulWidget {
  const CustomSelectProgram({super.key});

  @override
  State<CustomSelectProgram> createState() => _CustomSelectProgramState();
}

class _CustomSelectProgramState extends State<CustomSelectProgram> {
  final List<String> courses = [
    "Frontend Developer | 3 months",
    "Ui UX Designer | 3 months",
    "Flutter Developer | 3 months",
    "Backend Developer | 3 months",
  ];
  String selectedCourse = '';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedCourse = courses[index];
                });
              },
              child: Container(
                height: size.height * 0.1,
                width: size.width * 0.92,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: !(selectedCourse == courses[index])
                      ? Border.all(color: Color(0xFFC1272D), width: 1)
                      : Border(
                          left: BorderSide(color: Color(0xFFC1272D), width: 4),
                          top: BorderSide(color: Color(0xFFC1272D), width: 2),
                          right: BorderSide(color: Color(0xFFC1272D), width: 2),
                          bottom:
                              BorderSide(color: Color(0xFFC1272D), width: 2)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: size.height * 0.029,
                    children: [
                      Text(
                        courses[index],
                        style: TextStyle(
                            fontSize: size.width * 0.037,
                            fontWeight: FontWeight.bold),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '₹10,000 ',
                          style: TextStyle(
                            fontSize: size.width * 0.035,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: ' ₹25,000',
                              style: TextStyle(
                                fontSize: size.width * 0.022,
                                color: Colors.black54,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
