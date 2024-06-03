import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eventplanner/src/model/login_response.dart';
import 'package:flutter_eventplanner/src/session/SharedPrefManager.dart';
import 'package:flutter_eventplanner/src/utils/api_response.dart';
import 'package:flutter_eventplanner/src/view/screens/myhome_page.dart';
import 'package:flutter_eventplanner/src/view/screens/signup_screen.dart';
import 'package:flutter_eventplanner/src/view/widgets/ForgotPasswordBottomSheet.dart';
import 'package:flutter_eventplanner/src/view/widgets/LoadingDialog.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';

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

class _LoginScreenUI extends State<LoginScreenUI> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController.text = "test";
    _passwordController.text = "pass";
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  void _showForgotPasswordBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allow scrolling if content exceeds screen
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ), // Add rounded corners
      builder: (context) => const ForgotPasswordBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<MainViewModel>(context);
    return Scaffold(
      backgroundColor:  Colors.white, // Dark brown color from hex code #2a190d,

      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child:

            Stack(
              alignment: Alignment.center, // Center the ProgressDialog

              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[


                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),

                      height: 100,

                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              30), // Adjust the value to change the amount of circularity
                          child: Image.asset(
                              'lib/src/images/ic_app_logo_red.png')), // path to your image
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Login To Your Account',
                      style: TextStyle(
                          fontFamily: 'SFPro',
                          color:  Colors.redAccent, // Dark brown color from hex code #2a190d,

                          fontWeight: FontWeight.w600,
                          fontSize: 21),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: _emailController,
                      style: TextStyle(fontFamily:   'SFPro',color: Colors.black,fontSize:  17),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        enabledBorder: OutlineInputBorder( // Used when enabled and not focused
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.redAccent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust border radius as needed
                            borderSide: BorderSide(
                              width: 2,

                              color: Color(0xFFffd553), // Set border color
                            )),
                        border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust border radius as needed
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.redAccent, // Set border color
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      obscureText: _obscureText,
                      controller: _passwordController,
                      style: TextStyle(fontFamily:   'SFPro',color: Colors.black,fontSize:  17),

                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            color: Colors.brown,
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder( // Used when enabled and not focused
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.redAccent,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust border radius as needed
                            borderSide: BorderSide(
                              width: 2,

                              color: Colors.green, // Set border color
                            )),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust border radius as needed
                          borderSide: BorderSide(
                            color: Colors.grey, // Set border color
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => {
                            _showForgotPasswordBottomSheet(context)
                          },
                          child:
                          Text('Forgot password ?',style : TextStyle(fontWeight: FontWeight.w500, fontSize: 17, fontFamily: 'SFPro',color: Colors.grey)),

                        )

                      ],
                    ),
                    SizedBox(height: 20.0),
                    SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.redAccent,
                            Colors.red,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(
                            30), // Adjust border radius as needed
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          // Api Calling.
                          if (_emailController.text.toString().isEmpty) {
                            showAlertDialog(context, 'Please enter email address');
                          } else if (_passwordController.text.toString().isEmpty) {
                            showAlertDialog(context, 'Please enter password');
                          } else {
                            await _handleLogin(viewmodel);

                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(
                              left: 95.0, right: 95.0, top: 15.0, bottom: 15.0),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Keep consistent with container
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'PlayfairDisplay',
                              fontWeight: FontWeight.w700), // Adjust text style
                        ),
                      ),
                    ),



                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text('Or',
                              style: TextStyle(
                                  fontSize: 14, fontFamily: 'SFPro',color: Colors.white,fontWeight: FontWeight.w900)),
                        ),
                        SizedBox(width: 10.0),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.redAccent,
                            Colors.red,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(
                            25), // Adjust border radius as needed
                      ),
                      child: ElevatedButton(
                        onPressed: () => {
                          Navigator.push(

                            context,
                            MaterialPageRoute(builder: (context) => SignupScreen()),
                          )
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(
                              left: 55.0, right: 55.0, top: 15.0, bottom: 15.0),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Keep consistent with container
                          ),
                        ),
                        child: Text(
                          'Create New Account',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'PlayfairDisplay',
                              fontWeight: FontWeight.w700), // Adjust text style
                        ),
                      ),
                    ),
                  ],
                ),
                if(viewmodel.response.status == Status.LOADING)
                  LoadingDialog(),
              ],
            )


          ),
        ),
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

  Future<void> _handleLogin(MainViewModel viewModel) async {
    // Consider disabling the button to prevent multiple login attempts
    print(viewModel.response.status.toString());

    try {
      showLoader(); // Show the loading dialog
      await viewModel.loginUser({
        'email': _emailController.text,
        'password': _passwordController.text,
      });
      hideLoader(); // Hide the dialog
      print(viewModel.response.status.toString());

      if (viewModel.response.status == Status.COMPLETED) {
        // Success! Navigate to appropriate screen

        //   viewModel.loginResponse!.data.password
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(viewModel.loginResponse!.message.toString())),
        );
        // Saving the response into session
        await SharedPrefManager()
            .setString('LOGIN_RESPONSE', jsonEncode(viewModel.loginResponse));
        await SharedPrefManager()
            .setString('USER_ID', viewModel.loginResponse!.data.id.toString());
        await SharedPrefManager().setString('IS_LOGGED', 'true');
        String? jsonString =
            await SharedPrefManager().getString('LOGIN_RESPONSE');

        if (jsonString != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        }
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(viewModel.response.message.toString())),
        );
      }
    } finally {
      print('Finally Code');
      // Re-enable the login button
    }
  }

  void showLoader() {
    // Example if using flutter_easyloading:
    LoadingDialog();

  }

  void hideLoader() {
    // Example if using flutter_easyloading:
    print('Hide Loading');
  }
}
