

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/model/login_response.dart';
import 'package:flutter_eventplanner/src/model/user_events_response.dart';
import 'package:flutter_eventplanner/src/session/SharedPrefManager.dart';
import 'package:flutter_eventplanner/src/utils/api_response.dart';
import 'package:flutter_eventplanner/src/view/widgets/LoadingDialog.dart';
import 'package:flutter_eventplanner/src/view/widgets/NoRecordCard.dart';
import 'package:flutter_eventplanner/src/view/widgets/item_upcoming_event.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';

class EventSearchScreen extends StatefulWidget{



  const EventSearchScreen({super.key});

  @override
  _EventSearchScreen createState() => _EventSearchScreen();



}
class _EventSearchScreen extends State<EventSearchScreen> {


  final _controllerSearch = TextEditingController();

  bool isSearchData = false;
  bool isAllData = true;


  Future<void> _initializeData() async {
    setState(() {
      isSearchData = false;
      isAllData = true;
    });
    String? sessionUserString = await SharedPrefManager().getString("USER_ID");
    String? sessionUserLogin =
    await SharedPrefManager().getString("LOGIN_RESPONSE");
    login_response? userLoginResponse =
    login_response.fromJson(jsonDecode(sessionUserLogin!));

    Provider.of<MainViewModel>(context, listen: false)
        .getUserEvents({"userId": sessionUserString});
  }

  Future<void> _callEventSearchApi(String queryHint) async {
    if (queryHint.isEmpty) {
      _initializeData();
      return;
    }
    setState(() {
      isSearchData = true;
      isAllData = false;
    });

    String? sessionUserString = await SharedPrefManager().getString("USER_ID");
    String? sessionUserLogin =
    await SharedPrefManager().getString("LOGIN_RESPONSE");
    login_response? userLoginResponse =
    login_response.fromJson(jsonDecode(sessionUserLogin!));

    Provider.of<MainViewModel>(context, listen: false).getUserEventsBYName(
        {"userId": sessionUserString, "eventName": queryHint});

    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeData();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<MainViewModel>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF2A190D),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFD553),

        title:         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text('Search your events by name ',style: TextStyle(fontFamily: 'Raleway',fontSize: 15,fontWeight: FontWeight.w900),),

          ],
        ),



      ),
      body:

      SingleChildScrollView(

        child: Column(

          children: [
            SizedBox(height: 20,),
            SizedBox(

              height: 50,

              child: TextField(

                controller: _controllerSearch,
                onChanged: (newText) => {
                  _callEventSearchApi(newText)

                },
                style: TextStyle(fontFamily:   'SFPro',color: Colors.white,fontSize:  17),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),

                  hintText: 'Search Vendor Events',
                  hintStyle: TextStyle(fontFamily:  'SFPro', color: Colors.white),
                  enabledBorder: OutlineInputBorder( // Used when enabled and not focused
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      width: 1,
                      color: Color(0xFFffd553),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          25.0), // Adjust border radius as needed
                      borderSide: BorderSide(
                        width: 2,

                        color: Color(0xFFffd553), // Set border color
                      )),
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(
                        25.0), // Adjust border radius as needed
                    borderSide: BorderSide(
                      width: 2,
                      color: Color(0xFFffd553), // Set border color
                    ),
                  ),
                ),
              ),
            ),


            if(viewmodel.response.status==Status.LOADING)
              const LoadingDialog(),


            if(viewmodel.response.status==Status.COMPLETED && viewmodel.userEventNameSearchResponse!=null && viewmodel.userEventNameSearchResponse?.data!=null)
              Column(
                children: [
                  SizedBox(height: 10,),

                  SizedBox(
                    height: MediaQuery.of(context).size.height, // Full screen height

                    child: ListView.builder(
                      itemCount: viewmodel.userEventNameSearchResponse!.data!.length,
                      itemBuilder: (context, index) {
                        final dataEvent = viewmodel.userEventNameSearchResponse!.data![index];
                        final event = Events(
                          sId: dataEvent.sId.toString(),
                          eventName: dataEvent.eventName.toString(),
                          eventType:  dataEvent.eventType.toString(),
                          startDate: dataEvent.startDate.toString(),
                          endDate: dataEvent.endDate.toString(),
                          locationId: dataEvent.locationId.toString(),
                          description: dataEvent.description.toString(),
                          status:  dataEvent.status.toString(),
                          userId: dataEvent.userId.toString(),
                          categoryId:  dataEvent.categoryId.toString(),
                          createdAt:  dataEvent.createdAt.toString(),
                          updatedAt:  dataEvent.updatedAt.toString(),




                        );
                        return ItemUpcomingEvent(events: event,);
                      },
                    ),
                  ),
                ],
              ),
            if(viewmodel.response.status==Status.COMPLETED && viewmodel.userEventNameSearchResponse==null && viewmodel.userEventNameSearchResponse?.data==null && isAllData==false && _controllerSearch.text.toString().isEmpty)
              Column(
                children: [
                  SizedBox(height: 40,),
                  NoRecordCard(),
                ],
              ),
            if(viewmodel.response.status==Status.COMPLETED && viewmodel.userEventsResponse!=null && viewmodel.userEventsResponse?.data!=null && isAllData==true && viewmodel.userEventsResponse?.data?.events!=null)
              Column(
                children: [
                  SizedBox(height: 10,),

                  SizedBox(
                    height: MediaQuery.of(context).size.height, // Full screen height

                    child: ListView.builder(
                      itemCount: viewmodel.userEventsResponse!.data!.events!.length,
                      itemBuilder: (context, index) {
                        final dataEvent = viewmodel.userEventsResponse!.data!.events![index];
                        final event = Events(
                          sId: dataEvent.sId.toString(),
                          eventName: dataEvent.eventName.toString(),
                          eventType:  dataEvent.eventType.toString(),
                          startDate: dataEvent.startDate.toString(),
                          endDate: dataEvent.endDate.toString(),
                          locationId: dataEvent.locationId.toString(),
                          description: dataEvent.description.toString(),
                          status:  dataEvent.status.toString(),
                          userId: dataEvent.userId.toString(),
                          categoryId:  dataEvent.categoryId.toString(),
                          createdAt:  dataEvent.createdAt.toString(),
                          updatedAt:  dataEvent.updatedAt.toString(),




                        );
                        return ItemUpcomingEvent(events: event,);
                      },
                    ),
                  ),
                ],
              ),

          ],

        ),

      )
      ,


    );


  }


}