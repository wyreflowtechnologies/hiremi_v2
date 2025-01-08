import 'package:flutter/material.dart';
import 'package:pre_dashboard/HomePage/Widget/popupmsg.dart';
import 'package:pre_dashboard/HomePage/screens/AboutApp.dart';
import 'package:pre_dashboard/HomePage/screens/Drawer/Settings.dart';
import 'package:pre_dashboard/HomePage/screens/Drawer/help_Support.dart';
import 'package:pre_dashboard/HomePage/screens/HelpAnsSupport.dart';


import '../screens/Drawer/about.dart';
import 'logoutDialog.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: width * 0.02,
          ),
          child: Column(
            children: [
              // Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: width * 0.12,
                        height: width * 0.12,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: 0.25,
                              backgroundColor: const Color(0xFFEEF2FF),
                              color: const Color.fromARGB(255, 36, 231, 33),
                              strokeWidth: width * 0.015,
                            ),
                            Text(
                              '25%',
                              style: TextStyle(
                                fontSize: width * 0.032,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 36, 231, 33),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: width * 0.01),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Zaidi Akram',
                            style: TextStyle(
                              fontSize: width * 0.039,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1F1F1F),
                            ),
                          ),
                          Text(
                            'zaidiakram123@gmail.com',
                            style: TextStyle(
                              fontSize: width * 0.028,
                              color: const Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      size: width * 0.06,
                      color: const Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.025),

              // Profile Verification Section
              Container(
                padding: EdgeInsets.all(width * 0.04),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F3CC9),
                  borderRadius: BorderRadius.circular(width * 0.03),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'HireMi',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        // Container(
                        //   margin: EdgeInsets.only(left: width * 0.02),
                        //   padding: EdgeInsets.symmetric(
                        //     horizontal: width * 0.02,
                        //     vertical: width * 0.004,
                        //   ),
                        //   decoration: BoxDecoration(
                        //     color: const Color.fromARGB(255, 212, 176, 18),
                        //     borderRadius: BorderRadius.circular(width * 0.01),
                        //   ),
                        //   child: Text(
                        //     'Get Verified',
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: width * 0.024,
                        //       fontWeight: FontWeight.w700,
                        //       letterSpacing: 0.5,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      'Complete profile verification to access premium features',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.032,
                        height: 1.3,
                      ),
                    ),
                    SizedBox(height: height * 0.008),
                    ElevatedButton(onPressed: (){

                    },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width*0.02), // Adjust the radius as needed
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Adjust padding
                        ),
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Get Verified",style: TextStyle(
                          color: const Color(0xFF0F3CC9),
                        ),),
                        SizedBox(width: width*0.02,),
                        Icon(Icons.check_circle_outline,
                        color: const Color(0xFF0F3CC9),
                        )
                      ],
                    ))
                  ],
                ),
              ),

              SizedBox(height: height * 0.025),

              _buildMenuItemGeneral(
                context,
                Icons.account_circle,
                'Your Profile',
                () {
                showCustomPopup(context);

                }
              ),
              SizedBox(height: height * 0.015),
              _buildMenuItemGeneral(
                context,
                Icons.menu,
                'Settings',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: height * 0.015),
              _buildMenuItemGeneral(
                context,
                Icons.assignment,
                'About App',
                ()  {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => About_App(),
                    ),
                  );
                },
              ),
              SizedBox(height: height * 0.015),
              _buildMenuItemGeneral(
                context,
                Icons.quickreply,
                'Help & Support',
                () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => HelpAndSupport(),
                  //   ),
                  // );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HelpSupport(),
                    ),
                  );
                },
              ),

              const Spacer(),

              // Logout Item
              _buildMenuItem(
                context,
                Icons.logout,
                'Log out',
                isLogout: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItemGeneral(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    final width = MediaQuery.of(context).size.width;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: width * 0.005,
      ),
      leading: Icon(icon, size: width * 0.055, color: const Color(0xFF0F3CC9)),
      title: Text(
        title,
        style: TextStyle(
          fontSize: width * 0.036,
          color: const Color(0xFF1F1F1F),
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(Icons.chevron_right,
          size: width * 0.06, color: const Color(0xFF6B7280)),
      onTap: onTap,
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title, {
    bool isLogout = false,
  }) {
    final width = MediaQuery.of(context).size.width;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: width * 0.005,
      ),
      leading: Icon(
        icon,
        size: width * 0.055,
        color: isLogout ?const Color(0xFF0F3CC9) : const Color(0xFFDC2626) ,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: width * 0.036,
          color: isLogout ? const Color(0xFF0F3CC9) :  Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: isLogout
          ? null
          : Icon(
              Icons.chevron_right,
              size: width * 0.06,
              color: const Color(0xFF6B7280),
            ),
      onTap: () async {
        if (isLogout) {
          Navigator.pop(context);
          final shouldLogout = await showDialog<bool>(
            context: context,
            barrierColor: Colors.black.withOpacity(0.5),
            builder: (context) => const LogoutDialog(),
          );

          if (shouldLogout == true) {
            print('Performing logout...');
          }
        }
      },
    );
  }
}
