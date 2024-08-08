class OrderAddress {
  int? id;
  String? lat;
  String? lang;
  String? type;
  String? address;
  String? zipCode;
  int? userId;
  String? updatedAt;
  String? createdAt;
  dynamic deletedAt;

  OrderAddress(
      {this.id,
      this.lat,
      this.lang,
      this.type,
      this.address,
      this.zipCode,
      this.userId,
      this.updatedAt,
      this.createdAt,
      this.deletedAt});

  OrderAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lat = json['lat'];
    lang = json['lang'];
    type = json['type'];
    address = json['address'];
    zipCode = json['zip_code'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lat'] = lat;
    data['lang'] = lang;
    data['type'] = type;
    data['address'] = address;
    data['zip_code'] = zipCode;
    data['user_id'] = userId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
