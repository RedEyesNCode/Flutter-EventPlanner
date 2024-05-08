class create_travel_response {
  String? status;
  int? code;
  String? message;
  Data? data;

  create_travel_response({this.status, this.code, this.message, this.data});

  create_travel_response.fromJson(Map<String, dynamic> json) {
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
  String? clientName;
  String? typeOfCoverage;
  String? duration;
  String? hourlyRate;
  String? vehcileType;
  String? pickupLocation;
  String? dropoffLocation;
  String? number;
  String? sId;
  int? iV;

  Data(
      {this.serviceName,
        this.clientName,
        this.typeOfCoverage,
        this.duration,
        this.hourlyRate,
        this.vehcileType,
        this.pickupLocation,
        this.dropoffLocation,
        this.number,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    serviceName = json['service_name'];
    clientName = json['client_name'];
    typeOfCoverage = json['type_of_coverage'];
    duration = json['duration'];
    hourlyRate = json['hourly_rate'];
    vehcileType = json['vehcile_type'];
    pickupLocation = json['pickup_location'];
    dropoffLocation = json['dropoff_location'];
    number = json['number'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_name'] = this.serviceName;
    data['client_name'] = this.clientName;
    data['type_of_coverage'] = this.typeOfCoverage;
    data['duration'] = this.duration;
    data['hourly_rate'] = this.hourlyRate;
    data['vehcile_type'] = this.vehcileType;
    data['pickup_location'] = this.pickupLocation;
    data['dropoff_location'] = this.dropoffLocation;
    data['number'] = this.number;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
