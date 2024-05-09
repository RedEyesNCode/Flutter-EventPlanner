
import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/utils/api_response.dart';
import 'package:flutter_eventplanner/src/viewmodel/MainViewModel.dart';
import 'package:provider/provider.dart';

class _CategorySheet extends State<CategorySheet>{

  List<String> options = [];
  List<String> categoryId = [];


  @override
  void initState() {
    super.initState();
    // Fetch data from API here
    _fetchData(widget.viewModel); // Initiate the API call in the ViewModel
  }
  Future<void> _fetchData(MainViewModel viewModel) async {
    try {
      await viewModel.getAllEventCategories(); // Call your API function here, assuming it's fetchData


      if (viewModel.response.status == Status.COMPLETED) {
        // Optionally, you can check for completion status or handle data here
        viewModel.getAllCategoriesResponse!.data!.forEach((element) {
          options.add(element.categoriesName.toString());
          categoryId.add(element.sId.toString());

        });
        setState(() {});

      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(viewModel.getAllCategoriesResponse!.message.toString())),
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
                onTap: () => widget.onItemSelected(options[index],categoryId[index]),
              ),
            ),
          );
        },
      ),
    );
  }


}




class CategorySheet extends StatefulWidget {

  final Function(String,String) onItemSelected;
  final MainViewModel viewModel;


  CategorySheet({Key? key, required this.onItemSelected, required this.viewModel})
      : super(key: key);
  @override
  _CategorySheet createState() => _CategorySheet();
}