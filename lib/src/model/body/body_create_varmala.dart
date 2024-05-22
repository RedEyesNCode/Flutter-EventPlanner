class body_create_varmala {
  String? sId;
  String? name;
  String? varmalaSubcategory;
  String? date;
  String? location;
  String? description;
  String? category;
  String? numberOfGuests;
  String? requirements;
  String? eventId;

  body_create_varmala(
      {this.sId,
        this.name,
        this.varmalaSubcategory,
        this.date,
        this.location,
        this.description,
        this.category,
        this.numberOfGuests,
        this.requirements,
        this.eventId});

  body_create_varmala.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    varmalaSubcategory = json['varmala_subcategory'];
    date = json['date'];
    location = json['location'];
    description = json['description'];
    category = json['category'];
    numberOfGuests = json['number_of_guests'];
    requirements = json['requirements'];
    eventId = json['eventId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['varmala_subcategory'] = this.varmalaSubcategory;
    data['date'] = this.date;
    data['location'] = this.location;
    data['description'] = this.description;
    data['category'] = this.category;
    data['number_of_guests'] = this.numberOfGuests;
    data['requirements'] = this.requirements;
    data['eventId'] = this.eventId;
    return data;
  }
}
