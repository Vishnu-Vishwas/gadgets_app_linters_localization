import 'package:auto_route/auto_route.dart';
import 'package:gizmogrub_lints_localization/core/navigation/app_route.dart';
import 'package:gizmogrub_lints_localization/core/navigation/routes/chat_routes.dart';
import 'package:gizmogrub_lints_localization/core/navigation/routes/product_add_screen.dart';
import 'package:gizmogrub_lints_localization/core/navigation/routes/product_routes.dart';
import 'package:gizmogrub_lints_localization/core/navigation/routes/profile_routes.dart';
import 'package:gizmogrub_lints_localization/core/navigation/routes/wishlist_routes.dart';

final AutoRoute dashboardRoute = AutoRoute(
  page: DashboardScreenRoute.page,
  path: '/dashboard',
  children: <AutoRoute>[
    productRoute,
    profileRoute,
    productAddRoute,
    chatRoute,
    wishlistRoute,
  ],
);
