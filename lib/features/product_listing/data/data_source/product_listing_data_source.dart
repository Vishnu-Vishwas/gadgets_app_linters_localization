import 'package:dartz/dartz.dart';
import 'package:gizmogrub_lints_localization/core/network/failure_constants.dart';
import 'package:gizmogrub_lints_localization/core/network/http_method.dart';
import 'package:gizmogrub_lints_localization/core/network/network_constants.dart';
import 'package:gizmogrub_lints_localization/core/network/network_service.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/data/model/product_listing_model.dart';

abstract interface class ProductsListDataSource {
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
}

class ProductListDataSourceImplementation implements ProductsListDataSource {
  ProductListDataSourceImplementation(this.networkService);
  final NetworkService networkService;
  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    final Either<Failure, dynamic> result = await networkService.get(
      NetworkConstants.productsEndpoint,
      method: HttpMethods.get,
    );

    return result.fold(
      (Failure failure) => Left<Failure, List<ProductModel>>(failure),
      (response) {
        final List<dynamic> data = response.data['products'];
        final List<ProductModel> products =
            data.map((e) => ProductModel.fromJson(e)).toList();
        return Right<Failure, List<ProductModel>>(products);
      },
    );
  }
}
