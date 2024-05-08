class user_events_response {
  String? status;
  int? code;
  String? message;
  Data? data;

  user_events_response({this.status, this.code, this.message, this.data});

  user_events_response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  String? password;
  bool? isLoggedIn;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<Events>? events;

  Data(
      {this.sId,
        this.name,
        this.email,
        this.phoneNumber,
        this.address,
        this.password,
        this.isLoggedIn,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.events});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['PhoneNumber'];
    address = json['Address'];
    password = json['password'];
    isLoggedIn = json['isLoggedIn'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['PhoneNumber'] = this.phoneNumber;
    data['Address'] = this.address;
    data['password'] = this.password;
    data['isLoggedIn'] = this.isLoggedIn;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
  String? sId;
  String? eventName;
  String? eventType;
  String? startDate;
  String? endDate;
  String? locationId;
  String? description;
  String? status;
  List<Null>? eventImageUrl;
  List<Null>? bookingDetails;
  String? userId;
  String? categoryId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Events(
      {this.sId,
        this.eventName,
        this.eventType,
        this.startDate,
        this.endDate,
        this.locationId,
        this.description,
        this.status,
        this.eventImageUrl,
        this.bookingDetails,
        this.userId,
        this.categoryId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Events.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    eventName = json['event_name'];
    eventType = json['event_type'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    locationId = json['location_id'];
    description = json['description'];
    status = json['Status'];

    userId = json['userId'];
    categoryId = json['category_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['event_name'] = this.eventName;
    data['event_type'] = this.eventType;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['location_id'] = this.locationId;
    data['description'] = this.description;
    data['Status'] = this.status;

    data['userId'] = this.userId;
    data['category_id'] = this.categoryId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
