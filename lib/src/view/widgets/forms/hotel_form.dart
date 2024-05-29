

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_hotel.dart';
import 'package:flutter_eventplanner/src/model/body_create_event.dart';
import 'package:flutter_eventplanner/src/session/SharedPrefManager.dart';
import 'package:flutter_eventplanner/src/view/widgets/ImagePickerBottomSheet.dart';
import 'package:flutter_eventplanner/src/view/widgets/OptionsSheet.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';

class HotelForm extends StatefulWidget {


  final Map<String, String> initialData;
  final String eventCategoryID;
  const HotelForm({super.key, required this.initialData, required this.eventCategoryID});

  @override
  _HotelForm createState() => _HotelForm();

}

class _HotelForm extends State<HotelForm> {

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

        child:        Container(

          child: Column(

            children: [

              SizedBox(height: 20),
              ...widget.initialData.entries.map((entry) => Padding(
                padding: const EdgeInsets.all(8.0),
                child:

                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange.shade200,
                        Colors.orange.shade50,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(
                        25), // Adjust border radius as needed
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0 ,right: 10.0),
                    child: TextField(
                      onTap: () => {
                        if (entry.key == "hotel_subcategory")
                          {_showHotelSubcategory(context)}

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

              )).toList(),
              ElevatedButton(
                onPressed: () async {

                  // Api Calling.

                  if(_textControllers["hotel_name"]!.text.isEmpty){
                    showAlertDialog(context, 'Please enter  hotel name');
                  }else if(_textControllers["hotel_address"]!.text.isEmpty){
                    showAlertDialog(context, 'Please enter hotel address');
                  }else if(_textControllers["hotel_capacity"]!.text.isEmpty){
                    showAlertDialog(context, 'Please enter contact hotel capacity');
                  }else if(_textControllers["hotel_number"]!.text.isEmpty){
                    showAlertDialog(context, 'Please enter hotel number');
                  }else if(_textControllers["hotel_checkin"]!.text.isEmpty){
                    showAlertDialog(context, 'Please enter hotel checkin');
                  }else if(_textControllers["hotel_checkout"]!.text.isEmpty){
                    showAlertDialog(context, 'Please enter hotel checkout');
                  }else if(_textControllers["hotel_price"]!.text.isEmpty){
                    showAlertDialog(context, 'Please enter hotel price');
                  }else if(_textControllers["hotel_subcategory"]!.text.isEmpty){
                    showAlertDialog(context, 'Please enter hotel subcategory');
                  }
                  else{
                    await _handleHotelForm(viewmodel,_textControllers);

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
                  'Create Event Hotel and OYO',
                  style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w700), // Adjust text style
                ),
              ),

            ],

          ),
        )
        ,
      );

  }
  void _showImagePickerOptions(String categoryId) {
    final data = <String,String>{"categoryType" : "HOTEL", "id" : categoryId};

    Navigator.push(

      context,
      MaterialPageRoute(builder: (context) => ImagePickerBottomSheet(imageUploadData: data)),
    );
    // showModalBottomSheet(
    //     context: context,
    //     builder: (BuildContext context) {
    //       final data = <String,String>{"categoryType" : "HOTEL", "id" : categoryId};
    //
    //       return ImagePickerBottomSheet(imageUploadData: data,);
    //     }
    // );
  }
  void _showHotelSubcategory(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => OptionsSheet(
        options: ['Resorts','Hotels','Apartments','Halls','Rooms'],
        onItemSelected: (selectedItem) {
          _textControllers['hotel_subcategory']?.text = selectedItem;

          Navigator.pop(context);
          setState(() {}); // Trigger rebuild
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

  Future<void> _handleHotelForm(MainViewModel viewmodel, Map<String, TextEditingController> textControllers) async {

    try{

      var eventPanditData = body_create_hotel(
          hotelName : _textControllers["hotel_name"]!.text.toString(),
          hotelAddress : _textControllers["hotel_address"]!.text.toString(),
          hotelCapacity : _textControllers["hotel_capacity"]!.text.toString(),
          hotelNumber : _textControllers["hotel_number"]!.text.toString(),
          hotelCheckin : _textControllers["hotel_checkin"]!.text.toString(),
          hotelCheckout : _textControllers["hotel_checkout"]!.text.toString(),
          hotelPrice : _textControllers["hotel_price"]!.text.toString(),
          eventId : ''
      );
      await SharedPrefManager().setString('CREATE-EVENT-HOTEL', jsonEncode(eventPanditData));
      String? sessionEventPandit = await SharedPrefManager().getString('CREATE-EVENT-HOTEL');
      print(sessionEventPandit);


      if (sessionEventPandit !=null) {
        // Success! Navigate to appropriate screen
        _showImagePickerOptions(widget.eventCategoryID);
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(viewmodel.response.message.toString())),
        );
      }
    }finally{
      print('Finally Code.');
    }

  }





}