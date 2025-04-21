import 'package:dartz/dartz.dart';
import 'package:gizmogrub_lints_localization/core/network/failure_constants.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/data/data_source/product_listing_data_source.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/data/model/product_listing_model.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/domain/entities/product_listing_entity.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/domain/repository/product_listing_repository.dart';

class ProductsRepositoryImplementation implements ProductsRepository {
  ProductsRepositoryImplementation(this.productsListDataSource);
  final ProductsListDataSource productsListDataSource;

  @override
  Future<Either<Failure, List<ProductListingEntity>>> getAllProducts() async {
    final Either<Failure, List<ProductModel>> response =
        await productsListDataSource.getAllProducts();

    return response.fold(
      (Failure failure) => Left<Failure, List<ProductListingEntity>>(failure),
      (List<ProductModel> productModel) {
        final List<ProductModel> entities =
            productModel.map((ProductModel product) => product).toList();
        return Right<Failure, List<ProductListingEntity>>(entities);
      },
    );
  }
}
