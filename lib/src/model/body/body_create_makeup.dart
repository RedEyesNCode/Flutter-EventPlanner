class body_create_makeup {
  String? sId;
  String? serviceName;
  String? makeupSubcategory;
  String? firstName;
  String? lastName;
  String? members;
  String? description;
  String? hourlyRate;
  String? minHours;
  String? rate;
  String? location;
  String? contactInformation;
  String? eventId;

  body_create_makeup(
      {this.sId,
        this.serviceName,
        this.makeupSubcategory,
        this.firstName,
        this.lastName,
        this.members,
        this.description,
        this.hourlyRate,
        this.minHours,
        this.rate,
        this.location,
        this.contactInformation,
        this.eventId});

  body_create_makeup.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    serviceName = json['service_name'];
    makeupSubcategory = json['makeup_subcategory'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    members = json['members'];
    description = json['description'];
    hourlyRate = json['hourly_rate'];
    minHours = json['min_hours'];
    rate = json['rate'];
    location = json['location'];
    contactInformation = json['contact_information'];
    eventId = json['event_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['service_name'] = this.serviceName;
    data['makeup_subcategory'] = this.makeupSubcategory;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['members'] = this.members;
    data['description'] = this.description;
    data['hourly_rate'] = this.hourlyRate;
    data['min_hours'] = this.minHours;
    data['rate'] = this.rate;
    data['location'] = this.location;
    data['contact_information'] = this.contactInformation;
    data['event_id'] = this.eventId;
    return data;
  }
}
