import 'package:dartz/dartz.dart';
import 'package:gizmogrub_lints_localization/core/network/failure_constants.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/domain/entities/product_listing_entity.dart';

abstract interface class ProductsRepository {
  Future<Either<Failure, List<ProductListingEntity>>> getAllProducts();
}
