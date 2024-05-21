class body_create_decoration {
  String? decorSubcategory;
  String? sId;
  String? name;
  String? members;
  String? description;
  String? hourlyRate;
  String? minHours;
  String? rate;
  String? location;
  String? eventId;
  String? number;

  body_create_decoration(
      {this.decorSubcategory,
        this.sId,
        this.name,
        this.members,
        this.description,
        this.hourlyRate,
        this.minHours,
        this.rate,
        this.location,
        this.eventId,
        this.number});

  body_create_decoration.fromJson(Map<String, dynamic> json) {
    decorSubcategory = json['decor_subcategory'];
    sId = json['_id'];
    name = json['name'];
    members = json['members'];
    description = json['description'];
    hourlyRate = json['hourlyRate'];
    minHours = json['minHours'];
    rate = json['rate'];
    location = json['location'];
    eventId = json['eventId'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['decor_subcategory'] = this.decorSubcategory;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['members'] = this.members;
    data['description'] = this.description;
    data['hourlyRate'] = this.hourlyRate;
    data['minHours'] = this.minHours;
    data['rate'] = this.rate;
    data['location'] = this.location;
    data['eventId'] = this.eventId;
    data['number'] = this.number;
    return data;
  }
}
