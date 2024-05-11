import 'package:flutter/material.dart';

class CouponCard extends StatefulWidget {
  @override
  _CouponCardState createState() => _CouponCardState();
}

class _CouponCardState extends State<CouponCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      elevation: 2, // Add a subtle shadow
      color: Colors.blueAccent.shade100, // Background color
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              Icons.percent, // Percentage icon
              color: Colors.white,
              size: 30,
            ),
            SizedBox(width: 16), // Spacing between icon and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Use Code: WELCOMEMMT',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Grab up to 30% OFF on Your Trips',
                    style: TextStyle(
                      fontFamily: 'Raleway',

                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
