class Food {
  int? id;
  String? name;
  String? description;
  String? image;
  int? categoryId;
  dynamic variations;
  dynamic choiceOptions;
  String? price;
  String? tax;
  String? taxType;
  String? discount;
  String? discountType;
  dynamic availableTimeStarts;
  dynamic availableTimeEnds;
  int? veg;
  int? status;
  int? restaurantId;
  String? createdAt;
  String? updatedAt;
  int? orderCount;
  int? isSuggested;
  String? featuredImage;
  dynamic deletedAt;
  double? totalPrice;

  Food(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.categoryId,
      this.variations,
      this.choiceOptions,
      this.price,
      this.tax,
      this.taxType,
      this.discount,
      this.discountType,
      this.availableTimeStarts,
      this.availableTimeEnds,
      this.veg,
      this.status,
      this.restaurantId,
      this.createdAt,
      this.updatedAt,
      this.orderCount,
      this.isSuggested,
      this.featuredImage,
      this.deletedAt,
      this.totalPrice});

  Food.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    categoryId = json['category_id'];
    variations = json['variations'];
    choiceOptions = json['choice_options'];
    price = json['price'];
    tax = json['tax'];
    taxType = json['tax_type'];
    discount = json['discount'];
    discountType = json['discount_type'];
    availableTimeStarts = json['available_time_starts'];
    availableTimeEnds = json['available_time_ends'];
    veg = json['veg'];
    status = json['status'];
    restaurantId = json['restaurant_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orderCount = json['order_count'];
    isSuggested = json['is_suggested'];
    featuredImage = json['featured_image'];
    deletedAt = json['deleted_at'];
    if (json['total_price'] != null) {
      totalPrice = double.parse(json['total_price'].toString());
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['category_id'] = categoryId;
    data['variations'] = variations;
    data['choice_options'] = choiceOptions;
    data['price'] = price;
    data['tax'] = tax;
    data['tax_type'] = taxType;
    data['discount'] = discount;
    data['discount_type'] = discountType;
    data['available_time_starts'] = availableTimeStarts;
    data['available_time_ends'] = availableTimeEnds;
    data['veg'] = veg;
    data['status'] = status;
    data['restaurant_id'] = restaurantId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['order_count'] = orderCount;
    data['is_suggested'] = isSuggested;
    data['featured_image'] = featuredImage;
    data['deleted_at'] = deletedAt;
    data['total_price'] = totalPrice;
    return data;
  }
}
