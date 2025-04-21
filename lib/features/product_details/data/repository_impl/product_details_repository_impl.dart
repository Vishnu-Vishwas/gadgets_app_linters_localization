import 'package:dartz/dartz.dart';
import 'package:gizmogrub_lints_localization/core/network/failure_constants.dart';
import 'package:gizmogrub_lints_localization/features/product_details/data/data_sources/product_details_data_source.dart';
import 'package:gizmogrub_lints_localization/features/product_details/data/models/product_details_model.dart';
import 'package:gizmogrub_lints_localization/features/product_details/domain/entities/product_details_entity.dart';
import 'package:gizmogrub_lints_localization/features/product_details/domain/repository/product_details_repository.dart';

class ProductDetailsRepositoryImplementation
    implements ProductDetailsRepository {
  ProductDetailsRepositoryImplementation(this.productDetailsDataSource);
  final ProductDetailsDataSource productDetailsDataSource;

  @override
  Future<Either<Failure, ProductDetailsEntity>> getProductById(int id) async {
    final Either<Failure, ProductDetailsModel> response =
        await productDetailsDataSource.getProductById(id);

    return response.fold(Left.new, Right.new);
  }
}
