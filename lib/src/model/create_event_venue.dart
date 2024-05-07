class create_event_venue_response {
  String? status;
  int? code;
  String? message;
  Data? data;

  create_event_venue_response(
      {this.status, this.code, this.message, this.data});

  create_event_venue_response.fromJson(Map<String, dynamic> json) {
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
  String? venueName;
  String? venueAddress;
  String? venueCapacity;
  String? venueContactPerson;
  String? contactEmailPhone;
  String? additionalServices;
  String? parkingFacility;
  String? alcoholPermission;
  String? cost;
  String? paymentTerms;
  String? securityNeeds;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.venueName,
        this.venueAddress,
        this.venueCapacity,
        this.venueContactPerson,
        this.contactEmailPhone,
        this.additionalServices,
        this.parkingFacility,
        this.alcoholPermission,
        this.cost,
        this.paymentTerms,
        this.securityNeeds,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    venueName = json['venue_name'];
    venueAddress = json['venue_address'];
    venueCapacity = json['venue_capacity'];
    venueContactPerson = json['venue_contact_person'];
    contactEmailPhone = json['contact_email_phone'];
    additionalServices = json['additional_services'];
    parkingFacility = json['parking_facility'];
    alcoholPermission = json['alcohol_permission'];
    cost = json['cost'];
    paymentTerms = json['payment_terms'];
    securityNeeds = json['security_needs'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['venue_name'] = this.venueName;
    data['venue_address'] = this.venueAddress;
    data['venue_capacity'] = this.venueCapacity;
    data['venue_contact_person'] = this.venueContactPerson;
    data['contact_email_phone'] = this.contactEmailPhone;
    data['additional_services'] = this.additionalServices;
    data['parking_facility'] = this.parkingFacility;
    data['alcohol_permission'] = this.alcoholPermission;
    data['cost'] = this.cost;
    data['payment_terms'] = this.paymentTerms;
    data['security_needs'] = this.securityNeeds;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
