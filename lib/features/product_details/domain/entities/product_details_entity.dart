import 'package:equatable/equatable.dart';

class ProductDetailsEntity extends Equatable {
  const ProductDetailsEntity({
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
  List<Object?> get props => <Object?>[const ProductDetailsEntity()];
}
