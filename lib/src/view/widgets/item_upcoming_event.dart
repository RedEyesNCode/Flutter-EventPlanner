import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/model/user_events_response.dart';

class ItemUpcomingEvent extends StatelessWidget {



  const ItemUpcomingEvent({super.key, required this.events});

  final  Events events;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return

          Container(

            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(25.0),
            ),



            child:  Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child:
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.network(
                          'https://img2.sangam.com/assets/home/HomePage_Default_Final.webp',
                          fit: BoxFit.cover,

                          height: 70,
                          width: 70,// Adjust the height of the image as needed
                        ),
                      )


                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        'Created At : ${events.createdAt.toString()}',
                        style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w300,),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Event Name : ${events.eventName.toString()}",
                        style: TextStyle(fontSize: 18.0,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w600,),

                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined,color: Colors.grey,),

                          Text(
                            "Event Description : ${events!.description.toString()}",

                            style: TextStyle(fontSize: 14.0,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w300,),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
