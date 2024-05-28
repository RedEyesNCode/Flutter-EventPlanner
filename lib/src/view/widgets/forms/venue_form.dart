import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_venue.dart';
import 'package:flutter_eventplanner/src/model/body_create_event.dart';
import 'package:flutter_eventplanner/src/session/SharedPrefManager.dart';
import 'package:flutter_eventplanner/src/utils/api_response.dart';
import 'package:flutter_eventplanner/src/view/screens/myhome_page.dart';
import 'package:flutter_eventplanner/src/view/widgets/ImagePickerBottomSheet.dart';
import 'package:flutter_eventplanner/src/view/widgets/LoadingDialog.dart';
import 'package:flutter_eventplanner/src/view/widgets/OptionsSheet.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';


class VenueForm extends StatefulWidget{


  final Map<String, String> initialData;

  final String categoryEventID;


  const VenueForm({Key? key, required this.initialData,required this.categoryEventID}) : super(key: key);

  @override
  _VenueForm createState() => _VenueForm();



}

class _VenueForm extends State<VenueForm>{
  final _textControllers = Map<String, TextEditingController>();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with initial data
    widget.initialData.forEach((key, value) {
      _textControllers[key] = TextEditingController(text: value);
    });
  }

  @override
  void dispose() {
    // Dispose controllers
    _textControllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }
  void _showVenueSubCategory(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => OptionsSheet(
        options: ["GARDEN", "HOTEL", "BANQUET","RESORT & FARMHOUSE"],
        onItemSelected: (selectedItem) {
          _textControllers['venue_subcategory']?.text = selectedItem;

          Navigator.pop(context);
          setState(() {}); // Trigger rebuild
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final viewmodel = Provider.of<MainViewModel>(context);


    return SingleChildScrollView(
      child:

      Stack(
        alignment: Alignment.center,
        children: [

          Column(

            children: [

              SizedBox(height: 20),
              ...widget.initialData.entries.map((entry) => Padding(
                padding: const EdgeInsets.all(8.0),
                child:

                Container(
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
                    padding: const EdgeInsets.only(left: 10.0 ,right: 10.0),
                    child: TextField(
                      onTap: () =>{
                          if (entry.key == "venue_subcategory")
                          {_showVenueSubCategory(context)}
                      },
                      controller: _textControllers[entry.key],
                      obscureText: false,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontFamily: 'PlayfairDisplay'
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,


                          labelText: entry.key.replaceAll('_', ' ').toUpperCase(),
                          labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 15.0)

                      ),
                    ),
                  ),
                ),

              )),
              ElevatedButton(
                onPressed: () async {

                  // Api Calling.

                  if(_textControllers["venue_name"]!.text.isEmpty){
                    showAlertDialog(context, 'Please enter venue name');
                  }else if(_textControllers["venue_address"]!.text.isEmpty){
                    showAlertDialog(context, 'Please enter venue address');
                  }else if(_textControllers["venue_contact_person"]!.text.isEmpty){
                    showAlertDialog(context, 'Please enter contact person');
                  }else if(_textControllers["contact_email_phone"]!.text.isEmpty){
                    showAlertDialog(context, 'Please enter contact email phone');
                  }else if(_textControllers["additional_services"]!.text.isEmpty){
                    showAlertDialog(context, 'Please enter additonal services');
                  }else if(_textControllers["parking_facility"]!.text.isEmpty){
                    showAlertDialog(context, 'Please enter parking facility');
                  }else if(_textControllers["accessibility"]!.text.isEmpty){
                    showAlertDialog(context, 'Please enter accessibility info');
                  }else if(_textControllers["alcohol_permission"]!.text.isEmpty){
                    showAlertDialog(context, "Please enter alcohol permission information");
                  }else if(_textControllers["cost"]!.text.isEmpty){
                    showAlertDialog(context, "Please enter cost");
                  }else if(_textControllers["payment_terms"]!.text.isEmpty){
                    showAlertDialog(context, "Please enter payment terms");
                  }else if(_textControllers["security_needs"]!.text.isEmpty){
                    showAlertDialog(context, "Please enter security needs");
                  }else if(_textControllers["venue_subcategory"]!.text.isEmpty){
                    showAlertDialog(context, "Please enter venue subcategory");

                  }

                  else{
                    await _handleVenueForm(viewmodel,_textControllers);

                  }




                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(left: 55.0,right: 55.0,top: 15.0,bottom: 15.0), backgroundColor: Colors.green,
                  shadowColor: Colors.lightGreenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Keep consistent with container
                  ),
                ),
                child:
                Text(
                  'Create Event Venue',
                  style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w700), // Adjust text style
                ),
              ),

            ],

          ),


        ],

      ),




    );



  }
  void _showImagePickerOptions(String categoryId) {
    final data = <String,String>{"categoryType" : "VENUE", "id" : categoryId};

    Navigator.push(

      context,
      MaterialPageRoute(builder: (context) => ImagePickerBottomSheet(imageUploadData: data)),
    );

  }

  void showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        // Changed context to dialogContext
        return AlertDialog(
          title: Text("Info",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.w400,
                fontSize: 18,
              )),
          content: Text(message,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.w400,
                fontSize: 18,
              )),
          actions: [
            TextButton(
              child: Text(
                "OK",
                style: TextStyle(
                    color: Colors.redAccent,
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Use the dialogContext here
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _handleVenueForm(MainViewModel viewModel, Map<String, TextEditingController> textControllers) async {
    // Consider disabling the button to prevent multiple login attempts

    try{

      var eventVenueData = body_create_venue(
          venueName : _textControllers["venue_name"]!.text.toString(),
          venueAddress : _textControllers["venue_subcategory"]!.text.toString(),
          venueCapacity : _textControllers["venue_address"]!.text.toString(),
          venueContactPerson : _textControllers["venue_capacity"]!.text.toString(),
          contactEmailPhone : _textControllers["contact_email_phone"]!.text.toString(),
          additionalServices : _textControllers["additional_services"]!.text.toString(),
          parkingFacility : _textControllers["parking_facility"]!.text.toString(),
          alcoholPermission : _textControllers["alcohol_permission"]!.text.toString(),
          cost : _textControllers["cost"]!.text.toString(),
          paymentTerms : _textControllers["payment_terms"]!.text.toString(),
          securityNeeds : _textControllers["security_needs"]!.text.toString(),

          eventId : ''
      );
      await SharedPrefManager().setString('CREATE-EVENT-VENUE', jsonEncode(eventVenueData));
      String? sessionEventVenueString = await SharedPrefManager().getString('CREATE-EVENT-VENUE');
      print(sessionEventVenueString);


      if (sessionEventVenueString !=null) {
        // Success! Navigate to appropriate screen
        _showImagePickerOptions(widget.categoryEventID);
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(viewModel.response.message.toString())),
        );
      }
    }finally{
      print('Finally Code.');
    }






  }

}



