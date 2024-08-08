import 'package:rider/responses/base_responses/base_response.dart';

class VehicleResponse extends BaseResponse {
  VehicleObject? vehicle;

  VehicleResponse(success, errors, {this.vehicle})
      : super(success, error: errors);

  VehicleResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    success = json['success'] ?? false;
    error = json['error'];
    vehicle =
        json['body'] != null ? VehicleObject.fromJson(json['body']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['error'] = error;
    if (vehicle != null) {
      data['body'] = vehicle!.toJson();
    }
    return data;
  }
}

class VehicleObject {
  int? id;
  int? userId;
  String? make;
  String? model;
  int? year;
  String? licensePlate;
  String? color;
  String? v5Image;
  String? motImage;
  String? leftSideImage;
  String? rideSideImage;
  String? document;
  String? createdAt;
  String? updatedAt;
  int? vehicleTypeId;

  VehicleObject(
      {this.id,
      this.userId,
      this.make,
      this.model,
      this.year,
      this.licensePlate,
      this.color,
      this.v5Image,
      this.vehicleTypeId,
      this.motImage,
      this.leftSideImage,
      this.rideSideImage,
      this.document,
      this.createdAt,
      this.updatedAt});

  VehicleObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    make = json['make'];
    model = json['model'];
    year = json['year'];
    licensePlate = json['license_plate'];
    color = json['color'];
    v5Image = json['v5'];
    motImage = json['mot'];
    vehicleTypeId = json["vehicle_type_id"];
    leftSideImage = json['left_side_image'];
    rideSideImage = json['ride_side_image'];
    document = json['document'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['make'] = make;
    data['model'] = model;
    data['year'] = year;
    data['license_plate'] = licensePlate;
    data['color'] = color;
    data['front_image'] = v5Image;
    data['back_image'] = motImage;
    data['left_side_image'] = leftSideImage;
    data['ride_side_image'] = rideSideImage;
    data['document'] = document;
    data["vehicle_type_id"] = vehicleTypeId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
