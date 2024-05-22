class body_create_catering {
  String? sId;
  String? name;
  String? contact;
  String? cateringSubcategory;
  String? address;
  String? description;
  String? price;
  String? eventId;

  body_create_catering(
      {this.sId,
        this.name,
        this.contact,
        this.cateringSubcategory,
        this.address,
        this.description,
        this.price,
        this.eventId});

  body_create_catering.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    contact = json['contact'];
    cateringSubcategory = json['catering_subcategory'];
    address = json['address'];
    description = json['description'];
    price = json['price'];
    eventId = json['event_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['contact'] = this.contact;
    data['catering_subcategory'] = this.cateringSubcategory;
    data['address'] = this.address;
    data['description'] = this.description;
    data['price'] = this.price;
    data['event_id'] = this.eventId;
    return data;
  }
}
