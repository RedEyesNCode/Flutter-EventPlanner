class upload_image_response {
  String? status;
  int? code;
  String? message;
  Data? data;

  upload_image_response({this.status, this.code, this.message, this.data});

  upload_image_response.fromJson(Map<String, dynamic> json) {
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
  String? url;
  String? type;

  Data({this.url, this.type});

  Data.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['type'] = this.type;
    return data;
  }
}
