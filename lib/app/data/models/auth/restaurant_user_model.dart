class RestaurantUserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? avatar;
  String? status;
  String? restaurantName;
  String? slug;
  String? restaurantAddress;
  String? restaurantDescription;
  String? restaurantLogo;
  String? coverImage;
  String? restaurantStatus;
  String? approvalStatus;
  String? deliveryFee;
  String? minimumOrderValue;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  String? avatarUrl;
  String? restaurantLogoUrl;
  String? coverImageUrl;

  RestaurantUserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.status,
    this.restaurantName,
    this.slug,
    this.restaurantAddress,
    this.restaurantDescription,
    this.restaurantLogo,
    this.coverImage,
    this.restaurantStatus,
    this.approvalStatus,
    this.deliveryFee,
    this.minimumOrderValue,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.avatarUrl,
    this.restaurantLogoUrl,
    this.coverImageUrl,
  });

  factory RestaurantUserModel.fromJson(Map<String, dynamic> json) {
    return RestaurantUserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      avatar: json['avatar'],
      status: json['status'],
      restaurantName: json['restaurant_name'],
      slug: json['slug'],
      restaurantAddress: json['restaurant_address'],
      restaurantDescription: json['restaurant_description'],
      restaurantLogo: json['restaurant_logo'],
      coverImage: json['cover_image'],
      restaurantStatus: json['restaurant_status'],
      approvalStatus: json['approval_status'],
      deliveryFee: json['delivery_fee'],
      minimumOrderValue: json['minimum_order_value'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      avatarUrl: json['avatar_url'],
      restaurantLogoUrl: json['restaurant_logo_url'],
      coverImageUrl: json['cover_image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['avatar'] = avatar;
    data['status'] = status;
    data['restaurant_name'] = restaurantName;
    data['slug'] = slug;
    data['restaurant_address'] = restaurantAddress;
    data['restaurant_description'] = restaurantDescription;
    data['restaurant_logo'] = restaurantLogo;
    data['cover_image'] = coverImage;
    data['restaurant_status'] = restaurantStatus;
    data['approval_status'] = approvalStatus;
    data['delivery_fee'] = deliveryFee;
    data['minimum_order_value'] = minimumOrderValue;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['avatar_url'] = avatarUrl;
    data['restaurant_logo_url'] = restaurantLogoUrl;
    data['cover_image_url'] = coverImageUrl;
    return data;
  }
}