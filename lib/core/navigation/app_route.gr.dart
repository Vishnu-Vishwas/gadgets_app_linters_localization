// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

/// generated route for
/// [ChatScreen]
class ChatScreenRoute extends PageRouteInfo<void> {
  const ChatScreenRoute({List<PageRouteInfo>? children})
    : super(ChatScreenRoute.name, initialChildren: children);

  static const String name = 'ChatScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChatScreen();
    },
  );
}

/// generated route for
/// [DashboardScreen]
class DashboardScreenRoute extends PageRouteInfo<void> {
  const DashboardScreenRoute({List<PageRouteInfo>? children})
    : super(DashboardScreenRoute.name, initialChildren: children);

  static const String name = 'DashboardScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardScreen();
    },
  );
}

/// generated route for
/// [LanguageSettingsScreen]
class LanguageSettingsScreenRoute extends PageRouteInfo<void> {
  const LanguageSettingsScreenRoute({List<PageRouteInfo>? children})
    : super(LanguageSettingsScreenRoute.name, initialChildren: children);

  static const String name = 'LanguageSettingsScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LanguageSettingsScreen();
    },
  );
}

/// generated route for
/// [ProductAddScreen]
class ProductAddScreenRoute extends PageRouteInfo<void> {
  const ProductAddScreenRoute({List<PageRouteInfo>? children})
    : super(ProductAddScreenRoute.name, initialChildren: children);

  static const String name = 'ProductAddScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProductAddScreen();
    },
  );
}

/// generated route for
/// [ProductDetailsScreen]
class ProductDetailsScreenRoute
    extends PageRouteInfo<ProductDetailsScreenRouteArgs> {
  ProductDetailsScreenRoute({
    required int productId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         ProductDetailsScreenRoute.name,
         args: ProductDetailsScreenRouteArgs(productId: productId, key: key),
         initialChildren: children,
       );

  static const String name = 'ProductDetailsScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsScreenRouteArgs>();
      return ProductDetailsScreen(productId: args.productId, key: args.key);
    },
  );
}

class ProductDetailsScreenRouteArgs {
  const ProductDetailsScreenRouteArgs({required this.productId, this.key});

  final int productId;

  final Key? key;

  @override
  String toString() {
    return 'ProductDetailsScreenRouteArgs{productId: $productId, key: $key}';
  }
}

/// generated route for
/// [ProductItemsWidget]
class ProductItemsWidgetRoute extends PageRouteInfo<void> {
  const ProductItemsWidgetRoute({List<PageRouteInfo>? children})
    : super(ProductItemsWidgetRoute.name, initialChildren: children);

  static const String name = 'ProductItemsWidgetRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProductItemsWidget();
    },
  );
}

/// generated route for
/// [ProductListScreen]
class ProductListScreenRoute extends PageRouteInfo<void> {
  const ProductListScreenRoute({List<PageRouteInfo>? children})
    : super(ProductListScreenRoute.name, initialChildren: children);

  static const String name = 'ProductListScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProductListScreen();
    },
  );
}

/// generated route for
/// [ProfileScreen]
class ProfileScreenRoute extends PageRouteInfo<void> {
  const ProfileScreenRoute({List<PageRouteInfo>? children})
    : super(ProfileScreenRoute.name, initialChildren: children);

  static const String name = 'ProfileScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashScreenRoute extends PageRouteInfo<void> {
  const SplashScreenRoute({List<PageRouteInfo>? children})
    : super(SplashScreenRoute.name, initialChildren: children);

  static const String name = 'SplashScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [WishlistScreen]
class WishlistScreenRoute extends PageRouteInfo<void> {
  const WishlistScreenRoute({List<PageRouteInfo>? children})
    : super(WishlistScreenRoute.name, initialChildren: children);

  static const String name = 'WishlistScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WishlistScreen();
    },
  );
}
