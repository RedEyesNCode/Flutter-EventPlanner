import 'package:flutter_eventplanner/src/model/UserData.dart';

class login_response {
  final String?  status;
  final int? code;
  final String? message;
  final UserData data;

  login_response({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory login_response.fromJson(Map<String, dynamic> json) => login_response(
    status: json['status'],
    code: json['code'],
    message: json['message'],
    data: UserData.fromJson(json['data']),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'code': code,
    'message': message,
    'data': data.toJson(),
  };
}
