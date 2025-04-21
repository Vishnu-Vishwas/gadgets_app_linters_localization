import 'package:dartz/dartz.dart';
import 'package:gizmogrub_lints_localization/core/network/failure_constants.dart';
import 'package:gizmogrub_lints_localization/features/product_details/domain/entities/product_details_entity.dart';

abstract interface class ProductDetailsRepository {
  Future<Either<Failure, ProductDetailsEntity>> getProductById(int id);
}
