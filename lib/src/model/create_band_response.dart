class create_band_response {
  String? status;
  int? code;
  String? message;
  Data? data;

  create_band_response({this.status, this.code, this.message, this.data});

  create_band_response.fromJson(Map<String, dynamic> json) {
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
  String? bandName;
  String? genre;
  String? contactPerson;
  String? contactNumber;
  String? email;
  String? address;
  List<String>? images;
  String? sId;
  int? iV;

  Data(
      {this.eventId,
        this.bandName,
        this.genre,
        this.contactPerson,
        this.contactNumber,
        this.email,
        this.address,
        this.images,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    bandName = json['BandName'];
    genre = json['Genre'];
    contactPerson = json['ContactPerson'];
    contactNumber = json['ContactNumber'];
    email = json['Email'];
    address = json['Address'];
    images = json['images'].cast<String>();
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = this.eventId;
    data['BandName'] = this.bandName;
    data['Genre'] = this.genre;
    data['ContactPerson'] = this.contactPerson;
    data['ContactNumber'] = this.contactNumber;
    data['Email'] = this.email;
    data['Address'] = this.address;
    data['images'] = this.images;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
