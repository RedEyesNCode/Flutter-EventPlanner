import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/model/user_events_response.dart';
import 'package:flutter_eventplanner/src/view/screens/event_details_screen.dart';

class ItemUpcomingEvent extends StatelessWidget {
  final Events events; // Pass image URL from your data

  const ItemUpcomingEvent({
    super.key,
    required this.events
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EventsDetailsScreen(eventID: events.sId.toString(),)),
        );

      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E), // Dark background
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFFFC72C), // Yellow border color
            width: 1.0,  // Border width
          ),
        ),
        child: Row(
          children: [
            // Image
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1E), // Dark background
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFFFC72C), // Yellow border color
                  width: 1.0,  // Border width
                ),
              ),
              child: ClipRRect(
                
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  'https://placeholder.com/120x120', // Placeholder URL
                  width: 120,
                  height: 120,
                  fit: BoxFit.scaleDown,
                  errorBuilder: (context, error, stackTrace) =>
                      Image.network('https://placeholder.com/120x120'), // Error handling
                ),
              ),
            ),
            Expanded( // Make content take available space
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      events.eventName.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SFPro',
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Location
                    Row(
                      children: [
                        const Icon(Icons.description, color: Colors.yellow, size: 16),
                        Text(
                          events.description.toString(),
                          style: const TextStyle(color: Colors.yellow, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Date
                    Row(
                      children: [
                        const Icon(Icons.downloading, color: Colors.yellow, size: 16),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            softWrap: true,
                            events.status.toString(),

                            style: const TextStyle(color: Colors.white,fontFamily: 'SFPro', fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Adult Count and Price

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
