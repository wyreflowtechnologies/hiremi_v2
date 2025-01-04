import 'package:flutter/material.dart';
import 'package:pre_dashboard/predashboard/constants/constants.dart';
import 'package:pre_dashboard/predashboard/screens/LoginScreen.dart';

class CongratulationsDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: Text('Congratulations'),
      // content: Text('Your password has been successfully changed!'),
      actions: <Widget>[
        SizedBox(height: MediaQuery.of(context).size.width*0.06,),
       Image.asset("assets/images/pana.png"),
        SizedBox(height: MediaQuery.of(context).size.width*0.05,),
        Center(child: Text("Congratulations",
        style: TextStyle(
          color:AppColors.primaryColor,
          fontSize: MediaQuery.of(context).size.width*0.045,
          fontWeight:FontWeight.bold
        ),
        )),
        SizedBox(height: MediaQuery.of(context).size.width*0.06,),
        Center(child: Text("Your password has been successfully changed",
          textAlign: TextAlign.center,
        )),
        SizedBox(height: MediaQuery.of(context).size.width*0.05,),

        Center(
          child: ElevatedButton(
            onPressed: () {
               Navigator.push(context,MaterialPageRoute(builder: (context)=> LoginScreenUpdated()));

            },
            child: Text(
              "Go to login Page",
              style: TextStyle(
                color: AppColors.white, // White text color
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor, // Blue background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Curved edges
              ),
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.2, vertical: MediaQuery.of(context).size.width*0.05), // Optional: Adjust padding as needed
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.width*0.05,),

        Center(
          child: Text("Note: you can now log in with your new password",
         // textAlign: TextAlign.center,
            style: TextStyle(
                color:AppColors.grey,
                fontSize: MediaQuery.of(context).size.width*0.022,
                fontWeight:FontWeight.bold
            ),
          ),
        )

      ],
    );
  }
}
