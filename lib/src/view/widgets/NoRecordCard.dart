import 'package:flutter/material.dart';

class NoRecordCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center( // Center the card on the screen
      child: Container(
        width: 300, // Adjust width as needed
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [Color(0xFFFFD144), Color(0xff6e3e14)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Keep column as small as possible
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(
                    30), // Adjust the value to change the amount of circularity
                child: Image.asset(
                    'lib/src/images/ic_app_logogold.jpeg')),
            SizedBox(height: 20,),
            Text(
              'No Record Found',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'SFPro',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10), // Add some spacing
            // Optionally, add an icon or additional text here
          ],
        ),
      ),
    );
  }
}
