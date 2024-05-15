import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';

class EventsDetailsScreen extends StatefulWidget {
  
  final String eventID;
  
  EventsDetailsScreen({super.key, required this.eventID});

  @override
  _EventsDetailsScreenState createState() => _EventsDetailsScreenState();
}


class _EventsDetailsScreenState extends State<EventsDetailsScreen> {
  
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    _callEventDetailsApi();
    
  }
  Future<void> _callEventDetailsApi() async {
    print('event-details-screen-id'+widget.eventID);
    print('event-details-screen-id'+widget.eventID);
    print('event-details-screen-id'+widget.eventID);
    print('event-details-screen-id'+widget.eventID);
    Provider.of<MainViewModel>(context, listen: false).getEventDetails(
        {"eventId": widget.eventID});
  }



  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<MainViewModel>(context);
    var eventDetailsData = viewmodel.getEventDetailsResponse?.data;


    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false, // This removes the back arrow
        backgroundColor: Color(0xff6e3e14),

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
            
            Text('Event Details',style: TextStyle(color: Colors.white,fontFamily: 'SFPro',fontSize: 20, fontWeight: FontWeight.w900),),
          ],
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Event Image (You'll need to implement image loading)

            Container(
              color: Colors.brown,
              child: Column(

                children: [

                  if(eventDetailsData!=null)
                    Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(

                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(1.0),
                      image: DecorationImage(

                        image: NetworkImage('https://picsum.photos/400/200'), // Replace with actual image URL
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),

                      Row(
                        children: [
                          SizedBox(height: 10,),
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xff6e3e14),
                                border: Border.all(
                                  color: Color(0xFFFFD144),
                                  width: 2.0, // Adjust border width here
                                ),
                                borderRadius: BorderRadius.circular(20.0), // Adjust curvature
                              ),
                              child: Text('Category Name',style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white,fontFamily: 'SFPro',fontSize: 14),)),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                        child: Row(
                          children: [
                            Icon(Icons.access_time,size: 25,color: Colors.white,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:

                              Text(
                                softWrap: true,
                                'Tuesday-Sunday 10 a.m - 6:30 pm \n(last location 1 hour before close)',

                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,fontFamily: 'SFPro',color: Colors.white),
                              )

                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                        child: Row(
                          children: [
                            Icon(Icons.people,size: 25,color: Colors.white,),
                            Padding(
                                padding: const EdgeInsets.all(1.0),
                                child:

                                Text(
                                  softWrap: true,
                                  'No Suitable for children.',

                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,fontFamily: 'SFPro',color: Colors.white),
                                )

                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                        child: Row(
                          children: [
                            Icon(Icons.panorama_fish_eye,size: 25,color: Colors.white,),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:

                                Text(
                                  softWrap: true,
                                  'Duration 1 Hour',

                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,fontFamily: 'SFPro',color: Colors.white),
                                )

                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                        child: Row(
                          children: [
                            Icon(Icons.currency_rupee_rounded,size: 25,color: Colors.white,),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:

                                Text(
                                  softWrap: true,
                                  '32/person',

                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,fontFamily: 'SFPro',color: Colors.white),
                                )

                            ),
                          ],
                        ),
                      ),


                    ],
                  ),


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
              color: Color(0xff6e3e14),
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
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: Colors.white,fontFamily:  'SFPro'),
                        ),
                        SizedBox(height: 8.0),
                        Text('Ashu',style: TextStyle(color: Colors.white,fontFamily: 'SFPro',fontSize: 18.0),),
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
                Container(
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
                        25), // Adjust border radius as needed
                  ),
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(left: 55.0,right: 55.0,top: 15.0,bottom: 15.0), backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
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
