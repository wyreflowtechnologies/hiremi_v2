import 'package:flutter/material.dart';
import 'package:pre_dashboard/screens/splash_screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pre dashboard',
      theme: ThemeData(
          textTheme: TextTheme(

          bodyMedium: TextStyle(
            fontFamily: "Poppins",
            fontSize: MediaQuery.of(context).size.width*0.035,
            fontWeight: FontWeight.w500,
          ),
           titleLarge: TextStyle(
            fontFamily: "Poppins",
            fontSize: MediaQuery.of(context).size.width * 0.07,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF163EC8),
          ),
          bodySmall: TextStyle(
            fontFamily: "Poppins",
            fontSize: MediaQuery.of(context).size.width * 0.03,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          headlineSmall: TextStyle(
            fontFamily: "Poppins",
            fontSize: MediaQuery.of(context).size.width * 0.07,
            color: const Color(0xFF6983D9),
          ),
        ),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        
      
      home: SplashScreen(),
    );
  }
}
