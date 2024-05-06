


import 'package:flutter_eventplanner/src/services/AppHttpService.dart';
import 'package:flutter_eventplanner/src/services/base_service.dart';

import '../model/login_response.dart';

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

}