import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eventplanner/src/model/body_create_event.dart';
import 'package:flutter_eventplanner/src/model/login_response.dart';
import 'package:flutter_eventplanner/src/session/SharedPrefManager.dart';
import 'package:flutter_eventplanner/src/utils/api_response.dart';
import 'package:flutter_eventplanner/src/view/screens/event_type_screen.dart';
import 'package:flutter_eventplanner/src/view/screens/update_event_category_page.dart';
import 'package:flutter_eventplanner/src/view/widgets/DatePickerWidget.dart';
import 'package:flutter_eventplanner/src/view/widgets/LoadingDialog.dart';
import 'package:flutter_eventplanner/src/view/widgets/LocationSheet.dart';
import 'package:flutter_eventplanner/src/view/widgets/OptionsSheet.dart';
import 'package:flutter_eventplanner/src/view/widgets/VendorPaymentSheet.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';

class UpdateEventPage extends StatefulWidget {
  final Map<String, String> initialData;
  final String eventID;
  const UpdateEventPage({Key? key, required this.initialData,required this.eventID})
      : super(key: key);

  @override
  _UpdateEventPage createState() => _UpdateEventPage();
}

class _UpdateEventPage extends State<UpdateEventPage> {
  final _textControllers = Map<String, TextEditingController>();
  var _locationId = "";


  void _showLocationSheet(BuildContext context, String key,MainViewModel mainViewModel) {
    showModalBottomSheet(
        context: context,
        builder: (context) => LocationSheet(
          viewModel: mainViewModel,
          onItemSelected: (selectedItem,selectedId) {
            _textControllers[key]?.text = selectedItem;
            _locationId = selectedId;

            Navigator.pop(context);
            setState(() {}); // Trigger rebuild
          },
        ));
  }
  void _showPaymentSheet(BuildContext context) {

    showModalBottomSheet(
        context: context,
        builder: (context) => const VendorPaymentSheet(

        ));
  }

  void _showBottomSheetEventStatus(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => OptionsSheet(
        options: ["COMPLETED", "PLANNING", "PENDING"],
        onItemSelected: (selectedItem) {
          _textControllers['Status']?.text = selectedItem;

          Navigator.pop(context);
          setState(() {}); // Trigger rebuild
        },
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, String key) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _textControllers[key]?.text =
            picked.toString(); // Format this as per your requirement
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialize controllers with initial data
    widget.initialData.forEach((key, value) {
      _textControllers[key] = TextEditingController(text: value);
    });
    _callEventDetailsApi();
  }
  Future<void> _callEventDetailsApi() async {
    print('event-details-screen-id'+widget.eventID);
    print('event-details-screen-id'+widget.eventID);
    print('event-details-screen-id'+widget.eventID);
    print('event-details-screen-id'+widget.eventID);
    Provider.of<MainViewModel>(context, listen: false).getEventDetails(
        {"eventId": widget.eventID});
    if(Provider.of<MainViewModel>(context,listen: false).getEventDetailsResponse!=null){
      var eventDetails =Provider.of<MainViewModel>(context,listen: false).getEventDetailsResponse;

      setState(() { // Rebuild the widget after updating controllers
        _textControllers['event_name']?.text = eventDetails!.data!.eventName.toString();
        _textControllers['event_type']?.text = eventDetails!.data!.eventType.toString();
        _textControllers['start_date']?.text = eventDetails!.data!.startDate.toString();
        _textControllers['end_date']?.text = eventDetails!.data!.endDate.toString();
        _textControllers['location_id']?.text = eventDetails!.data!.locationId!.venueName.toString();
        _textControllers['description']?.text = eventDetails!.data!.description.toString();
        _textControllers['Status']?.text = eventDetails!.data!.status.toString();

      });
    }
  }

  @override
  void dispose() {
    // Dispose controllers
    _textControllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    body_create_event eventData;
    final viewmodel = Provider.of<MainViewModel>(context);


    return Scaffold(

      appBar: AppBar(
      automaticallyImplyLeading: true,
        title: Text('Update Event',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor:  Color(0xFF592b03), // Dark brown color from hex code #2a190d,
      body:
      SingleChildScrollView(
        child: Column(
          children: [

            Form(
                child:

                Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        ...widget.initialData.entries
                            .map((entry) => Padding(
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
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: TextField(


                                controller: _textControllers[entry.key],
                                onTap: () => {
                                  if (entry.key == "Status")
                                    {_showBottomSheetEventStatus(context)}
                                  else if (entry.key == "start_date" ||
                                      entry.key == "end_date")
                                    {_selectDate(context, entry.key)}
                                  else if (entry.key == "location_id")
                                      {_showLocationSheet(context, entry.key,viewmodel)}
                                },
                                obscureText: false,
                                canRequestFocus: entry.key != "Status" ||
                                    entry.key == "state_date" ||
                                    entry.key == "end_date",
                                cursorColor: Colors.black,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontFamily: 'PlayfairDisplay'),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: entry.key
                                        .replaceAll('_', ' ')
                                        .toUpperCase(),
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15.0)),
                              ),
                            ),
                          ),
                        ))
                            .toList(),
                        /*TextField(
                  controller: _textControllers[entry.key],
                  decoration: InputDecoration(labelText: entry.key.replaceAll('_', ' ').toUpperCase()),
                )*/
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFFFD144),
                                Color(0xff6e3e14),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(
                                25), // Adjust border radius as needed
                          ),
                          child: ElevatedButton(
                            onPressed: () => {
                              // Save the create event data into session.

                              if (_textControllers['event_name']!
                                  .text
                                  .toString()
                                  .isEmpty)
                                {showAlertDialog(context, 'Please enter event name')}
                              else if (_textControllers['event_type']!
                                  .text
                                  .toString()
                                  .isEmpty)
                                {showAlertDialog(context, 'Please enter event type')}
                              else if (_textControllers['start_date']!
                                    .text
                                    .toString()
                                    .isEmpty)
                                  {showAlertDialog(context, 'Please enter start date')}
                                else if (_textControllers['end_date']!
                                      .text
                                      .toString()
                                      .isEmpty)
                                    {showAlertDialog(context, 'Please enter end date')}
                                  else if (_textControllers['description']!
                                        .text
                                        .toString()
                                        .isEmpty)
                                      {showAlertDialog(context, 'Please enter description')}
                                    else if (_textControllers['Status']!
                                          .text
                                          .toString()
                                          .isEmpty)
                                        {
                                          showAlertDialog(
                                              context, 'Please enter Status of Event')
                                        }
                                      else if (_textControllers['location_id']!
                                            .text
                                            .toString()
                                            .isEmpty)
                                          {
                                            showAlertDialog(
                                                context, 'Please select event location')
                                          }
                                        else
                                          {
                                            _handleEventSession(context,viewmodel)

                                          }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(
                                  left: 55.0, right: 55.0, top: 15.0, bottom: 15.0),
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Keep consistent with container
                              ),
                            ),
                            child: Text(
                              'Update Event General Info',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontFamily: 'PlayfairDisplay',
                                  fontWeight: FontWeight.w700), // Adjust text style
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFFFD144),
                                Color(0xff6e3e14),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(
                                25), // Adjust border radius as needed
                          ),
                          child: ElevatedButton(
                            onPressed: () => {
                              Navigator.push(

                                context,
                                MaterialPageRoute(builder: (context) => UpdateEventCategoryPage(
                                  eventId: widget.eventID,

                                  incomingCategoryName: viewmodel.getEventDetailsResponse!.data!.categoryId!.categoriesName.toString(),
                                )),
                              )

                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(
                                  left: 55.0, right: 55.0, top: 15.0, bottom: 15.0),
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Keep consistent with container
                              ),
                            ),
                            child: Text(
                              'Update Event Category',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,

                                  fontFamily: 'PlayfairDisplay',
                                  fontWeight: FontWeight.w700), // Adjust text style
                            ),
                          ),
                        ),

                      ],
                    ),
                    if(viewmodel.response.status ==Status.LOADING)
                      const LoadingDialog()
                  ],
                )

            ),
          ],
        ),
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

  _handleEventSession(BuildContext buildContext,MainViewModel viewmodel) async {

    String? sessionUserString = await SharedPrefManager().getString("USER_ID");


    var eventData = body_create_event(
      eventname: _textControllers['event_name']?.text.toString(),
      eventtype: _textControllers['event_type']?.text.toString(),
      startdate: _textControllers['start_date']?.text.toString(),
      enddate: _textControllers['end_date']?.text.toString(),
      description: _textControllers['description']?.text.toString(),
      status: _textControllers['Status']?.text.toString(),
      userId:sessionUserString,
      // userId:'STATIC_FLUTTER',
      locationid: _locationId,
    );
    await SharedPrefManager().setString('CREATE-EVENT', jsonEncode(eventData));
    String? retrievedEvent =
    await SharedPrefManager().getString('CREATE-EVENT');
    if (retrievedEvent!=null) {
      print(jsonDecode(retrievedEvent));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EventTypeScreen()),
      );
      // check the payment status of the user.

      // viewmodel.getUserPaymentStatus({
      //   'userId' : sessionUserString,
      // });
      // if(viewmodel.userPaymentStatus!.code==200){
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text('You have already paid ! '),
      //     backgroundColor: Colors.green,
      //   ));
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => EventTypeScreen()),
      //   );
      // }else if(viewmodel.userPaymentStatus!.code==400){
      //   _showPaymentSheet(context);
      //
      // }




    }
  }
}
