import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/utils/api_response.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';

class ForgotPasswordBottomSheet extends StatefulWidget {
  const ForgotPasswordBottomSheet({super.key});

  @override
  _ForgotPasswordBottomSheetState createState() =>
      _ForgotPasswordBottomSheetState();
}

class _ForgotPasswordBottomSheetState extends State<ForgotPasswordBottomSheet> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<MainViewModel>(context);

    return Padding(
      padding: MediaQuery.of(context).viewInsets, // Adjust for keyboard
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Forgot Password',
                style: TextStyle(fontFamily: 'SFPro',fontSize: 17, fontWeight: FontWeight.w400,color: Colors.black),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(
                        left: 95.0, right: 95.0, top: 15.0, bottom: 15.0),
                    backgroundColor: Colors.redAccent,
                    shadowColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Keep consistent with container
                    ),
                  ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Send password reset email
                    _sendPasswordResetEmail(_emailController.text,viewmodel);

                    // Optionally close the bottom sheet
                  }
                },
                child: const Text('Send New Password',style: TextStyle(fontSize: 11,color : Colors.white,fontFamily: 'SFPro',fontWeight: FontWeight.w300),),
              ),
            ],
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

  Future<void> _sendPasswordResetEmail(String email, MainViewModel viewmodel) async {

    try{
      await viewmodel.forgotPassword({
        'email' : email
      });


      if (viewmodel.response.status == Status.COMPLETED) {
        showAlertDialog(context, viewmodel.forgotPasswordResponse!.message.toString());
        // Navigator.pop(context);



      }else{
        showAlertDialog(context, 'Mail address not found !');

      }

    }catch(error){
      print(error);
    }

  }
}
