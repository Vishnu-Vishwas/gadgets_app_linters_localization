import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gizmogrub_lints_localization/core/constants/color_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_constants.dart';
import 'package:gizmogrub_lints_localization/core/navigation/app_route.dart';
import 'package:gizmogrub_lints_localization/features/dashboard/presentation/widgets/bottom_nav_items.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) => AutoTabsScaffold(
    routes: const <PageRouteInfo<Object?>>[
      ProductListScreenRoute(),
      ProfileScreenRoute(),
      ProductAddScreenRoute(),
      ChatScreenRoute(),
      WishlistScreenRoute(),
    ],
    floatingActionButton: Builder(
      builder: (BuildContext context) {
        final TabsRouter tabsRouter = AutoTabsRouter.of(context);
        return FloatingActionButton(
          onPressed: () => tabsRouter.setActiveIndex(2),
          backgroundColor: ColorConstants.red,
          elevation: 6,
          shape: const CircleBorder(),
          child: Image.asset(TextConstants.addIconImage),
        );
      },
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBuilder:
        (_, TabsRouter tabsRouter) => BottomAppBar(
          color: ColorConstants.red,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              BottomNavItem(tabsRouter: tabsRouter, index: 0),
              BottomNavItem(tabsRouter: tabsRouter, index: 1),
              // TODO(vishnu): experiment with this, no need to use width here
              //const SizedBox(width: 42),
              const SizedBox(),
              BottomNavItem(tabsRouter: tabsRouter, index: 3),
              BottomNavItem(tabsRouter: tabsRouter, index: 4),
            ],
          ),
        ),
  );
}
