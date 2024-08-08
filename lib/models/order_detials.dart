import 'package:rider/models/food.dart';
import 'package:rider/responses/order_response.dart';

class OrderDetail {
  int? id;
  int? foodId;
  int? orderId;
  String? price;
  dynamic foodDetails;
  dynamic variation;
  dynamic addOns;
  dynamic discountOnItem;
  String? discountType;
  int? quantity;
  String? taxAmount;
  dynamic variant;
  String? createdAt;
  String? updatedAt;
  dynamic itemCampaignId;
  String? totalAddOnPrice;
  Food? food;
  List<OrderSubProduct> orderSubProducts = [];

  OrderDetail(
      {this.id,
      this.foodId,
      this.orderId,
      this.price,
      this.foodDetails,
      this.variation,
      this.addOns,
      this.discountOnItem,
      this.discountType,
      this.quantity,
      this.taxAmount,
      this.variant,
      this.createdAt,
      this.updatedAt,
      this.itemCampaignId,
      this.totalAddOnPrice,
      this.food});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foodId = json['food_id'];
    orderId = json['order_id'];
    price = json['price'];
    foodDetails = json['food_details'];
    variation = json['variation'];
    addOns = json['add_ons'];
    discountOnItem = json['discount_on_item'];
    discountType = json['discount_type'];
    quantity = json['quantity'];
    taxAmount = json['tax_amount'];
    variant = json['variant'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    itemCampaignId = json['item_campaign_id'];
    totalAddOnPrice = json['total_add_on_price'];
    food = json['food'] != null ? Food.fromJson(json['food']) : null;
    if (json['order_sub_products'] != null) {
      orderSubProducts = <OrderSubProduct>[];
      json['order_sub_products'].forEach((v) {
        orderSubProducts.add(OrderSubProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['food_id'] = foodId;
    data['order_id'] = orderId;
    data['price'] = price;
    data['food_details'] = foodDetails;
    data['variation'] = variation;
    data['add_ons'] = addOns;
    data['discount_on_item'] = discountOnItem;
    data['discount_type'] = discountType;
    data['quantity'] = quantity;
    data['tax_amount'] = taxAmount;
    data['variant'] = variant;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['item_campaign_id'] = itemCampaignId;
    data['total_add_on_price'] = totalAddOnPrice;
    if (food != null) {
      data['food'] = food!.toJson();
    }

    data['order_sub_products'] =
        orderSubProducts.map((v) => v.toJson()).toList();
    return data;
  }
}
