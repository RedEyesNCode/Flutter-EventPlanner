import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/model/all_location_response.dart';
import 'package:flutter_eventplanner/src/model/common_response.dart';
import 'package:flutter_eventplanner/src/model/complete_vendor_payment_response.dart';
import 'package:flutter_eventplanner/src/model/create_band_response.dart';
import 'package:flutter_eventplanner/src/model/create_catering_response.dart';
import 'package:flutter_eventplanner/src/model/create_decoration_response.dart';
import 'package:flutter_eventplanner/src/model/create_dhol_response.dart';
import 'package:flutter_eventplanner/src/model/create_djband_response.dart';
import 'package:flutter_eventplanner/src/model/create_entertainment_response.dart';
import 'package:flutter_eventplanner/src/model/create_event_response.dart';
import 'package:flutter_eventplanner/src/model/create_event_venue.dart';
import 'package:flutter_eventplanner/src/model/create_hotel_response.dart';
import 'package:flutter_eventplanner/src/model/create_makeup_response.dart';
import 'package:flutter_eventplanner/src/model/create_pandit_response.dart';
import 'package:flutter_eventplanner/src/model/create_photovideo_response.dart';
import 'package:flutter_eventplanner/src/model/create_tenthouse_response.dart';
import 'package:flutter_eventplanner/src/model/create_travel_response.dart';
import 'package:flutter_eventplanner/src/model/create_varmala_response.dart';
import 'package:flutter_eventplanner/src/model/create_weddingdress_response.dart';
import 'package:flutter_eventplanner/src/model/get_event_details_response.dart';
import 'package:flutter_eventplanner/src/model/get_user_payment_status_response.dart';
import 'package:flutter_eventplanner/src/model/getall_categories_response.dart';
import 'package:flutter_eventplanner/src/model/login_response.dart';
import 'package:flutter_eventplanner/src/model/razorpay_create_order_response.dart';
import 'package:flutter_eventplanner/src/model/register_response.dart';
import 'package:flutter_eventplanner/src/model/upload_image_response.dart';
import 'package:flutter_eventplanner/src/model/user_event_by_category_response.dart';
import 'package:flutter_eventplanner/src/model/user_event_count_response.dart';
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

  create_weddingdress_response? _create_weddingdress_response;

  create_catering_response? _create_catering_response;

  user_event_count_response? _user_event_count_response;



  create_band_response? _create_band_response;

  create_dhol_response? _create_dhol_response;

  create_entertainment_response? _create_entertainment_response;

  get_event_details_response? _get_event_details_response;

  razorpay_create_order_response? _razorpay_create_order_response;


  get_user_payment_status_response? _get_user_payment_status_response;

  complete_vendor_payment_response? _complete_vendor_payment_response;


  common_response? _common_response;

  common_response? get commonResponse => _common_response;

  user_event_count_response? get userEventCountResponse => _user_event_count_response;




  complete_vendor_payment_response? get completeVendorPaymentResponse => _complete_vendor_payment_response;



  get_user_payment_status_response? get userPaymentStatus => _get_user_payment_status_response;



  upload_image_response? _upload_image_response;

  create_hotel_response? _create_hotel_response;


  common_response? _forgot_pass_response;
  common_response? _reset_pass_response;

  common_response? _update_event_response;

  common_response? get updateEventResponse => _update_event_response;




  common_response? get forgotPasswordResponse => _forgot_pass_response;
  common_response? get resetPasswordResponse => _reset_pass_response;




  user_event_by_category_response? get userEventByCategoryResponse => _user_event_by_category_response;
  user_event_name_search_response? get userEventNameSearchResponse => _user_event_name_search_response;

  razorpay_create_order_response? get razorPayCreateOrderResponse => _razorpay_create_order_response;


  create_weddingdress_response? get createWeddingDressResponse => _create_weddingdress_response;
  create_catering_response? get createCateringResponse => _create_catering_response;

  create_dhol_response? get createDholResponse => _create_dhol_response;

  create_band_response? get createBandResponse => _create_band_response;

  create_entertainment_response? get createEntertainmentResponse => _create_entertainment_response;


  get_event_details_response? get getEventDetailsResponse => _get_event_details_response;


  create_hotel_response? get createHotelResponse => _create_hotel_response;









  upload_image_response? get uploadImageResponse => _upload_image_response;




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

  Future<void> updateEventDetails(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();

    try {

      common_response? response = await MainRepository().updateEvent(userData);
      print(response);
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();

      _apiResponse = ApiResponse.completed(response);
      _update_event_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();

    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();

    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.ERROR;
      notifyListeners();
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }


  Future<void> forgotPassword(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();

    try {

      common_response? response = await MainRepository().forgotPassword(userData);
      print(response);
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();

      _apiResponse = ApiResponse.completed(response);
      _forgot_pass_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();

    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();

    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.ERROR;
      notifyListeners();
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }
  Future<void> getDashboarduserEventCount(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();

    try {

      user_event_count_response? response = await MainRepository().getUserEventCount(userData);
      print(response);
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();

      _apiResponse = ApiResponse.completed(response);
      _user_event_count_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();

    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();

    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.ERROR;
      notifyListeners();

      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }

  Future<void> resetPassword(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();

    try {

      common_response? response = await MainRepository().resetPassword(userData);
      print(response);
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();

      _apiResponse = ApiResponse.completed(response);
      _reset_pass_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();

    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();

    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.ERROR;
      notifyListeners();

      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }


  Future<void> deleteEvent(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();

    try {

      common_response? response = await MainRepository().deleteEvent(userData);
      print(response);
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();

      _apiResponse = ApiResponse.completed(response);
      _common_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();

    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();

    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.ERROR;
      notifyListeners();

      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }

  Future<void> createHotel(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();

    try {

      create_hotel_response? response = await MainRepository().createHotelResponse(userData);
      print(response);
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();

      _apiResponse = ApiResponse.completed(response);
      _create_hotel_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();

    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();

    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.ERROR;
      notifyListeners();

      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }



  Future<void> completeVendorPayment(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      complete_vendor_payment_response? response = await MainRepository().completeVendorPayment(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _complete_vendor_payment_response = response;
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


  Future<void> getUserPaymentStatus(Map<String, dynamic> userData) async {
    // _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    // _apiResponse.status = Status.LOADING;

    notifyListeners();

    try {

      get_user_payment_status_response? response = await MainRepository().getUserPaymentStatus(userData);
      print(response);
      _get_user_payment_status_response = response;

      _apiResponse = ApiResponse.completed(response);
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }


  Future<void> createRazorPayOrder(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      razorpay_create_order_response? response = await MainRepository().createRazorPayOrder(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _razorpay_create_order_response = response;
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

  Future<void> getEventDetails(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      get_event_details_response? response = await MainRepository().getEventDetailsResponse(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _get_event_details_response = response;
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

  Future<void> createEventTypeBand(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();


    try {

      create_band_response? response = await MainRepository().createEventTypeBand(userData);
      print(response);
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();

      _apiResponse = ApiResponse.completed(response);
      _create_band_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();

    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.ERROR;
      notifyListeners();
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }


  Future<void> createEventTypeEntertainment(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      create_entertainment_response? response = await MainRepository().createEventTypeEntertainment(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _create_entertainment_response = response;
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
  Future<void> createEventTypeDhol(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      create_dhol_response? response = await MainRepository().createEventTypeDhol(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _create_dhol_response = response;
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

  Future<void> createEventTypePandit(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();

    try {

      create_pandit_response? response = await MainRepository().createEventPandit(userData);
      print(response);
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();
      _apiResponse = ApiResponse.completed(response);
      _create_pandit_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }
  Future<void> createEventTypeCatering(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();

    try {

      create_catering_response? response = await MainRepository().createEventTypeCatering(userData);
      print(response);
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();
      _apiResponse = ApiResponse.completed(response);
      _create_catering_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.ERROR;
      notifyListeners();
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }
  Future<void> createEventTypeWeddingDress(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      create_weddingdress_response? response = await MainRepository().createEventTypeWeddingDress(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _create_weddingdress_response = response;
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
    _apiResponse.status = Status.LOADING;
    notifyListeners();
    try {

      create_photovideo_response? response = await MainRepository().createEventPhotoVideo(userData);
      print(response);
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();
      _apiResponse = ApiResponse.completed(response);
      _create_photovideo_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.ERROR;
      notifyListeners();
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }
  Future<void> createEventtypeTentHouse(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();



    try {

      create_tenthouse_response? response = await MainRepository().createEventTentHouse(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();
      _create_tenthouse_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.ERROR;
      notifyListeners();
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }
  Future<void> createEventtypeVarmala(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();
    try {

      create_varmala_response? response = await MainRepository().createEventVarmala(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _create_varmala_response = response;
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.ERROR;
      notifyListeners();
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }



  Future<void> createEventtypeDecoration(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();



    try {

      create_decoration_response? response = await MainRepository().createEventTypeDecoration(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _create_decoration_response = response;
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.ERROR;
      notifyListeners();
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }



  Future<void> createEventtypeDJBand(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();

    try {

      create_djband_response? response = await MainRepository().createEventDjBand(userData);
      print(response);
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();
      _apiResponse = ApiResponse.completed(response);
      _create_djband_response = response;
    } on BadRequestException {

      _apiResponse.status = Status.ERROR;
      notifyListeners();
      _apiResponse = ApiResponse.error('User Not found !');
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');

      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());

      _apiResponse.status = Status.ERROR;
      notifyListeners();
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }
  Future<void> createEventtypeMakeup(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();

    try {

      create_makeup_response? response = await MainRepository().createEventMakeUp(userData);
      print(response);

      _apiResponse.status = Status.COMPLETED;
      notifyListeners();

      _apiResponse = ApiResponse.completed(response);
      _create_makeup_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();

    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();

    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.ERROR;
      notifyListeners();

      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }
  Future<void> createEventtypeTravel(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking event type decoration');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();

    try {

      create_travel_response? response = await MainRepository().createEventTravel(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _create_travel_response = response;
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.ERROR;
      notifyListeners();
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }

  Future<void> loginUser(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _apiResponse.status = Status.LOADING;
    notifyListeners(); // Notify listeners only once after all state changes

    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      login_response? response = await MainRepository().loginUser(userData);
      print(response);
      _apiResponse.status = Status.COMPLETED;

      _apiResponse = ApiResponse.completed(response);
      _loginResponse = response;
      notifyListeners(); // Notify listeners only once after all state changes

    } on BadRequestException {
      _apiResponse.status = Status.ERROR;

      _apiResponse = ApiResponse.error('User Not found !');
      notifyListeners(); // Notify listeners only once after all state changes

    } on FetchDataException {
      _apiResponse.status = Status.ERROR;

      _apiResponse = ApiResponse.error('No Internet Connection');
    } catch (e) {
      _apiResponse.status = Status.ERROR;

      _apiResponse = ApiResponse.error('Error : '+e.toString());
      print(e);
    }
    notifyListeners(); // Notify listeners only once after all state changes
  }

  Future<void> createEvent(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();

    try {

      create_event_response? response = await MainRepository().createNewEvent(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _create_event_response = response;
      _apiResponse.status = Status.LOADING;
      notifyListeners();

    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.LOADING;
      notifyListeners();
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.LOADING;
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.LOADING;
      notifyListeners();
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }
  Future<void> createEventTypeVenue(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();

    try {

      create_event_venue_response? response = await MainRepository().createEventTypeVenue(userData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();

      _create_event_venue_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();

    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();

    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();

      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }

  Future<void> getUserEvents(Map<String, dynamic> userData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();

    
    try {

      user_events_response? response = await MainRepository().getAllUserEvents(userData);
      print('USER-EVENTS-RESPONSE--> '+jsonEncode(response));
      _user_events_response = response;
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();

      _apiResponse = ApiResponse.completed(response);
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.ERROR;
      notifyListeners();
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }
  Future<void> uploadDJBandImage(Map<String, dynamic> uploadVenueImageData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();
    try {

      upload_image_response? response = await MainRepository().uploadDjBandImage(uploadVenueImageData);
      print(response);
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();
      _apiResponse = ApiResponse.completed(response);
      _upload_image_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.ERROR;
      notifyListeners();
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }


  Future<void> uploadHotelImage(Map<String, dynamic> uploadVenueImageData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();
    try {

      upload_image_response? response = await MainRepository().uploadHotelImage(uploadVenueImageData);
      print(response);
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();
      _apiResponse = ApiResponse.completed(response);
      _upload_image_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.ERROR;
      notifyListeners();
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }

  Future<void> uploadVenueImage(Map<String, dynamic> uploadVenueImageData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();
    try {

      upload_image_response? response = await MainRepository().uploadVenueImage(uploadVenueImageData);
      print(response);
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();
      _apiResponse = ApiResponse.completed(response);
      _upload_image_response = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.ERROR;
      notifyListeners();
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }

  Future<void> uploadBandImage(Map<String, dynamic> uploadVenueImageData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();
    try {

      upload_image_response? response = await MainRepository().uploadBandImage(uploadVenueImageData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _upload_image_response = response;
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();
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

  Future<void> uploadEntertainmentImage(Map<String, dynamic> uploadVenueImageData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      upload_image_response? response = await MainRepository().uploadEntertainmentImage(uploadVenueImageData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _upload_image_response = response;
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

  Future<void> uploadDholImage(Map<String, dynamic> uploadVenueImageData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      upload_image_response? response = await MainRepository().uploadDholImage(uploadVenueImageData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _upload_image_response = response;
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

  Future<void> uploadWeddingDressImage(Map<String, dynamic> uploadVenueImageData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      upload_image_response? response = await MainRepository().uploadWeddingDressImage(uploadVenueImageData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _upload_image_response = response;
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
  Future<void> uploadCateringImage(Map<String, dynamic> uploadVenueImageData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      upload_image_response? response = await MainRepository().uploadCateringImage(uploadVenueImageData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _upload_image_response = response;
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

  Future<void> uploadTravel(Map<String, dynamic> uploadVenueImageData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      upload_image_response? response = await MainRepository().uploadTravelImage(uploadVenueImageData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _upload_image_response = response;
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
  Future<void> uploadDecorationImage(Map<String, dynamic> uploadVenueImageData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      upload_image_response? response = await MainRepository().uploadDecorationImage(uploadVenueImageData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _upload_image_response = response;
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
  Future<void> uploadTentHouseImage(Map<String, dynamic> uploadVenueImageData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      upload_image_response? response = await MainRepository().uploadTenthouseImages(uploadVenueImageData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _upload_image_response = response;
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
  Future<void> uploadPhotoVideoImage(Map<String, dynamic> uploadVenueImageData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      upload_image_response? response = await MainRepository().uploadPhotoVideo(uploadVenueImageData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _upload_image_response = response;
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
  Future<void> uploadPanditImage(Map<String, dynamic> uploadVenueImageData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      upload_image_response? response = await MainRepository().uploadPanditImage(uploadVenueImageData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _upload_image_response = response;
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
  Future<void> uploadMakeImage(Map<String, dynamic> uploadVenueImageData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      upload_image_response? response = await MainRepository().uploadMakeupImage(uploadVenueImageData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _upload_image_response = response;
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
  Future<void> uploadVarmalaImage(Map<String, dynamic> uploadVenueImageData) async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners

    try {

      upload_image_response? response = await MainRepository().uploadVarmalaImage(uploadVenueImageData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _upload_image_response = response;
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
    _apiResponse.status = Status.LOADING;
    notifyListeners();

    try {

      register_response? response = await MainRepository().registerUser(userRegisterData);
      print(response);

      _apiResponse = ApiResponse.completed(response);
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();
      _registerResponse = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('User Not found !');

      _apiResponse.status = Status.ERROR;
      notifyListeners();

    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.ERROR;
      notifyListeners();
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
    _apiResponse.status = Status.LOADING;
    notifyListeners();
    try {

      user_event_name_search_response? response = await MainRepository().getAllUserEventsByName(mapper);
      print(response);
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();

      _apiResponse = ApiResponse.completed(response);
      _user_event_name_search_response = response;

    } on BadRequestException {
      _apiResponse = ApiResponse.error('Location Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.ERROR;
      notifyListeners();
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }


  Future<void> getAllLocation() async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();
    try {

      all_location_response? response = await MainRepository().getAllEventLocations();
      print(response);

      _apiResponse.status = Status.COMPLETED;
      notifyListeners();
      _apiResponse = ApiResponse.completed(response);
      _allLocationResponse = response;
    } on BadRequestException {
      _apiResponse = ApiResponse.error('Location Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }
  Future<void> getAllEventCategories() async {
    _apiResponse = ApiResponse.loading('Checking user');
    _shouldNotifyListeners = true; // Set flag to notify listeners
    _apiResponse.status = Status.LOADING;
    notifyListeners();

    try {
      getall_categories_response? response = await MainRepository().getAllEventCategories();
      print(response);
      _apiResponse = ApiResponse.completed(response);
      _getall_categories_response = response;
      _apiResponse.status = Status.COMPLETED;
      notifyListeners();


    } on BadRequestException {
      _apiResponse = ApiResponse.error('Location Not found !');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } on FetchDataException {
      _apiResponse = ApiResponse.error('No Internet Connection');
      _apiResponse.status = Status.ERROR;
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error('Error : '+e.toString());
      _apiResponse.status = Status.ERROR;
      notifyListeners();
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }

}
