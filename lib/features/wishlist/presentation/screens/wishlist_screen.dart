import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_constants.dart';

@RoutePage()
class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      const Center(child: Text(TextConstants.wishlistScreen));
}
