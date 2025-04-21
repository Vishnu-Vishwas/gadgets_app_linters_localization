import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gizmogrub_lints_localization/core/network/failure_constants.dart';
import 'package:gizmogrub_lints_localization/features/product_details/domain/entities/product_details_entity.dart';
import 'package:gizmogrub_lints_localization/features/product_details/domain/use_cases/product_details_use_cases.dart';
import 'package:gizmogrub_lints_localization/features/product_details/presentation/product_details_bloc/product_details_event.dart';
import 'package:gizmogrub_lints_localization/features/product_details/presentation/product_details_bloc/product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc(this.productDetailsUseCases)
    : super(ProductDetailsInitial()) {
    on<GetProductDetailsEvent>(_onGetProductDetails);
  }
  final ProductDetailsUseCases productDetailsUseCases;

  Future<void> _onGetProductDetails(
    GetProductDetailsEvent event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(ProductDetailsLoading());

    final Either<Failure, ProductDetailsEntity> result =
        await productDetailsUseCases.getProductById(event.id);

    result.fold(
      (Failure failure) => emit(ProductDetailsError(failure.message)),
      (ProductDetailsEntity product) => emit(ProductDetailsLoaded(product)),
    );
  }
}
