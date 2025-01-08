import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pre_dashboard/Footer/widget/custom_bottom_bar.dart';


import 'package:url_launcher/url_launcher.dart';



class HelpSupport extends StatefulWidget {
  const HelpSupport({Key? key, }) : super(key: key);

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  int currentIndex = 0;
  final String phoneNumber = '+91 89 7845 4512';
  void _launchWhatsApp() async {
    final String url = 'https://wa.me/$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  Text(
          "Help & Support",
          style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: screenHeight*0.02
          ),
        ),

        centerTitle: true,
        actions: [
          // IconButton(
          //   onPressed: () {
          //     Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const NotificationScreen()));
          //   },
          //   icon: const Icon(Icons.notifications),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenHeight * 0.03),
          child: Column(
            children: [

              const Center(
                  child: Image(
                      image: const AssetImage(
                          'assets/images/Contact us-cuate (1) (1).png'))),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 81.0),
                child: Text("Got App Related Query?",style: TextStyle(
                  color: Color(0xFF41485E),
                  fontSize: 22,

                ),),
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              // Row(
              //   children: [
              //     Container(
              //       height: screenHeight * 0.002,
              //       width: screenWidth * 0.390,
              //       decoration: BoxDecoration(
              //         border: Border.all(color: Colors.grey.shade400),
              //       ),
              //     ),
              //     SizedBox(
              //       width: screenWidth * 0.02,
              //     ),
              //     const Text('or', style: TextStyle(fontWeight: FontWeight.bold)),
              //     SizedBox(
              //       width: screenWidth * 0.02,
              //     ),
              //     Container(
              //       height: screenHeight * 0.002,
              //       width: screenWidth * 0.390,
              //       decoration: BoxDecoration(
              //         border: Border.all(color: Colors.grey.shade400),
              //       ),
              //     ),
              //   ],
              // ),

              SizedBox(
                height: screenHeight * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.call, color: Color(0xFF0F3CC9),),
                      SizedBox(width: screenWidth * 0.04),
                      const Text(
                        'Phone:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      GestureDetector(
                        onTap: _launchWhatsApp,
                        child:  Text(
                          phoneNumber,
                          style: TextStyle(
                              color: Color(0xFF0F3CC9), fontWeight: FontWeight.bold),
                          overflow: TextOverflow
                              .ellipsis, // Ensure text does not overflow
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.public, color: Color(0xFF0F3CC9),),
                    SizedBox(
                      width: screenWidth * 0.04,
                    ),
                    const Text(
                      'Website: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    InkWell(
                      onTap: ()async{
                        const url = 'http://hiremi.in/';
                        await launch(url);
                      },
                      child: Text(
                        'www.hiremi.in',
                        style: TextStyle(
                            color: Color(0xFF0F3CC9), fontWeight: FontWeight.bold),
                        overflow: TextOverflow
                            .ellipsis, // Ensure text does not overflow
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.send, color: Color(0xFF0F3CC9),),
                      SizedBox(width: screenWidth * 0.04),
                      const Text(
                        'Email:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      InkWell(
                        onTap: ()async{
                          final Uri emailUri = Uri(
                            scheme: 'mailto',
                            path: 'hiremi@support.com',
                          );
                          if (await canLaunch(emailUri.toString())) {
                            await launch(emailUri.toString());
                          } else {
                            throw 'Could not launch $emailUri';
                          }
                        },
                        child: Text(
                          'hiremi@support.com',
                          style: TextStyle(
                              color: Color(0xFF0F3CC9), fontWeight: FontWeight.bold),
                          overflow: TextOverflow
                              .ellipsis, // Ensure text does not overflow
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              // Container(
              //   height: screenHeight * 0.002,
              //   width: screenWidth * 0.900,
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.grey.shade400),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomBar(
      //   currentIndex: currentIndex,
      //   onTabSelected: (value) {
      //     setState(() {
      //       currentIndex = value;
      //     });
      //   },
      // ),
    );
  }
}
