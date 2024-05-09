class getall_categories_response {
  String? status;
  int? code;
  String? message;
  List<Data>? data;

  getall_categories_response({this.status, this.code, this.message, this.data});

  getall_categories_response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? categoriesName;
  String? description;
  List<String>? events;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
        this.categoriesName,
        this.description,
        this.events,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    categoriesName = json['categories_name'];
    description = json['description'];
    events = json['events'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['categories_name'] = this.categoriesName;
    data['description'] = this.description;
    data['events'] = this.events;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
