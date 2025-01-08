
import 'package:flutter/material.dart';
import 'package:pre_dashboard/HomePage/constants/constantsColor.dart';


import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const Color customRed = Color(0xFFC1272D);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (ctx) => const NotificationScreen(),
              // ));
            },
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // FutureBuilder<Map<String, String?>>(
              //   future: _getUserInfo(),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return Center(child: CircularProgressIndicator());
              //     } else if (snapshot.hasError) {
              //       return Text('Error: ${snapshot.error}');
              //     } else if (!snapshot.hasData || snapshot.data?['fullName'] == null) {
              //       return Text('User information not available');
              //     } else {
              //       final fullName = snapshot.data?['fullName'];
              //       final uid = snapshot.data?['uid'];
              //       // return VerifiedProfileWidget(
              //       //   name:fullName?.split(' ').first ?? 'N/A',
              //       //   //appId: uid ?? 'N/A',
              //       // );
              //     }
              //   },
              // ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor:  Color.fromRGBO(238, 238, 251, 1),
                    radius: MediaQuery.of(context).size.width * 0.07,
                    child: const Icon(
                      Icons.person,
                      color:  Color.fromRGBO(15, 60, 201, 3),
                      size: 18.86,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        'Hi, Yash',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.fingerprint,
                            size: 10.7,
                          ),
                          const Text(
                            'App ID: ',
                            style: TextStyle(fontSize: 10.7),
                          ),
                          // Text(
                          //   UID,
                          //   style: const TextStyle(fontSize: 10.7, color: Colors.grey),
                          // ),

                        ],
                      ),

                    ],
                  ),
                  const Spacer(),
                  // Container(
                  //   height: MediaQuery.of(context).size.width * 0.08,
                  //   width: MediaQuery.of(context).size.width * 0.17,
                  //   decoration: BoxDecoration(
                  //     color: Colors.white, // Set the background color to white or transparent
                  //     border: Border.all(
                  //       color: Colors.redAccent, // Border color
                  //       width: 2, // Border width
                  //     ),
                  //     borderRadius: BorderRadius.circular(8), // Optional: Add rounded corners
                  //   ),
                  //   color: Colors.redAccent,
                  //   child: Center(
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //        // Image.asset('images/new_releases (1).png'),
                  //         SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                  //         const Text(
                  //           'Not Verfied',
                  //
                  //           style: TextStyle(color: Colors.black87, fontSize: 8.42),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.08,
                    width: MediaQuery.of(context).size.width * 0.17,
                    decoration: BoxDecoration(
                      color: Colors.white, // Set the background color to white or transparent
                      border: Border.all(
                        color: Colors.redAccent, // Border color
                        width: 2, // Border width
                      ),
                      borderRadius: BorderRadius.circular(8), // Optional: Add rounded corners
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image.asset('images/new_releases (1).png'),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                          const Text(
                            'Not Verified',
                            style: TextStyle(color: Colors.black87, fontSize: 8.42),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              // Account section
              Text(
                'Account',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Container(
                width: screenWidth * 0.9,
                padding: EdgeInsets.all(screenWidth * 0.02),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(screenHeight * 0.01),
                ),
                child: RawMaterialButton(
                  onPressed: () {

                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_circle_outlined,
                      //  color: AppColors.primary,
                        color:  Color.fromRGBO(15, 60, 201, 3),

                        size: screenHeight * 0.03,
                      ),
                      SizedBox(
                        width: screenWidth * 0.03,
                      ),
                      InkWell(
                        onTap: (){
                         // Navigator.of(context).push(MaterialPageRoute(
                           //   builder: (ctx) =>  ProfileScreen()));
                        },
                        child: Text(
                          'Personal Information',
                          style: TextStyle(fontSize: screenHeight * 0.02),
                        ),
                      ),
                      const Spacer(),
                      // IconButton(
                      //   onPressed: () {
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //         builder: (ctx) =>  ProfileScreen()));
                      //   },
                      //   icon: Icon(
                      //     Icons.arrow_forward_ios,
                      //     size: screenHeight * 0.02,
                      //   ),
                      //   style: ButtonStyle(
                      //       backgroundColor: WidgetStatePropertyAll(AppColors.bgBlue)),
                      // )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              const Text(
                'Privacy & Security',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Container(
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(screenHeight * 0.01),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Column(
                    children: [
                      RawMaterialButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.lock_open_rounded,
                              // color: AppColors.primary,
                              color:  Color.fromRGBO(15, 60, 201, 3),

                              size: screenHeight * 0.03,
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            InkWell(
                              onTap: (){
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (ctx) => const Forget_Your_Password()));
                              },
                              child: Text(
                                'Change Password',
                                style: TextStyle(fontSize: screenHeight * 0.02),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (ctx) => const Forget_Your_Password()));
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: screenHeight * 0.02,
                                color:  Color.fromRGBO(15, 60, 201, 3),

                              ),
                              // style: ButtonStyle(
                              //     backgroundColor: WidgetStatePropertyAll(AppColors.bgBlue)),
                            )
                          ],
                        ),
                      ),
                      // RawMaterialButton(
                      //   onPressed: () {},
                      //   child: Row(
                      //     children: [
                      //       Icon(
                      //         Icons.notifications_outlined,
                      //         color: AppColors.primary,
                      //         size: screenHeight * 0.03,
                      //       ),
                      //       SizedBox(
                      //         width: screenWidth * 0.03,
                      //       ),
                      //       Text(
                      //         'Job Alert Notification',
                      //         style: TextStyle(fontSize: screenHeight * 0.02),
                      //       ),
                      //       const Spacer(),
                      //       Transform.scale(
                      //         scale: 0.7,
                      //         child: Switch(
                      //           value: false,
                      //           onChanged: (value) {},
                      //           activeColor: customRed,
                      //           activeTrackColor: Colors.grey[300],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      RawMaterialButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.explore_outlined,
                              // color: AppColors.primary,
                              color:  Color.fromRGBO(15, 60, 201, 3),

                              size: screenHeight * 0.03,
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            InkWell(
                              onTap: ()async{
                                final Uri url =
                                Uri.parse('http://www.hiremi.in/terms&condition.html');
                                if (!await launchUrl(url)) {
                                  throw Exception('Could not launch $url');
                                }
                              },
                              child: Text(
                                'Terms and Condition',
                                style: TextStyle(fontSize: screenHeight * 0.02),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () async {
                                final Uri url =
                                Uri.parse('http://www.hiremi.in/terms&condition.html');
                                if (!await launchUrl(url)) {
                                  throw Exception('Could not launch $url');
                                }
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: screenHeight * 0.02,
                                color:  Color.fromRGBO(15, 60, 201, 3),

                              ),
                            //   style: ButtonStyle(
                            //       backgroundColor: WidgetStatePropertyAll(AppColors.bgBlue)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              const Text(
                'About & More',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Container(
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(screenHeight * 0.01),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Column(
                    children: [
                      RawMaterialButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.import_contacts_sharp,
                              // color: AppColors.primary,
                              color:  Color.fromRGBO(15, 60, 201, 3),

                              size: screenHeight * 0.03,
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            InkWell(
                              onTap: (){
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (ctx) => const About_Us2()));
                              },
                              child: Text(
                                'About Us',
                                style: TextStyle(fontSize: screenHeight * 0.02),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (ctx) => const About_Us2()));
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: screenHeight * 0.02,
                                color:  Color.fromRGBO(15, 60, 201, 3),

                              ),
                            //   style: ButtonStyle(
                            //       backgroundColor: WidgetStatePropertyAll(AppColors.bgBlue)),
                            ),
                          ],
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.wifi_calling_3_sharp,
                              color:  Color.fromRGBO(15, 60, 201, 3),

                            //  color: AppColors.primary,
                              size: screenHeight * 0.03,
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            InkWell(
                              onTap: (){
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (ctx) => const HelpSupport()));
                              },
                              child: Text(
                                'Help & Support',
                                style: TextStyle(fontSize: screenHeight * 0.02,

                                ),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (ctx) => const HelpSupport()));
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: screenHeight * 0.02,
                                color:  Color.fromRGBO(15, 60, 201, 3),

                              ),
                            //   style: ButtonStyle(
                            //       backgroundColor: WidgetStatePropertyAll(AppColors.bgBlue)),
                            // )
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
