import 'package:get_it/get_it.dart';
import 'package:gizmogrub_lints_localization/core/network/network_service.dart';
import 'package:gizmogrub_lints_localization/features/language_settings/presentation/language_setttings_bloc/language_settings_bloc.dart';
import 'package:gizmogrub_lints_localization/features/product_details/data/data_sources/product_details_data_source.dart';
import 'package:gizmogrub_lints_localization/features/product_details/data/repository_impl/product_details_repository_impl.dart';
import 'package:gizmogrub_lints_localization/features/product_details/domain/repository/product_details_repository.dart';
import 'package:gizmogrub_lints_localization/features/product_details/domain/use_cases/product_details_use_cases.dart';
import 'package:gizmogrub_lints_localization/features/product_details/presentation/product_details_bloc/product_details_bloc.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/data/data_source/product_listing_data_source.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/data/repository_impl/product_listing_repository.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/domain/repository/product_listing_repository.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/domain/use_cases/product_listing_use_cases.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/presentation/prodcut_listing_bloc/product_items_bloc.dart';

final GetIt injector = GetIt.instance;

class Injector {
  static void init() {
    injector.registerLazySingleton<NetworkService>(NetworkService.new);

    // products data source
    injector.registerLazySingleton<ProductsListDataSource>(
      () => ProductListDataSourceImplementation(injector<NetworkService>()),
    );

    // products repository Implementation
    injector.registerLazySingleton<ProductsRepository>(
      () =>
          ProductsRepositoryImplementation(injector<ProductsListDataSource>()),
    );

    // products use case injection
    injector.registerLazySingleton<ProductsUseCases>(
      () => ProductsUseCases(injector<ProductsRepository>()),
    );

    // product listing bloc
    injector.registerFactory<ProductListingBloc>(
      () => ProductListingBloc(injector<ProductsUseCases>()),
    );

    // Register ProductDetails DataSource
    injector.registerLazySingleton<ProductDetailsDataSource>(
      () => ProductDetailsDataSourceImplementation(injector<NetworkService>()),
    );

    // Register ProductDetails Repository Implementation
    injector.registerLazySingleton<ProductDetailsRepository>(
      () => ProductDetailsRepositoryImplementation(
        injector<ProductDetailsDataSource>(),
      ),
    );

    // Register ProductDetails UseCases
    injector.registerLazySingleton<ProductDetailsUseCases>(
      () => ProductDetailsUseCases(injector<ProductDetailsRepository>()),
    );

    // Register ProductDetails Bloc
    injector.registerFactory<ProductDetailsBloc>(
      () => ProductDetailsBloc(injector<ProductDetailsUseCases>()),
    );

    // language settings
    injector.registerLazySingleton<LanguageSettingsBloc>(
      LanguageSettingsBloc.new,
    );
  }
}
