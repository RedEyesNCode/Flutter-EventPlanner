import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



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
                  fontWeight: FontWeight.w400,fontSize: 15),),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Or Continue With'),
                  SizedBox(width: 10.0),
                  IconButton(
                    icon: Icon(Icons.facebook),
                    onPressed: () => print('Login with Facebook'),
                  ),
                  IconButton(
                    icon: Icon(Icons.g_mobiledata),
                    onPressed: () => print('Login with Google'),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              TextButton(
                onPressed: () => print('Forgot Password'),
                child: Text('Forgot Your Password?'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () => print('Login'),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );

  }


}

