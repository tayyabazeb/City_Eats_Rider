import 'package:rider/responses/base_responses/base_response.dart';

class AddressResponse extends BaseResponse {
  AddressObject? body;

  AddressResponse(success, errors, {this.body}) : super(success, error: errors);

  AddressResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    success = json['success'];
    error = json['error'];
    body = json['body'] != null ? AddressObject.fromJson(json['body']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['error'] = error;
    if (body != null) {
      data['body'] = body!.toJson();
    }
    return data;
  }
}

class AddressObject {
  int? id;
  String? lat;
  String? lang;
  dynamic type;
  String? address;
  String? zipCode;
  int? userId;
  dynamic apt;
  String? city;
  String? building;
  String? state;
  String? updatedAt;
  dynamic createdAt;
  dynamic deletedAt;

  AddressObject(
      {this.id,
      this.lat,
      this.lang,
      this.type,
      this.address,
      this.building,
      this.zipCode,
      this.userId,
      this.apt,
      this.city,
      this.state,
      this.updatedAt,
      this.createdAt,
      this.deletedAt});

  AddressObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lat = json['lat'];
    lang = json['lang'];
    type = json['type'];
    address = json['address'];
    building = json['building'];
    zipCode = json['zip_code'];
    userId = json['user_id'];
    apt = json['apt'];
    city = json['city'];
    state = json['state'];
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
    data['building'] = building;
    data['zip_code'] = zipCode;
    data['user_id'] = userId;
    data['apt'] = apt;
    data['city'] = city;
    data['state'] = state;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
