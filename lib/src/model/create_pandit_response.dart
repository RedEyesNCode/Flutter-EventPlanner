class create_pandit_response {
  String? status;
  int? code;
  String? message;
  Data? data;

  create_pandit_response({this.status, this.code, this.message, this.data});

  create_pandit_response.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? address;
  String? contact;
  String? description;
  String? speciality;
  String? yearsOfExperience;
  String? eventId;
  String? sId;
  int? iV;

  Data(
      {this.name,
        this.address,
        this.contact,
        this.description,
        this.speciality,
        this.yearsOfExperience,
        this.eventId,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    contact = json['contact'];
    description = json['description'];
    speciality = json['speciality'];
    yearsOfExperience = json['years_of_experience'];
    eventId = json['event_id'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['contact'] = this.contact;
    data['description'] = this.description;
    data['speciality'] = this.speciality;
    data['years_of_experience'] = this.yearsOfExperience;
    data['event_id'] = this.eventId;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
