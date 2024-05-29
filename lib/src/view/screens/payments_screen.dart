import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                // Top section with two cards arranged horizontally
                Text(
                  'Available Balance',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16, color: Colors.green,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w700), // Adjust text style
                ),
                SizedBox(height: 30,),



                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => {
                        showAlertDialog(context, 'Under Development')
                      },
                      child: Expanded(
                        child: Card(

                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Icon(Icons.monetization_on_outlined, size: 40.0, color: Colors.green),
                                SizedBox(height: 8.0),
                                Text('Withdraw',),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    ,
                    const SizedBox(width: 16.0), // Add some horizontal space

                    GestureDetector(
                      onTap: () => {
                        showAlertDialog(context, 'Under Development')


                      },
                      child: Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Icon(Icons.account_balance_wallet_outlined, size: 40.0, color: Colors.green),
                                SizedBox(height: 8.0),
                                Text('Payment History'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 16.0), // Add some vertical space

                // Tab bar for Pending & Received
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () => {/* handle Pending tab selection */},
                      child: const Text('Pending'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blue, textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () => {/* handle Received tab selection */},
                      child: const Text('Received'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black, textStyle: const TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),

                // Your content based on the selected tab (replace with your widgets)
                const Text(
                  'Content for the selected tab will be displayed here.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
