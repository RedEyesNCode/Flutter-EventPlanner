class body_create_event {

  String? eventname;
  String? eventtype;
  String? startdate;
  String? enddate;
  String? description;
  String? status;
  String? userId;
  String? locationid;

  body_create_event({this.eventname, this.eventtype, this.startdate, this.enddate, this.description, this.status, this.userId, this.locationid});

  body_create_event.fromJson(Map<String, dynamic> json) {
    eventname = json['event_name'];
    eventtype = json['event_type'];
    startdate = json['start_date'];
    enddate = json['end_date'];
    description = json['description'];
    status = json['Status'];
    userId = json['userId'];
    locationid = json['location_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['event_name'] = eventname;
    data['event_type'] = eventtype;
    data['start_date'] = startdate;
    data['end_date'] = enddate;
    data['description'] = description;
    data['Status'] = status;
    data['userId'] = userId;
    data['location_id'] = locationid;
    return data;
  }

}