import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pre_dashboard/HomePage/Widget/app_bar.dart';
import 'package:pre_dashboard/HomePage/Widget/app_drawer.dart';

import '../../predashboard/widgets/custom_text_field.dart';

class Query extends StatefulWidget {
  const Query({super.key});

  @override
  State<Query> createState() => _QueryState();
}

class _QueryState extends State<Query> {
  String? _selectedGender;
  String? _selectedQueryType;
  final List<String> queryTypes = [
    "General Query",
    "Technical Support",
    "Billing Issue",
    "Feedback",
    "Other"
  ];
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController=TextEditingController();
  final _summaryController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(

      //backgroundColor: Colors.white,
      appBar: customAppBar(context, "Ask Expert"),
      drawer: const AppDrawer(),
        body: SingleChildScrollView(
          child: Container(
            child: Form(
              child: Column(
                children: [
                  FlutterCarousel(
                    options: FlutterCarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.15,
                      viewportFraction: 1,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      // scrollPhysics: BouncingScrollPhysics(),
                    ),
                    items: [
                      _buildSliderItem(
                        context: context,
                        title: "Career gap ki \ntension lo?",
                        imagePath: "assets/images/ask_expert_page.png",
                      ),
                      // Second Slide
                      _buildSliderItem(
                        context: context,
                        title: "Pahli job ki\ntayari?",
                        imagePath: "assets/images/banner (10) 1.png",
                      ),
                      // Third Slide
                      _buildSliderItem(
                        context: context,
                        title: "Interview me\nkya bole?",
                        imagePath: "assets/images/Frame 427319481.png",
                      ),
                      _buildSliderItem(
                        context: context,
                        title: "Career badlane\nka plan hai?",
                        imagePath: "assets/images/ask_expert3.png",
                      ),
                      _buildSliderItem(
                        context: context,
                        title: "Confused ho\ncareer ko lekar?",
                        imagePath: "assets/images/banner (14) 2.png",
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: size * 0.85),
                        child: RichText(
                          text: TextSpan(
                            text: 'Full Name ', // Normal text
                            style: TextStyle(
                              fontSize: size * 0.04,
                              color: Colors.black, // Default color
                            ),
                            children: [
                              TextSpan(
                                text: '*', // Asterisk
                                style: TextStyle(
                                  fontSize: size * 0.04,
                                  color: Colors.blue, // Blue color for the asterisk
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size * 0.01,
                      ),
                      SizedBox(
                        width: size * 1.1,
                        height: size * 0.27,
                        child: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: 'Enter your name',
                            labelStyle: TextStyle(fontSize: size * 0.05),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size * 0.02),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size * 0.02),
                              borderSide: BorderSide(color: Colors.blue, width: size * 0.005),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size * 0.02),
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            ),
                          ),
                          style: TextStyle(fontSize: 16),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Full Name is required';
                            } else if (value.length < 3) {
                              return 'Full Name must be at least 3 characters long';
                            }
                            return null; // No error
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: size * 0.85),
                        child: RichText(
                          text: TextSpan(
                            text: 'Email adress', // Normal text
                            style: TextStyle(
                              fontSize: size * 0.04,
                              color: Colors.black, // Default color
                            ),
                            children: [
                              TextSpan(
                                text: '*', // Asterisk
                                style: TextStyle(
                                  fontSize: size * 0.04,
                                  color: Colors.blue, // Blue color for the asterisk
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size * 0.01,
                      ),
                      SizedBox(
                        width: size * 1.1,
                        height: size * 0.27,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Enter your Email',
                            labelStyle: TextStyle(fontSize: size * 0.05),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size * 0.02),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size * 0.02),
                              borderSide: BorderSide(color: Colors.blue, width: size * 0.005),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size * 0.02),
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            ),
                          ),
                          style: TextStyle(fontSize: 16),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email address is required';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return 'Enter a valid email address';
                            }
                            return null; // No error
                          },

                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(right: size * 0.95),
                        child: RichText(
                          text: TextSpan(
                            text: 'Gender', // Normal text
                            style: TextStyle(
                              fontSize: size * 0.04,
                              color: Colors.black, // Default color
                            ),
                            children: [
                              TextSpan(
                                text: '*', // Asterisk
                                style: TextStyle(
                                  fontSize: size * 0.04,
                                  color: Colors.blue, // Blue color for the asterisk
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size*0.03,
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left:size*0.089),
                            child: Container(
                              width: size * 0.4, // Specific width
                              height: size * 0.15, // Specific height

                              decoration: BoxDecoration(
                                color: Colors.white, // Background color
                                border: Border.all(color: Colors.blue, width: 1.5), // Blue border
                                borderRadius: BorderRadius.circular(size * 0.03), // Curved edges
                              ),
                              child: Padding(
                                padding:  EdgeInsets.only(right:size*0.1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Radio<String>(
                                      value: "Male",
                                      groupValue: _selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedGender = value;
                                        });

                                      },
                                      activeColor: Colors.blue, // Blue color for the radio button
                                    ),
                                    Text(
                                      "Male",
                                      style: TextStyle(fontSize: size * 0.037),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: size*0.07,),

                          Container(
                            width: size * 0.4, // Specific width
                            height: size * 0.15, // Specific height

                            decoration: BoxDecoration(
                              color: Colors.white, // Background color
                              border: Border.all(color: Colors.blue, width: 1.5), // Blue border
                              borderRadius: BorderRadius.circular(size * 0.03), // Curved edges
                            ),
                            child: Padding(
                              padding:  EdgeInsets.only(right: size*0.1),
                              child: Row(
                                children: [

                                  Radio<String>(
                                    value: "Female",
                                    groupValue: _selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value;
                                      });
                                    },
                                    activeColor: Colors.blue, // Blue color for the radio button
                                  ),
                                  Text(
                                    "Female",
                                    style: TextStyle(fontSize: size * 0.037),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size * 0.09,
                      ),

                      Padding(
                        padding: EdgeInsets.only(right: size * 0.9),
                        child: RichText(
                          text: TextSpan(
                            text: 'Subject', // Normal text
                            style: TextStyle(
                              fontSize: size * 0.04,
                              color: Colors.black, // Default color
                            ),
                            children: [
                              TextSpan(
                                text: '*', // Asterisk
                                style: TextStyle(
                                  fontSize: size * 0.04,
                                  color: Colors.blue, // Blue color for the asterisk
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size*0.03,
                      ),
                      SizedBox(
                        width: size * 1.1,
                        height: size * 0.27,
                        child: TextFormField(
                          controller: _summaryController,
                          decoration: InputDecoration(
                            hintText: 'A short summary of the query',
                            labelStyle: TextStyle(fontSize: size * 0.05),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size * 0.02),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size * 0.02),
                              borderSide: BorderSide(color: Colors.blue, width: size * 0.005),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size * 0.02),
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            ),
                          ),
                          style: TextStyle(fontSize: 16),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Summary is required';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return 'Enter a valid email address';
                            }
                            return null; // No error
                          },

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: size * 0.9),
                        child: RichText(
                          text: TextSpan(
                            text: 'Ouery type', // Normal text
                            style: TextStyle(
                              fontSize: size * 0.04,
                              color: Colors.black, // Default color
                            ),
                            children: [
                              TextSpan(
                                text: '*', // Asterisk
                                style: TextStyle(
                                  fontSize: size * 0.04,
                                  color: Colors.blue, // Blue color for the asterisk
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size*0.03,
                      ),

                      Container(
                        width: size * 1.1,
                        height: size * 0.27,
                        child: DropdownButtonFormField<String>(
                          value: _selectedQueryType,
                          items: queryTypes.map((String queryType) {
                            return DropdownMenuItem<String>(
                              value: queryType,
                              child: Text(queryType),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedQueryType = value!;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Select a query type',  // Add hint text similar to TextFormField
                            //  labelText: "Select Query Type",
                            labelStyle: TextStyle(fontSize: size * 0.05),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size * 0.02),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size * 0.02),
                              borderSide: BorderSide(color: Colors.blue, width: size * 0.005),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size * 0.02),
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a query type';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: size * 0.72),
                        child: RichText(
                          text: TextSpan(
                            text: 'Discribe your issue', // Normal text
                            style: TextStyle(
                              fontSize: size * 0.04,
                              color: Colors.black, // Default color
                            ),
                            children: [
                              TextSpan(
                                text: '*', // Asterisk
                                style: TextStyle(
                                  fontSize: size * 0.04,
                                  color: Colors.blue, // Blue color for the asterisk
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size*0.03,
                      ),
                      Container(
                        width: size * 1.1,
                        child: TextFormField(
                          //controller: _textController,  // Replace with your controller if needed
                          maxLength: 600,  // Limits the input to 600 characters
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: 'Enter your text here',  // Provide a hint text
                            // labelText: 'Text Field',  // Set the label text
                            labelStyle: TextStyle(fontSize: size * 0.05),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size * 0.02),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size * 0.02),
                              borderSide: BorderSide(color: Colors.blue, width: size * 0.005),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size * 0.02),
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            ),
                          ),
                          style: TextStyle(fontSize: 16),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: size * 0.479),
                        child: RichText(
                          text: TextSpan(
                            text: 'Preferred guidance language', // Normal text
                            style: TextStyle(
                              fontSize: size * 0.04,
                              color: Colors.black, // Default color
                            ),
                            children: [
                              TextSpan(
                                text: '*', // Asterisk
                                style: TextStyle(
                                  fontSize: size * 0.04,
                                  color: Colors.blue, // Blue color for the asterisk
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size*0.03,
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left:size*0.089),
                            child: Container(
                              width: size * 0.4, // Specific width
                              height: size * 0.15, // Specific height

                              decoration: BoxDecoration(
                                color: Colors.white, // Background color
                                border: Border.all(color: Colors.blue, width: 1.5), // Blue border
                                borderRadius: BorderRadius.circular(size * 0.03), // Curved edges
                              ),
                              child: Padding(
                                padding:  EdgeInsets.only(right:size*0.1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Radio<String>(
                                      value: "Hindi",
                                      groupValue: _selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedGender = value;
                                        });

                                      },
                                      activeColor: Colors.blue, // Blue color for the radio button
                                    ),
                                    Text(
                                      "Hindi",
                                      style: TextStyle(fontSize: size * 0.037),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: size*0.07,),

                          Container(
                            width: size * 0.4, // Specific width
                            height: size * 0.15, // Specific height

                            decoration: BoxDecoration(
                              color: Colors.white, // Background color
                              border: Border.all(color: Colors.blue, width: 1.5), // Blue border
                              borderRadius: BorderRadius.circular(size * 0.03), // Curved edges
                            ),
                            child: Padding(
                              padding:  EdgeInsets.only(right: size*0.1),
                              child: Row(
                                children: [

                                  Radio<String>(
                                    value: "English",
                                    groupValue: _selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value;
                                      });
                                    },
                                    activeColor: Colors.blue, // Blue color for the radio button
                                  ),
                                  Text(
                                    "English",
                                    style: TextStyle(fontSize: size * 0.037),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),


                    ],
                  )


                ],
              ),
            ),
          ),
        ),
    );
  }
  Widget _buildSliderItem({
    required String title,
    required BuildContext context,
    required String imagePath,

  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SizedBox(width: 10,),
        RichText(
          text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: GoogleFonts.roboto(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                TextSpan(
                  text: "\nPuch lo!",
                  style: GoogleFonts.workSans(
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0F3CC9),
                  ),
                ),
              ]
          ),
        ),
        Image.asset(
          imagePath,
          fit: BoxFit.contain,
          //height,
          width: MediaQuery.of(context).size.width * 0.4,
        )

      ],
    );
  }
}

