

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorProfileScreen extends StatefulWidget {

  const VendorProfileScreen({super.key});

  @override
  _VendorProfileScreen createState() => _VendorProfileScreen();


}
class  _VendorProfileScreen extends State<VendorProfileScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        automaticallyImplyLeading: true,

        title: Text('My Profile',style: TextStyle(fontFamily: 'SFPro',fontWeight: FontWeight.w600,color: Colors.white),),
      ),
      body: SingleChildScrollView( // Allow scrolling for longer profiles
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Profile Image
            Container(
              width: 120,
              height: 120,
              decoration:
              BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Colors.brown,
                  width: 5
                )
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      30), // Adjust the value to change the amount of circularity
                  child: Image.asset(
                      'lib/src/images/ic_app_logo_red.png')),
            ),
            SizedBox(height: 16), // Add spacing

            // User Name
            Text(
              'One Touch Moments',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),

            // Email or Additional Info
            Text(
              'vendor_email_address@email.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 24), // More spacing

            // Profile Details (Cards/Tiles)
            _buildProfileDetail('Location', 'City, Country'),
            _buildProfileDetail('Phone', '+1 123-456-7890'),
            _buildProfileDetail('Bio', 'A short description about yourself.'),

            // Edit Profile Button (Optional)
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(colors: [
                    Color(0xFFFFD144),
                    Color(0xff6e3e14),

                  ])
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  textStyle: TextStyle(color: Colors.white)

                ),
                onPressed: () {
                  // Navigate to edit profile screen


                },
                child: Text('Edit Profile',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 21,fontFamily: 'SFPro',color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Helper function to create detail tiles
  Widget _buildProfileDetail(String label, String value) {
    return Container(

      child: Card(

        margin: EdgeInsets.symmetric(vertical: 8),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(colors: [
                  Color(0xFFFFD144),
                  Color(0xff6e3e14),

                ])
            ),
          child: ListTile(
            title: Text(label,style: TextStyle(fontFamily: 'SFPro',fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),),
            subtitle: Text(value,style: TextStyle(fontFamily: 'SFPro',fontSize: 14,color: Colors.black,fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }



}