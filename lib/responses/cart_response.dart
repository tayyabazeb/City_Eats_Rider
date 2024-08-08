import 'package:rider/responses/base_responses/base_response.dart';

class CartResponse extends BaseResponse {
  Body? body;

  CartResponse(success, error, {this.body}) : super(success, error: error);

  CartResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
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
  Cart? cart;

  Body({this.cart});

  Body.fromJson(Map<String, dynamic> json) {
    cart = json['cart'] != null ? Cart.fromJson(json['cart']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cart != null) {
      data['cart'] = cart!.toJson();
    }
    return data;
  }
}

class Cart {
  int? id;
  int? customerId;
  int? restaurantId;
  dynamic couponId;
  dynamic couponApplied;
  double? subTotal;
  double? deliveryFee;
  double? discounts;
  double? total;
  double? vat;
  double? serviceCharges;
  double? bagFee;
  dynamic coupon;
  String? createdAt;
  String? updatedAt;
  List<CartProducts>? cartProducts;
  Restaurant? restaurant;

  Cart(
      {this.id,
      this.customerId,
      this.restaurantId,
      this.couponId,
      this.couponApplied,
      this.subTotal,
      this.deliveryFee,
      this.discounts,
      this.total,
      this.coupon,
      this.createdAt,
      this.updatedAt,
      this.vat,
      this.bagFee,
      this.serviceCharges,
      this.cartProducts,
      this.restaurant});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    restaurantId = json['restaurant_id'];
    couponId = json['coupon_id'];

    vat = double.parse((json['VAT'] ?? 0).toString());
    serviceCharges = double.parse((json['service_charges'] ?? 0).toString());
    bagFee = double.parse((json['bag_fee'] ?? 0).toString());

    couponApplied = json['coupon_applied'];
    subTotal = double.parse(json['sub_total'].toString());
    deliveryFee = double.parse(json['delivery_fee'].toString());
    discounts = double.parse(json['discounts'].toString());
    total = double.parse(json['total'].toString());
    coupon = json['coupon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

    if (json['cart_products'] != null) {
      cartProducts = <CartProducts>[];
      json['cart_products'].forEach((v) {
        cartProducts!.add(CartProducts.fromJson(v));
      });
    }
    restaurant = json['restaurant'] != null
        ? Restaurant.fromJson(json['restaurant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['restaurant_id'] = restaurantId;
    data['coupon_id'] = couponId;
    data['coupon_applied'] = couponApplied;
    data['sub_total'] = subTotal;
    data['delivery_fee'] = deliveryFee;
    data['discounts'] = discounts;
    data['total'] = total;
    data['coupon'] = coupon;

    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (cartProducts != null) {
      data['cart_products'] = cartProducts!.map((v) => v.toJson()).toList();
    }
    if (restaurant != null) {
      data['restaurant'] = restaurant!.toJson();
    }
    return data;
  }
}

class CartProducts {
  int? id;
  int? cartId;
  int? productId;
  int? productPrice;
  int? productCount;
  int? totalPrice;
  String? productName;
  String? productImage;
  List<CartSideItems> sideItems = [];
  String? createdAt;
  String? updatedAt;

  CartProducts(this.sideItems,
      {this.id,
      this.cartId,
      this.productId,
      this.productPrice,
      this.productImage,
      this.productName,
      this.productCount,
      this.totalPrice,
      this.createdAt,
      this.updatedAt});

  CartProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartId = json['cart_id'];
    productId = json['product_id'];
    productPrice = json['product_price'];
    productCount = json['product_count'];
    totalPrice = json['total_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sideItems = <CartSideItems>[];
    if (json['side_items'] != null) {
      json['side_items'].forEach((v) {
        sideItems.add(CartSideItems.fromJson(v));
      });
    }
    productName = json["product_name"];
    productImage = json["product_image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cart_id'] = cartId;
    data['product_id'] = productId;
    data['product_price'] = productPrice;
    data['product_count'] = productCount;
    data['total_price'] = totalPrice;
    data['created_at'] = createdAt;
    data['side_items'] = sideItems.map((v) => v.toJson()).toList();
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Restaurant {
  int? id;
  String? name;
  String? phone;
  String? restaurantEmail;
  String? logo;
  dynamic latitude;
  dynamic longitude;
  String? address;
  dynamic footerText;
  String? minimumOrder;
  String? commission;
  int? scheduleOrder;
  String? openingTime;
  String? closeingTime;
  int? status;
  dynamic vendorId;
  dynamic createdAt;
  dynamic updatedAt;
  int? freeDelivery;
  dynamic rating;
  dynamic coverPhoto;
  int? delivery;
  int? takeAway;
  int? foodSection;
  String? tax;
  int? zoneId;
  int? reviewsSection;
  int? active;
  String? offDay;
  dynamic gst;
  int? selfDeliverySystem;
  int? posSystem;
  String? deliveryCharge;
  String? deliveryTime;
  int? veg;
  int? nonVeg;
  String? featureImage;
  String? type;
  dynamic deletedAt;
  bool isBusy = false;

  Restaurant(
      {this.id,
      this.name,
      this.phone,
      this.restaurantEmail,
      this.logo,
      this.latitude,
      this.longitude,
      this.address,
      this.footerText,
      this.minimumOrder,
      this.commission,
      this.scheduleOrder,
      this.openingTime,
      this.closeingTime,
      this.status,
      this.vendorId,
      this.createdAt,
      this.updatedAt,
      this.freeDelivery,
      this.rating,
      this.coverPhoto,
      this.delivery,
      this.takeAway,
      this.foodSection,
      this.tax,
      this.zoneId,
      this.reviewsSection,
      this.active,
      this.offDay,
      this.gst,
      this.selfDeliverySystem,
      this.posSystem,
      this.deliveryCharge,
      this.deliveryTime,
      this.veg,
      this.nonVeg,
      this.featureImage,
      this.type,
      this.isBusy = false,
      this.deletedAt});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    restaurantEmail = json['restaurant_email'];
    logo = json['logo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    footerText = json['footer_text'];
    minimumOrder = json['minimum_order'];
    commission = json['commission'];
    scheduleOrder = json['schedule_order'];
    openingTime = json['opening_time'];
    closeingTime = json['closeing_time'];
    status = json['status'];
    vendorId = json['vendor_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    freeDelivery = json['free_delivery'];
    rating = json['rating'];
    coverPhoto = json['cover_photo'];
    delivery = json['delivery'];
    takeAway = json['take_away'];
    foodSection = json['food_section'];
    tax = json['tax'];
    zoneId = json['zone_id'];
    reviewsSection = json['reviews_section'];
    active = json['active'];
    offDay = json['off_day'];
    gst = json['gst'];
    selfDeliverySystem = json['self_delivery_system'];
    posSystem = json['pos_system'];
    deliveryCharge = json['delivery_charge'];
    deliveryTime = json['delivery_time'];
    veg = json['veg'];
    nonVeg = json['non_veg'];
    featureImage = json['feature_image'];
    type = json['type'];
    deletedAt = json['deleted_at'];
    isBusy = (json['is_busy'] ?? false) == 1 ? true : false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['restaurant_email'] = restaurantEmail;
    data['logo'] = logo;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['address'] = address;
    data['footer_text'] = footerText;
    data['minimum_order'] = minimumOrder;
    data['commission'] = commission;
    data['schedule_order'] = scheduleOrder;
    data['opening_time'] = openingTime;
    data['closeing_time'] = closeingTime;
    data['status'] = status;
    data['vendor_id'] = vendorId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['free_delivery'] = freeDelivery;
    data['rating'] = rating;
    data['cover_photo'] = coverPhoto;
    data['delivery'] = delivery;
    data['take_away'] = takeAway;
    data['food_section'] = foodSection;
    data['tax'] = tax;
    data['zone_id'] = zoneId;
    data['reviews_section'] = reviewsSection;
    data['active'] = active;
    data['off_day'] = offDay;
    data['gst'] = gst;
    data['self_delivery_system'] = selfDeliverySystem;
    data['pos_system'] = posSystem;
    data['delivery_charge'] = deliveryCharge;
    data['delivery_time'] = deliveryTime;
    data['veg'] = veg;
    data['non_veg'] = nonVeg;
    data['feature_image'] = featureImage;
    data['type'] = type;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class CartSideItems {
  int? id;
  int? cartProductsId;
  String? sideItemName;
  String? sideItemPrice;
  String? createdAt;
  String? updatedAt;

  CartSideItems(
      {this.id,
      this.cartProductsId,
      this.sideItemName,
      this.sideItemPrice,
      this.createdAt,
      this.updatedAt});

  CartSideItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartProductsId = json['cart_products_id'];
    sideItemName = json['side_item_name'];
    sideItemPrice = json['side_item_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cart_products_id'] = cartProductsId;
    data['side_item_name'] = sideItemName;
    data['side_item_price'] = sideItemPrice;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
