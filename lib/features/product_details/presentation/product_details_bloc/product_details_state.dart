import 'package:equatable/equatable.dart';
import 'package:gizmogrub_lints_localization/features/product_details/domain/entities/product_details_entity.dart';

sealed class ProductDetailsState extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  ProductDetailsLoaded(this.product);
  final ProductDetailsEntity product;

  @override
  List<Object?> get props => <Object?>[product];
}

class ProductDetailsError extends ProductDetailsState {
  ProductDetailsError(this.message);
  final String message;

  @override
  List<Object?> get props => <Object?>[message];
}
