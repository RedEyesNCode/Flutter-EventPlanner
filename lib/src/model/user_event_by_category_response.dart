class user_event_by_category_response {
  String? status;
  int? code;
  String? message;
  List<Data>? data;

  user_event_by_category_response(
      {this.status, this.code, this.message, this.data});

  user_event_by_category_response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
  String? locationId;
  String? description;
  String? status;
  List<String>? eventImageUrl;
  List<Null>? bookingDetails;
  String? userId;
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
    locationId = json['location_id'];
    description = json['description'];
    status = json['Status'];
    eventImageUrl = json['eventImageUrl'].cast<String>();

    userId = json['userId'];
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
    data['location_id'] = this.locationId;
    data['description'] = this.description;
    data['Status'] = this.status;
    data['eventImageUrl'] = this.eventImageUrl;

    data['userId'] = this.userId;
    if (this.categoryId != null) {
      data['category_id'] = this.categoryId!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
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
