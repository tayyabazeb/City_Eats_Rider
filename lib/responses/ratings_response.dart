import 'package:rider/responses/base_responses/base_response.dart';
import 'package:rider/responses/order_response.dart';

class RatingsResponse extends BaseResponse {
  List<OrderModel>? body;

  RatingsResponse(success, error, {this.body}) : super(success, error: error);

  RatingsResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    success = json['success'];
    error = json['error'];
    if (json['body'] != null) {
      body = <OrderModel>[];
      json['body'].forEach((v) {
        body?.add(OrderModel.fromJson(v));
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
