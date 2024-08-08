import 'package:rider/responses/base_responses/base_response.dart';
import 'package:rider/responses/order_response.dart';

class EarningsResponse extends BaseResponse {
  Body? body;

  EarningsResponse(success, error, {this.body}) : super(success, error: error);

  EarningsResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    success = json['success'];
    error = json['error'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
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

class Body {
  List<OrderModel>? pendingAmounts;
  List<OrderModel>? clearedAmounts;

  Body({this.pendingAmounts, this.clearedAmounts});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['pending_amounts'] != null) {
      pendingAmounts = <OrderModel>[];
      json['pending_amounts'].forEach((v) {
        pendingAmounts!.add(OrderModel.fromJson(v));
      });
    }
    if (json['cleared_amounts'] != null) {
      clearedAmounts = <OrderModel>[];
      json['cleared_amounts'].forEach((v) {
        clearedAmounts!.add(OrderModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pendingAmounts != null) {
      data['pending_amounts'] = pendingAmounts!.map((v) => v.toJson()).toList();
    }
    if (clearedAmounts != null) {
      data['cleared_amounts'] = clearedAmounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
