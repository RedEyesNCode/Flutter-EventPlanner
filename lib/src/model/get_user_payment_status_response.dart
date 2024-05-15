class get_user_payment_status_response {
  String? status;
  int? code;
  String? message;
  bool? isPaid;

  get_user_payment_status_response(
      {this.status, this.code, this.message, this.isPaid});

  get_user_payment_status_response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    isPaid = json['isPaid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    data['isPaid'] = this.isPaid;
    return data;
  }
}
