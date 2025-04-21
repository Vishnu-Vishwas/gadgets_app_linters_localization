import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:gizmogrub_lints_localization/core/navigation/routes/dashboard_routes.dart';
import 'package:gizmogrub_lints_localization/core/navigation/routes/language_settings_route.dart';
import 'package:gizmogrub_lints_localization/core/navigation/routes/splash_screen_routes.dart';
import 'package:gizmogrub_lints_localization/features/product_details/presentation/screens/product_details_screen.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/presentation/screens/product_add_screen.dart';
import 'package:gizmogrub_lints_localization/features/language_settings/presentation/screens/language_settings_screen.dart';
import 'package:gizmogrub_lints_localization/features/dashboard/presentation/screens/dash_board_screen.dart';
import 'package:gizmogrub_lints_localization/features/chat/presentation/screens/chat_screen.dart';

import 'package:gizmogrub_lints_localization/features/product_listing/presentation/widgets/product_items_widget.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/presentation/screens/product_listing_screen.dart';
import 'package:gizmogrub_lints_localization/features/profile/presentation/screens/profile_screen.dart';
import 'package:gizmogrub_lints_localization/features/splash_screen/presentation/splash_screen.dart';
import 'package:gizmogrub_lints_localization/features/wishlist/presentation/screens/wishlist_screen.dart';

part 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
    splashScreenRoute,
    dashboardRoute,
    AutoRoute(page: ProductDetailsScreenRoute.page, path: '/product-details'),
    languageSettingPageRoute,
  ];
}
