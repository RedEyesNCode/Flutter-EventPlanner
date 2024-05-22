class body_create_tenthouse {
  String? sId;
  String? name;
  String? tenthouseSubcategory;
  String? string;
  String? adderss;
  String? description;
  String? price;
  String? availability;
  String? eventId;

  body_create_tenthouse(
      {this.sId,
        this.name,
        this.tenthouseSubcategory,
        this.string,
        this.adderss,
        this.description,
        this.price,
        this.availability,
        this.eventId});

  body_create_tenthouse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    tenthouseSubcategory = json['tenthouse_subcategory'];
    string = json['String'];
    adderss = json['adderss'];
    description = json['description'];
    price = json['price'];
    availability = json['availability'];
    eventId = json['eventId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['tenthouse_subcategory'] = this.tenthouseSubcategory;
    data['String'] = this.string;
    data['adderss'] = this.adderss;
    data['description'] = this.description;
    data['price'] = this.price;
    data['availability'] = this.availability;
    data['eventId'] = this.eventId;
    return data;
  }
}
