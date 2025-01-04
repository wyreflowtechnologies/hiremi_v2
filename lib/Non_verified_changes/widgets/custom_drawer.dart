import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'logoutDialog.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
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
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.01, bottom: 30, left: 13, right: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularPercentIndicator(
                          radius: 30,
                          backgroundColor:
                              const Color(0xFF808080).withOpacity(0.25),
                          lineWidth: 6,
                          animation: false,
                          center: const Text(
                            '25%',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          percent: 0.25,
                          progressColor: const Color(0xFF34AD78),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Kritish Bokde',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              height: 18,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFF0F3CC9)),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.verified,
                                      color: Color(0xFF0F3CC9), size: 12),
                                  SizedBox(width: 4),
                                  Text(
                                    'Not Verified',
                                    style: TextStyle(
                                        fontSize: 10, color: Color(0xFF0F3CC9)),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'KritishBokde@gmail.com',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F3CC9),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hiremi',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'Complete profile verification to access premium features',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.white),
                              height: 30,
                              width: double.infinity,
                              child: const Center(
                                child: Text(
                                  'Get verified ☺️',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.grey),
              _buildMenuItemGeneral(
                context,
                Icons.menu,
                'Settings',
                () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const SettingsScreen(),
                  //     ));
                },
              ),
              SizedBox(height: height * 0.015),
              _buildMenuItemGeneral(
                context,
                Icons.lock,
                'Change Password',
                () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangePasswordScreen(),));
                },
              ),
              SizedBox(height: height * 0.015),
              _buildMenuItemGeneral(
                context,
                Icons.paste,
                'About App',
                () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => HelpAndSupport2(),
                  //   ),
                  // );
                },
              ),
              SizedBox(height: height * 0.015),
              _buildMenuItemGeneral(
                context,
                Icons.info,
                'Help & Support',
                () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const HelpAndSupport(
                  //       currentIndex: 0,
                  //     ),
                  //   ),
                  // );
                },
              ),
              const Spacer(),
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
        color: isLogout ? const Color(0xFFDC2626) : const Color(0xFF0F3CC9),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: width * 0.036,
          color: isLogout ? const Color(0xFFDC2626) : const Color(0xFF1F1F1F),
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
          showDialog<bool>(
            context: context,
            barrierColor: Colors.black.withOpacity(0.5),
            builder: (context) => const LogoutDialog(),
          );
        }
      },
    );
  }
}
