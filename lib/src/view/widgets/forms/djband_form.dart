import 'package:flutter/material.dart';


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
          ],

        )
        ,
      );

  }
}