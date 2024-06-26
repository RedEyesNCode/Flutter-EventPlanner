
import 'package:flutter_eventplanner/src/services/base_service.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../utils/api_response.dart';
import '../utils/app_exception.dart';
class AppHttpService extends BaseService{



  @override
  Future loginUser(Map<String, dynamic> userData) async {
    // TODO: implement loginUser
    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/login'), // Adjust the endpoint accordingly
        body: jsonEncode(userData),
        headers: {
          'Content-Type': 'application/json',
        },
      );


      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }
  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        print(responseJson);

        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }

  @override
  Future registerUser(Map<String, dynamic> userRegisterData) async {
    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/signup'), // Adjust the endpoint accordingly
        body: jsonEncode(userRegisterData),
        headers: {
          'Content-Type': 'application/json',
        },
      );


      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future getEventLocations() async {
    // TODO: implement getEventLocations

    try {
      final response = await http.get(
        Uri.parse(BaseUrl + 'megma/getalllocation'), // Adjust the endpoint accordingly
        headers: {
          'Content-Type': 'application/json',
        },
      );


      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future createEvent(Map<String, dynamic> createEventData) async {
    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/createevent'), // Adjust the endpoint accordingly
        body: jsonEncode(createEventData),
        headers: {
          'Content-Type': 'application/json',
        },
      );


      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

  }

  @override
  Future createEventTypeVenue(Map<String, dynamic> createEventTypeVenue) async {
    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/create-venue'), // Adjust the endpoint accordingly
        body: jsonEncode(createEventTypeVenue),
        headers: {
          'Content-Type': 'application/json',
        },
      );


      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future getUserEvents(Map<String, dynamic> getUserEventsData) async {

    try {
      final response = await http.post(

        Uri.parse(BaseUrl + 'megma/get-user-events'), // Adjust the endpoint accordingly
        body: jsonEncode(getUserEventsData),

        headers: {
          'Content-Type': 'application/json',
        },
      );


      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }


  @override
  Future createEventTypeDecoration(Map<String, dynamic> createEventTypeDecoration) async{
    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/create-decoration'), // Adjust the endpoint accordingly
        body: jsonEncode(createEventTypeDecoration),
        headers: {
          'Content-Type': 'application/json',
        },
      );


      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future createEventTypeDJBand(Map<String, dynamic> createEventTypeDJBand) async {
    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/create-dj'), // Adjust the endpoint accordingly
        body: jsonEncode(createEventTypeDJBand),
        headers: {
          'Content-Type': 'application/json',
        },
      );


      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future createEventTypeMakeup(Map<String, dynamic> createEventTypeMakeup) async {
    // TODO: implement createEventTypeMakeup

    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/create-makeup'), // Adjust the endpoint accordingly
        body: jsonEncode(createEventTypeMakeup),
        headers: {
          'Content-Type': 'application/json',
        },
      );


      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future createEventTypeTravel(Map<String, dynamic> createEventTypeTravel) async {
    // TODO: implement createEventTypeTravel
    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/create-travel'), // Adjust the endpoint accordingly
        body: jsonEncode(createEventTypeTravel),
        headers: {
          'Content-Type': 'application/json',
        },
      );


      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future createEventTypePhotoVideo(Map<String, dynamic> createEventTypePhotoVideo) async {

    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/create-photoVideo'), // Adjust the endpoint accordingly
        body: jsonEncode(createEventTypePhotoVideo),
        headers: {
          'Content-Type': 'application/json',
        },
      );


      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future createEventTypeTentHouse(Map<String, dynamic> createEventTypeTentHouse) async {

    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/create-tent-house'), // Adjust the endpoint accordingly
        body: jsonEncode(createEventTypeTentHouse),
        headers: {
          'Content-Type': 'application/json',
        },
      );


      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future createEventTypeVarmala(Map<String, dynamic> createEventTypeVarmala) async {

    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/create-varmala'), // Adjust the endpoint accordingly
        body: jsonEncode(createEventTypeVarmala),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

  }

  @override
  Future getAllEventCategories()  async{

    try {
      final response = await http.get(
        Uri.parse(BaseUrl + 'megma/all-categories'), // Adjust the endpoint accordingly
        headers: {
          'Content-Type': 'application/json',
        },
      );


      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future createEventTypePandit(Map<String, dynamic> creatEventTypePandit) async {
    // TODO: implement createEventTypePandit
    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/create-pandit'), // Adjust the endpoint accordingly
        body: jsonEncode(creatEventTypePandit),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future getUserEventsByCategory(Map<String, dynamic> getUserEventData) async {

    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/get-user-events-by-category'), // Adjust the endpoint accordingly
        body: jsonEncode(getUserEventData),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

  }

  @override
  Future getUserEventsByName(Map<String, dynamic> getUserEventsByName) async {
    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/get-user-events-by-name'), // Adjust the endpoint accordingly
        body: jsonEncode(getUserEventsByName),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

  }

  @override
  Future uploadVenueImage(Map<String, dynamic> uploadVenueImageData) async {
    try {
      // Assuming 'uploadVenueImageData' contains the venueId and 'file' is a File object
      String venueId = uploadVenueImageData['venueId'];
      File file = uploadVenueImageData['file'];

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(BaseUrl + 'megma/upload-venue-image'),
      );

      request.fields['venueId'] = venueId;
      request.files.add(await http.MultipartFile.fromPath('file', file.path));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      print(response);

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future uploadDecorationImage(Map<String, dynamic> uploadDecorationImageData) async {

    try {
      // Assuming 'uploadVenueImageData' contains the venueId and 'file' is a File object
      String venueId = uploadDecorationImageData['decorationId'];
      File file = uploadDecorationImageData['file'];

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(BaseUrl + 'megma/upload-decoration-image'),
      );

      request.fields['decorationId'] = venueId;
      request.files.add(await http.MultipartFile.fromPath('file', file.path));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    print(response);

    return returnResponse(response);
    } on SocketException {
    throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future uploadMakeupImage(Map<String, dynamic> uploadMakeupImage) async {
    try {
      // Assuming 'uploadVenueImageData' contains the venueId and 'file' is a File object
      String venueId = uploadMakeupImage['makeupId'];
      File file = uploadMakeupImage['file'];

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(BaseUrl + 'megma/upload-makeup-image'),
      );

      request.fields['makeupId'] = venueId;
      request.files.add(await http.MultipartFile.fromPath('file', file.path));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      print(response);

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

  }

  @override
  Future uploadPanditImage(Map<String, dynamic> uploadPanditImage) async {

    try {
      // Assuming 'uploadVenueImageData' contains the venueId and 'file' is a File object
      String venueId = uploadPanditImage['panditId'];
      File file = uploadPanditImage['file'];

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(BaseUrl + 'megma/upload-pandit-image'),
      );

      request.fields['panditId'] = venueId;
      request.files.add(await http.MultipartFile.fromPath('file', file.path));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    print(response);

    return returnResponse(response);
    } on SocketException {
    throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future uploadPhotoVideoImage(Map<String, dynamic> uploadPhotoVideoImage) async {
    try {
      // Assuming 'uploadVenueImageData' contains the venueId and 'file' is a File object
      String venueId = uploadPhotoVideoImage['photoVideoId'];
      File file = uploadPhotoVideoImage['file'];

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(BaseUrl + 'megma/upload-photoVideo-image'),
      );

      request.fields['photovideoId'] = venueId;
      request.files.add(await http.MultipartFile.fromPath('file', file.path));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    print(response);

    return returnResponse(response);
    } on SocketException {
    throw FetchDataException('No Internet Connection');
    }

  }

  @override
  Future uploadTenthouseImage(Map<String, dynamic> uploadTentHouseImage) async {

    try {
      // Assuming 'uploadVenueImageData' contains the venueId and 'file' is a File object
      String venueId = uploadTentHouseImage['tenthouseId'];
      File file = uploadTentHouseImage['file'];

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(BaseUrl + 'megma/upload-tent-image'),
      );

      request.fields['tenthouseId'] = venueId;
      request.files.add(await http.MultipartFile.fromPath('file', file.path));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    print(response);

    return returnResponse(response);
    } on SocketException {
    throw FetchDataException('No Internet Connection');
    }

  }

  @override
  Future uploadTravelImage(Map<String, dynamic> uploadTravelImage) async {

    try {
      // Assuming 'uploadVenueImageData' contains the venueId and 'file' is a File object
      String venueId = uploadTravelImage['travelId'];
      File file = uploadTravelImage['file'];

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(BaseUrl + 'megma/upload-travel-image'),
      );

      request.fields['travelId'] = venueId;
      request.files.add(await http.MultipartFile.fromPath('file', file.path));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    print(response);

    return returnResponse(response);
    } on SocketException {
    throw FetchDataException('No Internet Connection');
    }

  }

  @override
  Future uploadVarmalaImage(Map<String, dynamic> uploadVarmalaImage) async {
    try {
      // Assuming 'uploadVenueImageData' contains the venueId and 'file' is a File object
      String venueId = uploadVarmalaImage['varmalaId'];
      File file = uploadVarmalaImage['file'];

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(BaseUrl + 'megma/upload-varmala-image'),
      );

      request.fields['varmalaId'] = venueId;
      request.files.add(await http.MultipartFile.fromPath('file', file.path));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    print(response);

    return returnResponse(response);
    } on SocketException {
    throw FetchDataException('No Internet Connection');
    }


  }

  @override
  Future createEventTypeCatering(Map<String, dynamic> createEventTypeCatering) async {
    // TODO: implement createEventTypeCatering
    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/create-catering'), // Adjust the endpoint accordingly
        body: jsonEncode(createEventTypeCatering),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }


  }

  @override
  Future createEventTypeWeddingDress(Map<String, dynamic> createEventTypeWeddingDress) async {
    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/create-wedding-dress'), // Adjust the endpoint accordingly
        body: jsonEncode(createEventTypeWeddingDress),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }


  }

  @override
  Future uploadCateringImage(Map<String, dynamic> uploadPanditImage) async {

    try {
      // Assuming 'uploadVenueImageData' contains the venueId and 'file' is a File object
      String venueId = uploadPanditImage['cateringId'];
      File file = uploadPanditImage['file'];

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(BaseUrl + 'megma/upload-catering-image'),
      );

      request.fields['cateringId'] = venueId;
      request.files.add(await http.MultipartFile.fromPath('file', file.path));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    print(response);

    return returnResponse(response);
    } on SocketException {
    throw FetchDataException('No Internet Connection');
    }


  }

  @override
  Future uploadWeddingDressImage(Map<String, dynamic> uploadPanditImage)  async{
    // TODO: implement uploadWeddingDressImage

    try {
      // Assuming 'uploadVenueImageData' contains the venueId and 'file' is a File object
      String venueId = uploadPanditImage['weddingDressId'];
      File file = uploadPanditImage['file'];

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(BaseUrl + 'megma/upload-wedding-dress-image'),
      );

      request.fields['weddingDressId'] = venueId;
      request.files.add(await http.MultipartFile.fromPath('file', file.path));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    print(response);

    return returnResponse(response);
    } on SocketException {
    throw FetchDataException('No Internet Connection');
    }

  }

  @override
  Future createEventTypeBandWale(Map<String, dynamic> createEventTypeDholWale) async {
    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/create-band'), // Adjust the endpoint accordingly
        body: jsonEncode(createEventTypeDholWale),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future createEventTypeDholWale(Map<String, dynamic> createEventTypeDholWale) async {

    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/create-dhol'), // Adjust the endpoint accordingly
        body: jsonEncode(createEventTypeDholWale),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future createEventTypeEntertainment(Map<String, dynamic> createEventTypeDholWale) async {
    // TODO: implement createEventTypeEntertainment
    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/create-entertainment'), // Adjust the endpoint accordingly
        body: jsonEncode(createEventTypeDholWale),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

  }

  @override
  Future uploadBandImage(Map<String, dynamic> uploadPanditImage) async {
    try {
      // Assuming 'uploadVenueImageData' contains the venueId and 'file' is a File object
      String venueId = uploadPanditImage['bandId'];
      File file = uploadPanditImage['file'];

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(BaseUrl + 'megma/upload-band-image'),
      );

      request.fields['bandId'] = venueId;
      request.files.add(await http.MultipartFile.fromPath('file', file.path));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    print(response);

    return returnResponse(response);
    } on SocketException {
    throw FetchDataException('No Internet Connection');
    }

  }

  @override
  Future uploadDholImage(Map<String, dynamic> uploadPanditImage) async{
    try {
      // Assuming 'uploadVenueImageData' contains the venueId and 'file' is a File object
      String venueId = uploadPanditImage['dholId'];
      File file = uploadPanditImage['file'];

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(BaseUrl + 'megma/upload-dhol-image'),
      );

      request.fields['dholId'] = venueId;
      request.files.add(await http.MultipartFile.fromPath('file', file.path));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    print(response);

    return returnResponse(response);
    } on SocketException {
    throw FetchDataException('No Internet Connection');
    }


  }

  @override
  Future uploadEntertainmentImage(Map<String, dynamic> uploadPanditImage) async {
    try {
      // Assuming 'uploadVenueImageData' contains the venueId and 'file' is a File object
      String venueId = uploadPanditImage['entertainmentId'];
      File file = uploadPanditImage['file'];

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(BaseUrl + 'megma/upload-entertainment-image'),
      );

      request.fields['entertainmentId'] = venueId;
      request.files.add(await http.MultipartFile.fromPath('file', file.path));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    print(response);

    return returnResponse(response);
    } on SocketException {
    throw FetchDataException('No Internet Connection');
    }


  }

  @override
  Future getEventDetailsByEventId(Map<String, dynamic> getEventDetails) async {
    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/get-event-by-id'), // Adjust the endpoint accordingly
        body: jsonEncode(getEventDetails),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future createRazorPayOrder(Map<String, dynamic> createRazorPayOrder) async {

    try {

      var auth =
          'Basic ' + base64Encode(utf8.encode('rzp_test_pr7kqypJcQmQiH:4lMgPCZFbt471suYhban1qiF'));
      var headers = {'content-type': 'application/json', 'Authorization': auth};
      var request =
      http.Request('POST', Uri.parse('https://api.razorpay.com/v1/orders'));
      request.body = json.encode(createRazorPayOrder);
      request.headers.addAll(headers);

      http.Response response = await http.Client().send(request).then(http.Response.fromStream);
      print(response.statusCode);

      return returnResponse(response);


    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future getUserPaymentStatus(Map<String, dynamic> getUserPaymentStatus) async {

    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/is-user-paid'), // Adjust the endpoint accordingly
        body: jsonEncode(getUserPaymentStatus),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

  }

  @override
  Future completeVendorPayment(Map<String, dynamic> completeVendorPaymentData) async {

    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/complete-vendor-payment'), // Adjust the endpoint accordingly
        body: jsonEncode(completeVendorPaymentData),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

  }

  @override
  Future createEventTypeHotel(Map<String, dynamic> createEventTypeHotel) async {

    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/create-hotel'), // Adjust the endpoint accordingly
        body: jsonEncode(createEventTypeHotel),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future uploadDjBandImage(Map<String, dynamic> uploadDjBandImage) async {

    try {
      // Assuming 'uploadVenueImageData' contains the venueId and 'file' is a File object
      String venueId = uploadDjBandImage['djId'];
      File file = uploadDjBandImage['file'];

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(BaseUrl + 'megma/upload-dj-image'),
      );

      request.fields['djId'] = venueId;
      request.files.add(await http.MultipartFile.fromPath('file', file.path));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    print(response);

    return returnResponse(response);
    } on SocketException {
    throw FetchDataException('No Internet Connection');
    }

  }

  @override
  Future uploadHotelImage(Map<String, dynamic> uploadHotelImage) async {

    try {
      // Assuming 'uploadVenueImageData' contains the venueId and 'file' is a File object
      String venueId = uploadHotelImage['HotelId'];
      File file = uploadHotelImage['file'];

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(BaseUrl + 'megma/upload-hotel-image'),
      );

      request.fields['HotelId'] = venueId;
      request.files.add(await http.MultipartFile.fromPath('file', file.path));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    print(response);

    return returnResponse(response);
    } on SocketException {
    throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future deleteEvent(Map<String, dynamic> createEventData) async{

    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/deleteevent'), // Adjust the endpoint accordingly
        body: jsonEncode(createEventData),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future forgotPassword(Map<String, dynamic> forgotPassword) async {
    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/forgot-password'), // Adjust the endpoint accordingly
        body: jsonEncode(forgotPassword),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future resetPassword(Map<String, dynamic> resetPassword) async {
    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/reset-password'), // Adjust the endpoint accordingly
        body: jsonEncode(resetPassword),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future getUserEventCount(Map<String, dynamic> userEventCount) async {
    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/get-user-event-count'), // Adjust the endpoint accordingly
        body: jsonEncode(userEventCount),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future updateEvent(Map<String, dynamic> updateEventData) async {
    try {
      final response = await http.post(
        Uri.parse(BaseUrl + 'megma/updateevent'), // Adjust the endpoint accordingly
        body: jsonEncode(updateEventData),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }






}