class body_create_entertainment {
  String? sId;
  String? eventId;
  String? eventName;
  String? entertainmentSubcategory;
  String? eventDescription;
  String? eventType;
  String? eventDateTime;
  String? duration;
  String? ticketPrice;

  body_create_entertainment(
      {this.sId,
        this.eventId,
        this.eventName,
        this.entertainmentSubcategory,
        this.eventDescription,
        this.eventType,
        this.eventDateTime,
        this.duration,
        this.ticketPrice});

  body_create_entertainment.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    eventId = json['event_id'];
    eventName = json['EventName'];
    entertainmentSubcategory = json['entertainment_subcategory'];
    eventDescription = json['EventDescription'];
    eventType = json['EventType'];
    eventDateTime = json['EventDateTime'];
    duration = json['Duration'];
    ticketPrice = json['TicketPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['event_id'] = this.eventId;
    data['EventName'] = this.eventName;
    data['entertainment_subcategory'] = this.entertainmentSubcategory;
    data['EventDescription'] = this.eventDescription;
    data['EventType'] = this.eventType;
    data['EventDateTime'] = this.eventDateTime;
    data['Duration'] = this.duration;
    data['TicketPrice'] = this.ticketPrice;
    return data;
  }
}
