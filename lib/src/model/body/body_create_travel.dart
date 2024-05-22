class body_create_travel {
  String? sId;
  String? serviceName;
  String? travelSubcategory;
  String? clientName;
  String? typeOfCoverage;
  String? duration;
  String? hourlyRate;
  String? vehcileType;
  String? pickupLocation;
  String? dropoffLocation;
  String? number;
  String? eventId;

  body_create_travel(
      {this.sId,
        this.serviceName,
        this.travelSubcategory,
        this.clientName,
        this.typeOfCoverage,
        this.duration,
        this.hourlyRate,
        this.vehcileType,
        this.pickupLocation,
        this.dropoffLocation,
        this.number,
        this.eventId});

  body_create_travel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    serviceName = json['service_name'];
    travelSubcategory = json['travel_subcategory'];
    clientName = json['client_name'];
    typeOfCoverage = json['type_of_coverage'];
    duration = json['duration'];
    hourlyRate = json['hourly_rate'];
    vehcileType = json['vehcile_type'];
    pickupLocation = json['pickup_location'];
    dropoffLocation = json['dropoff_location'];
    number = json['number'];
    eventId = json['event_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['service_name'] = this.serviceName;
    data['travel_subcategory'] = this.travelSubcategory;
    data['client_name'] = this.clientName;
    data['type_of_coverage'] = this.typeOfCoverage;
    data['duration'] = this.duration;
    data['hourly_rate'] = this.hourlyRate;
    data['vehcile_type'] = this.vehcileType;
    data['pickup_location'] = this.pickupLocation;
    data['dropoff_location'] = this.dropoffLocation;
    data['number'] = this.number;
    data['event_id'] = this.eventId;
    return data;
  }
}
