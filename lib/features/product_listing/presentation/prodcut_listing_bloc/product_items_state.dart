import 'package:equatable/equatable.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/domain/entities/product_listing_entity.dart';

sealed class ProductListingState extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

class ProductListingInitial extends ProductListingState {}

class ProductListingLoading extends ProductListingState {}

class ProductListingLoaded extends ProductListingState {
  ProductListingLoaded(this.products);
  final List<ProductListingEntity> products;

  @override
  List<Object?> get props => <Object?>[products];
}

class ProductListingError extends ProductListingState {
  ProductListingError(this.message);
  final String message;

  @override
  List<Object?> get props => <Object?>[message];
}
