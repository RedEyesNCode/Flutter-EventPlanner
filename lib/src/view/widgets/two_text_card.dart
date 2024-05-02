import 'package:flutter/material.dart';

class TwoTextCard extends StatelessWidget {
  final String text1;
  final String text2;

  const TwoTextCard({required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Adjust border radius as desired
        side: BorderSide(
          color: Colors.blue,
          width: 2.0, // Adjust border width as desired
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(text1,style: TextStyle(fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w400,fontSize: 15),),
            Text(text2,style: TextStyle(fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w900,fontSize: 11),),
          ],
        ),
      ),
    );
  }
}
