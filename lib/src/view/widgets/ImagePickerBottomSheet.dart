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
                  ? Image.file(_imageFile!)
                  : const SizedBox.shrink(), // Show image preview (if any)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle what to do with the selected image
                    _handleUploadImage(widget.imageUploadData,viewmodel);
                  },
                  child: const Text('Done'),
                ),
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
}

