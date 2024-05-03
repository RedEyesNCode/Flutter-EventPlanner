import 'package:flutter/material.dart';

class ImageAndTextRow extends StatelessWidget {
  final String text;
  final IconData icon;

  const ImageAndTextRow({super.key, required this.text,required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: Colors.black,),

        const SizedBox(width: 10), // Spacing between image and text
        Text(text,style: TextStyle(color: Colors.black,fontFamily:  'PlayfairDisplay',fontSize: 21, fontWeight: FontWeight.w300),),
      ],
    );
  }
}
