
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





}