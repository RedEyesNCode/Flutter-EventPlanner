import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_decoration.dart';
import 'package:flutter_eventplanner/src/model/body_create_event.dart';
import 'package:flutter_eventplanner/src/session/SharedPrefManager.dart';
import 'package:flutter_eventplanner/src/utils/api_response.dart';
import 'package:flutter_eventplanner/src/view/widgets/ImagePickerBottomSheet.dart';
import 'package:flutter_eventplanner/src/view/widgets/LoadingDialog.dart';
import 'package:flutter_eventplanner/src/view/widgets/OptionsSheet.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';


class DecorationForm extends StatefulWidget {

  final Map<String,String> initialData;
  final String categoryEventID;


  const DecorationForm({Key? key, required this.initialData, required this.categoryEventID}) : super(key: key);


  @override
  _DecorationForm createState() => _DecorationForm();

}

class _DecorationForm extends State<DecorationForm>{


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
          return SingleChildScrollView(
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
                              if (entry.key == "decor_subcategory")
                                {_showDecorationSubcategory(context)}

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

                        if(_textControllers["decoration_name"]!.text.isEmpty){
                          showAlertDialog(context, 'Please enter decoration name');
                        }else if(_textControllers["members"]!.text.isEmpty){
                          showAlertDialog(context, 'Please enter members in team');
                        }else if(_textControllers["description"]!.text.isEmpty){
                          showAlertDialog(context, 'Please enter description');
                        }else if(_textControllers["hourly_rate"]!.text.isEmpty){
                          showAlertDialog(context, 'Please enter hourly rate');
                        }else if(_textControllers["min_hours"]!.text.isEmpty){
                          showAlertDialog(context, 'Please enter min hours');
                        }else if(_textControllers["rate"]!.text.isEmpty){
                          showAlertDialog(context, 'Please enter rate of decoration');
                        }else if(_textControllers["location"]!.text.isEmpty){
                          showAlertDialog(context, 'Please enter location');
                        }else if(_textControllers["contact_information"]!.text.isEmpty){
                          showAlertDialog(context, "Please enter contact information");
                        }else if(_textControllers["decor_subcategory"]!.text.isEmpty){
                          showAlertDialog(context, "Please select decor subcategory.");

                        }

                        else{
                          await _handleDecorationForm(viewmodel,_textControllers);

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
                        'Create Event Decoration',
                        style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w700), // Adjust text style
                      ),
                    ),

                  ],

                ),
                if(viewmodel.response.status == Status.LOADING)
                  const LoadingDialog()

              ],
            ),




          );
    },
    ),
    );



  }
  void _showDecorationSubcategory(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => OptionsSheet(
        options: ["Baloon Decoration", "Flowers Decoration","Cloth Decoration","Theme Decoration"],
        onItemSelected: (selectedItem) {
          _textControllers['decor_subcategory']?.text = selectedItem;

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
  void _showImagePickerOptions(String categoryId) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          final data = <String,String>{"categoryType" : "DECOR", "id" : categoryId};

          return ImagePickerBottomSheet(imageUploadData: data,);
        }
    );
  }
 Future<void> _handleDecorationForm(MainViewModel viewmodel, Map<String, TextEditingController> textControllers) async{

   try{

     var eventDecorationData = body_create_decoration(
         decorSubcategory : _textControllers["decor_subcategory"]!.text.toString(),
         name : _textControllers["decoration_name"]!.text.toString(),
         members : _textControllers["members"]!.text.toString(),
         description : _textControllers["description"]!.text.toString(),
         hourlyRate : _textControllers["hourly_rate"]!.text.toString(),
         minHours : _textControllers["min_hours"]!.text.toString(),
         rate : _textControllers["rate"]!.text.toString(),
         location : _textControllers["location"]!.text.toString(),
         number : _textControllers["contact_information"]!.text.toString(),

         eventId : ''
     );
     await SharedPrefManager().setString('CREATE-EVENT-DECOR', jsonEncode(eventDecorationData));
     String? sessionEventPandit = await SharedPrefManager().getString('CREATE-EVENT-DECOR');
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