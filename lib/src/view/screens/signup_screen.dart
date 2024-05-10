import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eventplanner/src/utils/api_response.dart';
import 'package:flutter_eventplanner/src/view/screens/login_screen.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';

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

class _SignupScreenUI extends State<SignupScreenUI> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();




  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();


    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    final viewmodel = Provider.of<MainViewModel>(context);

    return
      Scaffold(
        body:
        SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Register with Us',
                    style: TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust border radius as needed
                          borderSide: BorderSide(
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
                  SizedBox(height: 20.0),
                  TextField(
                    obscureText: false,
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust border radius as needed
                          borderSide: BorderSide(
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
                  SizedBox(height: 20.0),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust border radius as needed
                          borderSide: BorderSide(
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
                  SizedBox(height: 20.0),
                  TextField(
                    controller: _phoneNumberController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust border radius as needed
                          borderSide: BorderSide(
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
                  SizedBox(height: 20.0),
                  TextField(
                    obscureText: false,
                    controller: _addressController,
                    decoration: InputDecoration(
                      hintText: 'Address',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust border radius as needed
                          borderSide: BorderSide(
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
                      borderRadius: BorderRadius.circular(
                          10), // Adjust border radius as needed
                    ),
                    child: ElevatedButton(
                      onPressed: () => _handleRegisterUser(viewmodel),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(
                            left: 55.0,
                            right: 55.0,
                            top: 15.0,
                            bottom: 15.0),
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
                            fontWeight:
                            FontWeight.w700), // Adjust text style
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        ,
      );




  }

  Future<void> _handleRegisterUser(MainViewModel viewModel) async {
    // Consider disabling the button to prevent multiple login attempts

    try {
      showLoader(); // Show the loading dialog
      await viewModel.registerUser({
        'email': _emailController.text,
        'password': _passwordController.text,
        "name" : _nameController.text,
        "PhoneNumber" : _phoneNumberController.text,
        "Address" : _addressController.text,
        "password" : _passwordController.text
      });
      hideLoader(); // Hide the dialog

      if (viewModel.response.status == Status.COMPLETED) {
        // Success! Navigate to appropriate screen
        Navigator.pop(context);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => LoginScreen()),
        // );

        //   viewModel.loginResponse!.data.password
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(viewModel.registerResponse!.message.toString())),
        );
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
    print('Loading');
  }

  void hideLoader() {
    // Example if using flutter_easyloading:
    print('Hide Loading');
  }
}
