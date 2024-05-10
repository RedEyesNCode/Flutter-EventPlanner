class create_catering_response {
  String? status;
  int? code;
  String? message;
  Data? data;

  create_catering_response({this.status, this.code, this.message, this.data});

  create_catering_response.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? contact;
  String? address;
  String? description;
  String? price;
  String? eventId;
  String? sId;
  int? iV;

  Data(
      {this.name,
        this.contact,
        this.address,
        this.description,
        this.price,
        this.eventId,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    contact = json['contact'];
    address = json['address'];
    description = json['description'];
    price = json['price'];
    eventId = json['event_id'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['contact'] = this.contact;
    data['address'] = this.address;
    data['description'] = this.description;
    data['price'] = this.price;
    data['event_id'] = this.eventId;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
