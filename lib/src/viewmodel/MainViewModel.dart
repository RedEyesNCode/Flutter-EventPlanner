import 'package:flutter/material.dart';
import 'package:flutter_eventplanner/src/model/login_response.dart';
import 'package:flutter_eventplanner/src/repository/MainRepository.dart';
import 'package:flutter_eventplanner/src/utils/api_response.dart';
import 'package:flutter_eventplanner/src/utils/app_exception.dart';


class MainViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');
  login_response? _loginResponse;
  bool _shouldNotifyListeners = false; // Flag to control listener notification

  ApiResponse get response => _apiResponse;
  login_response? get loginResponse => _loginResponse;

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
      // _apiResponse = ApiResponse.error('Error code: '+ _loginResponse!.message); // Problem!

      print('Exception of type ${e.runtimeType} caught: $e');
      if (_loginResponse?.message is String) {
        _apiResponse = ApiResponse.error('Error code: ${_loginResponse!.message}');
      } else {
        _apiResponse = ApiResponse.error('An error occurred');
      }

      _apiResponse = ApiResponse.error('Error : '+e.toString());
      print(e);
    }
    _notifyListenersIfNeeded(); // Notify listeners only once after all state changes
  }

}
