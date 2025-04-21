import 'package:auto_route/auto_route.dart';
import 'package:gizmogrub_lints_localization/core/navigation/app_route.dart';
import 'package:gizmogrub_lints_localization/core/navigation/routes/product_details_routes.dart';

final AutoRoute productRoute = AutoRoute(
  page: ProductListScreenRoute.page,
  children: <AutoRoute>[productDetailsRoute],
  path: 'home',
);
