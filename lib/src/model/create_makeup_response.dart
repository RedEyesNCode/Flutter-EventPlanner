class create_makeup_response {
  String? status;
  int? code;
  String? message;
  Data? data;

  create_makeup_response({this.status, this.code, this.message, this.data});

  create_makeup_response.fromJson(Map<String, dynamic> json) {
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
  String? serviceName;
  String? firstName;
  String? lastName;
  String? members;
  String? description;
  String? hourlyRate;
  String? minHours;
  String? rate;
  String? location;
  String? contactInformation;
  String? sId;
  int? iV;

  Data(
      {this.serviceName,
        this.firstName,
        this.lastName,
        this.members,
        this.description,
        this.hourlyRate,
        this.minHours,
        this.rate,
        this.location,
        this.contactInformation,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    serviceName = json['service_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    members = json['members'];
    description = json['description'];
    hourlyRate = json['hourly_rate'];
    minHours = json['min_hours'];
    rate = json['rate'];
    location = json['location'];
    contactInformation = json['contact_information'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_name'] = this.serviceName;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['members'] = this.members;
    data['description'] = this.description;
    data['hourly_rate'] = this.hourlyRate;
    data['min_hours'] = this.minHours;
    data['rate'] = this.rate;
    data['location'] = this.location;
    data['contact_information'] = this.contactInformation;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
