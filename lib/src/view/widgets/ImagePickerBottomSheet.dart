import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/session/SharedPrefManager.dart';
import 'package:flutter_eventplanner/src/utils/api_response.dart';
import 'package:flutter_eventplanner/src/view/widgets/VendorPaymentSheet.dart';
import 'dart:io'; // For File
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/MainViewModel.dart';

class ImagePickerBottomSheet extends StatefulWidget {

  final Map<String,String> imageUploadData;


  const ImagePickerBottomSheet({super.key, required this.imageUploadData});

  @override
  _ImagePickerBottomSheetState createState() => _ImagePickerBottomSheetState();
}

class _ImagePickerBottomSheetState extends State<ImagePickerBottomSheet> {
  File? _imageFile;

  List<File> _imageFiles = []; // List to store selected images
  bool isUserPaid = false;


  // Future<void> _pickImage(ImageSource source) async {
  //   final image = await ImagePicker().pickImage(source: source);
  //   if (image != null) {
  //     setState(() {
  //       _imageFile = File(image.path);
  //     });
  //   }
  // }
  Future<void> _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      if (!mounted) return; // Check if widget is mounted
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkPaymentStatus(Provider.of<MainViewModel>(context,listen: false));


  }
  void _showPaymentSheet(BuildContext context) {

    showModalBottomSheet(
        context: context,
        builder: (context) => const VendorPaymentSheet(

        ));
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



  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<MainViewModel>(context);

    return
      SingleChildScrollView(
        child:
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if(isUserPaid)
                Container(
                  margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.green,
                        width: 3
                      )
                      
                    ),
                    child: Text('Subscription Amount Paid',style: TextStyle(fontFamily: 'SFPro',color: Colors.black,fontWeight: FontWeight.w300,fontSize: 15),)),
              if(!isUserPaid)
                Container(

                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.redAccent,
                            width: 3
                        )

                    ),
                    child: Text('Subscription Amount Pending',style: TextStyle(fontFamily: 'SFPro',color: Colors.black,fontWeight: FontWeight.w300,fontSize: 15),)),

              _imageFiles.isNotEmpty
                  ? Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _imageFiles.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child:


                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                30),
                            child: Image.file(_imageFiles[index]),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,

                          child: Container(
                            height : 45,
                            width  : 45,
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Colors.redAccent,
                                width: 2
                              )
                            ),
                            child: IconButton(

                              icon: Icon(Icons.close, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  _imageFiles.removeAt(index);
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
                  : Container(
                  margin: EdgeInsets.all(10),

                  child: Text('No Image Selected',style: TextStyle(fontFamily: 'SFPro',fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),)),
               // Show image preview (if any)

              Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        final XFile? image =
                        await ImagePicker().pickImage(source: ImageSource.camera);
                        if (image != null) {
                          setState(() {
                            _imageFiles.add(File(image.path));
                          });
                        }
                      },
                      child: const Text('Pick from Camera'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        final List<XFile>? images =
                        await ImagePicker().pickMultiImage();
                        if (images != null) {
                          setState(() {
                            _imageFiles.addAll(images.map((image) => File(image.path)));
                          });
                        }
                      },
                      child: const Text('Pick from Gallery'),
                    ),
                  ),
                  // ... (your existing Upload and Close buttons)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _imageFiles.isNotEmpty
                      ? () {
                    if(isUserPaid){
                      for (var image in _imageFiles) {
                        _handleUploadImage(widget.imageUploadData, context,viewmodel, image);
                      }
                      setState(() {
                        _imageFiles.clear();
                      });
                    }else{
                      _checkPaymentStatus(viewmodel);

                    }

                  }
                      : null, // Disable button if not 2 images
                  child: const Text('Upload Images'),
                ),
              ),

            ],
          ),
        ),
      );
  }

  Future<void> _checkPaymentStatus(MainViewModel viewmodel) async{

    String? sessionUserString = await SharedPrefManager().getString("USER_ID");

    viewmodel.getUserPaymentStatus({
      'userId' : sessionUserString,
    });
    if(viewmodel.userPaymentStatus!.code==200){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('You have already paid ! '),
        backgroundColor: Colors.green,
      ));
      // proceed with uploading the images.
      setState(() {
        isUserPaid = true;

      });

    }else if(viewmodel.userPaymentStatus!.code==400){
      _showPaymentSheet(context);
      setState(() {
        isUserPaid =false;

      });

    }

  }

  Future<void> _handleUploadImage(Map<String, String> imageUploadData, BuildContext context,MainViewModel viewmodel,File imageFile) async {

    String? id = imageUploadData['id'];
    print(id);
    print(imageFile.path.toString());
    String? categoryType = imageUploadData['categoryType'];
    if(categoryType=="VENUE"){
      await viewmodel.uploadVenueImage({
        "venueId" : id,
        "file" : imageFile

      });
    }else if(categoryType=="TRAVEL"){
      await viewmodel.uploadTravel({
        "travelId" : id,
        "file" : imageFile

      });
    }else if(categoryType=="TENTHOUSE"){
      await viewmodel.uploadTentHouseImage({
        "tenthouseId" : id,
        "file" : imageFile

      });
    }else if(categoryType=="PHOTO_VIDEO"){
      await viewmodel.uploadPhotoVideoImage({
        "photoVideoId" : id,
        "file" : imageFile

      });

    }else if(categoryType=="PANDIT"){
      await viewmodel.uploadPanditImage({
        "panditId" : id,
        "file" : imageFile

      });

    }else if(categoryType=="MAKE_UP"){
      await viewmodel.uploadMakeImage({
        "makeupId" : id,
        "file" : imageFile

      });

    }else if(categoryType=="VARMALA"){
      await viewmodel.uploadVarmalaImage({
        "varmalaId" : id,
        "file" : imageFile

      });
    }else if(categoryType=="DECOR"){
      await viewmodel.uploadDecorationImage({
        "decorationId" : id,
        "file" : imageFile

      });
    }else if(categoryType=="CATERING"){

      await viewmodel.uploadCateringImage({
        "cateringId" : id,
        "file" : imageFile

      });
    }else if(categoryType=="WEDDING_DRESS") {
      await viewmodel.uploadWeddingDressImage({
        "weddingDressId": id,
        "file": imageFile
      });
    }else if(categoryType=="BAND"){
      await viewmodel.uploadBandImage({
        "bandId": id,
        "file": imageFile
      });

    }else if(categoryType=="DHOL"){
      await viewmodel.uploadDholImage({
        "dholId": id,
        "file": imageFile
      });
    }else if(categoryType=="ENTERTAINMENT"){
      await viewmodel.uploadEntertainmentImage({
        "entertainmentId": id,
        "file": imageFile
      });
    }else if(categoryType=="DJ_BAND"){
      await viewmodel.uploadDJBandImage({
        "djId": id,
        "file": imageFile
      });
    }else if(categoryType=="HOTEL"){
      await viewmodel.uploadHotelImage({
        "HotelId": id,
        "file": imageFile
      });
    }


    if(viewmodel.response.status == Status.COMPLETED && viewmodel.uploadImageResponse!=null){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(viewmodel.uploadImageResponse!.message.toString())),
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(viewmodel.response.message.toString())),
      );
    }





  }
}

