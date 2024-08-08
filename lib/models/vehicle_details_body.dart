import 'dart:io';

class VehicleDetails {
  String make;
  String model;
  int year;
  String licensePlate;
  String vehicleColor;
  // List<File> images;
  File? v5Image;
  File? motImage;
  File? leftSideImage;
  File? rightSideImage;
  File? documents;
  int? vehicleTypeId;

  VehicleDetails({
    required this.make,
    required this.model,
    required this.year,
    this.vehicleTypeId,
    required this.licensePlate,
    required this.vehicleColor,
    this.v5Image,
    this.motImage,
    this.leftSideImage,
    this.rightSideImage,
    this.documents,
  });

  factory VehicleDetails.fromJson(Map<String, dynamic> json) {
    return VehicleDetails(
        make: json['make'],
        model: json['model'],
        year: json['year'],
        vehicleTypeId: json['vehicle_type_id'],
        licensePlate: json['license_plate'],
        vehicleColor: json['vehicle_color'],
        // images: (json['images'] as List).map((path) => File(path)).toList(),
        v5Image: File(json['v5']),
        motImage: File(json['mot']),
        leftSideImage: File(json['left_side_image']),
        rightSideImage: File(json['ride_side_image']),
        documents: File(json['documents']));
  }

  Map<String, dynamic> toJson() {
    return {
      'make': make,
      'model': model,
      'year': year,
      'license_plate': licensePlate,
      'color': vehicleColor,
      'documents': documents?.path,
    };
  }

  static List<VehicleDetails> listFromJson(
      List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => VehicleDetails.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> listToJson(List<VehicleDetails> vehicles) {
    return vehicles.map((vehicle) => vehicle.toJson()).toList();
  }
}
