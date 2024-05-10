import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/utils/api_response.dart';
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
              Card(
                child: ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Pick from Camera'),
                  onTap: () {
                    _pickImage(ImageSource.camera);
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Pick from Gallery'),
                  onTap: () {
                    _pickImage(ImageSource.gallery);
                  },
                ),
              ),
              _imageFile != null
                  ? Container(
    height: 200,

    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10.0)
    ),
    child: Image.file(_imageFile!))
                  :  Text('No Image Selected'),
               // Show image preview (if any)
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle what to do with the selected image
                        _handleUploadImage(widget.imageUploadData,viewmodel);
                      },
                      child: const Text('Upload Image'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle what to do with the selected image
                        Navigator.pop(context);

                      },
                      child: const Text('Close Sheet'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }

  Future<void> _handleUploadImage(Map<String, String> imageUploadData, MainViewModel viewmodel) async {

    String? id = imageUploadData['id'];
    print(id);
    print(_imageFile?.path.toString());
    String? categoryType = imageUploadData['categoryType'];
    if(categoryType=="VENUE"){
      await viewmodel.uploadVenueImage({
        "venueId" : id,
        "file" : _imageFile!

      });
    }else if(categoryType=="TRAVEL"){
      await viewmodel.uploadTravel({
        "travelId" : id,
        "file" : _imageFile!

      });
    }else if(categoryType=="TENTHOUSE"){
      await viewmodel.uploadTentHouseImage({
        "tenthouseId" : id,
        "file" : _imageFile!

      });
    }else if(categoryType=="PHOTO_VIDEO"){
      await viewmodel.uploadPhotoVideoImage({
        "photoVideoId" : id,
        "file" : _imageFile!

      });

    }else if(categoryType=="PANDIT"){
      await viewmodel.uploadPanditImage({
        "panditId" : id,
        "file" : _imageFile!

      });

    }else if(categoryType=="MAKE_UP"){
      await viewmodel.uploadMakeImage({
        "makeupId" : id,
        "file" : _imageFile!

      });

    }else if(categoryType=="VARMALA"){
      await viewmodel.uploadVarmalaImage({
        "varmalaId" : id,
        "file" : _imageFile!

      });
    }else if(categoryType=="DECOR"){
      await viewmodel.uploadDecorationImage({
        "decorationId" : id,
        "file" : _imageFile!

      });
    }else if(categoryType=="CATERING"){

      await viewmodel.uploadCateringImage({
        "cateringId" : id,
        "file" : _imageFile!

      });
    }else if(categoryType=="WEDDING_DRESS") {
      await viewmodel.uploadWeddingDressImage({
        "weddingDressId": id,
        "file": _imageFile!
      });
    }
    if(viewmodel.response.status == Status.COMPLETED && viewmodel.uploadImageResponse!=null){
      showAlertDialog(context, viewmodel.uploadImageResponse!.message.toString());
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(viewmodel.response.message.toString())),
      );
    }





  }
}

