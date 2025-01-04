import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pre_dashboard/HomePage/Widget/AskQueryBlurredDIalogBox.dart';
import 'package:pre_dashboard/HomePage/Widget/app_bar.dart';
import 'package:pre_dashboard/HomePage/Widget/app_drawer.dart';
import 'package:reactive_forms/reactive_forms.dart';



class Query2 extends StatefulWidget {
  const Query2({super.key});

  @override
  State<Query2> createState() => _Query2State();
}

class _Query2State extends State<Query2> {
  String? _selectedGender="Male";
  String? _selectedLanguage="Hindi";

  String? _selectedQueryType;
  final List<String> queryTypes = [
    "Career Guidance",
    "Internship & Job Search",
    "Skill Development",
    "Exam Preparation",
    "Career Transition",
    "Freelancing or Entrepreneurship"
  ];
  final _formKey = GlobalKey<FormState>();
  final FormGroup form = fb.group({
    'option': FormControl<int>(validators: [Validators.required])
  });
  final _nameController = TextEditingController();
  final _emailController=TextEditingController();
  final _summaryController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      backgroundColor: Colors.white,
     //appBar: customAppBar(context, "Ask Expert"),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color:  Color(0xFF4C77D4),
            ),
          ),
          title: Text("Ask Expert",textAlign: TextAlign.center,),
          backgroundColor: Colors.transparent, // Make the background transparent
          elevation: 0, // Remove the shadow under the AppBar
        ),
      ),
      drawer: const AppDrawer(),
      body: Stack(

        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1, // 20% of the screen height
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF4C77D4), // Start color (blue)
                  Colors.transparent, // Fade to transparent
                ],
              ),
            ),
          ),
          Form(
            key: _formKey, // This is the FormKey
            child: Column(
              children: [
                // Fixed FlutterCarousel
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: FlutterCarousel(
                    options: FlutterCarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.15,
                      viewportFraction: 1,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                    ),
                    items: [
                      _buildSliderItem(
                        context: context,
                        title: "Career gap ki \ntension lo?",
                        imagePath: "assets/images/ask_expert_page.png",
                      ),
                      _buildSliderItem(
                        context: context,
                        title: "Pahli job ki\ntayari?",
                        imagePath: "assets/images/banner (10) 1.png",
                      ),
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
                ),
                // Content below the carousel
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10), // Adjust padding here
                      child:  Column(
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
                                      color:Color(0xFF0F3CC9), // Blue color for the asterisk
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
                                  borderSide: BorderSide(color: Color(0xFF0F3CC9), width: size * 0.005),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(size * 0.02),
                                  borderSide: BorderSide(color: Color(0xFF0F3CC9), width: 2.0),
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
                                      color: Color(0xFF0F3CC9), // Blue color for the asterisk
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
                                  borderSide: BorderSide(color: Color(0xFF0F3CC9), width: size * 0.005),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(size * 0.02),
                                  borderSide: BorderSide(color: Color(0xFF0F3CC9), width: 2.0),
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
                                      color: Color(0xFF0F3CC9), // Blue color for the asterisk
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
                                    border: Border.all(color: Color(0xFF0F3CC9), width: 1.5), // Blue border
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
                                          activeColor: Color(0xFF0F3CC9), // Blue color for the radio button
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
                                  border: Border.all(color: Color(0xFF0F3CC9), width: 1.5), // Blue border
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
                                        activeColor: Color(0xFF0F3CC9), // Blue color for the radio button
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
                                      color: Color(0xFF0F3CC9), // Blue color for the asterisk
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
                                  borderSide: BorderSide(color: Color(0xFF0F3CC9), width: size * 0.005),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(size * 0.02),
                                  borderSide: BorderSide(color: Color(0xFF0F3CC9), width: 2.0),
                                ),
                              ),
                              style: TextStyle(fontSize: 16),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Summary is required';
                                }
                                return null; // No error
                              },

                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: size * 0.9),
                            child: RichText(
                              text: TextSpan(
                                text: 'Query type', // Normal text
                                style: TextStyle(
                                  fontSize: size * 0.04,
                                  color: Colors.black, // Default color
                                ),
                                children: [
                                  TextSpan(
                                    text: '*', // Asterisk
                                    style: TextStyle(
                                      fontSize: size * 0.04,
                                      color: Color(0xFF0F3CC9), // Blue color for the asterisk
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
                                  borderSide: BorderSide(color: Color(0xFF0F3CC9), width: size * 0.005),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(size * 0.02),
                                  borderSide: BorderSide(color:Color(0xFF0F3CC9), width: 2.0),
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
                            padding: EdgeInsets.only(right: size * 0.52),
                            child: RichText(
                              text: TextSpan(
                                text: 'Describe your issue(Optional)', // Normal text
                                style: TextStyle(
                                  fontSize: size * 0.04,
                                  color: Colors.black, // Default color
                                ),
                                children: [
                                  TextSpan(
                                    text: '*', // Asterisk
                                    style: TextStyle(
                                      fontSize: size * 0.04,
                                      color: Color(0xFF0F3CC9), // Blue color for the asterisk
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
                                hintText: 'Enter your issue here',  // Provide a hint text
                                // labelText: 'Text Field',  // Set the label text
                                labelStyle: TextStyle(fontSize: size * 0.05),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(size * 0.02),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(size * 0.02),
                                  borderSide: BorderSide(color: Color(0xFF0F3CC9), width: size * 0.005),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(size * 0.02),
                                  borderSide: BorderSide(color: Color(0xFF0F3CC9), width: 2.0),
                                ),
                              ),
                              style: TextStyle(fontSize: 16),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'This field is required';
                              //   }
                              //   return null;
                              // },
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
                                      color: Color(0xFF0F3CC9), // Blue color for the asterisk
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
                                    border: Border.all(color: Color(0xFF0F3CC9), width: 1.5), // Blue border
                                    borderRadius: BorderRadius.circular(size * 0.03), // Curved edges
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.only(right:size*0.1),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [

                                        Radio<String>(
                                          value: "Hindi",
                                          groupValue: _selectedLanguage,
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedLanguage = value;
                                            });

                                          },
                                          activeColor: Color(0xFF0F3CC9), // Blue color for the radio button
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
                                  border: Border.all(color: Color(0xFF0F3CC9), width: 1.5), // Blue border
                                  borderRadius: BorderRadius.circular(size * 0.03), // Curved edges
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.only(right: size*0.1),
                                  child: Row(
                                    children: [

                                      Radio<String>(
                                        value: "English",
                                        groupValue: _selectedLanguage,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedLanguage = value;
                                          });
                                        },
                                        activeColor: Color(0xFF0F3CC9), // Blue color for the radio button
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
                          SizedBox(height: size*0.1,),
                          ElevatedButton(
                            onPressed: () {
                              // Your onPressed logic here
                              if (_formKey.currentState?.validate() ?? false) {
                                // Process the data
                                print("Clickongcxcxxc");
                                showDialog(
                                  context: context,
                                  barrierDismissible: false, // Prevents dismissing the dialog by tapping outside
                                  builder: (context) {
                                    // Pass the message to the BlurredDialog widget
                                    return BlurredDialog(message: 'Processing...');
                                  },
                                );
                              }
                              else{

                                print("Clickong");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF0F3CC9), // Blue color
                              minimumSize: Size(370, 60), // Set fixed width and height
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12), // Optional: rounded corners
                              ),
                            ),
                            child: Text(
                              'SubMit your query',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          )


                        ],
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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

