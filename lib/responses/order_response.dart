import 'package:rider/app/app.logger.dart';
import 'package:rider/models/order_detials.dart';
import 'package:rider/responses/active_order_response.dart';
import 'package:rider/responses/base_responses/base_response.dart';
import 'package:rider/responses/cart_response.dart';

class OrderResponse extends BaseResponse {
  List<OrderModel>? body;

  OrderResponse(success, error, {this.body}) : super(success, error: error);

  OrderResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
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

class OrderModel {
  int? id;
  int? userId;
  String? orderAmount;
  String? couponDiscountAmount;
  dynamic couponDiscountTitle;
  String? paymentStatus;
  String? orderStatus;
  int? rating;
  Review? restReview;
  Review? riderReview;
  String? totalTaxAmount;
  double? adminCommission;
  String? paymentMethod;
  String? transactionReference;
  dynamic deliveryAddressId;
  dynamic deliveryManId;
  dynamic couponCode;
  String? orderNote;
  String? orderType;
  int? checked;
  int? restaurantId;
  String? createdAt;
  String? updatedAt;
  String? deliveryCharge;
  dynamic scheduleAt;
  dynamic callback;
  dynamic otp;
  dynamic pending;
  dynamic accepted;
  dynamic confirmed;
  dynamic processing;
  dynamic handover;
  dynamic pickedUp;
  dynamic delivered;
  dynamic canceled;
  dynamic refundRequested;
  dynamic refunded;
  dynamic deliveryAddress;
  int? scheduled;
  String? storeDiscountAmount;
  String? originalDeliveryCharge;
  dynamic failed;
  String? adjusment;
  int? edited;
  String? riderPickingStatus;
  List<OrderDetail>? orderDetail;
  Restaurant? restaurant;
  bool? canCancel;
  bool? isManual;
  double? vAT;
  double? serviceCharges;
  double? bagFee;
  double? riderCharges;
  AddressObject? deliveryAddressObj;
  User? user;
  String? subTotal;

  OrderModel(
      {this.id,
      this.userId,
      this.rating,
      this.restReview,
      this.riderReview,
      this.canCancel,
      this.deliveryAddressObj,
      this.orderAmount,
      this.couponDiscountAmount,
      this.couponDiscountTitle,
      this.paymentStatus,
      this.orderStatus,
      this.totalTaxAmount,
      this.adminCommission,
      this.paymentMethod,
      this.transactionReference,
      this.deliveryAddressId,
      this.deliveryManId,
      this.subTotal,
      this.couponCode,
      this.restaurant,
      this.orderNote,
      this.orderType,
      this.checked,
      this.restaurantId,
      this.createdAt,
      this.updatedAt,
      this.deliveryCharge,
      this.scheduleAt,
      this.callback,
      this.otp,
      this.riderCharges,
      this.pending,
      this.accepted,
      this.confirmed,
      this.vAT,
      this.serviceCharges,
      this.bagFee,
      this.processing,
      this.handover,
      this.pickedUp,
      this.delivered,
      this.canceled,
      this.refundRequested,
      this.refunded,
      this.deliveryAddress,
      this.scheduled,
      this.storeDiscountAmount,
      this.originalDeliveryCharge,
      this.failed,
      this.adjusment,
      this.edited,
      this.user,
      this.riderPickingStatus,
      this.orderDetail});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    orderAmount = json['order_amount'];
    couponDiscountAmount = json['coupon_discount_amount'];
    couponDiscountTitle = json['coupon_discount_title'];
    paymentStatus = json['payment_status'];
    orderStatus = json['order_status'];
    subTotal = json['sub_total'];
    rating = json['rating'];
    riderCharges = double.parse(json['rider_charges'].toString());
    if (json['restaurant_review'] != null) {
      restReview = Review.fromJson(json['restaurant_review']);
    }
    if (json['rider_review'] != null) {
      riderReview = Review.fromJson(json['rider_review']);
    }
    // if (json['review'] != null) {
    //   riderReview = Review.fromJson(json['review']);
    // }

    vAT = double.parse((json['VAT'] ?? 0).toString());
    serviceCharges = double.parse((json['service_charges'] ?? 0).toString());
    bagFee = double.parse((json['bag_fee'] ?? 0).toString());

    totalTaxAmount = json['total_tax_amount'];
    adminCommission = double.parse(json['admin_commission'].toString());
    paymentMethod = json['payment_method'];
    transactionReference = json['transaction_reference'];
    deliveryAddressId = json['delivery_address_id'];
    deliveryManId = json['delivery_man_id'];
    couponCode = json['coupon_code'];
    orderNote = json['order_note'];
    orderType = json['order_type'];
    checked = json['checked'];

    restaurantId = json['restaurant_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deliveryCharge = json['delivery_charge'];
    scheduleAt = json['schedule_at'];
    callback = json['callback'];
    otp = json['otp'];
    pending = json['pending'];
    accepted = json['accepted'];
    confirmed = json['confirmed'];
    processing = json['processing'];
    handover = json['handover'];
    pickedUp = json['picked_up'];
    delivered = json['delivered'];
    canceled = json['canceled'];
    refundRequested = json['refund_requested'];
    refunded = json['refunded'];
    deliveryAddress = json['delivery_address'];
    scheduled = json['scheduled'];
    storeDiscountAmount = json['store_discount_amount'];
    originalDeliveryCharge = json['original_delivery_charge'];
    failed = json['failed'];
    adjusment = json['adjusment'];
    edited = json['edited'];
    riderPickingStatus = json['rider_picking_status'];
    if (json['order_detail'] != null) {
      orderDetail = <OrderDetail>[];
      json['order_detail'].forEach((v) {
        orderDetail?.add(OrderDetail.fromJson(v));
      });
    }
    if (json['restaurant'] != null) {
      getLogger("").wtf(json['restaurant']);
      restaurant = Restaurant.fromJson(json['restaurant']);
    }
    if (json["address"] != null) {
      deliveryAddressObj = AddressObject.fromJson(json['address']);
    }
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['order_amount'] = orderAmount;
    data['coupon_discount_amount'] = couponDiscountAmount;
    data['coupon_discount_title'] = couponDiscountTitle;
    data['payment_status'] = paymentStatus;
    data['sub_total'] = subTotal;
    data['rating'] = rating;
    data['rider_charges'] = riderCharges;
    data['restaurant_review'] = restReview?.toJson();
    data['rider_review'] = riderReview?.toJson();
    data['order_status'] = orderStatus;
    data['total_tax_amount'] = totalTaxAmount;
    data['admin_commission'] = double.parse(adminCommission.toString());
    data['payment_method'] = paymentMethod;
    data['transaction_reference'] = transactionReference;
    data['delivery_address_id'] = deliveryAddressId;
    data['delivery_man_id'] = deliveryManId;
    data['coupon_code'] = couponCode;
    data['order_note'] = orderNote;
    data['order_type'] = orderType;
    data['checked'] = checked;
    data['restaurant_id'] = restaurantId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['delivery_charge'] = deliveryCharge;
    data['schedule_at'] = scheduleAt;
    data['callback'] = callback;
    data['otp'] = otp;
    data['pending'] = pending;
    data['accepted'] = accepted;
    data['confirmed'] = confirmed;
    data['processing'] = processing;
    data['handover'] = handover;
    data['picked_up'] = pickedUp;
    data['delivered'] = delivered;
    data['canceled'] = canceled;
    data['refund_requested'] = refundRequested;
    data['refunded'] = refunded;
    data['delivery_address'] = deliveryAddress;
    data['scheduled'] = scheduled;
    data['store_discount_amount'] = storeDiscountAmount;
    data['original_delivery_charge'] = originalDeliveryCharge;
    data['failed'] = failed;
    data['adjusment'] = adjusment;
    data['edited'] = edited;

    data['rider_picking_status'] = riderPickingStatus;
    if (restaurant != null) {
      data['restaurant'] = restaurant?.toJson();
    }
    if (orderDetail != null) {
      data['order_detail'] = orderDetail!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class OrderSubProduct {
  int id;
  int orderDetailId;
  String sideItemName;
  String sideItemPrice;
  String createdAt;
  String updatedAt;

  OrderSubProduct({
    required this.id,
    required this.orderDetailId,
    required this.sideItemName,
    required this.sideItemPrice,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to create an instance of the model from a JSON map
  factory OrderSubProduct.fromJson(Map<String, dynamic> json) {
    return OrderSubProduct(
      id: json['id'],
      orderDetailId: json['order_detail_id'],
      sideItemName: json['side_item_name'],
      sideItemPrice: json['side_item_price'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  // Method to convert the model into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_detail_id': orderDetailId,
      'side_item_name': sideItemName,
      'side_item_price': sideItemPrice,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class AddressObject {
  String? address;
  String? apt;
  String? city;
  String? createdAt;
  String? type;
  String? deletedAt;
  String? zipCode;
  String? updatedAt;
  int? userId;
  int? id;
  String? state;
  double? lang;
  double? lat;

  AddressObject(
      {this.address,
      this.apt,
      this.city,
      this.createdAt,
      this.type,
      this.deletedAt,
      this.zipCode,
      this.updatedAt,
      this.userId,
      this.id,
      this.state,
      this.lang,
      this.lat});

  AddressObject.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    apt = json['apt'];
    city = json['city'];
    createdAt = json['created_at'];
    type = json['type'];
    deletedAt = json['deleted_at'];
    zipCode = json['zip_code'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
    id = json['id'];
    state = json['state'];
    if (json['lang'] != null) {
      lang = double.parse(json['lang'].toString());
    }
    if (json['lat'] != null) {
      lat = double.parse(json['lat'].toString());
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['apt'] = apt;
    data['city'] = city;
    data['created_at'] = createdAt;
    data['type'] = type;
    data['deleted_at'] = deletedAt;
    data['zip_code'] = zipCode;
    data['updated_at'] = updatedAt;
    data['user_id'] = userId;
    data['id'] = id;
    data['state'] = state;
    data['lang'] = lang;
    data['lat'] = lat;
    return data;
  }
}

class Review {
  int? id;
  int? userId;
  String? reviewRemarks;
  int? reviewStar;
  int? type;
  int? typeId;
  int? reviewStatus;
  String? createdAt;
  String? updatedAt;

  Review(
      {this.id,
      this.userId,
      this.reviewRemarks,
      this.reviewStar,
      this.type,
      this.typeId,
      this.reviewStatus,
      this.createdAt,
      this.updatedAt});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    reviewRemarks = json['review_remarks'];
    reviewStar = json['review_star'];
    type = json['type'];
    typeId = json['type_id'];
    reviewStatus = json['review_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['review_remarks'] = reviewRemarks;
    data['review_star'] = reviewStar;
    data['type'] = type;
    data['type_id'] = typeId;
    data['review_status'] = reviewStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
