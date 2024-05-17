import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eventplanner/src/view/widgets/VendorBookingCard.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Quick Access',style: TextStyle(color: Colors.black,fontFamily: 'SFPro',fontSize: 21,fontWeight: FontWeight.w600),),
            Divider(color: Colors.grey,height: 2,),

            Row(
              children: [

                Expanded(child:
                VendorBookingCard(vendorName: 'Booking',serviceType: 'Pending',bookingDate: '',bookingTime: '',)
                ),
                Expanded(child:
                VendorBookingCard(vendorName: 'Booking',serviceType: 'Confirm',bookingDate: '',bookingTime: '',)
                ),
              ],
            ),

            Text('Business Overview',style: TextStyle(color: Colors.black,fontFamily: 'SFPro',fontSize: 21,fontWeight: FontWeight.w600),),
            Divider(color: Colors.grey,height: 2,),
            Row(
              children: [
                Expanded(child:
                VendorBookingCard(vendorName: 'Business',serviceType: 'Today Booking',bookingDate: '',bookingTime: '',)
                ),
                Expanded(child:
                VendorBookingCard(vendorName: 'Business',serviceType: 'Monthly Booking',bookingDate: '',bookingTime: '',)
                ),
              ],
            ),
            Text('Payments Overview',style: TextStyle(color: Colors.black,fontFamily: 'SFPro',fontSize: 21,fontWeight: FontWeight.w600),),

            Divider(color: Colors.grey,height: 2,),
            Row(
              children: [
                Expanded(child:
                VendorBookingCard(vendorName: 'Payment',serviceType: 'Pending Payment',bookingDate: '',bookingTime: '',)
                ),
                Expanded(child:
                VendorBookingCard(vendorName: 'Payment',serviceType: 'Received Payment',bookingDate: '',bookingTime: '',)
                ),
              ],
            ),

          ],


        ),
      ),




    );
  }
}