class body_create_weddingdress {
  String? sId;
  String? name;
  String? weddingDressSubcategory;
  String? designer;
  String? style;
  String? color;
  String? fabric;
  String? size;
  String? price;
  String? description;
  String? availability;
  String? rating;
  String? tags;
  String? eventId;

  body_create_weddingdress(
      {this.sId,
        this.name,
        this.weddingDressSubcategory,
        this.designer,
        this.style,
        this.color,
        this.fabric,
        this.size,
        this.price,
        this.description,
        this.availability,
        this.rating,
        this.tags,
        this.eventId});

  body_create_weddingdress.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    weddingDressSubcategory = json['wedding_dress_subcategory'];
    designer = json['designer'];
    style = json['style'];
    color = json['color'];
    fabric = json['fabric'];
    size = json['size'];
    price = json['price'];
    description = json['description'];
    availability = json['availability'];
    rating = json['rating'];
    tags = json['tags'];
    eventId = json['event_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['wedding_dress_subcategory'] = this.weddingDressSubcategory;
    data['designer'] = this.designer;
    data['style'] = this.style;
    data['color'] = this.color;
    data['fabric'] = this.fabric;
    data['size'] = this.size;
    data['price'] = this.price;
    data['description'] = this.description;
    data['availability'] = this.availability;
    data['rating'] = this.rating;
    data['tags'] = this.tags;
    data['event_id'] = this.eventId;
    return data;
  }
}
