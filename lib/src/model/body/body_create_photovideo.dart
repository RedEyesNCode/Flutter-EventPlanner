class body_create_photovideo {
  String? sId;
  String? serviceName;
  String? photovideoSubcategory;
  String? clientName;
  String? typeOfCoverage;
  String? duration;
  String? hourlyRate;
  String? contactInformation;
  String? eventId;

  body_create_photovideo(
      {this.sId,
        this.serviceName,
        this.photovideoSubcategory,
        this.clientName,
        this.typeOfCoverage,
        this.duration,
        this.hourlyRate,
        this.contactInformation,
        this.eventId});

  body_create_photovideo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    serviceName = json['service_name'];
    photovideoSubcategory = json['photovideo_subcategory'];
    clientName = json['client_name'];
    typeOfCoverage = json['type_of_coverage'];
    duration = json['duration'];
    hourlyRate = json['hourly_rate'];
    contactInformation = json['contact_information'];
    eventId = json['event_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['service_name'] = this.serviceName;
    data['photovideo_subcategory'] = this.photovideoSubcategory;
    data['client_name'] = this.clientName;
    data['type_of_coverage'] = this.typeOfCoverage;
    data['duration'] = this.duration;
    data['hourly_rate'] = this.hourlyRate;
    data['contact_information'] = this.contactInformation;
    data['event_id'] = this.eventId;
    return data;
  }
}
