import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eventplanner/src/view/screens/booking_screen.dart';
import 'package:flutter_eventplanner/src/view/screens/catalogue_screen.dart';
import 'package:flutter_eventplanner/src/view/screens/payments_screen.dart';
import 'package:flutter_eventplanner/src/view/widgets/two_text_card.dart';

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
    CatalogueScreen(),
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
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Booking'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payments'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Catalogue'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Simple placeholder components
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        Text(
          'Bookings',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 16, color: Colors.green,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w700), // Adjust text style
        ),
        SizedBox(height: 20,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,

          children: <Widget>[
            Expanded(  // Wrap each 'TwoTextCard' within an 'Expanded' widget
              child: TwoTextCard(text1: 'Pending', text2: '3577'),
            ),
            Expanded(
              child: TwoTextCard(text1: 'Confirmed', text2: '3577'),
            ),
            Expanded(
              child: TwoTextCard(text1: 'Delivered', text2: '3577'),
            ),
          ],
        ),
        SizedBox(height: 20,),

        Text(
          'Business Overview',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 16, color: Colors.green,fontFamily: 'PlayfairDisplay',fontWeight: FontWeight.w700), // Adjust text style
        ),
        SizedBox(height: 20,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,

          children: <Widget>[
            Expanded(  // Wrap each 'TwoTextCard' within an 'Expanded' widget
              child: TwoTextCard(text1: 'Pending', text2: '3577'),
            ),
            Expanded(
              child: TwoTextCard(text1: 'Confirmed', text2: '3577'),
            ),

          ],
        ),

      ],
    );
  }
}




class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Catalogue'));
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
            child: Text('Event Planner',style: TextStyle(fontWeight: FontWeight.w700,fontFamily: 'PlayfairDisplay',color: Colors.black ),),
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