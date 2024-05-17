import 'package:flutter/material.dart';

class VendorBookingCard extends StatelessWidget {
  // Add properties for vendor details, booking info, etc.
  final String vendorName;
  final String serviceType;
  final String bookingDate;
  final String bookingTime;

  VendorBookingCard({
    required this.vendorName,
    required this.serviceType,
    required this.bookingDate,
    required this.bookingTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container( // Outer Container for spacing and layout
      height: 210,
      width: 210,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: [
          Color(0xFFFFD144),
          Color(0xff6e3e14),
        ]),
        border: Border.all(
          color: Colors.white,
          width: 2,
        )

      ),
      padding: EdgeInsets.all(10.0),
      child: Card( // The actual card widget
        elevation: 3.0, // Add a subtle shadow
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vendorName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text("$serviceType",style: TextStyle(fontFamily: 'SFPro',fontSize: 19,color: Colors.black),),
              SizedBox(height: 8.0),
              Text("-",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 23,fontFamily: 'PlayfairDisplay'),),

            ],
          ),
        ),
      ),
    );
  }
}
