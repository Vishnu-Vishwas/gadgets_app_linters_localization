import 'package:dartz/dartz.dart';
import 'package:gizmogrub_lints_localization/core/network/failure_constants.dart';
import 'package:gizmogrub_lints_localization/core/network/http_method.dart';
import 'package:gizmogrub_lints_localization/core/network/network_constants.dart';
import 'package:gizmogrub_lints_localization/core/network/network_service.dart';
import 'package:gizmogrub_lints_localization/features/product_details/data/models/product_details_model.dart';

abstract interface class ProductDetailsDataSource {
  Future<Either<Failure, ProductDetailsModel>> getProductById(int id);
}

class ProductDetailsDataSourceImplementation
    implements ProductDetailsDataSource {
  ProductDetailsDataSourceImplementation(this.networkService);
  final NetworkService networkService;

  @override
  Future<Either<Failure, ProductDetailsModel>> getProductById(int id) async {
    final Either<Failure, dynamic> result = await networkService.get(
      '${NetworkConstants.productsEndpoint}/$id',
      method: HttpMethods.get,
    );

    return result.fold(
      (Failure failure) => Left<Failure, ProductDetailsModel>(failure),

      (response) {
        final Map<String, dynamic> data = response.data['product'];
        final ProductDetailsModel product = ProductDetailsModel.fromJson(data);
        return Right<Failure, ProductDetailsModel>(product);
      },
    );
  }
}
