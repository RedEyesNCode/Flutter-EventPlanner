class create_tenthouse_response {
  String? status;
  int? code;
  String? message;
  Data? data;

  create_tenthouse_response({this.status, this.code, this.message, this.data});

  create_tenthouse_response.fromJson(Map<String, dynamic> json) {
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
  String? string;
  String? adderss;
  String? description;
  String? price;
  String? availability;
  String? sId;
  int? iV;

  Data(
      {this.name,
        this.string,
        this.adderss,
        this.description,
        this.price,
        this.availability,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    string = json['String'];
    adderss = json['adderss'];
    description = json['description'];

    price = json['price'];
    availability = json['availability'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['String'] = this.string;
    data['adderss'] = this.adderss;
    data['description'] = this.description;

    data['price'] = this.price;
    data['availability'] = this.availability;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
