import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widget/custom_bottom_bar.dart';

class EditProfileScreen2 extends StatefulWidget {
  final Function(Map<String, String>) socialLinksDetails;
  const EditProfileScreen2({super.key, required this.socialLinksDetails});

  @override
  State<EditProfileScreen2> createState() => _EditProfileScreen2State();
}

class _EditProfileScreen2State extends State<EditProfileScreen2> {
  TextEditingController linkedIn = TextEditingController();
  int currentIndex = 0;
  TextEditingController gitHub = TextEditingController();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
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
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: linkedIn,
                    decoration: InputDecoration(
                        hintText: 'https://prak-mish-etc',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        floatingLabelStyle: TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0xFF808080), width: 2),
                        )),
                  )),
                  SizedBox(width: 10,),
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey[600]!, width: 1.2)
                    ),
                    child: Center(child: FaIcon(FontAwesomeIcons.linkedin, color: Color(0xFF0076B2),)),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: gitHub,
                        decoration: InputDecoration(
                            hintText: 'https://prak-mietc',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            floatingLabelStyle: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              BorderSide(color: Color(0xFF808080), width: 2),
                            )),
                      )),
                  SizedBox(width: 10,),
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey[600]!, width: 1.2)
                    ),
                    child: Center(child: FaIcon(FontAwesomeIcons.github, color: Color(0xFF000000),)),
                  )
                ],
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
                padding: const EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (linkedIn.text.isEmpty || gitHub.text.isEmpty) {
                      setState(() {
                        isVisible = true;
                      });
                    } else {
                      setState(() {
                        isVisible = false;
                      });
                      widget.socialLinksDetails(
                        {
                          'linkedIn': linkedIn.text,
                          'gitHub': gitHub.text
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
