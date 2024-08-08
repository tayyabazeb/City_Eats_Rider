// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  int? status;
  int? restaurantId;
  int? userTypeId;
  String? fcmToken;
  String? locationId;
  double? lat;
  double? lng;
  String? image;
  String? contactNumber;
  String? createdAt;
  String? updatedAt;
  int userOnline = 0;
  int riderBusy = 0;
  int verified = 0;
  int isDocumentsVerified = 0;
  int isAddressAdded = 0;
  int isLicenseAdded = 0;
  int isVehicleAdded = 0;

  UserProfile(
    this.userOnline,
    this.riderBusy,
    this.verified,
    this.isDocumentsVerified,
    this.isAddressAdded,
    this.isLicenseAdded,
    this.isVehicleAdded, {
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.status,
    this.restaurantId,
    this.userTypeId,
    this.fcmToken,
    this.locationId,
    this.lat,
    this.lng,
    this.image,
    this.contactNumber,
    this.createdAt,
    this.updatedAt,
  });

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    status = json['status'];
    restaurantId = json['restaurant_id'];
    userTypeId = json['user_type_id'];
    fcmToken = json['fcm_token'];
    locationId = json['location_id'];
    lat = json['lat'];
    lng = json['lng'];
    image = json['image'];
    contactNumber = json['contact_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userOnline = json['user_online'] ?? 0;
    riderBusy = json['rider_busy'] ?? 0;
    verified = json['verified'] ?? 0;
    isDocumentsVerified = json['is_documents_verified'] ?? 0;
    isAddressAdded = json['is_address_added'] ?? 0;
    isLicenseAdded = json['is_license_added'] ?? 0;
    isVehicleAdded = json['is_vehicle_added'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['status'] = status;
    data['restaurant_id'] = restaurantId;
    data['user_type_id'] = userTypeId;
    data['fcm_token'] = fcmToken;
    data['location_id'] = locationId;
    data['lat'] = lat;
    data['lng'] = lng;
    data['image'] = image;
    data['contact_number'] = contactNumber;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['user_online'] = userOnline;
    data['rider_busy'] = riderBusy;
    data['verified'] = verified;
    data['is_documents_verified'] = isDocumentsVerified;
    data['is_license_added'] = isLicenseAdded;
    data['is_address_added'] = isAddressAdded;
    data['is_vehicle_added'] = isVehicleAdded;
    return data;
  }

  @override
  List<Object?> get props => throw UnimplementedError();

  factory UserProfile.dummyObj() => UserProfile(
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        name: "",
        email: "",
        id: -1, // Change id to Agent id
        fcmToken: '',
        createdAt: "",
        updatedAt: "",
      );
}
