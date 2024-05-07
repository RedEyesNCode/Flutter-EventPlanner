import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/model/body_create_event.dart';
import 'package:flutter_eventplanner/src/session/SharedPrefManager.dart';
import 'package:flutter_eventplanner/src/utils/api_response.dart';
import 'package:flutter_eventplanner/src/view/screens/myhome_page.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';


class VenueForm extends StatefulWidget{


  final Map<String, String> initialData;
  const VenueForm({Key? key, required this.initialData}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
        ChangeNotifierProvider(create: (_)=>MainViewModel(),

        child: Consumer<MainViewModel>(

          builder: (context,viewmodel,_){

            return     SingleChildScrollView(
              child:        Column(

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
                      }else{
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

              )

              ,
            );

          },

        ),

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

    try {
      // Call the create-event api first to get the eventID.
      String? sessionEventString = await SharedPrefManager().getString('CREATE-EVENT');
      body_create_event? sessionJsonEvent = jsonDecode(sessionEventString!);
      print(sessionEventString);
      // if(sessionJsonEvent!=null){
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => MyHomePage()),
      //   );
      // }
      // showAlertDialog(context, sessionJsonEvent!.eventname.toString());



      await viewModel.createEvent({
        'event_name' : sessionJsonEvent!.eventname,
        'event_type' : sessionJsonEvent.eventtype,
        'start_date' : sessionJsonEvent.startdate,
        'end_date' : sessionJsonEvent.enddate,
        'description' : sessionJsonEvent.description,
        'Status' : sessionJsonEvent.status,
        'userId' : 'static_flutter',
        'location_id' : sessionJsonEvent.locationid
      });

      if(viewModel.createEventResponse!=null){
        await viewModel.createEventTypeVenue({
          'agent_id' : 'static_flutter',
          'venue_name': _textControllers["venue_name"]!.text.toString(),
          'venue_address': _textControllers["venue_address"]!.text.toString(),
          'venue_capacity': _textControllers["venue_capacity"]!.text.toString(),
          'venue_contact_person': _textControllers["venue_contact_person"]!.text.toString(),
          'contact_email_phone': _textControllers["contact_email_phone"]!.text.toString(),
          'additional_services': _textControllers["additional_services"]!.text.toString(),
          'parking_facility': _textControllers["parking_facility"]!.text.toString(),
          'alcohol_permission': _textControllers["alcohol_permission"]!.text.toString(),
          'cost': _textControllers["cost"]!.text.toString(),
          'payment_terms': _textControllers["payment_terms"]!.text.toString(),
          'security_needs': _textControllers["security_needs"]!.text.toString(),
          'event_id' : viewModel.createEventResponse!.data!.sId.toString()
        });

        if (viewModel.createEventVenueResponse!.data !=null) {
          // Success! Navigate to appropriate screen



        } else {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(viewModel.response.message.toString())),
          );
        }
      }





    } finally {
      print('Finally Code');
      // Re-enable the login button
    }
  }

}

