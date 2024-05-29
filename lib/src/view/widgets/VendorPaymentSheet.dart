


import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/session/SharedPrefManager.dart';
import 'package:flutter_eventplanner/src/view/screens/event_type_screen.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class _VendorPaymentSheet extends State<VendorPaymentSheet>{

  late Razorpay _razorpay; // Declare _razorpay
  void errorHandler(PaymentFailureResponse response) {
    // Display a red-colored SnackBar with the error message
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(response.message!),
      backgroundColor: Colors.red,
    ));
  }
  void successHandler(PaymentSuccessResponse response) async {
    // Display a green-colored SnackBar with the payment ID
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Success Payment : '+response.paymentId!),
      backgroundColor: Colors.green,
    ));
    final viewmodel = Provider.of<MainViewModel>(context,listen: false);
    String? sessionUserString = await SharedPrefManager().getString("USER_ID");

    viewmodel.completeVendorPayment({

      'userId' : sessionUserString,
      'paymentId' : response.paymentId!,
      'orderId' : response.orderId.toString(),
      'amount' : '699'

    });
    Navigator.pop(context);


  }
  void externalWalletHandler(ExternalWalletResponse response) {
    // Display a green-colored SnackBar with the name of the external wallet used
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(response.walletName!),
      backgroundColor: Colors.green,
    ));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState(); _razorpay = Razorpay(); // Initialize _razorpay
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, successHandler);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, errorHandler);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWalletHandler);

  }
  String generateRandomString(int length) {
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();

    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }
  void _openCheckout(MainViewModel viewmodel) async {


    viewmodel.createRazorPayOrder({
      "amount" : 699*100,
      "currency" : "INR",
      "receipt" : generateRandomString(10)



    });
    if(viewmodel.razorPayCreateOrderResponse!=null){
      print(viewmodel.razorPayCreateOrderResponse?.id.toString());
      var options = {
        'key': 'rzp_test_pr7kqypJcQmQiH', // Replace with your Razorpay Key ID
        'amount': 69900, // Amount in paise (499 * 100)
        'order_id' : viewmodel.razorPayCreateOrderResponse?.id.toString(),
        'name': 'One Touch Moments', // Replace with your company name
        'description': 'One Touch Moments Vendor App Subscription',
        'prefill': {'contact': '', 'email': ''}, // Prefill contact and email if available
        'external': {
          'wallets': ['paytm','gpay']
        }
      };

      try {
        _razorpay.open(options);
      } catch (e) {
        debugPrint(e.toString()); // Handle errors gracefully
      }
    }



  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<MainViewModel>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Start Subscription",style: TextStyle(fontFamily: 'SFPro',fontSize: 22,fontWeight: FontWeight.bold,color: Colors.brown),), // Customize as needed
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'To continue adding events and their related catalogue. You need subscription.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                  color: Color(0xff6e3e14),
                    width: 2

                  ),

                  borderRadius: BorderRadius.circular(
                      30), // Adjust border radius as needed
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Text(
                      'Rs 699/-',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                    SizedBox(height: 20),
                    _buildFeatureRow('Unlimted Events', 'Banking'),
                    SizedBox(height: 20,),
                    _buildFeatureRow('Communication', 'Offers'),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFFD144),
                            Color(0xff6e3e14),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(
                            30), // Adjust border radius as needed
                      ),

                      child: ElevatedButton(

                        onPressed: () {
                          // Add your payment logic here
                          _openCheckout(viewmodel);

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Keep consistent with container
                          ),
                        ),
                        child: Text('Proceed to payment →',style: TextStyle(fontFamily: 'SFPro',fontSize: 21,color: Colors.white),),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              _buildGuaranteeSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureRow(String feature1, String feature2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(height: 10,),// Or your preferred icon
            Text(feature1,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,fontFamily: 'SFPro'),),
          ],
        ),
        Column(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            Text(feature2),
          ],
        ),
      ],
    );
  }

  Widget _buildGuaranteeSection() {
    return Column(
      children: [
        _buildGuaranteeItem(Icons.description, 'Worry-Free Compliance', 'All your filings will be taken care by us.'),
        _buildGuaranteeItem(Icons.attach_money, '100% Cashback Guarantee', 'We promise you 100% cashback guarantee'),
      ],
    );
  }

  Widget _buildGuaranteeItem(IconData icon, String title, String description) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(description),
    );
  }

}


class VendorPaymentSheet extends StatefulWidget {
  const VendorPaymentSheet({super.key});




  @override
  _VendorPaymentSheet createState() => _VendorPaymentSheet();

}