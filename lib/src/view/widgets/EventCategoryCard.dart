// File: event_category_card.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eventplanner/src/view/screens/event_list_screen.dart';

class EventCategoryCard extends StatelessWidget {
  final String category;

  final String categoryUrl;
  final List<String> subcategories; // List of subcategories




  const EventCategoryCard({super.key, required this.category, required this.categoryUrl,    required this.subcategories});

  @override
  Widget build(BuildContext context) {
    return

      GestureDetector(
        onTap: () => {
        Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) => EventListScreen(categoryName: category),
        ),
        )
        },
        child: Container(
          height: 120,
          margin: EdgeInsets.all(4),
          width: 120,
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
                    padding: const EdgeInsets.all(1.0),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Image.network(
                            categoryUrl, // Placeholder URL
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          category,
                          softWrap: true,

                          style: const TextStyle(

                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SFPro',
                              color: Colors.white

                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),





                    ],
                  ),
                  Expanded(child:
                  PopupMenuButton<String>(
                    iconSize: 25,
                    icon: const Icon(Icons.more_horiz_outlined, color: Colors.white, ),
                    onSelected: (value) {
                      // Handle subcategory selection (e.g., navigate to a new screen)
                      print('Selected subcategory: $value');
                    },
                    itemBuilder: (BuildContext context) {
                      return subcategories.map((String subcategory) {
                        return PopupMenuItem<String>(
                          value: subcategory,
                          child: Text(subcategory, style: TextStyle(color: Colors.black)), // Customize subcategory text style
                        );
                      }).toList();
                    },
                  ),

                  ),
                ],
              ),
            ),
          ),


        ),
      );

  }
}
