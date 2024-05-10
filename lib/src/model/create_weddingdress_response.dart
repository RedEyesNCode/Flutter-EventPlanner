class create_weddingdress_response {
  String? status;
  int? code;
  String? message;
  Data? data;

  create_weddingdress_response(
      {this.status, this.code, this.message, this.data});

  create_weddingdress_response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
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
  List<String>? images;
  String? eventId;
  String? sId;
  int? iV;

  Data(
      {this.name,
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
        this.images,
        this.eventId,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
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
    images = json['images'].cast<String>();
    eventId = json['event_id'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
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
    data['images'] = this.images;
    data['event_id'] = this.eventId;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
