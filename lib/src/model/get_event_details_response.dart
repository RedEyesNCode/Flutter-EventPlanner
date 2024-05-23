class get_event_details_response {
  String? status;
  int? code;
  String? message;
  Data? data;

  get_event_details_response({this.status, this.code, this.message, this.data});

  get_event_details_response.fromJson(Map<String, dynamic> json) {
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
  String? eventName;
  String? eventType;
  String? startDate;
  String? endDate;
  LocationId? locationId;
  String? description;
  String? status;
  List<String>? eventImageUrl;
  List<Null>? bookingDetails;
  UserId? userId;
  CategoryId? categoryId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    eventName = json['event_name'];
    eventType = json['event_type'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    locationId = json['location_id'] != null
        ? new LocationId.fromJson(json['location_id'])
        : null;
    description = json['description'];
    status = json['Status'];
    eventImageUrl = json['eventImageUrl'].cast<String>();

    userId =
    json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    categoryId = json['category_id'] != null
        ? new CategoryId.fromJson(json['category_id'])
        : null;
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
    if (this.locationId != null) {
      data['location_id'] = this.locationId!.toJson();
    }
    data['description'] = this.description;
    data['Status'] = this.status;
    data['eventImageUrl'] = this.eventImageUrl;

    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    if (this.categoryId != null) {
      data['category_id'] = this.categoryId!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class LocationId {
  String? sId;
  String? venueName;
  String? address;
  int? iV;
  String? createdAt;
  String? updatedAt;

  LocationId(
      {this.sId,
        this.venueName,
        this.address,
        this.iV,
        this.createdAt,
        this.updatedAt});

  LocationId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    venueName = json['venue_name'];
    address = json['address'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['venue_name'] = this.venueName;
    data['address'] = this.address;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class UserId {
  String? sId;
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  String? password;
  bool? isPaid;
  List<Subscriptions>? subscriptions;
  List<String>? events;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserId(
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

  UserId.fromJson(Map<String, dynamic> json) {
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
    events = json['events'].cast<String>();
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
    data['events'] = this.events;
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

class CategoryId {
  String? sId;
  String? categoriesName;
  String? description;
  List<String>? events;
  int? iV;
  String? createdAt;
  String? updatedAt;

  CategoryId(
      {this.sId,
        this.categoriesName,
        this.description,
        this.events,
        this.iV,
        this.createdAt,
        this.updatedAt});

  CategoryId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    categoriesName = json['categories_name'];
    description = json['description'];
    events = json['events'].cast<String>();
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['categories_name'] = this.categoriesName;
    data['description'] = this.description;
    data['events'] = this.events;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
