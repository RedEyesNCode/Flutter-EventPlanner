import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eventplanner/src/view/widgets/OptionsSheet.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/decoration_form.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/djband_form.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/makeup_form.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/photovideo_form.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/travel_form.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/venue_form.dart';

enum EventType { venue, djAndBand, decoration, travel, pandit}


class _EventTypeScreen extends State<EventTypeScreen>{


  final TextEditingController _controllerCategory = TextEditingController();

  final TextEditingController _controllerStatus = TextEditingController();

  void _showBottomSheetEventCategory(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => OptionsSheet(
        options: ["VENUE", "DJ AND BAND", "DECORATION", "MAKE-UP","PHOTO-VIDEO","TRAVEL", "PANDIT","TENT-HOUSE"],
        onItemSelected: (selectedItem) {

          _controllerCategory.text = selectedItem;

          Navigator.pop(context);
          setState(() {}); // Trigger rebuild

        },
      ),
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                    canRequestFocus: false,

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

            if (_controllerCategory.text.toString() == "VENUE")
              const Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Venue General Information',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  VenueForm(initialData: {
                    "venue_name": "",
                    "venue_address": "",
                    "venue_capacity": "",
                    "venue_contact_person": "",
                    "contact_email_phone": "",
                    "additional_services": "",
                    "parking_facility": "",
                    "accessibility": "",
                    "alcohol_permission": "",
                    "cost": "",
                    "payment_terms": "",
                    "security_needs": ""
                  }),
                  SizedBox(
                    height: 5.0,
                  ),
                ],
              ),


            if ((_controllerCategory.text.toString() == ("DJ AND BAND")))
              const Column(

                children: [
                  Text(
                    'DJ Band General Information',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700),
                  ),
                  DjBandForm(initialData: {
                    "dj_band_name": "",
                    "members": "",
                    "genre": "",
                    "description": "",
                    "availability": "",
                    "rate": "10000",
                    "location": "",
                    "equiment": "",
                    "reviews": "",
                    "rating": "",
                    "contact_information": ""
                  }),
                ],
              ),


            if((_controllerCategory.text.toString() == "DECORATION"))
              const Column(

                children: [
                  Text(
                    'Decoration General Information',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700),
                  ),
                  DecorationForm(initialData: {
                    "decoration_name": "",
                    "members": "",
                    "description": "",
                    "hourly_rate": "",
                    "min_hours": "",
                    "rate": "10000",
                    "location": "",
                    "contact_information": ""
                  }),
                ],
              ),
            if((_controllerCategory.text.toString() == "MAKE-UP"))
              const Column(

                children: [
                  Text(
                    'Makeup Artist General Information',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700),
                  ),
                  MakeupForm(initialData: {
                    "service_name": "",
                    "first_name" : "",
                    "last_name" : "",
                    "members": "",
                    "description": "",
                    "hourly_rate": "",
                    "min_hours": "",
                    "rate": "10000",
                    "location": "",
                    "contact_information": ""
                  }),
                ],
              ),
            if(_controllerCategory.text.toString() == "PHOTO-VIDEO")
              const Column(

                children: [
                  Text(
                    'Photo & Video General Information',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700),
                  ),
                  PhotoVideoForm(initialData: {
                    "service_name": "",
                    "client_name" : "",
                    "type_of_coverage" : "",
                    "duration" : "",
                    "hourly_rate" : "",


                    "contact_information": ""
                  }),
                ],
              ),
            if(_controllerCategory.text.toString() == "TRAVEL")
              const Column(

                children: [
                  Text(
                    'Travel & Transportation Information',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700),
                  ),
                  TravelForm(initialData: {
                    "service_name": "",
                    "client_name" : "",
                    "type_of_coverage" : "",
                    "duration" : "",
                    "hourly_rate" : "",
                    "vehicle_type" : "",
                    "pickup_location" : "",
                    "drop_off_location" : "",
                    "contact_information": ""
                  }),
                ],
              ),

          ],
        ),
      ),
    );
  }
}



class EventTypeScreen extends StatefulWidget {
  const EventTypeScreen({super.key});


  @override
  _EventTypeScreen createState() => _EventTypeScreen();



}
