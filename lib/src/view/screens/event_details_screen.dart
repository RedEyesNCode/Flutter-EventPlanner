import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eventplanner/src/view/screens/myhome_page.dart';
import 'package:flutter_eventplanner/src/view/screens/update_event_page.dart';
import 'package:flutter_eventplanner/src/view/widgets/NoRecordCard.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class EventsDetailsScreen extends StatefulWidget {
  
  final String eventID;
  
  EventsDetailsScreen({super.key, required this.eventID});

  @override
  _EventsDetailsScreenState createState() => _EventsDetailsScreenState();
}


class _EventsDetailsScreenState extends State<EventsDetailsScreen> {

  var eventDetailsData;


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
                  if (viewmodel.getEventDetailsResponse == null)
                    NoRecordCard(),
                  if (viewmodel.getEventDetailsResponse != null &&
                      viewmodel.getEventDetailsResponse!.data!.eventImageUrl!.isNotEmpty)
                    Column(
                      children: [
                        Container(
                          height: 200,
                          child: PageView.builder(
                            itemCount: viewmodel.getEventDetailsResponse!.data!.eventImageUrl!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1.0),
                                ),
                                child: Image.network(
                                  viewmodel.getEventDetailsResponse!.data!.eventImageUrl![index],
                                  fit: BoxFit.scaleDown,
                                ),
                              );
                            },
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
                                    child: Text(viewmodel.getEventDetailsResponse!.data!.categoryId!.categoriesName.toString(),style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white,fontFamily: 'SFPro',fontSize: 14),)),
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

                                          Column(
                                            children: [
                                              Text(
                                                softWrap: true,

                                                'Start Date : ${viewmodel.getEventDetailsResponse!.data!.startDate.toString()}',

                                                textAlign: TextAlign.start,
                                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal,fontFamily: 'SFPro',color: Colors.white),
                                              ),
                                              Text(
                                                softWrap: true,

                                                'End Date : ${viewmodel.getEventDetailsResponse!.data!.endDate.toString()}',

                                                textAlign: TextAlign.start,
                                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal,fontFamily: 'SFPro',color: Colors.white),
                                              ),
                                            ],
                                          )


                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.type_specimen,size: 25,color: Colors.white,),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:

                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,

                                        children: [
                                          Text(
                                            softWrap: true,

                                            'Event Type : ${viewmodel.getEventDetailsResponse!.data!.eventType.toString()}',

                                            textAlign: TextAlign.start,
                                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal,fontFamily: 'SFPro',color: Colors.white),
                                          ),
                                          Text(
                                            softWrap: true,

                                            'Event Name : ${viewmodel.getEventDetailsResponse!.data!.eventType.toString()}',

                                            textAlign: TextAlign.start,
                                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal,fontFamily: 'SFPro',color: Colors.white),
                                          ),
                                        ],
                                      )


                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,

                                children: [
                                  Icon(Icons.location_on,size: 25,color: Colors.white,),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:

                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,

                                        children: [
                                          Text(
                                            softWrap: true,

                                            'Location : ${viewmodel.getEventDetailsResponse!.data!.locationId!.venueName.toString()}',

                                            textAlign: TextAlign.start,
                                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal,fontFamily: 'SFPro',color: Colors.white),
                                          ),
                                          Text(
                                            softWrap: true,

                                            'Location ID : ${viewmodel.getEventDetailsResponse!.data!.locationId!.sId.toString()}',

                                            textAlign: TextAlign.start,
                                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal,fontFamily: 'SFPro',color: Colors.white),
                                          ),
                                        ],
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
                                        'EVENT STATUS : ${viewmodel.getEventDetailsResponse?.data!.status.toString()}',

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
                        Text(viewmodel.getEventDetailsResponse!.data!.userId!.name.toString(),style: TextStyle(color: Colors.white,fontFamily: 'SFPro',fontSize: 18.0),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 20.0,),


                        GestureDetector(
                          onTap: () async {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Confirm Call'),
                                content: Text('Do you want to call ${viewmodel.getEventDetailsResponse!.data!.userId!.phoneNumber.toString()}?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      final Uri launchUri = Uri(scheme: 'tel', path: viewmodel.getEventDetailsResponse!.data!.userId!.phoneNumber.toString());
                                      if (!await launchUrl(launchUri)) {
                                        throw Exception('Could not launch $launchUri');
                                      }
                                      Navigator.pop(context); // Close dialog after initiating the call
                                    },
                                    child: Text('Call',style: TextStyle(fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w800),),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Container(
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
                        ),

                        SizedBox(width: 20.0,),

                        GestureDetector(

                          onTap: () async {
                            final Uri launchUri = Uri(
                              scheme: 'sms',
                              path: viewmodel.getEventDetailsResponse!.data!.userId!.phoneNumber.toString(), // Replace with the actual phone number (optional)
                              queryParameters: {
                                'body': Uri.encodeComponent('Hello! This is a pre-filled SMS message.'), // Optional message body
                              },
                            );
                            if (!await launchUrl(launchUri)) {
                              throw Exception('Could not launch $launchUri');
                            }
                          },
                          child:  Container(
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

                        )



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
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirm Delete'),
                            content: Text('Are you sure you want to delete this event?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(false), // Dismiss dialog
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  // Call your delete event API here
                                  viewmodel.deleteEvent({
                                    "eventId" : widget.eventID.toString()
                                  });
                                  if(viewmodel.commonResponse!=null){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text('Your Event Was Deleted Successfully !'.toString(),style: TextStyle(fontFamily: 'SFPro',color: Colors.white,fontSize: 21,fontWeight: FontWeight.w800),)),
                                    );
                                    for (int i = 0; i < 3; i++) {
                                      Navigator.pop(context);
                                    }

                                  }
                                  // ...
                                },
                                child: Text('Delete'),
                              ),
                            ],
                          );
                        },
                      );




                    },
                    child:
                    Text(
                      'Delete My Event',
                      style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w700), // Adjust text style
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0,),
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
                    30), // Adjust border radius as needed
              ),
              child: ElevatedButton(
                onPressed: () async {
                  // Api Calling.
                  print('clicked');
                  Navigator.push(

                    context,
                    MaterialPageRoute(builder: (context) => UpdateEventPage(

                      initialData: {
                        "event_name": "",
                        "event_type": "",
                        "start_date": "",
                        "end_date": "",
                        "location_id": "",
                        "description": "",
                        "Status": ""
                      },
                      eventID: widget.eventID,
                    )),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(
                      left: 95.0, right: 95.0, top: 15.0, bottom: 15.0),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // Keep consistent with container
                  ),
                ),
                child: Text(
                  'Update Event Details',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'PlayfairDisplay',
                      fontWeight: FontWeight.w700), // Adjust text style
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
  Future<bool> showBackPressDialog(BuildContext context) async {
    bool confirmExit = false;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Event Deleted !'),
          content: Text('Event Deleted Successfully'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                confirmExit = true;
                for (int i = 0; i < 4; i++) {
                  Navigator.pop(context);
                } // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );

    return confirmExit; // Return true if the user confirmed exit
  }
}
