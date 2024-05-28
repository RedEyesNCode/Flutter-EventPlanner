import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_photovideo.dart';
import 'package:flutter_eventplanner/src/model/body_create_event.dart';
import 'package:flutter_eventplanner/src/session/SharedPrefManager.dart';
import 'package:flutter_eventplanner/src/utils/api_response.dart';
import 'package:flutter_eventplanner/src/view/widgets/ImagePickerBottomSheet.dart';
import 'package:flutter_eventplanner/src/view/widgets/LoadingDialog.dart';
import 'package:flutter_eventplanner/src/view/widgets/OptionsSheet.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';


class PhotoVideoForm extends StatefulWidget{

  final Map<String,String> initialData;

  final String categoryEventID;



  const PhotoVideoForm({Key? key, required this.initialData, required this.categoryEventID}) : super(key: key);
  @override
  _PhotoVideoForm createState() => _PhotoVideoForm();


}
class _PhotoVideoForm extends State<PhotoVideoForm>{


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
  void _showPhotoVideoSubcategory(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => OptionsSheet(
        options: ["PRE-WEDDING PHOTOGRAPHY", "WEDDING SHOOT","ALL PURPOSE VIDEOGRAPHY & PHOTOGRAPHY"],
        onItemSelected: (selectedItem) {
          _textControllers['photovideo_subcategory']?.text = selectedItem;

          Navigator.pop(context);
          setState(() {}); // Trigger rebuild
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<MainViewModel>(context);

    // TODO: implement build
    return


      SingleChildScrollView(
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
                        onTap: () => {
                          if (entry.key == "photovideo_subcategory")
                            {_showPhotoVideoSubcategory(context)}

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

                    if(_textControllers["service_name"]!.text.isEmpty){
                      showAlertDialog(context, 'Please enter service_name');
                    }else if(_textControllers["client_name"]!.text.isEmpty){
                      showAlertDialog(context, 'Please enter client_name');
                    }else if(_textControllers["type_of_coverage"]!.text.isEmpty){
                      showAlertDialog(context, 'Please enter type_of_coverage');
                    }else if(_textControllers["duration"]!.text.isEmpty){

                      showAlertDialog(context, 'Please enter duration details');
                    }else if(_textControllers["hourly_rate"]!.text.isEmpty){

                      showAlertDialog(context, 'Please enter hourly rate');
                    }
                    else if(_textControllers["contact_information"]!.text.isEmpty){

                      showAlertDialog(context, 'Please enter contact information');
                    }else if(_textControllers["photovideo_subcategory"]!.text.isEmpty){
                      showAlertDialog(context, 'Please select photo video subcategory');

                    } else{
                      await _handleDJBandForm(viewmodel,_textControllers);

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
                    'Create Event Photo-Video',
                    style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w700), // Adjust text style
                  ),
                ),

              ],

            ),


          ],

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
  void _showImagePickerOptions(String categoryId) {
    final data = <String,String>{"categoryType" : "PHOTO_VIDEO", "id" : categoryId};

    Navigator.push(

      context,
      MaterialPageRoute(builder: (context) => ImagePickerBottomSheet(imageUploadData: data)),
    );
    // showModalBottomSheet(
    //     context: context,
    //     builder: (BuildContext context) {
    //       final data = <String,String>{"categoryType" : "PHOTO_VIDEO", "id" : categoryId};
    //
    //       return ImagePickerBottomSheet(imageUploadData: data,);
    //     }
    // );
  }

  Future<void> _handleDJBandForm(MainViewModel viewmodel, Map<String, TextEditingController> textControllers) async {

    try{

      var eventPanditData = body_create_photovideo(
          serviceName : _textControllers["service_name"]!.text.toString(),
          photovideoSubcategory : _textControllers["photovideo_subcategory"]!.text.toString(),
          clientName : _textControllers["client_name"]!.text.toString(),
          typeOfCoverage : _textControllers["type_of_coverage"]!.text.toString(),
          duration : _textControllers["duration"]!.text.toString(),
          hourlyRate : _textControllers["hourly_rate"]!.text.toString(),
          eventId : ''
      );
      await SharedPrefManager().setString('CREATE-EVENT-PHOTOVIDEO', jsonEncode(eventPanditData));
      String? sessionEventPandit = await SharedPrefManager().getString('CREATE-EVENT-PHOTOVIDEO');
      print(sessionEventPandit);


      if (sessionEventPandit !=null) {
        // Success! Navigate to appropriate screen
        _showImagePickerOptions(widget.categoryEventID);
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