import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gizmogrub_lints_localization/core/constants/color_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_style_constants.dart';
import 'package:gizmogrub_lints_localization/core/navigation/app_route.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/domain/entities/product_listing_entity.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/presentation/prodcut_listing_bloc/product_items_bloc.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/presentation/prodcut_listing_bloc/product_items_event.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/presentation/prodcut_listing_bloc/product_items_state.dart';

@RoutePage()
class ProductItemsWidget extends StatelessWidget {
  const ProductItemsWidget({super.key});

  @override
  Widget build(
    BuildContext context,
  ) => BlocBuilder<ProductListingBloc, ProductListingState>(
    builder: (BuildContext context, ProductListingState state) {
      switch (state) {
        case ProductListingInitial():
          context.read<ProductListingBloc>().add(GetAllProductsEvent());
          return const Center(child: CircularProgressIndicator());

        case ProductListingLoading():
          return const Center(child: CircularProgressIndicator());

        case ProductListingLoaded():
          final List<ProductListingEntity> products = state.products;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 31,
              crossAxisSpacing: 12,
              mainAxisExtent: 235,
            ),
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              final ProductListingEntity product = products[index];
              return GestureDetector(
                onTap: () async {
                  await context.router.push(
                    ProductDetailsScreenRoute(productId: product.id!),
                  );
                  // await context.pushRoute(
                  //   ProductListScreenRoute(
                  //     children: [
                  //       ProductDetailsScreenRoute(productId: product.id!),
                  //     ],
                  //   ),
                  // );
                },

                child: Card(
                  elevation: 4,
                  color: ColorConstants.white,
                  shadowColor: ColorConstants.blackShade,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[
                        const SizedBox(height: 5),
                        Expanded(
                          child: Center(
                            child: Image.network(
                              product.image.toString(),
                              // height: 120,
                              // width: 120,
                              errorBuilder:
                                  (
                                    BuildContext context,
                                    Object error,
                                    StackTrace? stackTrace,
                                  ) => Image.network(
                                    TextConstants.imagePlaceHolderImage,
                                  ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          product.title.toString(),
                          style: TextStyleConstants.bodyText2.copyWith(
                            color: ColorConstants.darkChestnut,
                            fontWeight: FontWeight.w600,
                            height: 1.35,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          product.brand.toString(),
                          style: TextStyleConstants.bodyText2.copyWith(
                            color: ColorConstants.darkChestnut,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 1,
                        ),

                        Row(
                          children: <Widget>[
                            const Icon(
                              Icons.star,
                              color: ColorConstants.orange,
                              size: 14,
                            ),
                            Text(
                              '${product.rating}.0',
                              style: TextStyleConstants.bodyText2.copyWith(
                                color: ColorConstants.darkChestnut,
                                height: 1.35,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                TextConstants.heartIconImage,

                                width: 24,
                                height: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );

        case ProductListingError():
          final ProductListingError errorState = state;
          return Center(child: Text(errorState.message));
      }
    },
  );
}
