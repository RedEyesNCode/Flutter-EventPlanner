import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/model/login_response.dart';
import 'package:flutter_eventplanner/src/model/user_events_response.dart';
import 'package:flutter_eventplanner/src/session/SharedPrefManager.dart';
import 'package:flutter_eventplanner/src/utils/api_response.dart';
import 'package:flutter_eventplanner/src/view/widgets/CategorySheet.dart';
import 'package:flutter_eventplanner/src/view/widgets/NoRecordCard.dart';
import 'package:flutter_eventplanner/src/view/widgets/item_upcoming_event.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';


class EventListScreen extends StatefulWidget {

  final String categoryName;

  const EventListScreen({super.key, required this.categoryName});

  @override
  _EventListScreen createState() => _EventListScreen();

}
class _EventListScreen extends State<EventListScreen>{

   List<String> options = [];
   List<String> venueId = [];

   String category_id="";



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



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData(
        Provider.of<MainViewModel>(context, listen: false));

  }

  Future<void> _fetchData(MainViewModel viewModel) async {
    try {
      await viewModel.getAllEventCategories(); // Call your API function here, assuming it's fetchData


      if (viewModel.response.status == Status.COMPLETED) {
        // Optionally, you can check for completion status or handle data here
        viewModel.getAllCategoriesResponse!.data!.forEach((element) {
          options.add(element!.categoriesName.toString());
          venueId.add(element.sId.toString());

        });
        for (var i = 0; i < options.length; i++) {
          if(options[i].contains(widget.categoryName)){
            category_id = widget.categoryName;
            category_id = options[i];
            print('CURRENT CATEGORY ID '+category_id);
            break;
          }
        }

        // call the get event by category api.
        _callEventByCategoryApi();



        setState(() {});

      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(viewModel.allLocationResponse!.message.toString())),
        );
      }
    } catch (e) {
      // Handle error
      print("Error fetching data: $e");
      // Optionally, you can show an error message or handle it according to your app's logic
    }
  }
  Future<void> _callEventByCategoryApi() async {


     String? sessionUserString = await SharedPrefManager().getString("USER_ID");
     String? sessionUserLogin =
     await SharedPrefManager().getString("LOGIN_RESPONSE");
     login_response? userLoginResponse =
     login_response.fromJson(jsonDecode(sessionUserLogin!));

     Provider.of<MainViewModel>(context, listen: false).getUserEventsBYCateogry(
         {"userId": sessionUserString, "categoryName": category_id});
  }



   @override
  Widget build(BuildContext context) {
     final viewmodel = Provider.of<MainViewModel>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF2A190D),

      appBar:

      AppBar(

        backgroundColor: Color(0xFFFFD553),

        title:         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text('Events for ',style: TextStyle(fontFamily: 'Raleway',fontSize: 15,fontWeight: FontWeight.w900),),

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
                  _showCategorySheet(context, viewmodel);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Keep the button compact
                  children: [
                    Icon(Icons.category,color: Colors.white,), // Replace with your icon path
                    SizedBox(
                        width: 8.0), // Add spacing between icon and text
                    Text(category_id,style: TextStyle(color: Colors.white,fontFamily: 'SFPro',fontSize: 15,),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body:
      SingleChildScrollView(

        child: Column(

          children: [


            if(viewmodel.response.status==Status.COMPLETED && viewmodel.userEventByCategoryResponse!=null && viewmodel.userEventByCategoryResponse?.data!=null)
              Column(
                children: [
                  SizedBox(height: 10,),

                  SizedBox(
                    height: MediaQuery.of(context).size.height, // Full screen height

                    child: ListView.builder(
                      itemCount: viewmodel.userEventByCategoryResponse!.data!.length,
                      itemBuilder: (context, index) {
                        final dataEvent = viewmodel.userEventByCategoryResponse!.data![index];
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
                          eventImageUrl: dataEvent.eventImageUrl




                        );
                        return ItemUpcomingEvent(events: event,);
                      },
                    ),
                  ),
                ],
              ),
            // if(viewmodel.response.status==Status.COMPLETED && viewmodel.userEventByCategoryResponse==null || viewmodel.userEventByCategoryResponse?.data==null)
            //   Column(
            //     children: [
            //       SizedBox(height: 40,),
            //       NoRecordCard(),
            //     ],
            //   )
          ],

        ),

      )

      ,



    );

  }

}