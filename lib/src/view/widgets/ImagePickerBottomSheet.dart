import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_band.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_catering.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_decoration.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_dhol.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_djband.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_entertainment.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_hotel.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_makeup.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_pandit.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_photovideo.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_tenthouse.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_travel.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_varmala.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_venue.dart';
import 'package:flutter_eventplanner/src/model/body/body_create_weddingdress.dart';
import 'package:flutter_eventplanner/src/model/body_create_event.dart';
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
                      if(_imageFiles.isNotEmpty){
                        _handleUploadImage(widget.imageUploadData, context,viewmodel, _imageFiles);

                      }


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

  Future<void> _handleUploadImage(Map<String, String> imageUploadData, BuildContext context,MainViewModel viewmodel, List<File> imageFiles) async {

    String? id = imageUploadData['id'];
    print(id);
    String? categoryType = imageUploadData['categoryType'];
    if(categoryType=="VENUE"){

      await _createCategoryEvent(viewmodel);

      if(viewmodel.createEventResponse?.data!=null){
        // 2. call the create-pandit-api
        await _createEventVenue(viewmodel);

        if(viewmodel.createEventVenueResponse?.data!=null){
          // 3. call the upload image api finally
          await viewmodel.uploadVenueImage({
            "venueId" :  viewmodel.createEventVenueResponse?.data!.sId.toString(),
            "file" : imageFiles[0]

          });


        }
      }

    }else if(categoryType=="TRAVEL"){
      // 1. create event first
      await _createCategoryEvent(viewmodel);

      if(viewmodel.createEventResponse?.data!=null){
        // 2. call the create-pandit-api
        await _createEventTravel(viewmodel);

        if(viewmodel.createTravelResponse?.data!=null){
          // 3. call the upload image api finally
          await viewmodel.uploadTravel({
            "travelId" : viewmodel.createTravelResponse!.data?.sId.toString(),
            "file" : imageFiles[0]

          });


        }
      }

    }else if(categoryType=="TENTHOUSE"){
      // 1. create event first
      await _createCategoryEvent(viewmodel);

      if(viewmodel.createEventResponse?.data!=null){
        // 2. call the create-pandit-api
        await _createEventTentHouse(viewmodel);

        if(viewmodel.createTenthouseResponse?.data!=null){
          // 3. call the upload image api finally
          await viewmodel.uploadTentHouseImage({
            "tenthouseId" : viewmodel.createTenthouseResponse?.data?.sId.toString(),
            "file" : imageFiles.first

          });


        }
      }

    }else if(categoryType=="PHOTO_VIDEO"){
      // 1. create event first
      await _createCategoryEvent(viewmodel);

      if(viewmodel.createEventResponse?.data!=null){
        // 2. call the create-pandit-api
        await _createEventPhotoVideo(viewmodel);

        if(viewmodel.createPhotoVideoResponse?.data!=null){
          // 3. call the upload image api finally
          await viewmodel.uploadPhotoVideoImage({
            "photoVideoId" : viewmodel.createPhotoVideoResponse!.data?.sId.toString(),
            "file" : imageFiles.first

          });



        }
      }

    }else if(categoryType=="PANDIT"){
      // 1. create event first
      await _createCategoryEvent(viewmodel);

      if(viewmodel.createEventResponse?.data!=null){
        // 2. call the create-pandit-api
        await _createEventPandit(viewmodel);

        if(viewmodel.createPanditResponse?.data!=null){
          // 3. call the upload image api finally
          await viewmodel.uploadPanditImage({
            "panditId" : viewmodel.createPanditResponse?.data!.sId.toString(),
            "file" : imageFiles.first

          });


        }
      }
    }else if(categoryType=="MAKE_UP"){

      // 1. create event first
      await _createCategoryEvent(viewmodel);

      if(viewmodel.createEventResponse?.data!=null){
        // 2. call the create-pandit-api
        await _createEventMakeup(viewmodel);

        if(viewmodel.createMakeupResponse?.data!=null){
          // 3. call the upload image api finally
          await viewmodel.uploadMakeImage({
            "makeupId" : viewmodel.createMakeupResponse!.data?.sId.toString(),
            "file" : imageFiles.first

          });



        }
      }

    }else if(categoryType=="VARMALA"){


      // 1. create event first
      await _createCategoryEvent(viewmodel);

      if(viewmodel.createEventResponse?.data!=null){
        // 2. call the create-pandit-api
        await _createEventVarmala(viewmodel);

        if(viewmodel.createVarmalaResponse?.data!=null){
          // 3. call the upload image api finally
          await viewmodel.uploadVarmalaImage({
            "varmalaId" : viewmodel.createVarmalaResponse!.data?.sId.toString(),
            "file" : imageFiles[0]

          });


        }
      }


    }else if(categoryType=="DECOR"){


      // 1. create event first
      await _createCategoryEvent(viewmodel);

      if(viewmodel.createEventResponse?.data!=null){
        // 2. call the create-pandit-api
        await _createEventDecoration(viewmodel);

        if(viewmodel.createDecorationResponse?.data!=null){
          // 3. call the upload image api finally
          await viewmodel.uploadDecorationImage({
            "decorationId" : viewmodel.createDecorationResponse?.data!.sId.toString(),
            "file" : imageFiles[0]

          });


        }
      }

    }else if(categoryType=="CATERING"){


      // 1. create event first
      await _createCategoryEvent(viewmodel);

      if(viewmodel.createEventResponse?.data!=null){
        // 2. call the create-pandit-api
        await _createEventCatering(viewmodel);

        if(viewmodel.createCateringResponse?.data!=null){
          // 3. call the upload image api finally
          await viewmodel.uploadCateringImage({
            "cateringId" : viewmodel.createCateringResponse?.data!.sId.toString(),
            "file" : imageFiles.first

          });


        }
      }


    }else if(categoryType=="WEDDING_DRESS") {

      // 1. create event first
      await _createCategoryEvent(viewmodel);

      if(viewmodel.createEventResponse?.data!=null){
        // 2. call the create-pandit-api
        await _createEventWeddingDress(viewmodel);

        if(viewmodel.createWeddingDressResponse?.data!=null){
          // 3. call the upload image api finally
          await viewmodel.uploadWeddingDressImage({
            "weddingDressId": viewmodel.createWeddingDressResponse?.data
            !.sId.toString(),
            "file": imageFiles[0]
          });
        }
      }


    }else if(categoryType=="BAND"){
      // 1. create event first
      await _createCategoryEvent(viewmodel);

      if(viewmodel.createEventResponse?.data!=null){
        // 2. call the create-pandit-api
        await _createEventBand(viewmodel);

        if(viewmodel.createBandResponse?.data!=null){
          // 3. call the upload image api finally
          await viewmodel.uploadBandImage({
            "bandId": viewmodel.createBandResponse?.data
            !.sId.toString(),
            "file": imageFiles[0]
          });
        }
      }


    }else if(categoryType=="DHOL"){

      // 1. create event first
      await _createCategoryEvent(viewmodel);

      if(viewmodel.createEventResponse?.data!=null){
        // 2. call the create-pandit-api
        await _createEventDhol(viewmodel);

        if(viewmodel.createDholResponse?.data!=null){
          // 3. call the upload image api finally
          await viewmodel.uploadDholImage({
            "dholId": viewmodel.createDholResponse?.data
            !.sId.toString(),
            "file": imageFiles[0]
          });
        }
      }
    }else if(categoryType=="ENTERTAINMENT"){


      // 1. create event first
      await _createCategoryEvent(viewmodel);

      if(viewmodel.createEventResponse?.data!=null){
        // 2. call the create-pandit-api
        await _createEventEntertainment(viewmodel);

        if(viewmodel.createEntertainmentResponse?.data!=null){
          // 3. call the upload image api finally
          await viewmodel.uploadEntertainmentImage({
            "entertainmentId": viewmodel.createEntertainmentResponse!.data?.sId.toString(),
            "file": imageFiles[0]
          });
        }
      }



    }else if(categoryType=="DJ_BAND"){


      // 1. create event first
      await _createCategoryEvent(viewmodel);

      if(viewmodel.createEventResponse?.data!=null){
        // 2. call the create-pandit-api
        await _createEventDJBand(viewmodel);

        if(viewmodel.createDJBandResponse?.data!=null){
          // 3. call the upload image api finally
          await viewmodel.uploadDJBandImage({
            "djId": viewmodel.createDJBandResponse?.data!.sId.toString(),
            "file": imageFiles.first
          });
        }
      }



    }else if(categoryType=="HOTEL"){
      // 1. create event first
      await _createCategoryEvent(viewmodel);

      if(viewmodel.createEventResponse?.data!=null){
        // 2. call the create-pandit-api
        await _createEventHotel(viewmodel);

        if(viewmodel.createHotelResponse?.data!=null){
          // 3. call the upload image api finally
          await viewmodel.uploadHotelImage({
            "HotelId": viewmodel.createHotelResponse!.data?.sId.toString(),
            "file": imageFiles.first
          });
        }
      }


    }


    if(viewmodel.response.status == Status.COMPLETED && viewmodel.uploadImageResponse!=null){
      showAlertDialog(context, viewmodel.uploadImageResponse!.message.toString());
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(viewmodel.response.message.toString())),
      );
    }





  }

  Future<void> _createCategoryEvent(MainViewModel viewmodel) async {
    String? sessionEventString = await SharedPrefManager().getString('CREATE-EVENT');
    String? sessionUserString = await SharedPrefManager().getString("USER_ID");
    body_create_event? sessionJsonEvent = body_create_event.fromJson(jsonDecode(sessionEventString!));
    print(sessionEventString);
    await viewmodel.createEvent({
      'event_name' : sessionJsonEvent!.eventname,
      'event_type' : sessionJsonEvent.eventtype,
      'start_date' : sessionJsonEvent.startdate,
      'end_date' : sessionJsonEvent.enddate,
      'description' : sessionJsonEvent.description,
      'Status' : sessionJsonEvent.status,
      'userId' : sessionUserString,
      'location_id' : sessionJsonEvent.locationid,
      'category_id' : widget.imageUploadData['id'],

    });
  }

  Future<void> _createEventPandit(MainViewModel viewmodel) async{
    String? sessionEventPandit = await SharedPrefManager().getString('CREATE-EVENT-PANDIT');
    body_create_pandit? sessionJsonEventPandit = body_create_pandit.fromJson(jsonDecode(sessionEventPandit!));
    await viewmodel.createEventTypePandit({
      "name" : sessionJsonEventPandit.name,
      "pandit_subcategory" : sessionJsonEventPandit.panditSubcateogry,
      "address" : sessionJsonEventPandit.address,
      "contact" : sessionJsonEventPandit.contact,
      "description" : sessionJsonEventPandit.description,
      "speciality" : sessionJsonEventPandit.speciality,
      "years_of_experience" : sessionJsonEventPandit.yearsOfExperience,
      'event_id' : viewmodel.createEventResponse!.data!.sId.toString()
    });

  }
  Future<void> _createEventPhotoVideo(MainViewModel viewmodel) async{
    String? sessionEventPandit = await SharedPrefManager().getString('CREATE-EVENT-PHOTOVIDEO');
    body_create_photovideo? sessionJsonEventPandit = body_create_photovideo.fromJson(jsonDecode(sessionEventPandit!));
    await viewmodel.createEventTypePhotoVideo({
      "service_name" : sessionJsonEventPandit.serviceName,
      "photovideo_subcategory" : sessionJsonEventPandit.photovideoSubcategory,
      "client_name" : sessionJsonEventPandit.clientName,
      "type_of_coverage" : sessionJsonEventPandit.typeOfCoverage,
      "duration" : sessionJsonEventPandit.duration,
      "hourly_rate" : sessionJsonEventPandit.hourlyRate,
      "contact_information" : sessionJsonEventPandit.contactInformation,
      'event_id' : viewmodel.createEventResponse!.data!.sId.toString()
    });

  }
  Future<void> _createEventEntertainment(MainViewModel viewmodel) async{
    String? sessionEventPandit = await SharedPrefManager().getString('CREATE-EVENT-ENTERTAINMENT');
    body_create_entertainment? sessionJsonEventPandit = body_create_entertainment.fromJson(jsonDecode(sessionEventPandit!));
    await viewmodel.createEventTypeEntertainment({
      "event_name" : sessionJsonEventPandit.eventName,
      "entertainment_subcategory" : sessionJsonEventPandit.entertainmentSubcategory,
      "event_description" : sessionJsonEventPandit.eventDescription,
      "event_type" : sessionJsonEventPandit.eventType,
      "event_date_time" : sessionJsonEventPandit.eventDateTime,
      "duration" : sessionJsonEventPandit.duration,
      "ticket_price" : sessionJsonEventPandit.ticketPrice,
      'event_id' : viewmodel.createEventResponse!.data!.sId.toString()
    });

  }
  Future<void> _createEventWeddingDress(MainViewModel viewmodel) async{
    String? sessionEventPandit = await SharedPrefManager().getString('CREATE-EVENT-WEDDINGDRESS');
    body_create_weddingdress? sessionJsonEventPandit = body_create_weddingdress.fromJson(jsonDecode(sessionEventPandit!));
    await viewmodel.createEventTypeWeddingDress({
      "name" : sessionJsonEventPandit.name,
      "wedding_dress_subcategory" : sessionJsonEventPandit.weddingDressSubcategory,
      "designer" : sessionJsonEventPandit.designer,
      "style" : sessionJsonEventPandit.style,
      "color" : sessionJsonEventPandit.color,
      "fabric" : sessionJsonEventPandit.fabric,
      "size" : sessionJsonEventPandit.size,
      "price" : sessionJsonEventPandit.price,
      "description" : sessionJsonEventPandit.description,
      "availability" : sessionJsonEventPandit.availability,
      "rating" : sessionJsonEventPandit.rating,
      "tags" : sessionJsonEventPandit.tags,
      'event_id' : viewmodel.createEventResponse!.data!.sId.toString()
    });

  }

  Future<void> _createEventMakeup(MainViewModel viewmodel) async{
    String? sessionEventPandit = await SharedPrefManager().getString('CREATE-EVENT-MAKEUP');
    body_create_makeup? sessionJsonEventPandit = body_create_makeup.fromJson(jsonDecode(sessionEventPandit!));
    await viewmodel.createEventtypeMakeup({
      "service_name" : sessionJsonEventPandit.serviceName,
      "makeup_subcategory" : sessionJsonEventPandit.makeupSubcategory,
      "first_name" : sessionJsonEventPandit.firstName,
      "last_name" : sessionJsonEventPandit.lastName,
      "members" : sessionJsonEventPandit.members,
      "description" : sessionJsonEventPandit.description,
      "hourly_rate" : sessionJsonEventPandit.hourlyRate,
      "min_hours" : sessionJsonEventPandit.minHours,
      "rate" : sessionJsonEventPandit.rate,
      "location" : sessionJsonEventPandit.location,
      'event_id' : viewmodel.createEventResponse!.data!.sId.toString()
    });

  }
  Future<void> _createEventTravel(MainViewModel viewmodel) async{
    String? sessionEventPandit = await SharedPrefManager().getString('CREATE-EVENT-TRAVEL');
    body_create_travel? sessionJsonEventPandit = body_create_travel.fromJson(jsonDecode(sessionEventPandit!));
    await viewmodel.createEventtypeTravel({
      "service_name" : sessionJsonEventPandit.serviceName,
      "travel_subcategory" : sessionJsonEventPandit.travelSubcategory,
      "client_name" : sessionJsonEventPandit.clientName,
      "type_of_coverage" : sessionJsonEventPandit.typeOfCoverage,
      "duration" : sessionJsonEventPandit.duration,
      "hourly_rate" : sessionJsonEventPandit.hourlyRate,
      "vehicle_type" : sessionJsonEventPandit.vehcileType,
      "pickup_location" : sessionJsonEventPandit.pickupLocation,
      "drop_off_location" : sessionJsonEventPandit.dropoffLocation,

      'event_id' : viewmodel.createEventResponse!.data!.sId.toString()
    });

  }

  Future<void> _createEventHotel(MainViewModel viewmodel) async{
    String? sessionEventPandit = await SharedPrefManager().getString('CREATE-EVENT-HOTEL');
    body_create_hotel? sessionJsonEventPandit = body_create_hotel.fromJson(jsonDecode(sessionEventPandit!));
    await viewmodel.createHotel({
      "hotel_name" : sessionJsonEventPandit.hotelName,
      "hotel_address" : sessionJsonEventPandit.hotelAddress,
      "hotel_capacity" : sessionJsonEventPandit.hotelCapacity,
      "hotel_number" : sessionJsonEventPandit.hotelNumber,
      "hotel_checkin" : sessionJsonEventPandit.hotelCheckin,
      "hotel_checkout" : sessionJsonEventPandit.hotelCheckout,
      "hotel_price" : sessionJsonEventPandit.hotelPrice,
      'event_id' : viewmodel.createEventResponse!.data!.sId.toString()
    });

  }

  Future<void> _createEventVarmala(MainViewModel viewmodel) async{
    String? sessionEventPandit = await SharedPrefManager().getString('CREATE-EVENT-VARMALA');
    body_create_varmala? sessionJsonEventPandit = body_create_varmala.fromJson(jsonDecode(sessionEventPandit!));
    await viewmodel.createEventtypeVarmala({
      "name" : sessionJsonEventPandit.name,
      "varmala_subcategory" : sessionJsonEventPandit.varmalaSubcategory,
      "date" : sessionJsonEventPandit.date,
      "location" : sessionJsonEventPandit.location,
      "description" : sessionJsonEventPandit.description,
      "category" : sessionJsonEventPandit.category,
      "number_of_guests" : sessionJsonEventPandit.numberOfGuests,
      "requirements" : sessionJsonEventPandit.requirements,
      'event_id' : viewmodel.createEventResponse!.data!.sId.toString()
    });

  }


  Future<void> _createEventTentHouse(MainViewModel viewmodel) async{
    String? sessionEventPandit = await SharedPrefManager().getString('CREATE-EVENT-TENTHOUSE');
    body_create_tenthouse? sessionJsonEventPandit = body_create_tenthouse.fromJson(jsonDecode(sessionEventPandit!));
    await viewmodel.createEventtypeTentHouse({
      "name" : sessionJsonEventPandit.name,
      "tenthouse_subcategory" : sessionJsonEventPandit.tenthouseSubcategory,
      "adderss" : sessionJsonEventPandit.adderss,
      "description" : sessionJsonEventPandit.description,
      "description" : sessionJsonEventPandit.description,
      "price" : sessionJsonEventPandit.price,
      "availability" : sessionJsonEventPandit.availability,
      'event_id' : viewmodel.createEventResponse!.data!.sId.toString()
    });

  }
  Future<void> _createEventCatering(MainViewModel viewmodel) async {
    String? sessionEventCatering = await SharedPrefManager().getString('CREATE-EVENT-CATERING');
    body_create_catering? sessionJsonEventCatering = body_create_catering.fromJson(jsonDecode(sessionEventCatering!));
    await viewmodel.createEventTypeCatering({
      "name" : sessionJsonEventCatering.name,
      "catering_subcategory" : sessionJsonEventCatering.cateringSubcategory,
      "address" : sessionJsonEventCatering.address,
      "contact" : sessionJsonEventCatering.contact,
      "description" : sessionJsonEventCatering.description,
      "price" : sessionJsonEventCatering.price,
      'event_id' : viewmodel.createEventResponse!.data!.sId.toString()
    });



  }

  Future<void> _createEventDJBand(MainViewModel viewmodel) async{
    String? sessionEventPandit = await SharedPrefManager().getString('CREATE-EVENT-DJBAND');
    body_create_djband? sessionJsonEventPandit = body_create_djband.fromJson(jsonDecode(sessionEventPandit!));
    await viewmodel.createEventtypeDJBand({
      "dj_band_name" : sessionJsonEventPandit.djBandName,

      "members" : sessionJsonEventPandit.members,
      "genre" : sessionJsonEventPandit.genre,
      "description" : sessionJsonEventPandit.description,
      "availability" : sessionJsonEventPandit.availability,
      "rate" : sessionJsonEventPandit.rate,
      "location" : sessionJsonEventPandit.location,
      "equiment" : sessionJsonEventPandit.equipment,
      "reviews" : sessionJsonEventPandit.reviews,
      "rating" : sessionJsonEventPandit.rating,
      "contact_information" : sessionJsonEventPandit.contactInformation,
      'event_id' : viewmodel.createEventResponse!.data!.sId.toString()
    });

  }
  Future<void> _createEventVenue(MainViewModel viewmodel) async{
    String? sessionEventPandit = await SharedPrefManager().getString('CREATE-EVENT-VENUE');
    body_create_venue? sessionJsonEventPandit = body_create_venue.fromJson(jsonDecode(sessionEventPandit!));
    await viewmodel.createEventTypeVenue({
      "venue_name" : sessionJsonEventPandit.venueName,
      "venue_subcategory" : sessionJsonEventPandit.venueName,
      "venue_address" : sessionJsonEventPandit.venueAddress,
      "venue_capacity" : sessionJsonEventPandit.venueCapacity,
      "venue_contact_person" : sessionJsonEventPandit.venueContactPerson,
      "contact_email_phone" : sessionJsonEventPandit.contactEmailPhone,
      "additional_services" : sessionJsonEventPandit.additionalServices,
      "parking_facility" : sessionJsonEventPandit.parkingFacility,
      "accessibility" : sessionJsonEventPandit.additionalServices,
      "alcohol_permission" : sessionJsonEventPandit.alcoholPermission,
      "cost" : sessionJsonEventPandit.cost,
      "payment_terms" : sessionJsonEventPandit.paymentTerms,
      "security_needs" : sessionJsonEventPandit.securityNeeds,
      'event_id' : viewmodel.createEventResponse!.data!.sId.toString()
    });

  }

  Future<void> _createEventBand(MainViewModel viewmodel) async {
    String? sessionEventPandit = await SharedPrefManager().getString('CREATE-EVENT-BAND');
    body_create_band? sessionJsonEventPandit = body_create_band.fromJson(jsonDecode(sessionEventPandit!));
    await viewmodel.createEventTypeBand({
      "band_name" : sessionJsonEventPandit.bandName,
      "genre" : sessionJsonEventPandit.genre,
      "contact_person" : sessionJsonEventPandit.contactPerson,
      "contact_number" : sessionJsonEventPandit.contactNumber,
      "email" : sessionJsonEventPandit.email,
      "address" : sessionJsonEventPandit.address,

      'event_id' : viewmodel.createEventResponse!.data!.sId.toString()
    });
  }

  Future<void> _createEventDhol(MainViewModel viewmodel) async {
    String? sessionEventPandit = await SharedPrefManager().getString('CREATE-EVENT-DHOL');
    body_create_dhol? sessionJsonEventPandit = body_create_dhol.fromJson(jsonDecode(sessionEventPandit!));
    await viewmodel.createEventTypeDhol({
      "group_name" : sessionJsonEventPandit.groupName,
      "dhol_subcategory" : sessionJsonEventPandit.dholSubcategory,
      "contact_person" : sessionJsonEventPandit.contactPerson,
      "contact_number" : sessionJsonEventPandit.contactNumber,
      "email" : sessionJsonEventPandit.email,
      "address" : sessionJsonEventPandit.address,

      'event_id' : viewmodel.createEventResponse!.data!.sId.toString()
    });

  }
  Future<void> _createEventDecoration(MainViewModel viewmodel) async {
    String? sessionEventPandit = await SharedPrefManager().getString('CREATE-EVENT-DECOR');
    body_create_decoration? sessionJsonEventPandit = body_create_decoration.fromJson(jsonDecode(sessionEventPandit!));
    await viewmodel.createEventtypeDecoration({
      "decoration_name" : sessionJsonEventPandit.name,
      "decor_subcategory" : sessionJsonEventPandit.decorSubcategory,
      "members" : sessionJsonEventPandit.members,
      "description" : sessionJsonEventPandit.description,
      "hourlyRate" : sessionJsonEventPandit.hourlyRate,
      "minHours" : sessionJsonEventPandit.minHours,
      "rate" : sessionJsonEventPandit.rate,
      "location" : sessionJsonEventPandit.location,
      "number" : sessionJsonEventPandit.number,


      'event_id' : viewmodel.createEventResponse!.data!.sId.toString()
    });

  }
}

