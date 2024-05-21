class body_create_pandit {
  String? name;
  String? address;
  String? contact;
  String? description;
  String? panditSubcateogry;
  String? yearsOfExperience;
  String? speciality;
  String? eventId;

  body_create_pandit(
      {this.name,
        this.address,
        this.contact,
        this.description,
        this.panditSubcateogry,
        this.yearsOfExperience,
        this.speciality,
        this.eventId});

  body_create_pandit.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    contact = json['contact'];
    description = json['description'];
    panditSubcateogry = json['pandit_subcateogry'];
    yearsOfExperience = json['years_of_experience'];
    speciality = json['speciality'];
    eventId = json['event_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['contact'] = this.contact;
    data['description'] = this.description;
    data['pandit_subcateogry'] = this.panditSubcateogry;
    data['years_of_experience'] = this.yearsOfExperience;
    data['speciality'] = this.speciality;
    data['event_id'] = this.eventId;
    return data;
  }
}
