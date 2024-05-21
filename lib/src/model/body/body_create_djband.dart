class body_create_djband {
  String? sId;
  String? djBandName;
  String? members;
  String? genre;
  String? description;
  String? availability;
  String? rate;
  String? location;
  String? equipment;
  String? reviews;
  String? rating;
  String? contactInformation;

  body_create_djband(
      {this.sId,
        this.djBandName,
        this.members,
        this.genre,
        this.description,
        this.availability,
        this.rate,
        this.location,
        this.equipment,
        this.reviews,
        this.rating,
        this.contactInformation});

  body_create_djband.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    djBandName = json['dj_band_name'];
    members = json['members'];
    genre = json['genre'];
    description = json['description'];
    availability = json['availability'];
    rate = json['rate'];
    location = json['location'];
    equipment = json['equipment'];
    reviews = json['reviews'];
    rating = json['rating'];
    contactInformation = json['contact_information'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['dj_band_name'] = this.djBandName;
    data['members'] = this.members;
    data['genre'] = this.genre;
    data['description'] = this.description;
    data['availability'] = this.availability;
    data['rate'] = this.rate;
    data['location'] = this.location;
    data['equipment'] = this.equipment;
    data['reviews'] = this.reviews;
    data['rating'] = this.rating;
    data['contact_information'] = this.contactInformation;
    return data;
  }
}
