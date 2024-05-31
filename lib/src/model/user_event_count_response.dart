class user_event_count_response {
  String? status;
  int? code;
  Data? data;

  user_event_count_response({this.status, this.code, this.data});

  user_event_count_response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? pHOTOVIDEO;
  int? dECORATION;
  int? dJANDBAND;
  int? mAKEUP;
  int? pANDIT;
  int? tENTHOUSE;
  int? tRAVEL;
  int? vARMALAENTRY;
  int? vENUE;
  int? wEDDINGDRESS;
  int? cATERING;
  int? dHOL;
  int? bAND;
  int? eNTERTAINMENT;

  Data(
      {this.pHOTOVIDEO,
        this.dECORATION,
        this.dJANDBAND,
        this.mAKEUP,
        this.pANDIT,
        this.tENTHOUSE,
        this.tRAVEL,
        this.vARMALAENTRY,
        this.vENUE,
        this.wEDDINGDRESS,
        this.cATERING,
        this.dHOL,
        this.bAND,
        this.eNTERTAINMENT});

  Data.fromJson(Map<String, dynamic> json) {
    pHOTOVIDEO = json['PHOTO-VIDEO'];
    dECORATION = json['DECORATION'];
    dJANDBAND = json['DJ AND BAND'];
    mAKEUP = json['MAKE-UP'];
    pANDIT = json['PANDIT'];
    tENTHOUSE = json['TENTHOUSE'];
    tRAVEL = json['TRAVEL'];
    vARMALAENTRY = json['VARMALA-ENTRY'];
    vENUE = json['VENUE'];
    wEDDINGDRESS = json['WEDDING DRESS'];
    cATERING = json['CATERING'];
    dHOL = json['DHOL'];
    bAND = json['BAND'];
    eNTERTAINMENT = json['ENTERTAINMENT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PHOTO-VIDEO'] = this.pHOTOVIDEO;
    data['DECORATION'] = this.dECORATION;
    data['DJ AND BAND'] = this.dJANDBAND;
    data['MAKE-UP'] = this.mAKEUP;
    data['PANDIT'] = this.pANDIT;
    data['TENTHOUSE'] = this.tENTHOUSE;
    data['TRAVEL'] = this.tRAVEL;
    data['VARMALA-ENTRY'] = this.vARMALAENTRY;
    data['VENUE'] = this.vENUE;
    data['WEDDING DRESS'] = this.wEDDINGDRESS;
    data['CATERING'] = this.cATERING;
    data['DHOL'] = this.dHOL;
    data['BAND'] = this.bAND;
    data['ENTERTAINMENT'] = this.eNTERTAINMENT;
    return data;
  }
}
