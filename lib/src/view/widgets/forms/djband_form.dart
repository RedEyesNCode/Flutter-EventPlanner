import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';


class DjBandForm extends StatefulWidget{


  final Map<String, String> initialData;
  const DjBandForm({Key? key, required this.initialData}) : super(key: key);

  @override
  _DjBandForm createState() => _DjBandForm();



}

class _DjBandForm extends State<DjBandForm>{
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

    ChangeNotifierProvider(create: (_)=> MainViewModel(),child:
      Consumer<MainViewModel>(

        builder: (context,viewmodel,_){
          return       SingleChildScrollView(
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

                    if(_textControllers["dj_band_name"]!.text.isEmpty){
                      showAlertDialog(context, 'Please enter dj band name');
                    }else if(_textControllers["members"]!.text.isEmpty){
                      showAlertDialog(context, 'Please enter members in team');
                    }else if(_textControllers["description"]!.text.isEmpty){
                      showAlertDialog(context, 'Please enter description');
                    }else if(_textControllers["genre"]!.text.isEmpty){
                      showAlertDialog(context, 'Please enter genre');
                    }else if(_textControllers["availability"]!.text.isEmpty){
                      showAlertDialog(context, 'Please enter availability');
                    }else if(_textControllers["rate"]!.text.isEmpty){
                      showAlertDialog(context, 'Please enter rate of decoration');
                    }else if(_textControllers["location"]!.text.isEmpty){
                      showAlertDialog(context, 'Please enter location');
                    }else if(_textControllers["contact_information"]!.text.isEmpty){
                      showAlertDialog(context, "Please enter contact information");
                    }else if(_textControllers["equiment"]!.text.isEmpty){

                      showAlertDialog(context, 'Please enter equipment details');
                    }

                    else{
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
                    'Create Event Venue',
                    style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w700), // Adjust text style
                  ),
                ),

              ],

            )
            ,
          );

        },
      )

      ,);


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

  _handleDJBandForm(MainViewModel viewmodel, Map<String, TextEditingController> textControllers) {




  }
}