class create_varmala_response {
  String? status;
  int? code;
  String? message;
  Data? data;

  create_varmala_response({this.status, this.code, this.message, this.data});

  create_varmala_response.fromJson(Map<String, dynamic> json) {
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
  String? date;
  String? location;
  String? description;
  String? category;
  String? numberOfGuests;
  String? requirements;
  String? sId;
  int? iV;

  Data(
      {this.name,
        this.date,
        this.location,
        this.description,
        this.category,
        this.numberOfGuests,
        this.requirements,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    date = json['date'];
    location = json['location'];
    description = json['description'];
    category = json['category'];
    numberOfGuests = json['number_of_guests'];
    requirements = json['requirements'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['date'] = this.date;
    data['location'] = this.location;
    data['description'] = this.description;
    data['category'] = this.category;
    data['number_of_guests'] = this.numberOfGuests;
    data['requirements'] = this.requirements;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
