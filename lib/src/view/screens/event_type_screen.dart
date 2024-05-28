import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eventplanner/src/view/widgets/CategorySheet.dart';
import 'package:flutter_eventplanner/src/view/widgets/OptionsSheet.dart';
import 'package:flutter_eventplanner/src/view/widgets/VendorPaymentSheet.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/band_form.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/catering_form.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/decoration_form.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/dhol_form.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/djband_form.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/entertainment_form.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/entry_varmala_form.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/hotel_form.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/makeup_form.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/pandit_form.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/photovideo_form.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/tenthouse_form.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/travel_form.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/venue_form.dart';
import 'package:flutter_eventplanner/src/view/widgets/forms/weddingdress_form.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';

enum EventType { venue, djAndBand, decoration, travel, pandit}


class _EventTypeScreen extends State<EventTypeScreen>{


  final TextEditingController _controllerCategory = TextEditingController();


  final TextEditingController _controllerCategoryID = TextEditingController();

  String category_id = "";




  void _showBottomSheetEventCategory(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => OptionsSheet(
        options: ["VENUE", "DJ AND BAND", "DECORATION", "BAND","DHOL","ENTERTAINMENT","MAKE-UP","PHOTO-VIDEO","TRAVEL", "PANDIT","TENTHOUSE","VARMALA-ENTRY","CATERING","WEDDING DRESS","HOTEL"],
        onItemSelected: (selectedItem) {

          _controllerCategory.text = selectedItem;
          Navigator.pop(context);
          setState(() {}); // Trigger rebuild

        },
      ),
    );
  }
  void _showCategorySheet(BuildContext context,MainViewModel mainViewModel) {

    showModalBottomSheet(
        context: context,
        builder: (context) => CategorySheet(
          viewModel: mainViewModel,
          onItemSelected: (selectedItem,selectedId) {
            _controllerCategory.text = selectedItem;
            _controllerCategoryID.text = selectedId;
            category_id = selectedId;

            Navigator.pop(context);
            setState(() {}); // Trigger rebuild
          },
        ));
  }





  @override
  Widget build(BuildContext context) {

    final viewmodel = Provider.of<MainViewModel>(context);

    return Scaffold(
      backgroundColor: Color(0xff6e3e14),
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
                        color: Colors.white,
                        fontSize: 20.0,
                        fontFamily: 'SFPro',
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: [
            //         Color(0xFFFFD144),
            //         Color(0xff6e3e14),
            //       ],
            //       begin: Alignment.topCenter,
            //       end: Alignment.bottomCenter,
            //     ),
            //     borderRadius: BorderRadius.circular(
            //         30), // Adjust border radius as needed
            //   ),
            //   child: ElevatedButton(
            //     onPressed: () async {
            //       // Api Calling.
            //       _showPaymentSheet(context);
            //     },
            //     style: ElevatedButton.styleFrom(
            //       padding: EdgeInsets.only(
            //           left: 95.0, right: 95.0, top: 15.0, bottom: 15.0),
            //       backgroundColor: Colors.transparent,
            //       shadowColor: Colors.transparent,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(
            //             10), // Keep consistent with container
            //       ),
            //     ),
            //     child: Text(
            //       'Vendor Payment Sheet ',
            //       style: TextStyle(
            //           fontSize: 16,
            //           color: Colors.white,
            //           fontFamily: 'PlayfairDisplay',
            //           fontWeight: FontWeight.w700), // Adjust text style
            //     ),
            //   ),
            // ),

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

                      _showCategorySheet(context,viewmodel);
                    },
                    obscureText: false,
                    cursorColor: Colors.black,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'PlayfairDisplay'),
                    decoration: const InputDecoration(
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

            if(_controllerCategory.text.toString() == "HOTEL")
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Hotel General Information',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  HotelForm(initialData: {
                    "hotel_name": "",
                    "hotel_subcategory": "",
                    "hotel_address": "",
                    "hotel_capacity": "",
                    "hotel_number": "",
                    "hotel_checkin": "",
                    "hotel_checkout": "",
                    "hotel_price": "",
                  },eventCategoryID: category_id,),
                  SizedBox(
                    height: 5.0,
                  ),
                ],


              ),

            if(_controllerCategory.text.toString() == "VENUE")
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Venue General Information',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  VenueForm(initialData: {
                    "venue_name": "",
                    "venue_subcategory": "",
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
                    "security_needs": "",
                  },categoryEventID: category_id,),
                  SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            if(_controllerCategory.text.toString()== "WEDDING DRESS")
              Column(

                children: [
                  Text(
                    'Wedding Dress General Information',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700),
                  ),
                  WeddingDressForm(initialData: {
                    "name": "",
                    "wedding_dress_subcategory" : "",
                    "designer": "",
                    "style": "",
                    "color": "",
                    "fabric": "",
                    "size": "",
                    "price": "",
                    "description": "",
                    "availability": "",
                    "rating": "",
                    "tags": "",
                  },eventCategoryID: category_id),
                ],
              ),

            if(_controllerCategory.text.toString()=="CATERING")
              Column(

                children: [
                  Text(
                    'Catering General Information',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700),
                  ),
                  CateringForm(initialData: {
                    "name": "",
                    "catering_subcategory": "",
                    "address": "",
                    "contact": "",
                    "description": "",
                    "price": "",
                  },eventCategoryID: category_id),
                ],
              ),


            if ((_controllerCategory.text.toString() == ("DJ AND BAND")))
              Column(

                children: [
                  Text(
                    'DJ Band General Information',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700),
                  ),
                  DjBandForm(initialData: {
                    "dj_band_name": "",
                    "djband_subcategory": "",
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
                  },categoryEventID: category_id),
                ],
              ),

            if(_controllerCategory.text.toString() == "BAND")
              Column(

                children: [
                  Text(
                    'Band General Information',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700),
                  ),
                  BandForm(initialData: {
                    "band_name": "",
                    "band_subcategory": "",
                    "genre": "",
                    "contact_person": "",
                    "contact_number": "",
                    "email": "",
                    "address": "",
                  },eventCategoryID: category_id),
                ],
              ),

            if(_controllerCategory.text.toString() == "ENTERTAINMENT")
              Column(

                children: [
                  Text(
                    'Entertainment General Information',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700),
                  ),
                  EntertainmentForm(initialData: {
                    "event_name": "",
                    "entertainment_subcategory": "",
                    "event_description": "",
                    "event_type": "",
                    "event_date_time": "",
                    "duration": "",
                    "ticket_price": "",
                  },eventCategoryID: category_id),
                ],
              ),
            if(_controllerCategory.text.toString() == "DHOL")
              Column(

                children: [
                  Text(
                    'Dhol General Information',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700),
                  ),
                  DholForm(initialData: {
                    "group_name": "",
                    "dhol_subcategory": "",
                    "contact_person": "",
                    "contact_number": "",
                    "email": "",
                    "address": "",
                  },eventCategoryID: category_id),
                ],
              ),


            if((_controllerCategory.text.toString() == "DECORATION"))
              Column(

                children: [
                  Text(
                    'Decoration General Information',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700),
                  ),
                  DecorationForm(initialData: {
                    "decoration_name": "",
                    "decor_subcategory": "",
                    "members": "",
                    "description": "",
                    "hourly_rate": "",
                    "min_hours": "",
                    "rate": "10000",
                    "location": "",
                    "contact_information": ""
                  },categoryEventID: category_id),
                ],
              ),
            if((_controllerCategory.text.toString() == "MAKE-UP"))
              Column(

                children: [
                  Text(
                    'Makeup Artist General Information',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700),
                  ),
                  MakeupForm(initialData: {
                    "service_name": "",
                    "makeup_subcategory": "",
                    "first_name" : "",
                    "last_name" : "",
                    "members": "",
                    "description": "",
                    "hourly_rate": "",
                    "min_hours": "",
                    "rate": "10000",
                    "location": "",
                    "contact_information": ""
                  },categoryEventID: category_id),
                ],
              ),
            if(_controllerCategory.text.toString() == "PHOTO-VIDEO")
              Column(

                children: [
                  Text(
                    'Photo & Video General Information',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700),
                  ),
                  PhotoVideoForm(initialData: {
                    "service_name": "",
                    "photovideo_subcategory": "",
                    "client_name" : "",
                    "type_of_coverage" : "",
                    "duration" : "",
                    "hourly_rate" : "",
                    "contact_information": ""
                  },categoryEventID: category_id),
                ],
              ),
            if(_controllerCategory.text.toString() == "TRAVEL")
               Column(

                children: [
                  Text(
                    'Travel & Transportation Information',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700),
                  ),
                  TravelForm(initialData: {
                    "service_name": "",
                    "travel_subcategory": "",
                    "client_name" : "",
                    "type_of_coverage" : "",
                    "duration" : "",
                    "hourly_rate" : "",
                    "vehicle_type" : "",
                    "pickup_location" : "",
                    "drop_off_location" : "",
                    "contact_information": ""
                  },categoryEventID: category_id),
                ],
              ),
            if(_controllerCategory.text.toString() == "VARMALA-ENTRY")
              Column(

                children: [
                  Text(
                    'Varmala Entry Information',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700),
                  ),
                  EntryVarmalaForm(initialData: {
                    "name": "",
                    "varmala_subcategory": "",
                    "date" : "",
                    "location" : "",
                    "description" : "",
                    "category" : "",
                    "number_of_guests" : "",
                    "requirements" : "",
                  },categoryEventID: category_id),
                ],
              ),
            if(_controllerCategory.text.toString() == "TENTHOUSE")
              Column(

                children: [
                  Text(
                    'TentHouse Entry Information',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700),
                  ),
                  TentHouseForm(initialData: {
                    "name": "",
                    "tenthouse_subcategory": "",
                    "number": "",
                    "adderss" : "",
                    "description" : "",
                    "price" : "",
                    "availability" : "",
                  },categoryEventID: category_id),
                ],
              ),
            if(_controllerCategory.text.toString() == "PANDIT")
              Column(
                children: [
                  Text(
                    'Pandit Information',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w700),
                  ),
                  PanditForm(initialData: {
                    "name" : "",
                    "pandit_subcategory" : "",
                    "address" : "",
                    "contact" : "",
                    "description" : "",
                    "speciality" : "",
                    "years_of_experience" : "",
                  },eventCategoryID : category_id),
                ],
              )


          ],
        ),
      ),
    );
  }

  void _showPaymentSheet(BuildContext context) {

    showModalBottomSheet(
        context: context,
        builder: (context) => const VendorPaymentSheet(

        ));
  }
}



class EventTypeScreen extends StatefulWidget {
  const EventTypeScreen({super.key});


  @override
  _EventTypeScreen createState() => _EventTypeScreen();



}
