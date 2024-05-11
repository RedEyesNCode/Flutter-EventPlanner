


import 'package:flutter_eventplanner/src/model/all_location_response.dart';
import 'package:flutter_eventplanner/src/model/create_band_response.dart';
import 'package:flutter_eventplanner/src/model/create_decoration_response.dart';
import 'package:flutter_eventplanner/src/model/create_dhol_response.dart';
import 'package:flutter_eventplanner/src/model/create_djband_response.dart';
import 'package:flutter_eventplanner/src/model/create_entertainment_response.dart';
import 'package:flutter_eventplanner/src/model/create_event_response.dart';
import 'package:flutter_eventplanner/src/model/create_event_venue.dart';
import 'package:flutter_eventplanner/src/model/create_makeup_response.dart';
import 'package:flutter_eventplanner/src/model/create_pandit_response.dart';
import 'package:flutter_eventplanner/src/model/create_photovideo_response.dart';
import 'package:flutter_eventplanner/src/model/create_tenthouse_response.dart';
import 'package:flutter_eventplanner/src/model/create_travel_response.dart';
import 'package:flutter_eventplanner/src/model/create_varmala_response.dart';
import 'package:flutter_eventplanner/src/model/create_weddingdress_response.dart';
import 'package:flutter_eventplanner/src/model/getall_categories_response.dart';
import 'package:flutter_eventplanner/src/model/register_response.dart';
import 'package:flutter_eventplanner/src/model/upload_image_response.dart';
import 'package:flutter_eventplanner/src/model/user_event_by_category_response.dart';
import 'package:flutter_eventplanner/src/model/user_event_name_search_response.dart';
import 'package:flutter_eventplanner/src/services/AppHttpService.dart';
import 'package:flutter_eventplanner/src/services/base_service.dart';

import '../model/create_catering_response.dart';
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
  Future<create_pandit_response> createEventPandit(Map<String,dynamic> createEventDataDecoration) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.createEventTypePandit(createEventDataDecoration);
      // Assuming the response is in the format you provided earlier
      return create_pandit_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }
  Future<create_catering_response> createEventTypeCatering(Map<String,dynamic> createEventDataDecoration) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.createEventTypeCatering(createEventDataDecoration);
      // Assuming the response is in the format you provided earlier
      return create_catering_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }
  Future<create_weddingdress_response> createEventTypeWeddingDress(Map<String,dynamic> createEventDataDecoration) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.createEventTypeWeddingDress(createEventDataDecoration);
      // Assuming the response is in the format you provided earlier
      return create_weddingdress_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }
  Future<create_catering_response> createEventType(Map<String,dynamic> createEventDataDecoration) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.createEventTypeCatering(createEventDataDecoration);
      // Assuming the response is in the format you provided earlier
      return create_catering_response.fromJson(response);
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
  Future<getall_categories_response> getAllEventCategories() async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.getAllEventCategories();
      // Assuming the response is in the format you provided earlier
      return getall_categories_response.fromJson(response);
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
  Future<user_event_by_category_response> getAllUserEventsbyCategory(Map<String,dynamic> getUserEventsData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.getUserEventsByCategory(getUserEventsData);
      // Assuming the response is in the format you provided earlier
      return user_event_by_category_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }

  Future<create_dhol_response> createEventTypeDhol(Map<String,dynamic> getUserEventsData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.createEventTypeDholWale(getUserEventsData);
      // Assuming the response is in the format you provided earlier
      return create_dhol_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }
  Future<create_band_response> createEventTypeBand(Map<String,dynamic> getUserEventsData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.createEventTypeBandWale(getUserEventsData);
      // Assuming the response is in the format you provided earlier
      return create_band_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }
  Future<create_entertainment_response> createEventTypeEntertainment(Map<String,dynamic> getUserEventsData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.createEventTypeEntertainment(getUserEventsData);
      // Assuming the response is in the format you provided earlier
      return create_entertainment_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }
  }



  Future<user_event_name_search_response> getAllUserEventsByName(Map<String,dynamic> getUserEventsData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.getUserEventsByName(getUserEventsData);
      // Assuming the response is in the format you provided earlier
      return user_event_name_search_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }

  Future<upload_image_response> uploadVenueImage(Map<String,dynamic> uploadVenueImageData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.uploadVenueImage(uploadVenueImageData);
      // Assuming the response is in the format you provided earlier
      return upload_image_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }


  Future<upload_image_response> uploadTravelImage(Map<String,dynamic> uploadVenueImageData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.uploadTravelImage(uploadVenueImageData);
      // Assuming the response is in the format you provided earlier
      return upload_image_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }
  Future<upload_image_response> uploadTenthouseImages(Map<String,dynamic> uploadVenueImageData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.uploadTenthouseImage(uploadVenueImageData);
      // Assuming the response is in the format you provided earlier
      return upload_image_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }

  Future<upload_image_response> uploadPhotoVideo(Map<String,dynamic> uploadVenueImageData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.uploadPhotoVideoImage(uploadVenueImageData);
      // Assuming the response is in the format you provided earlier
      return upload_image_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }

  Future<upload_image_response> uploadWeddingDressImage(Map<String,dynamic> uploadVenueImageData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.uploadWeddingDressImage(uploadVenueImageData);
      // Assuming the response is in the format you provided earlier
      return upload_image_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }
  Future<upload_image_response> uploadCateringImage(Map<String,dynamic> uploadVenueImageData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.uploadCateringImage(uploadVenueImageData);
      // Assuming the response is in the format you provided earlier
      return upload_image_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }


  }


  Future<upload_image_response> uploadPanditImage(Map<String,dynamic> uploadVenueImageData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.uploadPanditImage(uploadVenueImageData);
      // Assuming the response is in the format you provided earlier
      return upload_image_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }
  }
  Future<upload_image_response> uploadMakeupImage(Map<String,dynamic> uploadVenueImageData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.uploadMakeupImage(uploadVenueImageData);
      // Assuming the response is in the format you provided earlier
      return upload_image_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }
  }
  Future<upload_image_response> uploadVarmalaImage(Map<String,dynamic> uploadVenueImageData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.uploadVarmalaImage(uploadVenueImageData);
      // Assuming the response is in the format you provided earlier
      return upload_image_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }
  }
  Future<upload_image_response> uploadDecorationImage(Map<String,dynamic> uploadVenueImageData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.uploadDecorationImage(uploadVenueImageData);
      // Assuming the response is in the format you provided earlier
      return upload_image_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }
  }
  Future<upload_image_response> uploadBandImage(Map<String,dynamic> uploadVenueImageData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.uploadBandImage(uploadVenueImageData);
      // Assuming the response is in the format you provided earlier
      return upload_image_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }
  }
  Future<upload_image_response> uploadDholImage(Map<String,dynamic> uploadVenueImageData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.uploadDholImage(uploadVenueImageData);
      // Assuming the response is in the format you provided earlier
      return upload_image_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }
  }
  Future<upload_image_response> uploadEntertainmentImage(Map<String,dynamic> uploadVenueImageData) async{

    try {
      // Assuming _userService handles the registration request
      dynamic response = await _userService.uploadEntertainmentImage(uploadVenueImageData);
      // Assuming the response is in the format you provided earlier
      return upload_image_response.fromJson(response);
    } catch (error) {
      // Handle error
      throw error;
    }
  }


}