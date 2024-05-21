class body_create_dhol {
  String? dholSubcategory;
  String? sId;
  String? eventId;
  String? groupName;
  String? contactPerson;
  String? contactNumber;
  String? email;
  String? address;

  body_create_dhol(
      {this.dholSubcategory,
        this.sId,
        this.eventId,
        this.groupName,
        this.contactPerson,
        this.contactNumber,
        this.email,
        this.address});

  body_create_dhol.fromJson(Map<String, dynamic> json) {
    dholSubcategory = json['dhol_subcategory'];
    sId = json['_id'];
    eventId = json['event_id'];
    groupName = json['GroupName'];
    contactPerson = json['ContactPerson'];
    contactNumber = json['ContactNumber'];
    email = json['Email'];
    address = json['Address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dhol_subcategory'] = this.dholSubcategory;
    data['_id'] = this.sId;
    data['event_id'] = this.eventId;
    data['GroupName'] = this.groupName;
    data['ContactPerson'] = this.contactPerson;
    data['ContactNumber'] = this.contactNumber;
    data['Email'] = this.email;
    data['Address'] = this.address;
    return data;
  }
}
