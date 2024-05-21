class body_create_band {
  String? sId;
  String? eventId;
  String? bandName;
  String? genre;
  String? contactPerson;
  String? contactNumber;
  String? email;
  String? address;

  body_create_band(
      {this.sId,
        this.eventId,
        this.bandName,
        this.genre,
        this.contactPerson,
        this.contactNumber,
        this.email,
        this.address});

  body_create_band.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    eventId = json['event_id'];
    bandName = json['BandName'];
    genre = json['Genre'];
    contactPerson = json['ContactPerson'];
    contactNumber = json['ContactNumber'];
    email = json['Email'];
    address = json['Address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['event_id'] = this.eventId;
    data['BandName'] = this.bandName;
    data['Genre'] = this.genre;
    data['ContactPerson'] = this.contactPerson;
    data['ContactNumber'] = this.contactNumber;
    data['Email'] = this.email;
    data['Address'] = this.address;
    return data;
  }
}
