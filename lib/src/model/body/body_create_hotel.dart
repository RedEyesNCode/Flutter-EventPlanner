class body_create_hotel {
  String? sId;
  String? hotelName;
  String? hotelAddress;
  String? hotelCapacity;
  String? hotelNumber;
  String? hotelCheckin;
  String? hotelCheckout;
  String? hotelPrice;
  String? eventId;

  body_create_hotel(
      {this.sId,
        this.hotelName,
        this.hotelAddress,
        this.hotelCapacity,
        this.hotelNumber,
        this.hotelCheckin,
        this.hotelCheckout,
        this.hotelPrice,
        this.eventId});

  body_create_hotel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    hotelName = json['hotel_name'];
    hotelAddress = json['hotel_address'];
    hotelCapacity = json['hotel_capacity'];
    hotelNumber = json['hotel_number'];
    hotelCheckin = json['hotel_checkin'];
    hotelCheckout = json['hotel_checkout'];
    hotelPrice = json['hotel_price'];
    eventId = json['event_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['hotel_name'] = this.hotelName;
    data['hotel_address'] = this.hotelAddress;
    data['hotel_capacity'] = this.hotelCapacity;
    data['hotel_number'] = this.hotelNumber;
    data['hotel_checkin'] = this.hotelCheckin;
    data['hotel_checkout'] = this.hotelCheckout;
    data['hotel_price'] = this.hotelPrice;
    data['event_id'] = this.eventId;
    return data;
  }
}
