import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gizmogrub_lints_localization/core/di/injector.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/presentation/prodcut_listing_bloc/product_items_bloc.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/presentation/widgets/product_list_screen_body.dart';

@RoutePage()
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<ProductListingBloc>(
    create: (_) => injector<ProductListingBloc>(),
    child: const ProductListScreenBody(),
  );
}
