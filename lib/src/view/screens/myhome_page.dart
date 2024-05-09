import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eventplanner/src/model/login_response.dart';
import 'package:flutter_eventplanner/src/session/SharedPrefManager.dart';
import 'package:flutter_eventplanner/src/utils/api_response.dart';
import 'package:flutter_eventplanner/src/view/screens/booking_screen.dart';
import 'package:flutter_eventplanner/src/view/screens/catalogue_screen.dart';
import 'package:flutter_eventplanner/src/view/screens/payments_screen.dart';
import 'package:flutter_eventplanner/src/view/widgets/image_text_row.dart';
import 'package:flutter_eventplanner/src/view/widgets/item_upcoming_event.dart';
import 'package:flutter_eventplanner/src/view/widgets/two_text_card.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    HomeScreen(),
    BookingScreen(),
    PaymentScreen(),
    CatalogueScreen(initialData: {
      "event_name":"",
      "event_type":"",
      "start_date":"",

      "end_date":"",
      "location_id":"",
      "description":"",
      "Status":""

    },)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Planner'),
      ),
      drawer: NavigationDrawer(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'Booking'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payments'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Catalogue'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget
{
  const HomeScreen({super.key});


  @override
  _HomeScreen createState() => _HomeScreen();


}

// Simple placeholder components
class _HomeScreen extends State<HomeScreen> {

  final _controllerUserName = TextEditingController();


  @override
  void initState() {
    super.initState();
    _initializeData();


  }
  Future<void> _initializeData() async {
    String? sessionUserString = await SharedPrefManager().getString("USER_ID");
    String? sessionUserLogin = await SharedPrefManager().getString("LOGIN_RESPONSE");
    login_response? userLoginResponse = login_response.fromJson(jsonDecode(sessionUserLogin!));
    _controllerUserName.text = userLoginResponse.data.name.toString();


    Provider.of<MainViewModel>(context, listen: false).getUserEvents({
      "userId": sessionUserString
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<MainViewModel>(context);

    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              // Define the direction of the gradient
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // List the colors of the gradient
              colors: [
                Colors.white,
                Colors.white,
              ],
              // Define stops for each color
              stops: [0.0, 1.0],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageAndTextRow(
                    icon: Icons.my_location_outlined, text: 'Welcome Back !'),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Row(
                  children: [
                    Text(_controllerUserName.text,textAlign: TextAlign.start,textDirection: TextDirection.ltr,style: TextStyle(
                      fontSize: 21,
                      fontFamily: 'PlayfairDisplay',
                      fontWeight: FontWeight.w700,
                      color: Colors.black,

                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(

                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(

                        hintText: "Search by event name",
                        hintStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,fontFamily: 'PlayfairDisplay',color: Colors.black),
                        prefixIcon: const Icon(Icons.search,color: Colors.black,),
                        suffixIcon: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8.0), // Adjust as needed
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: const Icon(Icons.filter_list),
                        ),
                        focusedBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(30.0), // Adjust border radius as needed
                            borderSide: BorderSide(
                              color: Colors.grey, // Set border color
                            )
                        ),
                        border: OutlineInputBorder(

                            borderSide: BorderSide(
                                color: Colors.white
                            )
                        )
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                ),

                child: Padding(
                  padding: const EdgeInsets.only(left: 1.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [


                        if(viewmodel.response.status==Status.COMPLETED && viewmodel.userEventsResponse!=null)
                          Column(
                            children: [
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text('Your Events',textAlign: TextAlign.start,textDirection: TextDirection.ltr,style: TextStyle(
                                    fontSize: 21,
                                    fontFamily: 'PlayfairDisplay',
                                    color: Colors.black,

                                  )),
                                ],
                              ),
                              SizedBox(height: 10,),
                              SizedBox(
                                height: 355,
                                child: Expanded( // Expanded to let the list take available space
                                  child: ListView.builder(
                                    itemCount: viewmodel.userEventsResponse!.data?.events!.length,
                                    itemBuilder: (context, index) {
                                      final event = viewmodel.userEventsResponse!.data?.events![index];
                                      return ItemUpcomingEvent(events: event!,);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        //USE SIZED BOX WITH LIST-VIEW BUILDER IF WIDGET IS NOT RENDERING.


                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      );


  }
}



class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.greenAccent),
            child: Text(
              'Event Planner',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'PlayfairDisplay',
                  color: Colors.black),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
