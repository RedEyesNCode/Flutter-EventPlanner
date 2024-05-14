import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eventplanner/src/model/login_response.dart';
import 'package:flutter_eventplanner/src/model/user_events_response.dart';
import 'package:flutter_eventplanner/src/session/SharedPrefManager.dart';
import 'package:flutter_eventplanner/src/utils/api_response.dart';
import 'package:flutter_eventplanner/src/view/screens/booking_screen.dart';
import 'package:flutter_eventplanner/src/view/screens/catalogue_screen.dart';
import 'package:flutter_eventplanner/src/view/screens/payments_screen.dart';
import 'package:flutter_eventplanner/src/view/widgets/CategorySheet.dart';
import 'package:flutter_eventplanner/src/view/widgets/CouponCard.dart';
import 'package:flutter_eventplanner/src/view/widgets/EventCategoryCard.dart';
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
    CatalogueScreen(
      initialData: {
        "event_name": "",
        "event_type": "",
        "start_date": "",
        "end_date": "",
        "location_id": "",
        "description": "",
        "Status": ""
      },
    )
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
        backgroundColor: Color(0xFFFFD553),
        title:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text('Vendor \nOTM',style: TextStyle(fontFamily: 'Raleway',fontSize: 15,fontWeight: FontWeight.w900),),

            Container(
              margin: EdgeInsets.all(5),
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
                style: ElevatedButton.styleFrom(
                  elevation: 5.0,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  // Adjust for desired shadow depth
                ),
                onPressed: () {
                  // Your button's action here
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Keep the button compact
                  children: [
                    Icon(Icons.wallet,color: Colors.white,), // Replace with your icon path
                    SizedBox(
                        width: 8.0), // Add spacing between icon and text
                    Text('Your Wallet',style: TextStyle(color: Colors.white,fontFamily: 'SFPro',fontSize: 15,),),
                  ],
                ),
              ),
            )
          ],
        ),
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreen createState() => _HomeScreen();
}

// Simple placeholder components
class _HomeScreen extends State<HomeScreen> {
  final _controllerUserName = TextEditingController();
  final _controllerSearch = TextEditingController();
  bool isSearchData = false;
  bool isFilterData = true;

  String category_id = "";

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _showCategorySheet(BuildContext context, MainViewModel mainViewModel) {
    showModalBottomSheet(
        context: context,
        builder: (context) => CategorySheet(
              viewModel: mainViewModel,
              onItemSelected: (selectedItem, selectedId) {
                category_id = selectedItem;
                _callEventByCategoryApi();

                Navigator.pop(context);
                setState(() {}); // Trigger rebuild
              },
            ));
  }

  Future<void> _initializeData() async {
    setState(() {
      isSearchData = false;
      isFilterData = false;
    });
    String? sessionUserString = await SharedPrefManager().getString("USER_ID");
    String? sessionUserLogin =
        await SharedPrefManager().getString("LOGIN_RESPONSE");
    login_response? userLoginResponse =
        login_response.fromJson(jsonDecode(sessionUserLogin!));
    _controllerUserName.text = userLoginResponse.data.name.toString();

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
      isFilterData = false;
    });

    String? sessionUserString = await SharedPrefManager().getString("USER_ID");
    String? sessionUserLogin =
        await SharedPrefManager().getString("LOGIN_RESPONSE");
    login_response? userLoginResponse =
        login_response.fromJson(jsonDecode(sessionUserLogin!));
    _controllerUserName.text = userLoginResponse.data.name.toString();

    Provider.of<MainViewModel>(context, listen: false).getUserEventsBYName(
        {"userId": sessionUserString, "eventName": queryHint});
  }

  Future<void> _callEventByCategoryApi() async {
    setState(() {
      isSearchData = false;
      isFilterData = true;
    });

    String? sessionUserString = await SharedPrefManager().getString("USER_ID");
    String? sessionUserLogin =
        await SharedPrefManager().getString("LOGIN_RESPONSE");
    login_response? userLoginResponse =
        login_response.fromJson(jsonDecode(sessionUserLogin!));
    _controllerUserName.text = userLoginResponse.data.name.toString();

    Provider.of<MainViewModel>(context, listen: false).getUserEventsBYCateogry(
        {"userId": sessionUserString, "categoryName": category_id});
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<MainViewModel>(context);

    return Scaffold(
      backgroundColor: Color(0xFF2A190D),
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),


          SizedBox(
            height: 50,

            child: TextField(

              controller: _controllerSearch,
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

          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.only(left: 1.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: EventCategoryCard(
                        category: 'VENUE',
                        categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/VENUE-removebg-preview.png',
                      ),
                    ),
                    Expanded(
                      child: EventCategoryCard(
                        category: 'DJ',
                        categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/dj.png',
                      ),
                    ),
                    Expanded(
                      child: EventCategoryCard(
                        category: 'Decor',
                        categoryUrl:
                        'https://onetouchmoments.co.in/wp-content/uploads/2024/05/wedding-arch.png',
                      ),
                    ),
                    Expanded(
                      child: EventCategoryCard(
                        category: 'Catering',
                        categoryUrl:
                        'https://onetouchmoments.co.in/wp-content/uploads/2024/05/food-cart.png',
                      ),
                    )

                    //USE SIZED BOX WITH LIST-VIEW BUILDER IF WIDGET IS NOT RENDERING.
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.only(left: 1.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: EventCategoryCard(
                            category: 'Tent\nhouse',
                            categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/tent.png',
                          ),
                        ),
                        Expanded(
                          child: EventCategoryCard(
                            category: 'Photo\nVideo',
                            categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/multimedia.png',
                          ),
                        ),
                        Expanded(
                          child: EventCategoryCard(
                            category: 'Makeup',
                            categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/makeup-cosmetics-palette-brushes-white-background.png',
                          ),
                        ),
                        Expanded(
                          child: EventCategoryCard(
                            category: 'Travel',
                            categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/truck-e1714674238616.png',
                          ),
                        ),


                        //USE SIZED BOX WITH LIST-VIEW BUILDER IF WIDGET IS NOT RENDERING.
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: EventCategoryCard(
                            category: 'Varmala',
                            categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/newlyweds.png',
                          ),
                        ),
                        Expanded(
                          child: EventCategoryCard(
                            category: 'Pandit',
                            categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/hindu.png',
                          ),
                        ),
                        Expanded(
                          child: EventCategoryCard(
                            category: 'Wedding\nDress',
                            categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/28807096_JEMA_GER_1454-01-removebg-preview.png',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: EventCategoryCard(
                            category: 'Entertainment',
                            categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/popcorn.png',
                          ),
                        ),
                        Expanded(
                          child: EventCategoryCard(
                            category: 'Dhol',
                            categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/drum.png',
                          ),
                        ),
                        Expanded(
                          child: EventCategoryCard(
                            category: 'Band',
                            categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/parade-e1714669744336.png',
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    ));
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
