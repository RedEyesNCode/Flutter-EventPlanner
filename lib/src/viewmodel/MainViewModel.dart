import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/model/all_location_response.dart';
import 'package:flutter_eventplanner/src/model/create_decoration_response.dart';
import 'package:flutter_eventplanner/src/model/create_djband_response.dart';
import 'package:flutter_eventplanner/src/model/create_event_response.dart';
import 'package:flutter_eventplanner/src/model/create_event_venue.dart';
import 'package:flutter_eventplanner/src/model/create_makeup_response.dart';
import 'package:flutter_eventplanner/src/model/create_pandit_response.dart';
import 'package:flutter_eventplanner/src/model/create_photovideo_response.dart';
import 'package:flutter_eventplanner/src/model/create_tenthouse_response.dart';
import 'package:flutter_eventplanner/src/model/create_travel_response.dart';
import 'package:flutter_eventplanner/src/model/create_varmala_response.dart';
import 'package:flutter_eventplanner/src/model/getall_categories_response.dart';
import 'package:flutter_eventplanner/src/model/login_response.dart';
import 'package:flutter_eventplanner/src/model/register_response.dart';
import 'package:flutter_eventplanner/src/model/user_event_by_category_response.dart';
import 'package:flutter_eventplanner/src/model/user_event_name_search_response.dart';
import 'package:flutter_eventplanner/src/model/user_events_response.dart';
import 'package:flutter_eventplanner/src/repository/MainRepository.dart';
import 'package:flutter_eventplanner/src/utils/api_response.dart';
import 'package:flutter_eventplanner/src/utils/app_exception.dart';


class MainViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');
  login_response? _loginResponse;

  register_response? _registerResponse;

  all_location_response? _allLocationResponse;

  create_event_response? _create_event_response;

  create_event_venue_response? _create_event_venue_response;

  user_events_response? _user_events_response;

  create_decoration_response? _create_decoration_response;

  create_djband_response? _create_djband_response;

  create_travel_response? _create_travel_response;

  create_makeup_response? _create_makeup_response;

  create_photovideo_response? _create_photovideo_response;

  create_tenthouse_response? _create_tenthouse_response;

  create_varmala_response? _create_varmala_response;

  getall_categories_response? _getall_categories_response;

  create_pandit_response? _create_pandit_response;

  user_event_by_category_response? _user_event_by_category_response;

  user_event_name_search_response? _user_event_name_search_response;




  user_event_by_category_response? get userEventByCategoryResponse => _user_event_by_category_response;
  user_event_name_search_response? get userEventNameSearchResponse => _user_event_name_search_response;


  create_photovideo_response? get createPhotoVideoResponse => _create_photovideo_response;

  create_tenthouse_response? get createTenthouseResponse => _create_tenthouse_response;

  create_varmala_response? get createVarmalaResponse => _create_varmala_response;


  getall_categories_response? get getAllCategoriesResponse => _getall_categories_response;

  create_pandit_response? get createPanditResponse => _create_pandit_response;







  user_events_response? get userEventsResponse => _user_events_response;




  all_location_response? get allLocationResponse => _allLocationResponse;


  bool _shouldNotifyListeners = false; // Flag to control listener notification

  ApiResponse get response => _apiResponse;
  login_response? get loginResponse => _loginResponse;

  register_response? get registerResponse => _registerResponse;

  create_event_response? get createEventResponse => _create_event_response;

  create_event_venue_response? get createEventVenueResponse=> _create_event_venue_response;

  create_decoration_response? get createDecorationResponse => _create_decoration_response;

  create_djband_response? get createDJBandResponse => _create_djband_response;

  create_makeup_response? get createMakeupResponse => _create_makeup_response;

  create_travel_response? get createTravelResponse => _create_travel_response;







  void _notifyListenersIfNeeded() {
    if (_shouldNotifyListeners) {
      notifyListeners();
      _shouldNotifyListeners = false; // Reset flag after notifying listeners
    }
  }

  Future<void> createEventTypePandit(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      create_pandit_response? response = await MainRepository().createEventPandit(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _create_pandit_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }

  Future<void> createEventTypePhotoVideo(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      create_photovideo_response? response = await MainRepository().createEventPhotoVideo(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _create_photovideo_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }
  Future<void> createEventtypeTentHouse(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      create_tenthouse_response? response = await MainRepository().createEventTentHouse(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _create_tenthouse_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }
  Future<void> createEventtypeVarmala(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      create_varmala_response? response = await MainRepository().createEventVarmala(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _create_varmala_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }



  Future<void> createEventtypeDecoration(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      create_decoration_response? response = await MainRepository().createEventTypeDecoration(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _create_decoration_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }
  Future<void> createEventtypeDJBand(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      create_djband_response? response = await MainRepository().createEventDjBand(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _create_djband_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }
  Future<void> createEventtypeMakeup(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      create_makeup_response? response = await MainRepository().createEventMakeUp(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _create_makeup_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }
  Future<void> createEventtypeTravel(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      create_travel_response? response = await MainRepository().createEventTravel(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _create_travel_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }

  Future<void> loginUser(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      login_response? response = await MainRepository().loginUser(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _loginResponse = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }

  Future<void> createEvent(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      create_event_response? response = await MainRepository().createNewEvent(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _create_event_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }
  Future<void> createEventTypeVenue(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      create_event_venue_response? response = await MainRepository().createEventTypeVenue(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _create_event_venue_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }

  Future<void> getUserEvents(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    
    
    try {

      user_events_response? response = await MainRepository().getAllUserEvents(userData);
      print('USER-EVENTS-RESPONSE--> '+jsonEncode(response));
      _user_events_response = response;

      _apiResponse = ApiResponse.completed(response);
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }



  Future<void> registerUser(Map<String, dynamic> userRegisterData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      register_response? response = await MainRepository().registerUser(userRegisterData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _registerResponse = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }

  Future<void> getUserEventsBYCateogry(Map<String,dynamic> mapper) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      user_event_by_category_response? response = await MainRepository().getAllUserEventsbyCategory(mapper);
      print(response);


      _apiResponse = ApiResponse.completed(response);
      _user_event_by_category_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('Location Not found !');
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }
  Future<void> getUserEventsBYName(Map<String,dynamic> mapper) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      user_event_name_search_response? response = await MainRepository().getAllUserEventsByName(mapper);
      print(response);


      _apiResponse = ApiResponse.completed(response);
      _user_event_name_search_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('Location Not found !');
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }


  Future<void> getAllLocation() async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      all_location_response? response = await MainRepository().getAllEventLocations();
      print(response);
      

      _apiResponse = ApiResponse.completed(response);
      _allLocationResponse = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('Location Not found !');
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }
  Future<void> getAllEventCategories() async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      getall_categories_response? response = await MainRepository().getAllEventCategories();
      print(response);


      _apiResponse = ApiResponse.completed(response);
      _getall_categories_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('Location Not found !');
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }

}
