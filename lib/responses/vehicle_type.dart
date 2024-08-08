import 'package:rider/responses/base_responses/base_response.dart';

class VehicleTypeResponse extends BaseResponse {
  List<VehicleType>? body;

  VehicleTypeResponse(success, error, {this.body})
      : super(success, error: error);

  VehicleTypeResponse.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    success = json['success'];
    error = json['error'];
    if (json['body'] != null) {
      body = <VehicleType>[];
      json['body'].forEach((v) {
        body!.add(VehicleType.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['error'] = error;
    if (body != null) {
      data['body'] = body!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VehicleType {
  int? id;
  String? name;
  String? description;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  VehicleType(
      {this.id,
      this.name,
      this.description,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  VehicleType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
