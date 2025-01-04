import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pre_dashboard/Footer/screens/basic_details_screen.dart';
import 'package:pre_dashboard/HomePage/screens/AboutApp.dart';
import 'package:pre_dashboard/HomePage/screens/Drawer/query2.dart';
import 'package:pre_dashboard/HomePage/screens/HomeScreen.dart';
import 'package:pre_dashboard/HomePage/screens/Query.dart';
import 'package:pre_dashboard/HomePage/screens/askExpertScreen.dart';
import 'package:pre_dashboard/Non_verified_changes/screens/final_step_screen.dart';
import 'package:pre_dashboard/Non_verified_changes/screens/payment_processing_step.dart';
import 'package:pre_dashboard/Non_verified_changes/screens/profile_verification_screen1.dart';


import 'package:pre_dashboard/predashboard/Provider/StateCityProvider.dart';
import 'package:pre_dashboard/predashboard/bloc/user_bloc.dart';
import 'package:pre_dashboard/predashboard/screens/LoginScreen.dart';
import 'package:pre_dashboard/predashboard/screens/splash_screens/splash_screen1.dart';
import 'package:provider/provider.dart';

import 'Hiremi360/controller_screen/controller_screen.dart';
void main() {
  runApp( BlocProvider(
    create: (context) => UserBloc(),
    child: MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pre dashboard',
      theme: ThemeData(
        textTheme:TextTheme(
          bodyMedium: GoogleFonts.poppins(
            fontSize: MediaQuery.of(context).size.width * 0.035,
            fontWeight: FontWeight.w500,
          ),
          titleLarge: GoogleFonts.poppins(
            fontSize: MediaQuery.of(context).size.width * 0.07,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF163EC8),
          ),
          bodySmall: GoogleFonts.poppins(
            fontSize: MediaQuery.of(context).size.width * 0.03,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          headlineSmall: GoogleFonts.poppins(
            fontSize: MediaQuery.of(context).size.width * 0.07,
            color: const Color(0xFF6983D9),
          ),
        ),
        useMaterial3: true,
      ),
      home:  SplashScreen(),
    );
  }
}
