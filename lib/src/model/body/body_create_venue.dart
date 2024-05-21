class body_create_venue {
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
  String? eventId;


  body_create_venue(
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
        this.eventId,});

  body_create_venue.fromJson(Map<String, dynamic> json) {
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
    eventId = json['event_id'];

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
    data['event_id'] = this.eventId;

    return data;
  }
}
