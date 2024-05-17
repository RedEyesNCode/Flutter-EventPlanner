import 'dart:ui';

import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  final Color backgroundColor; // Background color of the dialog
  final Color indicatorColor; // Color of the loading indicator
  final double elevation; // Elevation of the dialog

  const LoadingDialog({
    Key? key,
    this.backgroundColor = const Color(0xFFFFD144), // Semi-transparent black by default
    this.indicatorColor = const Color(0xff6e3e14),
    this.elevation = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor,
      elevation: elevation,
      child: Padding(  // Add padding for visual appeal
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Keep the dialog as small as possible
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
            ),
            SizedBox(height: 16.0), // Add spacing between indicator and text
            Text(
              'Loading...', // Customize the text message
              style: TextStyle(color: indicatorColor),
            ),
          ],
        ),
      ),
    );
  }
}
