import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gizmogrub_lints_localization/core/network/failure_constants.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/domain/entities/product_listing_entity.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/domain/use_cases/product_listing_use_cases.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/presentation/prodcut_listing_bloc/product_items_event.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/presentation/prodcut_listing_bloc/product_items_state.dart';

class ProductListingBloc
    extends Bloc<ProductListingEvent, ProductListingState> {
  ProductListingBloc(this.productsUseCases) : super(ProductListingInitial()) {
    on<GetAllProductsEvent>(_onGetAllProducts);
    on<SearchProductsEvent>(_onSearchProducts);
  }
  final ProductsUseCases productsUseCases;

  Future<void> _onGetAllProducts(
    GetAllProductsEvent event,
    Emitter<ProductListingState> emit,
  ) async {
    emit(ProductListingLoading());

    final Either<Failure, List<ProductListingEntity>> result =
        await productsUseCases.getAllProducts();

    result.fold(
      (Failure failure) => emit(ProductListingError(failure.message)),
      (List<ProductListingEntity> products) =>
          emit(ProductListingLoaded(products)),
    );
  }

  Future<void> _onSearchProducts(
    SearchProductsEvent event,
    Emitter<ProductListingState> emit,
  ) async {
    emit(ProductListingLoading());

    final Either<Failure, List<ProductListingEntity>> result =
        await productsUseCases.getAllProducts();

    result.fold(
      (Failure failure) => emit(ProductListingError(failure.message)),
      (List<ProductListingEntity> products) {
        final List<ProductListingEntity> filtered =
            products
                .where(
                  (ProductListingEntity product) =>
                      product.title?.toLowerCase().contains(
                        event.query.toLowerCase(),
                      ) ??
                      false,
                )
                .toList();
        emit(ProductListingLoaded(filtered));
      },
    );
  }
}
