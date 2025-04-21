import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_constants.dart';

@RoutePage()
class ProductAddScreen extends StatelessWidget {
  const ProductAddScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      const Center(child: Text(TextConstants.addProductScreen));
}
