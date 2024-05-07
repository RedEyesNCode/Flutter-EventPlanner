import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/model/all_location_response.dart';
import 'package:flutter_eventplanner/src/model/create_event_response.dart';
import 'package:flutter_eventplanner/src/model/create_event_venue.dart';
import 'package:flutter_eventplanner/src/model/login_response.dart';
import 'package:flutter_eventplanner/src/model/register_response.dart';
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



  all_location_response? get allLocationResponse => _allLocationResponse;


  bool _shouldNotifyListeners = false; // Flag to control listener notification

  ApiResponse get response => _apiResponse;
  login_response? get loginResponse => _loginResponse;

  register_response? get registerResponse => _registerResponse;

  create_event_response? get createEventResponse => _create_event_response;

  create_event_venue_response? get createEventVenueResponse=> _create_event_venue_response;






  void _notifyListenersIfNeeded() {
    if (_shouldNotifyListeners) {
      notifyListeners();
      _shouldNotifyListeners = false; // Reset flag after notifying listeners
    }
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

}
