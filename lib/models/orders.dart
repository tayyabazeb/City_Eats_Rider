import 'package:rider/models/order_address.dart';
import 'package:rider/models/order_detials.dart';
import 'package:rider/responses/active_order_response.dart';
import 'package:rider/responses/cart_response.dart';

class Orders {
  int? id;
  int? userId;
  String? orderAmount;
  String? couponDiscountAmount;
  dynamic couponDiscountTitle;
  String? paymentStatus;
  String? orderStatus;
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
  String? deliveryAddress;
  int? scheduled;
  String? storeDiscountAmount;
  String? originalDeliveryCharge;
  dynamic failed;
  String? adjusment;
  int? edited;
  String? riderPickingStatus;
  List<OrderDetail>? orderDetail;
  Restaurant? restaurant;
  double? vat;
  double? serviceCharges;
  double? bagFee;
  OrderAddress? address;
  User? user;

  Orders(
      {this.id,
      this.userId,
      this.address,
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
      this.couponCode,
      this.orderNote,
      this.restaurant,
      this.orderType,
      this.checked,
      this.restaurantId,
      this.createdAt,
      this.updatedAt,
      this.deliveryCharge,
      this.scheduleAt,
      this.callback,
      this.otp,
      this.pending,
      this.accepted,
      this.confirmed,
      this.vat,
      this.bagFee,
      this.serviceCharges,
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

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    orderAmount = json['order_amount'];
    couponDiscountAmount = json['coupon_discount_amount'];
    couponDiscountTitle = json['coupon_discount_title'];
    paymentStatus = json['payment_status'];
    orderStatus = json['order_status'];
    totalTaxAmount = json['total_tax_amount'];
    vat = double.parse((json['VAT'] ?? 0).toString());
    serviceCharges = double.parse((json['service_charges'] ?? 0).toString());
    bagFee = double.parse((json['bag_fee'] ?? 0).toString());

    ///
    address =
        json['address'] != null ? OrderAddress.fromJson(json['address']) : null;
    adminCommission = double.parse(json['admin_commission'].toString());
    paymentMethod = json['payment_method'];
    transactionReference = json['transaction_reference'];
    deliveryAddressId = json['deliveryAddressId'];
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
    deliveryAddress = json['address']['address'];
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
        orderDetail!.add(OrderDetail.fromJson(v));
      });
    }
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['restaurant'] != null) {
      restaurant = Restaurant.fromJson(json['restaurant']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['order_amount'] = orderAmount;
    data['coupon_discount_amount'] = couponDiscountAmount;
    data['coupon_discount_title'] = couponDiscountTitle;
    data['payment_status'] = paymentStatus;
    data['order_status'] = orderStatus;
    data['total_tax_amount'] = totalTaxAmount;
    data['admin_commission'] = adminCommission;
    if (address != null) {
      data['address'] = address?.toJson();
    }
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
    if (orderDetail != null) {
      data['order_detail'] = orderDetail!.map((v) => v.toJson()).toList();
    }
    if (restaurant != null) {
      data['restaurant'] = restaurant?.toJson();
    }
    if (user != null) {
      data['user'] = user?.toJson();
    }
    return data;
  }
}
