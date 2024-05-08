class create_djband_response {
  String? status;
  int? code;
  String? message;
  Data? data;

  create_djband_response({this.status, this.code, this.message, this.data});

  create_djband_response.fromJson(Map<String, dynamic> json) {
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
  String? djBandName;
  String? members;
  String? genre;
  String? description;
  String? availability;
  String? rate;
  String? location;
  String? equipment;
  String? reviews;
  String? rating;
  String? contactInformation;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.djBandName,
        this.members,
        this.genre,
        this.description,
        this.availability,
        this.rate,
        this.location,
        this.equipment,
        this.reviews,
        this.rating,
        this.contactInformation,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    djBandName = json['dj_band_name'];
    members = json['members'];
    genre = json['genre'];
    description = json['description'];
    availability = json['availability'];
    rate = json['rate'];
    location = json['location'];
    equipment = json['equipment'];
    reviews = json['reviews'];
    rating = json['rating'];

    contactInformation = json['contact_information'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dj_band_name'] = this.djBandName;
    data['members'] = this.members;
    data['genre'] = this.genre;
    data['description'] = this.description;
    data['availability'] = this.availability;
    data['rate'] = this.rate;
    data['location'] = this.location;
    data['equipment'] = this.equipment;
    data['reviews'] = this.reviews;
    data['rating'] = this.rating;

    data['contact_information'] = this.contactInformation;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
