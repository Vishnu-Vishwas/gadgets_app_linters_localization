import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gizmogrub_lints_localization/core/constants/color_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_constants.dart';

class DetailsAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const DetailsAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) => AppBar(
    forceMaterialTransparency: true,
    backgroundColor: ColorConstants.white,

    leadingWidth: 56,

    leading: Align(
      child: IconButton(
        icon: Align(
          child: Image.asset(
            TextConstants.backArrowIconImage,
            height: 24,
            width: 24,
            fit: BoxFit.contain,
          ),
        ),
        onPressed: () {
          context.router.pop();
        },
      ),
    ),

    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19),
        child: Image.asset(
          TextConstants.searchIconImage,
          height: 20,
          width: 20,
          fit: BoxFit.contain,
        ),
      ),
    ],
  );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
