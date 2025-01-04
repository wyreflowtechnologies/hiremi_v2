import 'package:flutter/material.dart';

import '../widget/custom_bottom_bar.dart';

class ContactDetails extends StatefulWidget {
  final Function(Map<String, String>) contactDetail;
  const ContactDetails({super.key, required this.contactDetail});

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  TextEditingController contactNumber = TextEditingController();
  TextEditingController whatsAapNumber = TextEditingController();
  bool isVisible = false;
  int currentIndex = 0;
  bool contact = false;
  bool whatsApp = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Details',
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
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Contact Number*',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: contactNumber,
                onChanged: (value) {
                  if (value.length != 10) {
                    setState(() {
                      contact = true;
                    });
                  } else if (value.length == 10) {
                    setState(() {
                      contact = false;
                    });
                  }
                },
                decoration: InputDecoration(
                    error:
                        contact ? Text('Please Enter 10 Digit Number') : null,
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFFC1272D), width: 1),
                    ),
                    hintText: '0000000000',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    floatingLabelStyle: TextStyle(
                        color: Color(0xFF000000), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFF808080), width: 2),
                    )),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'WhatsApp number*',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: whatsAapNumber,
                onChanged: (value) {
                  if (value.length != 10) {
                    setState(() {
                      whatsApp = true;
                    });
                  } else if (value.length == 10) {
                    setState(() {
                      whatsApp = false;
                    });
                  }
                },
                decoration: InputDecoration(
                    error:
                        whatsApp ? Text('Please Enter 10 Digit Number') : null,
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFFC1272D), width: 1),
                    ),
                    hintText: '0000000000',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    floatingLabelStyle: TextStyle(
                        color: Color(0xFF000000), fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFF808080), width: 2),
                    )),
                keyboardType: TextInputType.phone,
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
                    if (contactNumber.text.isEmpty ||
                        whatsAapNumber.text.isEmpty) {
                      setState(() {
                        isVisible = true;
                      });
                    } else {
                      if (contactNumber.text.length != 10 ||
                          whatsAapNumber.text.length != 10) {
                        isVisible = true;
                      } else {
                        setState(() {
                          isVisible = false;
                        });
                        widget.contactDetail(
                          {
                            'contactNumber': contactNumber.text,
                            'whatsAppNumber': whatsAapNumber.text
                          }
                        );
                        Navigator.pop(context);
                      }
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
