import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eventplanner/src/model/body_create_event.dart';
import 'package:flutter_eventplanner/src/session/SharedPrefManager.dart';
import 'package:flutter_eventplanner/src/view/screens/event_type_screen.dart';
import 'package:flutter_eventplanner/src/view/widgets/DatePickerWidget.dart';
import 'package:flutter_eventplanner/src/view/widgets/LocationSheet.dart';
import 'package:flutter_eventplanner/src/view/widgets/OptionsSheet.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';

class CatalogueScreen extends StatefulWidget {
  final Map<String, String> initialData;
  const CatalogueScreen({Key? key, required this.initialData})
      : super(key: key);

  @override
  _CatalogueScreenState createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  final _textControllers = Map<String, TextEditingController>();

  void _showLocationSheet(BuildContext context, String key) {
    showModalBottomSheet(
        context: context,
        builder: (context) => LocationSheet(
              onItemSelected: (selectedItem) {
                _textControllers[key]?.text = selectedItem;
                Navigator.pop(context);
                setState(() {}); // Trigger rebuild
              },
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
    return ChangeNotifierProvider<MainViewModel>(
      create: (_) => MainViewModel(),
      child:
      Consumer<MainViewModel>(

        builder: (context,viewmodel,_){
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Event General Information',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'PlayfairDisplay',
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                Form(
                  child: Column(
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
                                    {_showLocationSheet(context, entry.key)}
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
                              Colors.red,
                              Colors.redAccent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(
                              10), // Adjust border radius as needed
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
                                        {_handleEventSession(context)}
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
                            'Proceed',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: 'PlayfairDisplay',
                                fontWeight: FontWeight.w700), // Adjust text style
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          );

        },

      )


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

  _handleEventSession(BuildContext buildContext) async {
    var eventData = body_create_event(
      eventname: _textControllers['event_name']?.text.toString(),
      eventtype: _textControllers['event_type']?.text.toString(),
      startdate: _textControllers['start_date']?.text.toString(),
      enddate: _textControllers['end_date']?.text.toString(),
      description: _textControllers['description']?.text.toString(),
      status: _textControllers['Status']?.text.toString(),
      userId: _textControllers['userId']?.text.toString(),
      locationid: _textControllers['location_id']?.text.toString(),
    );
    await SharedPrefManager().setString('CREATE-EVENT', eventData.toString());
    String? retrievedEvent =
        await SharedPrefManager().getString('CREATE-EVENT');
    if (jsonEncode(retrievedEvent).isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EventTypeScreen()),
      );
    }
  }
}
