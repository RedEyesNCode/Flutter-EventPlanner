import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eventplanner/src/view/screens/event_type_screen.dart';


class CatalogueScreen extends StatefulWidget {
  final Map<String, String> initialData;
  const CatalogueScreen({Key? key, required this.initialData}) : super(key: key);

  @override
  _CatalogueScreenState createState() => _CatalogueScreenState();


}

class _CatalogueScreenState extends State<CatalogueScreen>{

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
    return
      SingleChildScrollView(

        child:
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Event General Information',style: TextStyle(fontSize: 20.0,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w700),),
                ),
              ],
            ),
            Form(
              child: Column(
                children: [
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
                      borderRadius: BorderRadius.circular(10), // Adjust border radius as needed
                    ),
                    child: ElevatedButton(
                      onPressed: () => {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventTypeScreen()),
                      )},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(left: 55.0,right: 55.0,top: 15.0,bottom: 15.0), backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Keep consistent with container
                        ),
                      ),
                      child: Text(
                        'Proceed',
                        style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w700), // Adjust text style
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                ],
              ),
            ),
          ],
        ),
      )
      ;
  }



}
