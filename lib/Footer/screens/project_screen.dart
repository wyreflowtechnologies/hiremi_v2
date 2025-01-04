import 'package:flutter/material.dart';
import 'package:pre_dashboard/Footer/widget/custom_text_field_2.dart';


import '../widget/custom_bottom_bar.dart';

class ProjectScreen extends StatefulWidget {
  final Function(Map<String, String>) projectDetails;
  const ProjectScreen({super.key, required this.projectDetails});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  TextEditingController projectTitle = TextEditingController();
  TextEditingController projectLink = TextEditingController();
  TextEditingController projectDescription = TextEditingController();
  int currentIndex = 0;
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Projects',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        leading: Container(
            decoration: BoxDecoration(
              color: Color(0xFFECF5FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Image.asset('assets/images/appBarMenu.png'))),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Stack(
              children: [
                const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                Positioned(
                  top: size.height * 0.001,
                  right: size.width * 0.008,
                  child: Container(
                    height: size.height * 0.015,
                    width: size.width * 0.033,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.5),
                        color: const Color(0xFFDBE4FF)),
                    child: Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                              fontSize: size.width * 0.023,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF0F3CC9)),
                        )),
                  ),
                )
              ],
            ),
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //spacing: 20,
            children: [
              CustomTextField2(labelText: 'Project Title*', hintText: 'Landing page', text: (p0) {
                setState(() {
                  projectTitle.text = p0;
                });
              },),
              CustomTextField2(labelText: 'Project Link*', hintText: 'XYZ', text: (p0) {
                setState(() {
                  projectLink.text = p0;
                });
              },),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Project Description',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              TextField(
                onChanged: (p0) {
                  projectDescription.text = p0;
                },
                maxLines: 5,
                maxLength: 200,
                decoration: InputDecoration(
                    hintText: '',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    floatingLabelStyle: TextStyle(
                        color: Color(0xFF000000), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFF808080), width: 2),
                    )),
                keyboardType: TextInputType.text,
              ),
              Visibility(
                visible: isVisible,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text(
                    'Required fields are incomplete.\nFill them out to move forward.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (projectTitle.text.isEmpty ||
                        projectLink.text.isEmpty ||
                        projectDescription.text.isEmpty) {
                      setState(() {
                        isVisible = true;
                      });
                    } else {
                      setState(() {
                        isVisible = false;
                      });
                      widget.projectDetails(
                        {
                          'projectTitle': projectTitle.text,
                          'projectLink': projectLink.text,
                          'projectDescription': projectDescription.text
                        }
                      );
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F3CC9),
                    fixedSize: Size(size.width * 0.4, size.height * 0.05),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: currentIndex,
        onTabSelected: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
