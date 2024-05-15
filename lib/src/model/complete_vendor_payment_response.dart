class complete_vendor_payment_response {
  String? status;
  int? code;
  String? message;
  User? user;

  complete_vendor_payment_response(
      {this.status, this.code, this.message, this.user});

  complete_vendor_payment_response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  String? password;
  List<String>? events;
  String? createdAt;
  String? updatedAt;
  int? iV;
  bool? isPaid;
  List<Subscriptions>? subscriptions;

  User(
      {this.sId,
        this.name,
        this.email,
        this.phoneNumber,
        this.address,
        this.password,
        this.events,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.isPaid,
        this.subscriptions});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['PhoneNumber'];
    address = json['Address'];
    password = json['password'];
    events = json['events'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    isPaid = json['isPaid'];
    if (json['subscriptions'] != null) {
      subscriptions = <Subscriptions>[];
      json['subscriptions'].forEach((v) {
        subscriptions!.add(new Subscriptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['PhoneNumber'] = this.phoneNumber;
    data['Address'] = this.address;
    data['password'] = this.password;
    data['events'] = this.events;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['isPaid'] = this.isPaid;
    if (this.subscriptions != null) {
      data['subscriptions'] =
          this.subscriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subscriptions {
  String? paymentId;
  String? orderId;
  String? amount;

  Subscriptions({this.paymentId, this.orderId, this.amount});

  Subscriptions.fromJson(Map<String, dynamic> json) {
    paymentId = json['paymentId'];
    orderId = json['orderId'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paymentId'] = this.paymentId;
    data['orderId'] = this.orderId;
    data['amount'] = this.amount;
    return data;
  }
}
