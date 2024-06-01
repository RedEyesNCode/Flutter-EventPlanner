import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EventMediaDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final String lottieAssetPath; // Path to your checkmark Lottie JSON file
  final VoidCallback onPressed;

  const EventMediaDialog({
    Key? key,
    this.title = 'Heavy Operations in Background',
    this.subtitle = 'Please wait on this screen until process is completed.',
    this.lottieAssetPath = 'lib/src/images/anim_loader.json',
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

                // Lottie.asset(
                //   lottieAssetPath,
                //   width: 100,
                //   height: 100,
                //   repeat: true,
                // ),
                Icon(Icons.warning,size: 50,color: Colors.yellow.shade700,)
              ],
            ),

            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
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
            SizedBox(height: 30,),
            Text(
              'You may receive a green alert at the bottom of the screen',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15,fontFamily: 'PlayFairDisplay',fontWeight: FontWeight.w800,color: Colors.grey),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('OK',style: TextStyle(color: Colors.black,fontFamily: 'SFPro',fontWeight: FontWeight.w400),),
            ),
          ],
        ),
      ),
    );
  }
}
