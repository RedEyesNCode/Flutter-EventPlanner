import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class SignupScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return SignupScreenUI();
  }

}
class SignupScreenUI extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignupScreenUI();
  }

}
class _SignupScreenUI extends State<SignupScreenUI>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Account ',style: TextStyle( fontFamily: 'PlayfairDisplay',
            fontWeight: FontWeight.w800),),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Register with Us',style: TextStyle( fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.w600,fontSize: 15),),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  focusedBorder: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(10.0), // Adjust border radius as needed
                      borderSide: BorderSide(
                        color: Colors.green, // Set border color
                      )
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Adjust border radius as needed
                    borderSide: BorderSide(
                      color: Colors.grey, // Set border color
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Name',
                  focusedBorder: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(10.0), // Adjust border radius as needed
                      borderSide: BorderSide(
                        color: Colors.green, // Set border color
                      )
                  ),
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(10.0), // Adjust border radius as needed
                    borderSide: BorderSide(
                      color: Colors.grey, // Set border color
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  focusedBorder: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(10.0), // Adjust border radius as needed
                      borderSide: BorderSide(
                        color: Colors.green, // Set border color
                      )
                  ),
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(10.0), // Adjust border radius as needed
                    borderSide: BorderSide(
                      color: Colors.grey, // Set border color
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  focusedBorder: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(10.0), // Adjust border radius as needed
                      borderSide: BorderSide(
                        color: Colors.green, // Set border color
                      )
                  ),
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(10.0), // Adjust border radius as needed
                    borderSide: BorderSide(
                      color: Colors.grey, // Set border color
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Address',
                  focusedBorder: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(10.0), // Adjust border radius as needed
                      borderSide: BorderSide(
                        color: Colors.green, // Set border color
                      )
                  ),
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(10.0), // Adjust border radius as needed
                    borderSide: BorderSide(
                      color: Colors.grey, // Set border color
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.greenAccent,
                      Colors.green,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10), // Adjust border radius as needed
                ),
                child: ElevatedButton(
                  onPressed: () => print('Create New Account'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(left: 55.0,right: 55.0,top: 15.0,bottom: 15.0), backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Keep consistent with container
                    ),
                  ),
                  child: Text(
                    'Create New Account',
                    style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w700), // Adjust text style
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );


  }


}