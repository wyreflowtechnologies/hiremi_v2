import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pre_dashboard/Non_verified_changes/screens/payment_verification_screen.dart';
import 'package:pre_dashboard/Non_verified_changes/widgets/custom_drawer.dart';
import 'package:pre_dashboard/Non_verified_changes/widgets/custombottombar.dart';
import 'package:pre_dashboard/RazorPayPayment/RazorPayPayment.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PaymentVerificationFailScreen extends StatefulWidget {
  const PaymentVerificationFailScreen({super.key});

  @override
  State<PaymentVerificationFailScreen> createState() =>
      _PaymentFailureScreenState();
}

class _PaymentFailureScreenState extends State<PaymentVerificationFailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpayHelper = RazorpayHelper();
  }
  late RazorpayHelper _razorpayHelper;
  bool isButtonDisabled = false;
  bool? paymentStatus;
  Future<bool> _makePayment() async {
    print("HEDEEE");

    double amount = 1; // Example amount
    Completer<bool> paymentCompleter = Completer<bool>();

    // Generate Order ID

    _razorpayHelper.generateOrderId(
      amount: amount,
      onOrderIdGenerated: (orderId) async {
        print('Order ID generated: $orderId');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('ORDERID', orderId);  // Save the orderId
        // Start Payment
        _razorpayHelper.startPayment(
          amount: amount,
          contact: '1234567890',
          email: "",
        );
      },

      onError: (errorMessage) {
        print("Order ID generation error: $errorMessage");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
        paymentCompleter.complete(false); // Payment failed
      },
    );
    setState(() {
      isButtonDisabled = false; // Disable the button after click
    });


    // Handle callbacks for Razorpay payment status
    _razorpayHelper.initialize(
      onSuccess: (PaymentSuccessResponse response) {
        print("HDHD");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PaymentVerificationScreen(),
            ));
        print("Payment Successful: ${response.paymentId}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Payment Successful: ${response.paymentId}")),
        );
        paymentCompleter.complete(true); // Payment successful
      },
      onFailure: (PaymentFailureResponse response) {

        print("Payment Failed: ${response.code} - ${response.error}-${response.message}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Payment Failed: ${response.message}")),
        );
        paymentCompleter.complete(false); // Payment failed
      },
      onExternalWallet: (ExternalWalletResponse response) {
        print("External Wallet Selected: ${response.walletName}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("External Wallet Selected: ${response.walletName}")),
        );
        paymentCompleter.complete(false); // Consider external wallet as failure
      },
    );

    return paymentCompleter.future;
  }
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const CustomDrawer(),
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Profile Verification",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          centerTitle: true,
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
                            style:
                            TextStyle(fontSize: size.width * 0.023, fontWeight: FontWeight.bold, color: const Color(0xFF0F3CC9)),
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/payment_failed.png',
              ),
            ),
            SizedBox(height: size.height * 0.04),
            const Text(
              "Your payment was not\nsuccessful. Please try again",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFEE3322),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            const Text(
              "We encountered an issue with your payment\nPlease try again",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0F3CC9),
                fontSize: 14,
              ),
            ),
            SizedBox(height: size.height * 0.06),
            Center(
              child: ElevatedButton(
                onPressed: isButtonDisabled
                    ? null // Disables the button if isButtonDisabled is true
                    : () async {
                  setState(() {
                    isButtonDisabled = true; // Disable the button after click
                  });

                  bool isSuccess = await _makePayment();

                  setState(() {
                    paymentStatus = isSuccess;
                    // Re-enable the button after payment is completed
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F3CC9),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: Size(size.width * 0.2, size.height * 0.06),
                ),
                child:
                const Text("Try Again", style: TextStyle(fontSize: 16)),
              ),
            ),
            // Center(
            //   child: ElevatedButton(
            //     onPressed: isButtonDisabled
            //         ? null // Disables the button if isButtonDisabled is true
            //         : () async {
            //       setState(() {
            //         isButtonDisabled = true; // Disable the button after click
            //       });
            //
            //       bool isSuccess = await _makePayment();
            //
            //       setState(() {
            //         paymentStatus = isSuccess;
            //         // Re-enable the button after payment is completed
            //       });
            //     },
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: const Color(0xFF0F3CC9),
            //       foregroundColor: Colors.white,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //       minimumSize: Size(size.width * 0.8, size.height * 0.06),
            //     ),
            //     child:
            //     const Text("Pay ₹2999", style: TextStyle(fontSize: 16)),
            //   ),
            // ),
          ],
        ),
        bottomNavigationBar: Custombottombar(
            currentIndex: currentIndex,
            onTabSelected: (index) => setState(() {
                  currentIndex = index;
                })));
  }
}
