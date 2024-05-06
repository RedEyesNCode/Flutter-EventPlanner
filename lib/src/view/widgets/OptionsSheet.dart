import 'package:flutter/material.dart';

class OptionsSheet extends StatelessWidget {
  final List<String> options;

  final Function(String) onItemSelected;

  OptionsSheet({Key? key, required this.options, required this.onItemSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: options.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(options[index],style: TextStyle(fontFamily: 'PlayfairDisplay',color: Colors.black,fontWeight: FontWeight.w500),),
          onTap: () => onItemSelected(options[index]),
        ),
      ),
    );
  }
}