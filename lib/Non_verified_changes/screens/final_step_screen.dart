import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pre_dashboard/Non_verified_changes/screens/payment_verification_fail_screen.dart';
import 'package:pre_dashboard/Non_verified_changes/screens/payment_verification_screen.dart';
import 'package:pre_dashboard/Non_verified_changes/screens/profile_verification_screen.dart';
import 'package:pre_dashboard/Non_verified_changes/widgets/custom_drawer.dart';
import 'package:pre_dashboard/Non_verified_changes/widgets/custombottombar.dart';
import 'package:pre_dashboard/Non_verified_changes/widgets/unlock_exclusive_features.dart';
import 'package:pre_dashboard/RazorPayPayment/RazorPayPayment.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FinalStepScreen extends StatefulWidget {
  const FinalStepScreen({super.key});

  @override
  State<FinalStepScreen> createState() => _FinalStepScreenState();
}

class _FinalStepScreenState extends State<FinalStepScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpayHelper = RazorpayHelper(); // Initialize here
    // _razorpayHelper.initialize(
    //   onSuccess: _handlePaymentSuccess,
    //   onFailure: _handlePaymentError,
    //   onExternalWallet: _handleExternalWallet,
    // );
  }
  bool? paymentStatus;
  bool isButtonDisabled = false;
  int currentIndex = 0;
  late RazorpayHelper _razorpayHelper;
  // void _handlePaymentSuccess(PaymentSuccessResponse response) async {
  //   print("Payment Successful: ${response.paymentId}");
  //
  //   // Check if paymentId is null, if so provide a fallback string
  //   String paymentId = response.paymentId ?? 'No Payment ID';
  //
  //   // Save the paymentId into SharedPreferences
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('PAYMENTID', paymentId);
  //
  //   // Navigate to PaymentDetails page
  //
  //
  //   // Show success message
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text("Payment Successful: $paymentId")),
  //   );
  // }
  //
  //
  // void _handlePaymentError(PaymentFailureResponse response) {
  //
  //   print("Payment Failed: ${response.code} - ${response.message}");
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text("Payment Failed: ${response.message}")),
  //   );
  // }
  //
  // void _handleExternalWallet(ExternalWalletResponse response) {
  //   print("External Wallet: ${response.walletName}");
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text("External Wallet Selected: ${response.walletName}")),
  //   );
  // }
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
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
              PaymentVerificationFailScreen(),
            ));
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text(
          'Final Step',
          style: TextStyle(fontSize: 18),
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
                      style: TextStyle(
                          fontSize: size.width * 0.023,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0F3CC9)),
                    )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/final_step.png',
              height: size.height*0.23,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 2, spreadRadius: 0.5)
                  ],
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.white,
                ),
                height: size.height * 0.25,
                width: size.width * 0.8,
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.07,
                      decoration: const BoxDecoration(color: Color(0xFF0F3CC9)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Image.asset('assets/images/medal.png',
                           height: size.height*0.03,
                           ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Unlock Exclusive Features Now!',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const UnlockExclusiveFeatures(
                        image: 'assets/images/exclusive_career.png',
                        title: 'Exclusive Career Opportunity'),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const UnlockExclusiveFeatures(
                        image: 'assets/images/lifetime_membership.png',
                        title: 'Lifetime Mentorship'),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const UnlockExclusiveFeatures(
                        image: 'assets/images/eligible.png',
                        title: 'Eligible for HireMi 360'),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.6),
                      child: const Text(
                        'T&C applied',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: size.width * 0.1, top: size.height * 0.01),
                  child: const Text(
                    'Learn More',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF0F3CC9),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                height: size.height * 0.1,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: const Color(0xFF767680).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/Vector.png',
                      height: size.height*0.023,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "Thank you for subscribing to our premium section! We're excited to have you on board and can't wait for you to enjoy all the exclusive benefits.",
                          style: TextStyle(fontSize: size.width * 0.03),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.04),

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
                    minimumSize: Size(size.width * 0.8, size.height * 0.06),
                  ),
                  child:
                      const Text("Pay ₹2999", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Custombottombar(
          currentIndex: currentIndex,
          onTabSelected: (index) => setState(() {
                currentIndex = index;
              })),
    );
  }
}
