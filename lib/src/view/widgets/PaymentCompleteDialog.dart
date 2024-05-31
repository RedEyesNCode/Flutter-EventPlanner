import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PaymentCompleteDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final String lottieAssetPath; // Path to your checkmark Lottie JSON file
  final VoidCallback onPressed;

  const PaymentCompleteDialog({
    Key? key,
    this.title = 'Payment Successful',
    this.subtitle = 'Your subscription has started.',
    this.lottieAssetPath = 'lib/src/images/confetti_one.json',
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Lottie.asset(
                  lottieAssetPath,
                  width: 100,
                  height: 100,
                  repeat: true,
                ),
              ],
            ),

            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'SFPro',
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16,fontFamily: 'PlayFairDisplay',fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20,),
            Text(
              'You may refresh this page multiple times to re-check your payment status.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15,fontFamily: 'SFPro',fontWeight: FontWeight.w500,color: Colors.grey),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('OK',style: TextStyle(color: Colors.white,fontFamily: 'SFPro',fontWeight: FontWeight.w400),),
            ),
          ],
        ),
      ),
    );
  }
}
