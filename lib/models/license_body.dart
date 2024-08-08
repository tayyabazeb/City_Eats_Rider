import 'dart:io';

class LicenseBody {
  int? id;
  String issueDate;
  String expiryDate;
  String licenseNo;
  String issuingState;
  File? frontImage;
  File? backImage;

  LicenseBody({
    this.id,
    required this.issueDate,
    required this.expiryDate,
    required this.licenseNo,
    required this.issuingState,
    this.frontImage,
    this.backImage,
  });

  factory LicenseBody.fromJson(Map<String, dynamic> json) {
    return LicenseBody(
      issueDate: json['issue_date'],
      expiryDate: json['expiry_date'],
      licenseNo: json['license_no'],
      issuingState: json['issuing_date'],
      frontImage: File(json['front_image']),
      backImage: File(json['back_image']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'issue_date': issueDate,
      'expiry_date': expiryDate,
      'license_no': licenseNo,
      'issuing_date': issuingState,
      'front_image': frontImage?.path,
      'back_image': backImage?.path,
    };
  }

  static List<LicenseBody> listFromJson(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => LicenseBody.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> listToJson(List<LicenseBody> licenses) {
    return licenses.map((license) => license.toJson()).toList();
  }
}
