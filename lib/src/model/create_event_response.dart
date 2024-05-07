class create_event_response {
  String? status;
  int? code;
  String? message;
  Data? data;

  create_event_response({this.status, this.code, this.message, this.data});

  create_event_response.fromJson(Map<String, dynamic> json) {
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
  String? eventName;
  String? eventType;
  String? startDate;
  String? endDate;
  String? locationId;
  String? description;
  String? status;
  String? userId;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.eventName,
        this.eventType,
        this.startDate,
        this.endDate,
        this.locationId,
        this.description,
        this.status,
        this.userId,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    eventName = json['event_name'];
    eventType = json['event_type'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    locationId = json['location_id'];
    description = json['description'];
    status = json['Status'];

    userId = json['userId'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_name'] = this.eventName;
    data['event_type'] = this.eventType;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['location_id'] = this.locationId;
    data['description'] = this.description;
    data['Status'] = this.status;

    data['userId'] = this.userId;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
