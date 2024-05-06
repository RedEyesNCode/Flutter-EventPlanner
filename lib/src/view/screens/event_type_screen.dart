import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eventplanner/src/view/widgets/OptionsSheet.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/djband_form.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/venue_form.dart';

class EventTypeScreen extends StatelessWidget {
  EventTypeScreen({super.key});

  final TextEditingController _controllerCategory = TextEditingController();

  void _showBottomSheetEventCategory(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => OptionsSheet(
        options: ["VENUE","DJWALE-BABU","DECORATION","TRAVEL"],
        onItemSelected: (selectedItem) {
          _controllerCategory.text = selectedItem;
          Navigator.pop(context);
        },
      ),
    );
  }



  @override
  Widget build(BuildContext context) {







    return Scaffold(
      body:



     SingleChildScrollView(child:  Column(
       children: [
         SizedBox(
           height: 50.0,
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             mainAxisSize: MainAxisSize.min,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Text(
                 'Event Category Information',
                 style: TextStyle(
                     color: Colors.black,
                     fontSize: 20.0,
                     fontFamily: 'PlayfairDisplay',
                     fontWeight: FontWeight.w700),
               ),
             ],
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10.0),
               gradient: LinearGradient(
                 // Define the direction of the gradient
                 begin: Alignment.topLeft,
                 end: Alignment.bottomRight,
                 // List the colors of the gradient
                 colors: [
                   Colors.orange.shade200,
                   Colors.orange.shade50,
                 ],
                 // Define stops for each color
                 stops: [0.0, 1.0],
               ),
             ),
             child: Padding(
               padding: const EdgeInsets.only(left: 10.0, right: 10.0),
               child: TextField(
                 controller: _controllerCategory,
                 onTap: () {
                   _showBottomSheetEventCategory(context);
                 },
                 obscureText: false,
                 cursorColor: Colors.black,
                 style: TextStyle(
                     color: Colors.black,
                     fontSize: 20.0,
                     fontFamily: 'PlayfairDisplay'),
                 decoration: InputDecoration(
                     border: InputBorder.none,
                     labelText: 'Select Event Category',
                     labelStyle: TextStyle(
                         color: Colors.black,
                         fontWeight: FontWeight.w400,
                         fontSize: 15.0)),
               ),
             ),
           ),
         ),
         SizedBox(
           height: 5.0,
         ),
         Text('Venue General Information',style: TextStyle(fontSize: 20.0,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w700),),
         SizedBox(
           height: 5.0,
         ),
         VenueForm(initialData: {
           "venue_name": "",
           "venue_address": "",
           "venue_capacity" : "",
           "venue_contact_person" : "",
           "contact_email_phone" : "",
           "additional_services" : "",
           "parking_facility" : "",
           "accessibility" : "",
           "alcohol_permission" : "",
           "cost" : "",
           "payment_terms" : "",
           "security_needs" : ""
         }),
         SizedBox(
           height: 5.0,
         ),
         Text('DJ Band General Information',style: TextStyle(fontSize: 20.0,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w700),),
         DjBandForm(initialData: {
           "venue_name": "",

         }),

       ],
     ),),
    );
  }
}
