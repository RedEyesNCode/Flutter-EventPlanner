import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/model/body_create_event.dart';
import 'package:flutter_eventplanner/src/session/SharedPrefManager.dart';
import 'package:flutter_eventplanner/src/view/widgets/ImagePickerBottomSheet.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';


class BandForm extends StatefulWidget {

  final Map<String, String> initialData;
  final String eventCategoryID;
  const BandForm({super.key, required this.initialData, required this.eventCategoryID});

  @override
  _BandForm createState() => _BandForm();

}
class _BandForm extends State<BandForm> {

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
    final viewmodel = Provider.of<MainViewModel>(context);

    // TODO: implement build
    return


      SingleChildScrollView(
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

            )).toList(),
            ElevatedButton(
              onPressed: () async {

                // Api Calling.

                if(_textControllers["band_name"]!.text.isEmpty){
                  showAlertDialog(context, 'Please enter  band name');
                }else if(_textControllers["genre"]!.text.isEmpty){
                  showAlertDialog(context, 'Please enter genre');
                }else if(_textControllers["contact_person"]!.text.isEmpty){
                  showAlertDialog(context, 'Please enter contact person');
                }else if(_textControllers["contact_number"]!.text.isEmpty){
                  showAlertDialog(context, 'Please enter contact number');
                }else if(_textControllers["email"]!.text.isEmpty){
                  showAlertDialog(context, 'Please enter email');
                }else if(_textControllers["address"]!.text.isEmpty){
                  showAlertDialog(context, 'Please enter address');
                }
                else{
                  await _handleCateringForm(viewmodel,_textControllers);

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
                'Create Event Band',
                style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w700), // Adjust text style
              ),
            ),

          ],

        )
        ,
      );

  }
  void _showImagePickerOptions(String categoryId) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          final data = <String,String>{"categoryType" : "BAND", "id" : categoryId};

          return ImagePickerBottomSheet(imageUploadData: data,);
        }
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

  Future<void> _handleCateringForm(MainViewModel viewmodel, Map<String, TextEditingController> textControllers) async {

    try{
      String? sessionEventString = await SharedPrefManager().getString('CREATE-EVENT');
      String? sessionUserString = await SharedPrefManager().getString("USER_ID");

      body_create_event? sessionJsonEvent = body_create_event.fromJson(jsonDecode(sessionEventString!));
      print(sessionEventString);
      await viewmodel.createEvent({
        'event_name' : sessionJsonEvent!.eventname,
        'event_type' : sessionJsonEvent.eventtype,
        'start_date' : sessionJsonEvent.startdate,
        'end_date' : sessionJsonEvent.enddate,
        'description' : sessionJsonEvent.description,
        'Status' : sessionJsonEvent.status,
        'userId' : sessionUserString,
        'location_id' : sessionJsonEvent.locationid,
        'category_id' : widget.eventCategoryID,

      });

      if(viewmodel.createEventResponse!=null){
        await viewmodel.createEventTypeBand({
          "BandName" : _textControllers["band_name"]!.text.toString(),
          "Genre" : _textControllers["genre"]!.text.toString(),
          "ContactPerson" : _textControllers["contact_person"]!.text.toString(),
          "ContactNumber" : _textControllers["contact_number"]!.text.toString(),
          "Email" : _textControllers["email"]!.text.toString(),
          "Address" : _textControllers["address"]!.text.toString(),
          'event_id' : viewmodel.createEventResponse!.data!.sId.toString()
        });


        if (viewmodel.createBandResponse!.data !=null) {
          // Success! Navigate to appropriate screen
          _showImagePickerOptions(viewmodel.createBandResponse!.data!.sId.toString());



        } else {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(viewmodel.response.message.toString())),
          );
        }
      }

    }finally{
      print('Finally Code.');
    }


  }


}