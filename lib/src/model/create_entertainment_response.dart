class create_entertainment_response {
  String? status;
  int? code;
  String? message;
  Data? data;

  create_entertainment_response(
      {this.status, this.code, this.message, this.data});

  create_entertainment_response.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? eventId;
  String? eventName;
  String? eventDescription;
  String? eventType;
  String? eventDateTime;
  String? duration;
  String? ticketPrice;
  List<String>? images;
  String? sId;
  int? iV;

  Data(
      {this.eventId,
        this.eventName,
        this.eventDescription,
        this.eventType,
        this.eventDateTime,
        this.duration,
        this.ticketPrice,
        this.images,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    eventName = json['EventName'];
    eventDescription = json['EventDescription'];
    eventType = json['EventType'];
    eventDateTime = json['EventDateTime'];
    duration = json['Duration'];
    ticketPrice = json['TicketPrice'];
    images = json['images'].cast<String>();
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = this.eventId;
    data['EventName'] = this.eventName;
    data['EventDescription'] = this.eventDescription;
    data['EventType'] = this.eventType;
    data['EventDateTime'] = this.eventDateTime;
    data['Duration'] = this.duration;
    data['TicketPrice'] = this.ticketPrice;
    data['images'] = this.images;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
