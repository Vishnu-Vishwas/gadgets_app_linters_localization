import 'package:gizmogrub_lints_localization/core/constants/text_constants.dart';
import 'package:gizmogrub_lints_localization/features/product_details/domain/entities/product_details_entity.dart';

class ProductDetailsModel extends ProductDetailsEntity {
  const ProductDetailsModel({
    required super.id,
    required super.title,
    required super.image,
    required super.brand,
    required super.category,
    required super.color,
    required super.description,
    required super.discount,
    required super.model,
    required super.price,
    required super.rating,
  });

  // from json
  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        id: json['id'] ?? 0,
        title: json['title'] ?? TextConstants.productDetailsPlaceholder,
        image: json['image'] ?? TextConstants.imagePlaceHolderImage,
        brand: json['brand'] ?? TextConstants.productDetailsPlaceholder,
        category: json['category'] ?? TextConstants.productDetailsPlaceholder,
        color: json['color'] ?? TextConstants.productDetailsPlaceholder,
        description:
            json['description'] ?? TextConstants.productDetailsPlaceholder,
        discount: json['discount'] ?? 0,
        model: json['models'] ?? TextConstants.productDetailsPlaceholder,
        price: json['price'] ?? 0,
        rating: json['rating'] ?? 5,
      );

  // to json
  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'title': title,
    'brand': brand,
    'category': category,
    'color': color,
    'description': description,
    'discount': discount,
    'image': image,
    'models': model,
    'price': price,
    'rating': rating,
  };
}
