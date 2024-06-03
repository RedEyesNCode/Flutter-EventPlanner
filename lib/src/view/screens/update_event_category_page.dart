import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_band.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_catering.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_decoration.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_dhol.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_djband.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_entertainment.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_hotel.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_makeup.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_pandit.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_photovideo.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_tenthouse.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_travel.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_varmala.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_venue.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_weddingdress.dart';
import 'package:flutter_eventplanner/src/model/create_pandit_response.dart';
import 'package:flutter_eventplanner/src/view/screens/myhome_page.dart';
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


class _UpdateEventCategoryPage extends State<UpdateEventCategoryPage>{


  final TextEditingController _controllerCategory = TextEditingController();

  late body_create_venue _body_create_venue;
  late body_create_djband _body_create_djband;

  late body_create_decoration _body_create_decoration;

  late body_create_band _body_create_band;
  late body_create_dhol _body_create_dhol;

  late body_create_entertainment _body_create_entertainment;

  late body_create_makeup _body_create_makeup;

  late body_create_photovideo _body_photo_video;

  late body_create_travel _body_create_travel;

  late body_create_pandit _body_create_pandit;

  late body_create_tenthouse _body_create_tenthouse;

  late body_create_varmala _body_create_varmala;

  late body_create_weddingdress _body_create_wedding_dress;

  late body_create_catering _body_create_catering;

  late body_create_hotel _body_create_hotel;












  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerCategory.text = widget.incomingCategoryName.toString();
    _callEventDetailsApi();

  }

  Future<void> _callEventDetailsApi() async {
    Provider.of<MainViewModel>(context, listen: false).getEventDetails(
        {"eventId": widget.eventId});
    if(Provider.of<MainViewModel>(context,listen: false).getEventDetailsResponse!=null){
      var eventDetails =Provider.of<MainViewModel>(context,listen: false).getEventDetailsResponse;
      //parse the json string received in key eventCategoryData.
      if(Provider.of<MainViewModel>(context,listen: false).getEventDetailsResponse?.data?.categoryId!.categoriesName=='VENUE'){
        //parse json string for venue.
        List<dynamic> eventCategoryDataJson = jsonDecode(eventDetails!.eventCategoryData!);
        // Map the JSON data to a list of EventCategoryData objects
        List<body_create_venue> eventCategoryDataList = eventCategoryDataJson
            .map((item) => body_create_venue.fromJson(item))
            .toList();
        var categoryDetail = eventCategoryDataList[0];
        _body_create_venue = categoryDetail;
        print(categoryDetail.venueName);
      }else if(Provider.of<MainViewModel>(context,listen: false).getEventDetailsResponse?.data?.categoryId!.categoriesName=='DJ AND BAND'){
        //parse json string for venue.
        List<dynamic> eventCategoryDataJson = jsonDecode(eventDetails!.eventCategoryData!);
        // Map the JSON data to a list of EventCategoryData objects
        List<body_create_djband> eventCategoryDataList = eventCategoryDataJson
            .map((item) => body_create_djband.fromJson(item))
            .toList();
        var categoryDetail = eventCategoryDataList[0];
        _body_create_djband = categoryDetail;
        print(categoryDetail.djBandName);
      }else if(Provider.of<MainViewModel>(context,listen: false).getEventDetailsResponse?.data?.categoryId!.categoriesName=='DECORATION'){

        //parse json string for venue.
        List<dynamic> eventCategoryDataJson = jsonDecode(eventDetails!.eventCategoryData!);
        // Map the JSON data to a list of EventCategoryData objects
        List<body_create_decoration> eventCategoryDataList = eventCategoryDataJson
            .map((item) => body_create_decoration.fromJson(item))
            .toList();
        var categoryDetail = eventCategoryDataList[0];
        _body_create_decoration = categoryDetail;
      }else if(Provider.of<MainViewModel>(context,listen: false).getEventDetailsResponse?.data?.categoryId!.categoriesName=='BAND'){

        //parse json string for venue.
        List<dynamic> eventCategoryDataJson = jsonDecode(eventDetails!.eventCategoryData!);
        // Map the JSON data to a list of EventCategoryData objects
        List<body_create_band> eventCategoryDataList = eventCategoryDataJson
            .map((item) => body_create_band.fromJson(item))
            .toList();
        var categoryDetail = eventCategoryDataList[0];
        _body_create_band = categoryDetail;

      }else if(Provider.of<MainViewModel>(context,listen: false).getEventDetailsResponse?.data?.categoryId!.categoriesName=='DHOL'){
        //parse json string for venue.
        List<dynamic> eventCategoryDataJson = jsonDecode(eventDetails!.eventCategoryData!);
        // Map the JSON data to a list of EventCategoryData objects
        List<body_create_dhol> eventCategoryDataList = eventCategoryDataJson
            .map((item) => body_create_dhol.fromJson(item))
            .toList();
        var categoryDetail = eventCategoryDataList[0];
        _body_create_dhol = categoryDetail;


      }else if(Provider.of<MainViewModel>(context,listen: false).getEventDetailsResponse?.data?.categoryId!.categoriesName=='ENTERTAINMENT'){
        List<dynamic> eventCategoryDataJson = jsonDecode(eventDetails!.eventCategoryData!);
        // Map the JSON data to a list of EventCategoryData objects
        List<body_create_entertainment> eventCategoryDataList = eventCategoryDataJson
            .map((item) => body_create_entertainment.fromJson(item))
            .toList();
        var categoryDetail = eventCategoryDataList[0];
        _body_create_entertainment = categoryDetail;
      }else if(Provider.of<MainViewModel>(context,listen: false).getEventDetailsResponse?.data?.categoryId!.categoriesName=='MAKE-UP'){
        List<dynamic> eventCategoryDataJson = jsonDecode(eventDetails!.eventCategoryData!);
        // Map the JSON data to a list of EventCategoryData objects
        List<body_create_makeup> eventCategoryDataList = eventCategoryDataJson
            .map((item) => body_create_makeup.fromJson(item))
            .toList();
        var categoryDetail = eventCategoryDataList[0];
        _body_create_makeup = categoryDetail;
      }else if(Provider.of<MainViewModel>(context,listen: false).getEventDetailsResponse?.data?.categoryId!.categoriesName=='PHOTO-VIDEO'){
        List<dynamic> eventCategoryDataJson = jsonDecode(eventDetails!.eventCategoryData!);
        // Map the JSON data to a list of EventCategoryData objects
        List<body_create_photovideo> eventCategoryDataList = eventCategoryDataJson
            .map((item) => body_create_photovideo.fromJson(item))
            .toList();
        var categoryDetail = eventCategoryDataList[0];
        _body_photo_video = categoryDetail;


      }else if(Provider.of<MainViewModel>(context,listen: false).getEventDetailsResponse?.data?.categoryId!.categoriesName=='TRAVEL'){
        List<dynamic> eventCategoryDataJson = jsonDecode(eventDetails!.eventCategoryData!);
        // Map the JSON data to a list of EventCategoryData objects
        List<body_create_travel> eventCategoryDataList = eventCategoryDataJson
            .map((item) => body_create_travel.fromJson(item))
            .toList();
        var categoryDetail = eventCategoryDataList[0];
        _body_create_travel = categoryDetail;


      }else if(Provider.of<MainViewModel>(context,listen: false).getEventDetailsResponse?.data?.categoryId!.categoriesName=='PANDIT'){
        List<dynamic> eventCategoryDataJson = jsonDecode(eventDetails!.eventCategoryData!);
        // Map the JSON data to a list of EventCategoryData objects
        List<body_create_pandit> eventCategoryDataList = eventCategoryDataJson
            .map((item) => body_create_pandit.fromJson(item))
            .toList();
        var categoryDetail = eventCategoryDataList[0];
        _body_create_pandit = categoryDetail;
      }else if(Provider.of<MainViewModel>(context,listen: false).getEventDetailsResponse?.data?.categoryId!.categoriesName=='TENTHOUSE'){
        List<dynamic> eventCategoryDataJson = jsonDecode(eventDetails!.eventCategoryData!);
        // Map the JSON data to a list of EventCategoryData objects
        List<body_create_tenthouse> eventCategoryDataList = eventCategoryDataJson
            .map((item) => body_create_tenthouse.fromJson(item))
            .toList();
        var categoryDetail = eventCategoryDataList[0];
        _body_create_tenthouse = categoryDetail;
      }else if(Provider.of<MainViewModel>(context,listen: false).getEventDetailsResponse?.data?.categoryId!.categoriesName=='VARMALA-ENTRY'){
        List<dynamic> eventCategoryDataJson = jsonDecode(eventDetails!.eventCategoryData!);

        List<body_create_varmala> eventCategoryDataList = eventCategoryDataJson
            .map((item) => body_create_varmala.fromJson(item))
            .toList();
        var categoryDetail = eventCategoryDataList[0];
        _body_create_varmala = categoryDetail;
      }else if(Provider.of<MainViewModel>(context,listen: false).getEventDetailsResponse?.data?.categoryId!.categoriesName=='CATERING'){
        List<dynamic> eventCategoryDataJson = jsonDecode(eventDetails!.eventCategoryData!);

        List<body_create_catering> eventCategoryDataList = eventCategoryDataJson
            .map((item) => body_create_catering.fromJson(item))
            .toList();
        var categoryDetail = eventCategoryDataList[0];
        _body_create_catering = categoryDetail;
      }else if(Provider.of<MainViewModel>(context,listen: false).getEventDetailsResponse?.data?.categoryId!.categoriesName=='WEDDING DRESS'){
        List<dynamic> eventCategoryDataJson = jsonDecode(eventDetails!.eventCategoryData!);

        List<body_create_tenthouse> eventCategoryDataList = eventCategoryDataJson
            .map((item) => body_create_tenthouse.fromJson(item))
            .toList();
        var categoryDetail = eventCategoryDataList[0];
        _body_create_tenthouse = categoryDetail;
      }else if(Provider.of<MainViewModel>(context,listen: false).getEventDetailsResponse?.data?.categoryId!.categoriesName=='HOTEL'){
        List<dynamic> eventCategoryDataJson = jsonDecode(eventDetails!.eventCategoryData!);

        List<body_create_hotel> eventCategoryDataList = eventCategoryDataJson
            .map((item) => body_create_hotel.fromJson(item))
            .toList();
        var categoryDetail = eventCategoryDataList[0];
        _body_create_hotel = categoryDetail;
      }
    }
  }

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

                      // _showCategorySheet(context,viewmodel);
                      showAlertDialog(context, 'You cannot change event subcategory !');
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
                    "hotel_name": _body_create_hotel.hotelName.toString(),
                    "hotel_subcategory":'',
                    "hotel_address": _body_create_hotel.hotelAddress.toString(),
                    "hotel_capacity": _body_create_hotel.hotelCapacity.toString(),
                    "hotel_number": _body_create_hotel.hotelNumber.toString(),
                    "hotel_checkin": _body_create_hotel.hotelCheckin.toString(),
                    "hotel_checkout": _body_create_hotel.hotelCheckout.toString(),
                    "hotel_price": _body_create_hotel.hotelPrice.toString(),
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
                    "venue_name": _body_create_venue.venueName.toString(),
                    "venue_subcategory": "",
                    "venue_address": _body_create_venue.venueAddress.toString(),
                    "venue_capacity": _body_create_venue.venueCapacity.toString(),
                    "venue_contact_person": _body_create_venue.venueContactPerson.toString(),
                    "contact_email_phone": _body_create_venue.contactEmailPhone.toString(),
                    "additional_services": _body_create_venue.additionalServices.toString(),
                    "parking_facility": _body_create_venue.parkingFacility.toString(),
                    "accessibility": _body_create_venue.additionalServices.toString(),
                    "alcohol_permission": _body_create_venue.alcoholPermission.toString(),
                    "cost": _body_create_venue.cost.toString(),
                    "payment_terms": _body_create_venue.paymentTerms.toString(),
                    "security_needs": _body_create_venue.securityNeeds.toString(),
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
                    "name": _body_create_wedding_dress.name.toString(),
                    "wedding_dress_subcategory" :_body_create_wedding_dress.weddingDressSubcategory.toString(),
                    "designer": _body_create_wedding_dress.designer.toString(),
                    "style": _body_create_wedding_dress.style.toString(),
                    "color": _body_create_wedding_dress.color.toString(),
                    "fabric": _body_create_wedding_dress.fabric.toString(),
                    "size": _body_create_wedding_dress.size.toString(),
                    "price": _body_create_wedding_dress.price.toString(),
                    "description": _body_create_wedding_dress.description.toString(),
                    "availability": _body_create_wedding_dress.availability.toString(),
                    "rating": _body_create_wedding_dress.rating.toString(),
                    "tags": _body_create_wedding_dress.tags.toString(),
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
                    "name": _body_create_catering.name.toString(),
                    "catering_subcategory": _body_create_catering.cateringSubcategory.toString(),
                    "address": _body_create_catering.address.toString(),
                    "contact": _body_create_catering.contact.toString(),
                    "description": _body_create_catering.description.toString(),
                    "price": _body_create_catering.price.toString(),
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
                    "dj_band_name": _body_create_djband.djBandName.toString(),
                    "djband_subcategory": "",
                    "members": _body_create_djband.members.toString(),
                    "genre": _body_create_djband.genre.toString(),
                    "description": _body_create_djband.description.toString(),
                    "availability": _body_create_djband.availability.toString(),
                    "rate": _body_create_djband.rate.toString(),
                    "location": _body_create_djband.location.toString(),
                    "equiment": _body_create_djband.equipment.toString(),
                    "reviews": _body_create_djband.reviews.toString(),
                    "rating": _body_create_djband.rating.toString(),
                    "contact_information": _body_create_djband.contactInformation.toString()
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
                    "band_name": _body_create_band.bandName.toString(),
                    "band_subcategory": "",
                    "genre": _body_create_band.genre.toString(),
                    "contact_person":_body_create_band.contactPerson.toString(),
                    "contact_number": _body_create_band.contactNumber.toString(),
                    "email": _body_create_band.email.toString(),
                    "address": _body_create_band.address.toString(),
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
                    "event_name": _body_create_entertainment.eventName.toString(),
                    "entertainment_subcategory": _body_create_entertainment.entertainmentSubcategory.toString(),
                    "event_description": _body_create_entertainment.eventDescription.toString(),
                    "event_type": _body_create_entertainment.eventType.toString(),
                    "event_date_time": _body_create_entertainment.eventDateTime.toString(),
                    "duration": _body_create_entertainment.duration.toString(),
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
                    "group_name": _body_create_dhol.groupName.toString(),
                    "dhol_subcategory": _body_create_dhol.dholSubcategory.toString(),
                    "contact_person": _body_create_dhol.contactPerson.toString(),
                    "contact_number": _body_create_dhol.contactNumber.toString(),
                    "email": _body_create_dhol.email.toString(),
                    "address": _body_create_dhol.address.toString(),
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
                    "decoration_name":  _body_create_decoration.name.toString(),
                    "decor_subcategory": _body_create_decoration.decorSubcategory.toString(),
                    "members": _body_create_decoration.members.toString(),
                    "description": _body_create_decoration.description.toString(),
                    "hourly_rate": _body_create_decoration.hourlyRate.toString(),
                    "min_hours": _body_create_decoration.minHours.toString(),
                    "rate": _body_create_decoration.rate.toString(),
                    "location": _body_create_decoration.location.toString(),
                    "contact_information": ''
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
                    "service_name": _body_create_makeup.serviceName.toString(),
                    "makeup_subcategory": _body_create_makeup.makeupSubcategory.toString(),
                    "first_name" : _body_create_makeup.firstName.toString(),
                    "last_name" : _body_create_makeup.lastName.toString(),
                    "members": _body_create_makeup.members.toString(),
                    "description": _body_create_makeup.description.toString(),
                    "hourly_rate": _body_create_makeup.hourlyRate.toString(),
                    "min_hours": _body_create_makeup.minHours.toString(),
                    "rate":  _body_create_makeup.rate.toString(),
                    "location":  _body_create_makeup.location.toString(),
                    "contact_information":  _body_create_makeup.contactInformation.toString()
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
                    "service_name": _body_photo_video.serviceName.toString(),
                    "photovideo_subcategory": _body_photo_video.photovideoSubcategory.toString(),
                    "client_name" : _body_photo_video.clientName.toString(),
                    "type_of_coverage" : _body_photo_video.typeOfCoverage.toString(),
                    "duration" : _body_photo_video.duration.toString(),
                    "hourly_rate" : _body_photo_video.hourlyRate.toString(),
                    "contact_information": _body_photo_video.contactInformation.toString()
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
                    "service_name": _body_create_travel.serviceName.toString(),
                    "travel_subcategory": _body_create_travel.travelSubcategory.toString(),
                    "client_name" : _body_create_travel.clientName.toString(),
                    "type_of_coverage" : _body_create_travel.typeOfCoverage.toString(),
                    "duration" : _body_create_travel.duration.toString(),
                    "hourly_rate" : _body_create_travel.hourlyRate.toString(),
                    "vehicle_type" : _body_create_travel.vehcileType.toString(),
                    "pickup_location" : _body_create_travel.pickupLocation.toString(),
                    "drop_off_location" : _body_create_travel.dropoffLocation.toString(),
                    "contact_information": ''
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
                    "name": _body_create_varmala.name.toString(),
                    "varmala_subcategory": _body_create_varmala.varmalaSubcategory.toString(),
                    "date" : _body_create_varmala.date.toString(),
                    "location" : _body_create_varmala.location.toString(),
                    "description" : _body_create_varmala.description.toString(),
                    "category" : _body_create_varmala.category.toString(),
                    "number_of_guests" :  _body_create_varmala.numberOfGuests.toString(),
                    "requirements" : _body_create_varmala.requirements.toString(),
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
                    "name": _body_create_tenthouse.name.toString(),
                    "tenthouse_subcategory": _body_create_tenthouse.tenthouseSubcategory.toString(),
                    "number": "",
                    "adderss" : _body_create_tenthouse.adderss.toString(),
                    "description" : _body_create_tenthouse.description.toString(),
                    "price" : _body_create_tenthouse.price.toString(),
                    "availability" : _body_create_tenthouse.availability.toString(),
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
                    "name" : _body_create_pandit.name.toString(),
                    "pandit_subcategory" : _body_create_pandit.panditSubcateogry.toString(),
                    "address" : _body_create_pandit.address.toString(),
                    "contact" : _body_create_pandit.contact.toString(),
                    "description" : _body_create_pandit.description.toString(),
                    "speciality" : _body_create_pandit.speciality.toString(),
                    "years_of_experience" : _body_create_pandit.yearsOfExperience.toString(),
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



class UpdateEventCategoryPage extends StatefulWidget {


  final String incomingCategoryName;

  final String eventId;


  const UpdateEventCategoryPage({super.key, required this.incomingCategoryName,required this.eventId});


  @override
  _UpdateEventCategoryPage createState() => _UpdateEventCategoryPage();



}
