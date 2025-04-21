import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_style_constants.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/presentation/widgets/profile_image_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) => AppBar(
    automaticallyImplyLeading: false,
    forceMaterialTransparency: true,
    toolbarHeight: 80,

    titleSpacing: 20,
    title: ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        AppLocalizations.of(context)!.gizmoGrub,
        style: TextStyleConstants.heading1,
      ),
      subtitle: Text(
        AppLocalizations.of(context)!.orderYourFavouriteFood,
        style: TextStyleConstants.heading2,
      ),
      trailing: const ProfileImageWidget(),
    ),
  );

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
