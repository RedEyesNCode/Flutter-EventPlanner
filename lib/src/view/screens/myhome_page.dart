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
import 'package:flutter_eventplanner/src/view/screens/event_search_screen.dart';
import 'package:flutter_eventplanner/src/view/screens/login_screen.dart';
import 'package:flutter_eventplanner/src/view/screens/payments_screen.dart';
import 'package:flutter_eventplanner/src/view/screens/vendor_profile_screen.dart';
import 'package:flutter_eventplanner/src/view/widgets/CategorySheet.dart';
import 'package:flutter_eventplanner/src/view/widgets/CouponCard.dart';
import 'package:flutter_eventplanner/src/view/widgets/EventCategoryCard.dart';
import 'package:flutter_eventplanner/src/view/widgets/image_text_row.dart';
import 'package:flutter_eventplanner/src/view/widgets/item_upcoming_event.dart';
import 'package:flutter_eventplanner/src/view/widgets/two_text_card.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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

            // Container(
            //   margin: EdgeInsets.all(5),
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: [
            //         Color(0xFFFFD144),
            //         Color(0xff6e3e14),
            //       ],
            //       begin: Alignment.topCenter,
            //       end: Alignment.bottomCenter,
            //     ),
            //     borderRadius: BorderRadius.circular(
            //         30), // Adjust border radius as needed
            //   ),
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       elevation: 5.0,
            //       backgroundColor: Colors.transparent,
            //       shadowColor: Colors.transparent,
            //       // Adjust for desired shadow depth
            //     ),
            //     onPressed: () {
            //       // Your button's action here
            //     },
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min, // Keep the button compact
            //       children: [
            //         Icon(Icons.wallet,color: Colors.white,), // Replace with your icon path
            //         SizedBox(
            //             width: 8.0), // Add spacing between icon and text
            //         Text('Your Wallet',style: TextStyle(color: Colors.white,fontFamily: 'SFPro',fontSize: 15,),),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
      drawer: NavigationDrawer(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff6e3e14),
        selectedItemColor: Color(0xff6e3e14),
        unselectedItemColor: Colors.black,
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
  final Uri _url = Uri.parse('https://onetouchmoments.co.in/privacy-policy/'); // Replace with your URL


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
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventSearchScreen()),
                )

              },
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
                        subcategories: ['Garden ','Banquet','Hall','Resort','Farmhouse'],

                        categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/VENUE-removebg-preview.png',
                      ),
                    ),
                    Expanded(
                      child: EventCategoryCard(
                        category: 'DJ',
                        subcategories: ['Mobile DJ ','Show DJ','Floor Show'],

                        categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/dj.png',
                      ),
                    ),
                    Expanded(
                      child: EventCategoryCard(
                        category: 'DECORATION',
                        subcategories: ['Ballon Decoration','Flower Decoration','Theme Decoration'],

                        categoryUrl:
                        'https://onetouchmoments.co.in/wp-content/uploads/2024/05/wedding-arch.png',
                      ),
                    ),


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
                            category: 'TRAVEL',
                            subcategories: ['Passenger Vehicle', 'Loading Vehicle'],
                            categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/truck-e1714674238616.png',
                          ),
                        ),
                        Expanded(
                          child: EventCategoryCard(
                            category: 'CATERING',
                            subcategories: ['PureVeg', 'NonVeg','Jain Food without garlic onion'],

                            categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/food-cart.png',
                          ),
                        ),
                        Expanded(
                          child: EventCategoryCard(
                            category: 'VARMALA-ENTRY',
                            subcategories: ['VARMALA-STAGE','VARMALA-THEME'],

                            categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/newlyweds.png',
                          ),
                        ),

                        //USE SIZED BOX WITH LIST-VIEW BUILDER IF WIDGET IS NOT RENDERING.
                      ],
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: EventCategoryCard(
                            category: 'TENTHOUSE',
                            subcategories: ['Pandal','Crockery','Cooler','Carpet','Cooler Fans','Carpets Mets','Chair & Sofa','Tables'],

                            categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/tent.png',
                          ),
                        ),
                        Expanded(
                          child: EventCategoryCard(
                            category: 'PHOTO-VIDEO',
                            subcategories: ['Pre Wedding Shoot','Wedding Shoot','Shoot All Purpose'],

                            categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/multimedia.png',
                          ),
                        ),

                        Expanded(
                          child: EventCategoryCard(
                            category: 'MAKEUP',
                            subcategories: ['Beauty Health Style'],

                            categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/makeup-cosmetics-palette-brushes-white-background.png',
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [

                        Expanded(
                          child: EventCategoryCard(
                            category: 'HOTEL',
                            subcategories: ['Resorts','Hotels','Apartments','Halls'],

                            categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/dj.png',
                          ),
                        ),

                        Expanded(
                          child: EventCategoryCard(
                            category: 'PANDIT',
                            subcategories: ['Expericened Pandit','Pandit for all Purpose'],

                            categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/hindu.png',
                          ),
                        ),
                        Expanded(
                          child: EventCategoryCard(
                            category: 'WEDDING DRESS',
                            subcategories: ['LadkeWale','LadkiWale','Bridal','Groom'],

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
                            category: 'ENTERTAINMENT',
                            subcategories: ['Dancers','Singers','Band','DJ'],

                            categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/popcorn.png',
                          ),
                        ),
                        Expanded(
                          child: EventCategoryCard(
                            category: 'DHOL',
                            subcategories: ['Punjabi Dhol','Nashik Dhol','Local Dhol','Tasse'],

                            categoryUrl:
                            'https://onetouchmoments.co.in/wp-content/uploads/2024/05/drum.png',
                          ),
                        ),
                        Expanded(
                          child: EventCategoryCard(
                            category: 'BAND',
                            subcategories: ['Horse & Baggi','Baarat'],

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
Future<bool?> showConfirmationDialog(BuildContext context, String title, String content) async {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              )
            },
            child: Text('Confirm'),
          ),
        ],
      );
    },
  );
}
void showAlertDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      // Changed context to dialogContext
      return AlertDialog(
        title: Text("Info",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'PlayfairDisplay',
              fontWeight: FontWeight.w400,
              fontSize: 18,
            )),
        content: Text(message,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'PlayfairDisplay',
              fontWeight: FontWeight.w400,
              fontSize: 18,
            )),
        actions: [
          TextButton(
            child: Text(
              "OK",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            onPressed: () {
              Navigator.of(dialogContext).pop(); // Use the dialogContext here
            },
          ),
        ],
      );
    },
  );
}

class NavigationDrawer extends StatelessWidget {
  final Uri _url = Uri.parse('https://onetouchmoments.co.in/privacy-policy/'); // Replace with your URL

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(gradient: LinearGradient(
          colors: [
            Color(0xFFFFD144),
            Color(0xff6e3e14),
            Colors.black,
          ])

            ),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.brown,
                  width: 2,
                )

              ),
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(
                          30), // Adjust the value to change the amount of circularity
                      child: Image.asset(
                        width: 70,
                          height: 70,
                          'lib/src/images/ic_app_logo_red.png')),
                  Text(
                    'One Touch Moments Vendor',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'SFPro',
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFFFFD144),
                    Color(0xff6e3e14),
                  ]
              ),
              borderRadius: BorderRadius.circular(8),
                border: Border.all(
                color: Colors.black,
                width: 1,
              )
              
            ),
            child: ListTile(
              onTap: () => {
                showAlertDialog(context, 'Under-Development (After Customer App Release)')
                
              },
              leading: Icon(Icons.airplane_ticket_outlined,color: Colors.white,),
              title: Text('Bookings',style: TextStyle(fontSize: 18,fontFamily: 'SFPro',color: Colors.white,fontWeight: FontWeight.w600),),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFD144),
                      Color(0xff6e3e14),
                    ]
                ),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                )

            ),
            child: ListTile(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VendorProfileScreen()),
                )
              },
              leading: Icon(Icons.account_circle,color: Colors.white,),
              title: Text('Profile',style: TextStyle(fontSize: 18,fontFamily: 'SFPro',color: Colors.white,fontWeight: FontWeight.w600),),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFD144),
                      Color(0xff6e3e14),
                    ]
                ),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                )

            ),
            child: ListTile(
              onTap: () => {
                showAlertDialog(context, 'Under-Development (After Customer App Release)')

              },
              leading: Icon(Icons.account_balance_wallet,color: Colors.white,),
              title: Text('Payments',style: TextStyle(fontSize: 18,fontFamily: 'SFPro',color: Colors.white,fontWeight: FontWeight.w600),),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFD144),
                      Color(0xff6e3e14),
                    ]
                ),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                )

            ),
            child: ListTile(
              onTap: () => {
                showAlertDialog(context, 'Under-Development (Provide design or url)')
                
              },
              leading: Icon(Icons.live_help_sharp,color: Colors.white,),
              title: Text('Help',style: TextStyle(fontSize: 18,fontFamily: 'SFPro',color: Colors.white,fontWeight: FontWeight.w600),),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFD144),
                      Color(0xff6e3e14),
                    ]
                ),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                )

            ),
            child: ListTile(
              onTap: () => {
                _launchUrl()
              },
              leading: Icon(Icons.privacy_tip_rounded,color: Colors.white,),
              title: Text('Privacy Policy',style: TextStyle(fontSize: 18,fontFamily: 'SFPro',color: Colors.white,fontWeight: FontWeight.w600),),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFD144),
                      Color(0xff6e3e14),
                    ]
                ),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                )

            ),
            child: ListTile(
              onTap: () => {
                launchUrl('https://onetouchmoments.co.in/privacy-policy/' as Uri)

              },
              leading: Icon(Icons.document_scanner_sharp,color: Colors.white,),
              title: Text('Terms & Conditions',style: TextStyle(fontSize: 18,fontFamily: 'SFPro',color: Colors.white,fontWeight: FontWeight.w600),),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFD144),
                      Color(0xff6e3e14),
                    ]
                ),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                )

            ),
            child: ListTile(
              onTap: () => {

                showConfirmationDialog(context, 'Info', 'Are you sure you want to logout ?')

              },
              leading: Icon(Icons.logout_sharp,color: Colors.white,),
              title: Text('Logout',style: TextStyle(fontSize: 18,fontFamily: 'SFPro',color: Colors.white,fontWeight: FontWeight.w600),),
            ),
          ),

        ],
      ),
    );
  }
}
