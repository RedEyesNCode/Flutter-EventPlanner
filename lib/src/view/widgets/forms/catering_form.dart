import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_catering.dart';
import 'package:flutter_eventplanner/src/model/body_create_event.dart';
import 'package:flutter_eventplanner/src/session/SharedPrefManager.dart';
import 'package:flutter_eventplanner/src/utils/api_response.dart';
import 'package:flutter_eventplanner/src/view/widgets/ImagePickerBottomSheet.dart';
import 'package:flutter_eventplanner/src/view/widgets/LoadingDialog.dart';
import 'package:flutter_eventplanner/src/view/widgets/OptionsSheet.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';


class CateringForm extends StatefulWidget {

  final Map<String, String> initialData;
  final String eventCategoryID;
  const CateringForm({super.key, required this.initialData, required this.eventCategoryID});

  @override
  _CateringForm createState() => _CateringForm();

}
class _CateringForm extends State<CateringForm> {

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
        child:

        Stack(
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
                          if (entry.key == "catering_subcategory")
                            {_showCateringSubcategory(context)}

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

                    if(_textControllers["name"]!.text.isEmpty){
                      showAlertDialog(context, 'Please enter  name');
                    }else if(_textControllers["address"]!.text.isEmpty){
                      showAlertDialog(context, 'Please enter address');
                    }else if(_textControllers["contact"]!.text.isEmpty){
                      showAlertDialog(context, 'Please enter contact');
                    }else if(_textControllers["description"]!.text.isEmpty){
                      showAlertDialog(context, 'Please enter description');
                    }else if(_textControllers["price"]!.text.isEmpty){
                      showAlertDialog(context, 'Please enter price');
                    }else if(_textControllers["catering_subcategory"]!.text.isEmpty){
                      showAlertDialog(context, 'Please catering subcategory');

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
                    'Create Event Catering',
                    style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w700), // Adjust text style
                  ),
                ),

              ],

            )
            ,

          ],

        ),

      );

  }
  void _showCateringSubcategory(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => OptionsSheet(
        options: ['PureVeg', 'NonVeg','Jain Food without garlic onion'],
        onItemSelected: (selectedItem) {
          _textControllers['catering_subcategory']?.text = selectedItem;

          Navigator.pop(context);
          setState(() {}); // Trigger rebuild
        },
      ),
    );
  }
  void _showImagePickerOptions(String categoryId) {
    final data = <String,String>{"categoryType" : "CATERING", "id" : categoryId};

    Navigator.push(

      context,
      MaterialPageRoute(builder: (context) => ImagePickerBottomSheet(imageUploadData: data)),
    );
    // showModalBottomSheet(
    //     context: context,
    //     builder: (BuildContext context) {
    //       final data = <String,String>{"categoryType" : "CATERING", "id" : categoryId};
    //
    //       return ImagePickerBottomSheet(imageUploadData: data,);
    //     }
    // );
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

      var eventPanditData = body_create_catering(
          name : _textControllers["name"]!.text.toString(),
          cateringSubcategory : _textControllers["catering_subcategory"]!.text.toString(),
          address : _textControllers["address"]!.text.toString(),
          contact : _textControllers["contact"]!.text.toString(),
          description : _textControllers["description"]!.text.toString(),
          price : _textControllers["price"]!.text.toString(),
          eventId : ''
      );
      await SharedPrefManager().setString('CREATE-EVENT-CATERING', jsonEncode(eventPanditData));
      String? sessionEventPandit = await SharedPrefManager().getString('CREATE-EVENT-CATERING');
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