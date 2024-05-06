
class Data {
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  String? password;
  bool? isLoggedIn;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  Data({this.name, this.email, this.phoneNumber, this.address, this.password, this.isLoggedIn, this.id, this.createdAt, this.updatedAt, this.v});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['PhoneNumber'];
    address = json['Address'];
    password = json['password'];
    isLoggedIn = json['isLoggedIn'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['PhoneNumber'] = phoneNumber;
    data['Address'] = address;
    data['password'] = password;
    data['isLoggedIn'] = isLoggedIn;
    data['_id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = v;
    return data;
  }
}

class register_response{

  String? status;
  int? code;
  String? message;
  Data? data;

  register_response({this.status, this.code, this.message, this.data});

  register_response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data?.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    // Change here the name of the variable.

    final Map<String, dynamic> dataMap = Map<String, dynamic>();
    dataMap['status'] = status;
    dataMap['code'] = code;
    dataMap['message'] = message;
    dataMap['data'] = data!.toJson();
    return dataMap;
  }



}

