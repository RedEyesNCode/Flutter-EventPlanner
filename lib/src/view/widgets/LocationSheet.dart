
import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/utils/api_response.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';

class _LocationSheet extends State<LocationSheet>{

  List<String> options = [];
  List<String> locationId = [];


  @override
  void initState() {
    super.initState();
    // Fetch data from API here
    _fetchData(widget.viewModel); // Initiate the API call in the ViewModel
  }
  Future<void> _fetchData(MainViewModel viewModel) async {
    try {
      await viewModel.getAllLocation(); // Call your API function here, assuming it's fetchData


      if (viewModel.response.status == Status.COMPLETED) {
        // Optionally, you can check for completion status or handle data here
        viewModel.allLocationResponse!.date!.forEach((element) {
          options.add(element!.venuename.toString());
          locationId.add(element.id.toString());

        });
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



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainViewModel>(create:(_)=>MainViewModel(),

      child: Consumer<MainViewModel>(
        builder: (context,viewmodel,_){


          return Container(
            padding: EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(options[index],style: TextStyle(fontFamily: 'PlayfairDisplay',color: Colors.black,fontWeight: FontWeight.w500),),
                onTap: () => widget.onItemSelected(options[index],locationId[index]),
              ),
            ),
          );
        },
      ),
    );
  }


}




class LocationSheet extends StatefulWidget {

  final Function(String,String) onItemSelected;
  final MainViewModel viewModel;


  LocationSheet({Key? key, required this.onItemSelected, required this.viewModel})
      : super(key: key);
  @override
  _LocationSheet createState() => _LocationSheet();
}