import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gizmogrub_lints_localization/core/constants/color_constants.dart';
import 'package:gizmogrub_lints_localization/core/navigation/app_route.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/presentation/prodcut_listing_bloc/product_items_bloc.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/presentation/prodcut_listing_bloc/product_items_event.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/presentation/widgets/app_bar_widget.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/presentation/widgets/category_list_widget.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/presentation/widgets/drawer_list_widget.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/presentation/widgets/product_items_widget.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/presentation/widgets/serach_bar_widget.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/presentation/widgets/settings_button_widget.dart';

class ProductListScreenBody extends StatelessWidget {
  const ProductListScreenBody({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: ColorConstants.white,
    appBar: const AppBarWidget(),
    drawer: Drawer(
      backgroundColor: ColorConstants.white,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 80),
        children: <Widget>[
          DrawerListTileWidget(
            title: AppLocalizations.of(context)!.profile,
            icon: Icons.person,
            onTap: () async {
              await context.router.navigate(const ProfileScreenRoute());
            },
          ),
          DrawerListTileWidget(
            title: AppLocalizations.of(context)!.appLangSettings,
            icon: Icons.language,
            onTap: () async {
              await context.router.navigate(
                const LanguageSettingsScreenRoute(),
              );
            },
          ),
        ],
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 44),
          Row(
            spacing: 14,
            children: <Widget>[
              Expanded(
                child: SearchBarWidget(
                  onSearch: (String query) {
                    context.read<ProductListingBloc>().add(
                      SearchProductsEvent(query),
                    );
                  },
                ),
              ),
              const SettingsButtonWidget(),
            ],
          ),

          const SizedBox(height: 40),

          const Expanded(child: CategoryListWidget()),

          const SizedBox(height: 40),

          // todo: we should not give flex: 9 here, there is an alternative for this
          const Expanded(flex: 9, child: ProductItemsWidget()),
        ],
      ),
    ),
  );
}
