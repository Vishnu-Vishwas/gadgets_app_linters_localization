import 'package:dartz/dartz.dart';
import 'package:gizmogrub_lints_localization/core/network/failure_constants.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/domain/entities/product_listing_entity.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/domain/repository/product_listing_repository.dart';

class ProductsUseCases {
  ProductsUseCases(this.productsRepository);
  final ProductsRepository productsRepository;

  Future<Either<Failure, List<ProductListingEntity>>> getAllProducts() async {
    final Either<Failure, List<ProductListingEntity>> response =
        await productsRepository.getAllProducts();

    return response.fold(
      (Failure failure) => Left<Failure, List<ProductListingEntity>>(failure),
      (List<ProductListingEntity> products) =>
          Right<Failure, List<ProductListingEntity>>(products),
    );
  }
}
