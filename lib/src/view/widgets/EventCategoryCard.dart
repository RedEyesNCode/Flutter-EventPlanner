// File: event_category_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/view/screens/event_list_screen.dart';

class EventCategoryCard extends StatelessWidget {
  final String category;

  final String categoryUrl;


  const EventCategoryCard({super.key, required this.category, required this.categoryUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      margin: EdgeInsets.all(4),
      width: 115,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFFD144),
            Color(0xff6e3e14),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(
            10), // Adjust border radius as needed
      ),

      child:
      GestureDetector(
        onTap: () => {

        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EventListScreen(categoryName: category,)),
        )

        },
        child: Container(
          color: Colors.transparent,


          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 2.0,
                  child: Image.network(
                    categoryUrl, // Placeholder URL
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  category,
                  softWrap: true,

                  style: const TextStyle(

                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SFPro',
                      color: Colors.white

                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),


    );
  }
}
