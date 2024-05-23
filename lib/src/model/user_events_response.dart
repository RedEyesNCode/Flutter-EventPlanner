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
  bool? isPaid;
  List<Subscriptions>? subscriptions;
  List<Events>? events;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
        this.name,
        this.email,
        this.phoneNumber,
        this.address,
        this.password,
        this.isPaid,
        this.subscriptions,
        this.events,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['PhoneNumber'];
    address = json['Address'];
    password = json['password'];
    isPaid = json['isPaid'];
    if (json['subscriptions'] != null) {
      subscriptions = <Subscriptions>[];
      json['subscriptions'].forEach((v) {
        subscriptions!.add(new Subscriptions.fromJson(v));
      });
    }
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['PhoneNumber'] = this.phoneNumber;
    data['Address'] = this.address;
    data['password'] = this.password;
    data['isPaid'] = this.isPaid;
    if (this.subscriptions != null) {
      data['subscriptions'] =
          this.subscriptions!.map((v) => v.toJson()).toList();
    }
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Subscriptions {
  String? paymentId;
  String? orderId;
  String? amount;
  int? date;

  Subscriptions({this.paymentId, this.orderId, this.amount, this.date});

  Subscriptions.fromJson(Map<String, dynamic> json) {
    paymentId = json['paymentId'];
    orderId = json['orderId'];
    amount = json['amount'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paymentId'] = this.paymentId;
    data['orderId'] = this.orderId;
    data['amount'] = this.amount;
    data['date'] = this.date;
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
  List<String>? eventImageUrl;
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
    eventImageUrl = json['eventImageUrl'].cast<String>();

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
    data['eventImageUrl'] = this.eventImageUrl;

    data['userId'] = this.userId;
    data['category_id'] = this.categoryId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
