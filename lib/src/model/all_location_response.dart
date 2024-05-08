
class Date {
  String? id;
  String? venuename;
  String? address;
  String? capacity;
  String? contactnumber;
  String? contactname;
  String? website;
  String? createdAt;
  String? updatedAt;
  int? v;

  Date({this.id, this.venuename, this.address, this.capacity, this.contactnumber, this.contactname, this.website, this.createdAt, this.updatedAt, this.v});

  Date.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    venuename = json['venue_name'];
    address = json['address'];
    capacity = json['capacity'];
    contactnumber = json['contact_number'];
    contactname = json['contact_name'];
    website = json['website'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['venue_name'] = venuename;
    data['address'] = address;
    data['capacity'] = capacity;
    data['contact_number'] = contactnumber;
    data['contact_name'] = contactname;
    data['website'] = website;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = v;
    return data;
  }
}



class all_location_response {


  String? status;
  int? code;
  String? message;
  List<Date?>? date;

  all_location_response({this.status, this.code, this.message, this.date});

  all_location_response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['date'] != null) {
      date = <Date>[];
      json['date'].forEach((v) {
        date!.add(Date.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    data['date'] =date != null ? date!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}