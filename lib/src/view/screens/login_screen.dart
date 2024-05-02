import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eventplanner/src/view/screens/myhome_page.dart';
import 'package:flutter_eventplanner/src/view/screens/signup_screen.dart';



class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return LoginScreenUI();
  }
}

class LoginScreenUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreenUI();
  }

}
class _LoginScreenUI extends State<LoginScreenUI>{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Event-Planner',style: TextStyle( fontFamily: 'PlayfairDisplay',
          fontWeight: FontWeight.w800),),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Login To Your Account',style: TextStyle( fontFamily: 'PlayfairDisplay',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Or Continue With',style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'PlayfairDisplay'
                    )),
                  ),
                  SizedBox(width: 10.0),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,

                          )


                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(

                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Facebook',style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'PlayfairDisplay'
                              ),),
                            ),
                            Icon(Icons.facebook_outlined)
                          ],

                        ),
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,

                          )


                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(

                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Google',style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'PlayfairDisplay'
                              ),),
                            ),
                            Icon(Icons.mail_outline_outlined)
                          ],

                        ),
                      ),

                    ),
                  ),

                ],

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
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  )
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(left: 55.0,right: 55.0,top: 15.0,bottom: 15.0), backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Keep consistent with container
                  ),
                ),
                child:
                Text(
                  'Login',
                  style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w700), // Adjust text style
                ),
              ),
            ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Or',style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'PlayfairDisplay'
                )),
              ),
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
                  onPressed: () => {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                  )
                  },
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
