class DocumentsResponse {
  bool? success;
  String? error;
  Document? body;

  DocumentsResponse({this.success, this.error, this.body});

  DocumentsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    body = json['body'] != null ? Document.fromJson(json['body']) : null;
  }

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

class Document {
  int? id;
  int? userId;
  String? frontImage;
  String? backImage;
  String? issueDate;
  String? expiryDate;
  String? licenseNo;
  String? issuingState;
  String? createdAt;
  String? updatedAt;

  Document(
      {this.id,
      this.userId,
      this.frontImage,
      this.backImage,
      this.issueDate,
      this.expiryDate,
      this.licenseNo,
      this.issuingState,
      this.createdAt,
      this.updatedAt});

  Document.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    frontImage = json['front_image'];
    backImage = json['back_image'];
    issueDate = json['issue_date'];
    expiryDate = json['expiry_date'];
    licenseNo = json['license_no'];
    issuingState = json['issuing_state'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['front_image'] = frontImage;
    data['back_image'] = backImage;
    data['issue_date'] = issueDate;
    data['expiry_date'] = expiryDate;
    data['license_no'] = licenseNo;
    data['issuing_state'] = issuingState;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

// {"success":true,"error":null,
// "body":{"id":9,"user_id":270,"front_image":"https://cityeats.online/public/app/driver/170570469157688.jpg",
// "back_image":"https://cityeats.online/public/app/driver/170570469152380.jpg",
// "issue_date":"2024-01-20","expiry_date":"2024-01-20","license_no":"fhhccvh",
// "issuing_state":"Pakistan","created_at":"2024-01-19T22:51:31.000000Z",
// "updated_at":"2024-01-19T22:51:31.000000Z"}}
