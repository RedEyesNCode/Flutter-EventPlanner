class create_hotel_response {
  String? status;
  int? code;
  String? message;
  Data? data;

  create_hotel_response({this.status, this.code, this.message, this.data});

  create_hotel_response.fromJson(Map<String, dynamic> json) {
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
  String? hotelName;
  String? hotelAddress;
  String? hotelCapacity;
  String? hotelNumber;
  String? hotelCheckin;
  String? hotelCheckout;
  String? hotelPrice;
  List<String>? images;
  String? eventId;
  String? sId;
  int? iV;

  Data(
      {this.hotelName,
        this.hotelAddress,
        this.hotelCapacity,
        this.hotelNumber,
        this.hotelCheckin,
        this.hotelCheckout,
        this.hotelPrice,
        this.images,
        this.eventId,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    hotelName = json['hotel_name'];
    hotelAddress = json['hotel_address'];
    hotelCapacity = json['hotel_capacity'];
    hotelNumber = json['hotel_number'];
    hotelCheckin = json['hotel_checkin'];
    hotelCheckout = json['hotel_checkout'];
    hotelPrice = json['hotel_price'];
    images = json['images'].cast<String>();
    eventId = json['event_id'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hotel_name'] = this.hotelName;
    data['hotel_address'] = this.hotelAddress;
    data['hotel_capacity'] = this.hotelCapacity;
    data['hotel_number'] = this.hotelNumber;
    data['hotel_checkin'] = this.hotelCheckin;
    data['hotel_checkout'] = this.hotelCheckout;
    data['hotel_price'] = this.hotelPrice;
    data['images'] = this.images;
    data['event_id'] = this.eventId;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
