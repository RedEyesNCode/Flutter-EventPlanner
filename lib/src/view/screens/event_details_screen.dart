import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventsDetailsScreen extends StatefulWidget {
  @override
  _EventsDetailsScreenState createState() => _EventsDetailsScreenState();
}

class _EventsDetailsScreenState extends State<EventsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false, // This removes the back arrow
        backgroundColor: Colors.redAccent,

        title:


        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Material( // Use Material for ink splash effect
                color: Colors.transparent, // Make background transparent
                child: InkWell(
                  onTap: () => {
                    Navigator.pop(context)


                  },
                  child: Container( // Use Container for padding
                    padding: EdgeInsets.all(10.0), // Adjust padding as desired
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white, // Example: Set icon color to white
                    ),
                  ),
                ),
              ),
            ),
            Text('Event Details',style: TextStyle(color: Colors.white,fontFamily: 'PlayfairDisplay',fontSize: 20, fontWeight: FontWeight.w900),),
          ],
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Event Image (You'll need to implement image loading)

            Card(
              color: Colors.grey.shade200,
              margin: EdgeInsets.all(10.0),
              child: Column(

                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(

                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(25.0),
                        image: DecorationImage(

                          image: NetworkImage('https://picsum.photos/400/200'), // Replace with actual image URL
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                        child: Text(
                          'Event Name',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,fontFamily: 'PlayfairDisplay'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                        child: Text(
                          'Event Price',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        ),
                      ),

                    ],
                  ),

                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Card(
                        margin: EdgeInsets.all(16.0), // Example: 16 pixels on all sides
                        color: Colors.white,
                        child:
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Expanded(child:
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Date',
                                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                      'Oct 20, 2022',
                                      style: TextStyle(fontSize: 16.0,fontFamily: 'PlayfairDisplay'),
                                    ),
                                  ],
                                ),
                              )
                              ),

                              Expanded(child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Location',
                                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                      'New York, USA',
                                      style: TextStyle(fontSize: 16.0,fontFamily: 'PlayfairDisplay'),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),

                      ),
                    ),
                  )
                  ,
                ],
              ),

            )
            ,
            // Event Title

            // Divider
            Divider(
              height: 16.0,
              thickness: 1.0,
            ),
            // About this Event

            Card(
              margin: EdgeInsets.all(20.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(

                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(25.0),
                        image: DecorationImage(

                          image: NetworkImage('https://picsum.photos/400/200'), // Replace with actual image URL
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Column(
                      children: [
                        Text(
                          'Organizer',
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text('Ashu',style: TextStyle(color: Colors.black,fontFamily: 'PlayfairDisplay',fontSize: 18.0),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 20.0,),
                        Container(
                          height: 50.0,
                          width: 50.0,
                          child: Icon(
                            Icons.call,
                            color: Colors.green, // Example: Set icon color to white
                          ),
                          decoration: BoxDecoration(

                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0),

                          ),
                        ),
                        SizedBox(width: 20.0,),

                        Container(
                          height: 50.0,
                          width: 50.0,
                          child: Icon(
                            Icons.message,
                            color: Colors.green, // Example: Set icon color to white
                          ),
                          decoration: BoxDecoration(

                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0),

                          ),
                        ),


                      ],
                    )


                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: Text(
                'About this Event',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,fontFamily: 'PlayfairDisplay'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
              child: Text(
                'Event Description', // Placeholder text
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            // (Continued in next response)
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(left: 55.0,right: 55.0,top: 15.0,bottom: 15.0), backgroundColor: Colors.redAccent,
                    shadowColor: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Keep consistent with container
                    ),
                  ),
                  onPressed: () { print('Hii'); },
                  child:
                  Text(
                    'Delete My Event',
                    style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w700), // Adjust text style
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0,)


          ],
        ),
      ),
    );
  }
}
