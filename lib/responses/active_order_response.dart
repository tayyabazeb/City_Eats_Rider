import 'package:rider/responses/base_responses/base_response.dart';
import 'package:rider/responses/order_response.dart';

class CurrentRideResponse extends BaseResponse {
  OrderModel? body;

  CurrentRideResponse(succuss, errors, {this.body})
      : super(succuss, error: errors);

  CurrentRideResponse.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    body = json['body'] != null ? OrderModel.fromJson(json['body']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['error'] = error;
    if (body != null) {
      data['body'] = body?.toJson();
    }
    return data;
  }
}

// class ActiveRideOrder {
//   int? id;
//   int? userId;
//   String? subTotal;
//   String? orderAmount;
//   String? couponDiscountAmount;
//   String? couponDiscountTitle;
//   String? paymentStatus;
//   String? orderStatus;
//   String? totalTaxAmount;
//   double? adminCommission;
//   String? paymentMethod;
//   String? transactionReference;
//   int? deliveryAddressId;
//   int? deliveryManId;
//   String? couponCode;
//   String? orderNote;
//   String? orderType;
//   int? checked;
//   int? restaurantId;
//   String? createdAt;
//   String? updatedAt;
//   String? deliveryCharge;
//   dynamic scheduleAt;
//   dynamic callback;
//   dynamic otp;
//   dynamic pending;
//   dynamic accepted;
//   dynamic confirmed;
//   dynamic processing;
//   dynamic handover;
//   dynamic pickedUp;
//   dynamic delivered;
//   dynamic canceled;
//   dynamic refundRequested;
//   dynamic refunded;
//   String? deliveryAddress;
//   int? scheduled;
//   String? storeDiscountAmount;
//   String? originalDeliveryCharge;
//   dynamic failed;
//   String? adjusment;
//   int? edited;
//   String? riderPickingStatus;
//   String? isPaidToRestaurant;
//   int? cancelRequest;
//   String? vAT;
//   String? serviceCharges;
//   String? bagFee;
//   int? riderCharges;
//   List<OrderDetail>? orderDetail;
//   Restaurant? restaurant;
//   User? user;
//   RestaurantAddress? address;

//   ActiveRideOrder(
//       {this.id,
//       this.userId,
//       this.subTotal,
//       this.orderAmount,
//       this.couponDiscountAmount,
//       this.couponDiscountTitle,
//       this.paymentStatus,
//       this.orderStatus,
//       this.totalTaxAmount,
//       this.adminCommission,
//       this.paymentMethod,
//       this.transactionReference,
//       this.deliveryAddressId,
//       this.deliveryManId,
//       this.couponCode,
//       this.orderNote,
//       this.orderType,
//       this.checked,
//       this.restaurantId,
//       this.createdAt,
//       this.updatedAt,
//       this.deliveryCharge,
//       this.scheduleAt,
//       this.callback,
//       this.otp,
//       this.pending,
//       this.accepted,
//       this.confirmed,
//       this.processing,
//       this.handover,
//       this.pickedUp,
//       this.delivered,
//       this.canceled,
//       this.refundRequested,
//       this.refunded,
//       this.deliveryAddress,
//       this.scheduled,
//       this.storeDiscountAmount,
//       this.originalDeliveryCharge,
//       this.failed,
//       this.adjusment,
//       this.edited,
//       this.riderPickingStatus,
//       this.isPaidToRestaurant,
//       this.cancelRequest,
//       this.vAT,
//       this.serviceCharges,
//       this.bagFee,
//       this.riderCharges,
//       this.orderDetail,
//       this.restaurant,
//       this.user,
//       this.address});

//   ActiveRideOrder.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     subTotal = json['sub_total'];
//     orderAmount = json['order_amount'];
//     couponDiscountAmount = json['coupon_discount_amount'];
//     couponDiscountTitle = json['coupon_discount_title'];
//     paymentStatus = json['payment_status'];
//     orderStatus = json['order_status'];
//     totalTaxAmount = json['total_tax_amount'];
//     adminCommission = json['admin_commission'];
//     paymentMethod = json['payment_method'];
//     transactionReference = json['transaction_reference'];
//     deliveryAddressId = json['delivery_address_id'];
//     deliveryManId = json['delivery_man_id'];
//     couponCode = json['coupon_code'];
//     orderNote = json['order_note'];
//     orderType = json['order_type'];
//     checked = json['checked'];
//     restaurantId = json['restaurant_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deliveryCharge = json['delivery_charge'];
//     scheduleAt = json['schedule_at'];
//     callback = json['callback'];
//     otp = json['otp'];
//     pending = json['pending'];
//     accepted = json['accepted'];
//     confirmed = json['confirmed'];
//     processing = json['processing'];
//     handover = json['handover'];
//     pickedUp = json['picked_up'];
//     delivered = json['delivered'];
//     canceled = json['canceled'];
//     refundRequested = json['refund_requested'];
//     refunded = json['refunded'];
//     deliveryAddress = json['delivery_address'];
//     scheduled = json['scheduled'];
//     storeDiscountAmount = json['store_discount_amount'];
//     originalDeliveryCharge = json['original_delivery_charge'];
//     failed = json['failed'];
//     adjusment = json['adjusment'];
//     edited = json['edited'];
//     riderPickingStatus = json['rider_picking_status'];
//     isPaidToRestaurant = json['is_paid_to_restaurant'];
//     cancelRequest = json['cancel_request'];
//     vAT = json['VAT'];
//     serviceCharges = json['service_charges'];
//     bagFee = json['bag_fee'];
//     riderCharges = json['rider_charges'];
//     if (json['order_detail'] != null) {
//       orderDetail = <OrderDetail>[];
//       json['order_detail'].forEach((v) {
//         orderDetail!.add(OrderDetail.fromJson(v));
//       });
//     }
//     restaurant = json['restaurant'] != null
//         ? Restaurant.fromJson(json['restaurant'])
//         : null;
//     user = json['user'] != null ? User.fromJson(json['user']) : null;
//     address = json['address'] != null
//         ? RestaurantAddress.fromJson(json['address'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['user_id'] = userId;
//     data['sub_total'] = subTotal;
//     data['order_amount'] = orderAmount;
//     data['coupon_discount_amount'] = couponDiscountAmount;
//     data['coupon_discount_title'] = couponDiscountTitle;
//     data['payment_status'] = paymentStatus;
//     data['order_status'] = orderStatus;
//     data['total_tax_amount'] = totalTaxAmount;
//     data['admin_commission'] = adminCommission;
//     data['payment_method'] = paymentMethod;
//     data['transaction_reference'] = transactionReference;
//     data['delivery_address_id'] = deliveryAddressId;
//     data['delivery_man_id'] = deliveryManId;
//     data['coupon_code'] = couponCode;
//     data['order_note'] = orderNote;
//     data['order_type'] = orderType;
//     data['checked'] = checked;
//     data['restaurant_id'] = restaurantId;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['delivery_charge'] = deliveryCharge;
//     data['schedule_at'] = scheduleAt;
//     data['callback'] = callback;
//     data['otp'] = otp;
//     data['pending'] = pending;
//     data['accepted'] = accepted;
//     data['confirmed'] = confirmed;
//     data['processing'] = processing;
//     data['handover'] = handover;
//     data['picked_up'] = pickedUp;
//     data['delivered'] = delivered;
//     data['canceled'] = canceled;
//     data['refund_requested'] = refundRequested;
//     data['refunded'] = refunded;
//     data['delivery_address'] = deliveryAddress;
//     data['scheduled'] = scheduled;
//     data['store_discount_amount'] = storeDiscountAmount;
//     data['original_delivery_charge'] = originalDeliveryCharge;
//     data['failed'] = failed;
//     data['adjusment'] = adjusment;
//     data['edited'] = edited;
//     data['rider_picking_status'] = riderPickingStatus;
//     data['is_paid_to_restaurant'] = isPaidToRestaurant;
//     data['cancel_request'] = cancelRequest;
//     data['VAT'] = vAT;
//     data['service_charges'] = serviceCharges;
//     data['bag_fee'] = bagFee;
//     data['rider_charges'] = riderCharges;
//     if (orderDetail != null) {
//       data['order_detail'] = orderDetail!.map((v) => v.toJson()).toList();
//     }
//     if (restaurant != null) {
//       data['restaurant'] = restaurant!.toJson();
//     }
//     if (user != null) {
//       data['user'] = user?.toJson();
//     }
//     if (address != null) {
//       data['address'] = address!.toJson();
//     }
//     return data;
//   }
// }

class User {
  int? id;
  String? name;
  dynamic lastName;
  String? email;
  dynamic emailVerifiedAt;
  int? status;
  dynamic restaurantId;
  int? userTypeId;
  dynamic fcmToken;
  dynamic locationId;
  dynamic lat;
  dynamic lng;
  String? image;
  String? contactNumber;
  String? createdAt;
  String? updatedAt;
  int? userOnline;
  int? riderBusy;
  int? verified;
  int? isDocumentsVerified;
  dynamic deletedAt;

  User(
      {this.id,
      this.name,
      this.lastName,
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
      this.userOnline,
      this.riderBusy,
      this.verified,
      this.isDocumentsVerified,
      this.deletedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['last_name'];
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
    userOnline = json['user_online'];
    riderBusy = json['rider_busy'];
    verified = json['verified'];
    isDocumentsVerified = json['is_documents_verified'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['last_name'] = lastName;
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
    data['deleted_at'] = deletedAt;
    return data;
  }
}

// class RestaurantAddress {
//   int? id;
//   String? lat;
//   dynamic lang;
//   dynamic type;
//   dynamic address;
//   dynamic zipCode;
//   int? userId;
//   dynamic apt;
//   dynamic city;
//   dynamic state;
//   String? updatedAt;
//   String? createdAt;
//   dynamic deletedAt;

//   RestaurantAddress(
//       {this.id,
//       this.lat,
//       this.lang,
//       this.type,
//       this.address,
//       this.zipCode,
//       this.userId,
//       this.apt,
//       this.city,
//       this.state,
//       this.updatedAt,
//       this.createdAt,
//       this.deletedAt});

//   RestaurantAddress.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     lat = json['lat'];
//     lang = json['lang'];
//     type = json['type'];
//     address = json['address'];
//     zipCode = json['zip_code'];
//     userId = json['user_id'];
//     apt = json['apt'];
//     city = json['city'];
//     state = json['state'];
//     updatedAt = json['updated_at'];
//     createdAt = json['created_at'];
//     deletedAt = json['deleted_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['lat'] = lat;
//     data['lang'] = lang;
//     data['type'] = type;
//     data['address'] = address;
//     data['zip_code'] = zipCode;
//     data['user_id'] = userId;
//     data['apt'] = apt;
//     data['city'] = city;
//     data['state'] = state;
//     data['updated_at'] = updatedAt;
//     data['created_at'] = createdAt;
//     data['deleted_at'] = deletedAt;
//     return data;
//   }
// }
