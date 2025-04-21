import 'package:equatable/equatable.dart';

class ProductListingEntity extends Equatable {
  const ProductListingEntity({
    this.id,
    this.title,
    this.image,
    this.price,
    this.description,
    this.brand,
    this.model,
    this.color,
    this.category,
    this.discount,
    this.rating,
  });
  final int? id;
  final String? title;
  final String? image;
  final int? price;
  final String? description;
  final String? brand;
  final String? model;
  final String? color;
  final String? category;
  final int? discount;
  final int? rating;

  @override
  List<Object?> get props => <Object?>[const ProductListingEntity()];
}
