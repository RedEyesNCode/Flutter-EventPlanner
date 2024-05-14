// File: event_category_card.dart

import 'package:flutter/material.dart';

class EventCategoryCard extends StatelessWidget {
  final String category;

  final String categoryUrl;


  const EventCategoryCard({super.key, required this.category, required this.categoryUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Card(
        elevation: 2,
        color: Colors.greenAccent.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
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

                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Raleway',
                  color: Colors.black

                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
