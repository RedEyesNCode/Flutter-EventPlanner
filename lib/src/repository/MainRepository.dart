


import 'package:flutter_eventplanner/src/model/all_location_response.dart';
import 'package:flutter_eventplanner/src/model/create_decoration_response.dart';
import 'package:flutter_eventplanner/src/model/create_djband_response.dart';
import 'package:flutter_eventplanner/src/model/create_event_response.dart';
import 'package:flutter_eventplanner/src/model/create_event_venue.dart';
import 'package:flutter_eventplanner/src/model/create_makeup_response.dart';
import 'package:flutter_eventplanner/src/model/create_photovideo_response.dart';
import 'package:flutter_eventplanner/src/model/create_tenthouse_response.dart';
import 'package:flutter_eventplanner/src/model/create_travel_response.dart';
import 'package:flutter_eventplanner/src/model/create_varmala_response.dart';
import 'package:flutter_eventplanner/src/model/register_response.dart';
import 'package:flutter_eventplanner/src/services/AppHttpService.dart';
import 'package:flutter_eventplanner/src/services/base_service.dart';

import '../model/login_response.dart';
import '../model/user_events_response.dart';

class MainRepository {
  BaseService _userService = AppHttpService();



  Future<login_response> loginUser(Map<String,dynamic> userData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.loginUser(userData);
      // Assuming the response is in the format you provided earlier
      return login_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }

  }

  Future<register_response> registerUser(Map<String,dynamic> userRegisterData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.registerUser(userRegisterData);
      // Assuming the response is in the format you provided earlier
      return register_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }
  Future<create_event_response> createNewEvent(Map<String,dynamic> createEventData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.createEvent(createEventData);
      // Assuming the response is in the format you provided earlier
      return create_event_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }
  Future<create_event_venue_response> createEventTypeVenue(Map<String,dynamic> createEventData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.createEventTypeVenue(createEventData);
      // Assuming the response is in the format you provided earlier
      return create_event_venue_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }
  Future<create_decoration_response> createEventTypeDecoration(Map<String,dynamic> createEventDataDecoration) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.createEventTypeDecoration(createEventDataDecoration);
      // Assuming the response is in the format you provided earlier
      return create_decoration_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }
  Future<create_djband_response> createEventDjBand(Map<String,dynamic> createEventDataDecoration) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.createEventTypeDJBand(createEventDataDecoration);
      // Assuming the response is in the format you provided earlier
      return create_djband_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }
  Future<create_makeup_response> createEventMakeUp(Map<String,dynamic> createEventDataDecoration) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.createEventTypeMakeup(createEventDataDecoration);
      // Assuming the response is in the format you provided earlier
      return create_makeup_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }
  Future<create_travel_response> createEventTravel(Map<String,dynamic> createEventDataDecoration) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.createEventTypeTravel(createEventDataDecoration);
      // Assuming the response is in the format you provided earlier
      return create_travel_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }

  Future<create_photovideo_response> createEventPhotoVideo(Map<String,dynamic> createEventDataDecoration) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.createEventTypePhotoVideo(createEventDataDecoration);
      // Assuming the response is in the format you provided earlier
      return create_photovideo_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }
  Future<create_tenthouse_response> createEventTentHouse(Map<String,dynamic> createEventDataDecoration) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.createEventTypeTentHouse(createEventDataDecoration);
      // Assuming the response is in the format you provided earlier
      return create_tenthouse_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }
  Future<create_varmala_response> createEventVarmala(Map<String,dynamic> createEventDataDecoration) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.createEventTypeVarmala(createEventDataDecoration);
      // Assuming the response is in the format you provided earlier
      return create_varmala_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }




  Future<all_location_response> getAllEventLocations() async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.getEventLocations();
      // Assuming the response is in the format you provided earlier
      return all_location_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }
  Future<user_events_response> getAllUserEvents(Map<String,dynamic> getUserEventsData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.getUserEvents(getUserEventsData);
      // Assuming the response is in the format you provided earlier
      return user_events_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }



}