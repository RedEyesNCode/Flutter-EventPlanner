class create_decoration_response {
  String? status;
  int? code;
  String? message;
  Data? data;

  create_decoration_response({this.status, this.code, this.message, this.data});

  create_decoration_response.fromJson(Map<String, dynamic> json) {
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
  String? members;
  String? description;
  String? hourlyRate;
  String? minHours;
  String? rate;
  String? location;
  String? number;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.name,
        this.members,
        this.description,
        this.hourlyRate,
        this.minHours,
        this.rate,
        this.location,
        this.number,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    members = json['members'];
    description = json['description'];
    hourlyRate = json['hourlyRate'];
    minHours = json['minHours'];
    rate = json['rate'];
    location = json['location'];
    number = json['number'];

    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['members'] = this.members;
    data['description'] = this.description;
    data['hourlyRate'] = this.hourlyRate;
    data['minHours'] = this.minHours;
    data['rate'] = this.rate;
    data['location'] = this.location;
    data['number'] = this.number;

    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
