import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemUpcomingEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      child: Column(
        children: [

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
                          'Event Date',
                          style: TextStyle(fontSize: 12.0,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w300,),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          'Bhopal Music Festival 2024',
                          style: TextStyle(fontSize: 18.0,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w600,),

                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,color: Colors.grey,),

                            Text(
                              'California, USA',

                              style: TextStyle(fontSize: 14.0,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w300,),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            )

        ],
      ),
    );
  }
}
