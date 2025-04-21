import 'package:dartz/dartz.dart';
import 'package:gizmogrub_lints_localization/core/network/failure_constants.dart';
import 'package:gizmogrub_lints_localization/features/product_details/domain/entities/product_details_entity.dart';
import 'package:gizmogrub_lints_localization/features/product_details/domain/repository/product_details_repository.dart';

class ProductDetailsUseCases {
  ProductDetailsUseCases(this.productDetailsRepository);
  final ProductDetailsRepository productDetailsRepository;

  Future<Either<Failure, ProductDetailsEntity>> getProductById(int id) async {
    final Either<Failure, ProductDetailsEntity> response =
        await productDetailsRepository.getProductById(id);

    return response.fold(
      (Failure failure) => Left<Failure, ProductDetailsEntity>(failure),
      (ProductDetailsEntity products) =>
          Right<Failure, ProductDetailsEntity>(products),
    );
  }
}
