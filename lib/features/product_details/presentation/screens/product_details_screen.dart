import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gizmogrub_lints_localization/core/constants/color_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_style_constants.dart';
import 'package:gizmogrub_lints_localization/core/di/injector.dart';
import 'package:gizmogrub_lints_localization/features/product_details/domain/entities/product_details_entity.dart';
import 'package:gizmogrub_lints_localization/features/product_details/presentation/product_details_bloc/product_details_bloc.dart';
import 'package:gizmogrub_lints_localization/features/product_details/presentation/product_details_bloc/product_details_event.dart';
import 'package:gizmogrub_lints_localization/features/product_details/presentation/product_details_bloc/product_details_state.dart';
import 'package:gizmogrub_lints_localization/features/product_details/presentation/widgets/details_app_bar_widget.dart';
import 'package:gizmogrub_lints_localization/features/product_details/presentation/widgets/order_now_alert_widget.dart';
import 'package:gizmogrub_lints_localization/features/product_details/presentation/widgets/portion_and_add_remove_widget.dart';
import 'package:gizmogrub_lints_localization/features/product_details/presentation/widgets/price_ordernow_widget.dart';
import 'package:gizmogrub_lints_localization/features/product_details/presentation/widgets/rating_minutes_widget.dart';
import 'package:gizmogrub_lints_localization/features/product_details/presentation/widgets/spicy_level_and_slider_widget.dart';

@RoutePage()
class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({required this.productId, super.key});
  final int productId;

  @override
  Widget build(BuildContext context) => BlocProvider<ProductDetailsBloc>(
    create:
        (_) =>
            injector<ProductDetailsBloc>()
              ..add(GetProductDetailsEvent(productId)),
    child: Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: const DetailsAppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (BuildContext context, ProductDetailsState state) {
            switch (state) {
              case ProductDetailsInitial():
                context.read<ProductDetailsBloc>().add(
                  GetProductDetailsEvent(productId),
                );
                return const Center(child: CircularProgressIndicator());

              case ProductDetailsLoading():
                return const Center(child: CircularProgressIndicator());

              case ProductDetailsError():
                final ProductDetailsError errorState = state;
                return Center(child: Text(errorState.message));

              case ProductDetailsLoaded():
                final ProductDetailsLoaded loadedState = state;
                final ProductDetailsEntity product = loadedState.product;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 1.01,
                        child: Image.network(
                          product.image.toString(),
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
                      const SizedBox(height: 30),
                      Text(
                        product.title.toString(),
                        style: TextStyleConstants.bodyText3,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),

                      // rating minutes
                      RatingMinutesWidget(
                        rating: product.rating!,
                        deliveryTime: TextConstants.deliveryTime,
                      ),

                      const SizedBox(height: 20),
                      Text(
                        product.description.toString(),
                        style: TextStyleConstants.bodyText5.copyWith(
                          color: ColorConstants.grey,
                          height: 1.75,
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(child: SpicyLevelAndSliderWidget()),
                          Spacer(),
                          PortionAndAddRemoveWidget(),
                        ],
                      ),

                      const SizedBox(height: 50),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          PriceOrderNowWidget(
                            text: '\$${product.price}',
                            textStyle: TextStyleConstants.bodyText7,
                            buttonColor: ColorConstants.red,
                            horizontalPaddingSize: 23,
                            onPressed: () {},
                          ),

                          PriceOrderNowWidget(
                            text: AppLocalizations.of(context)!.orderNow,
                            textStyle: TextStyleConstants.bodyText1.copyWith(
                              fontFamily: TextConstants.interFontFamily,
                              color: ColorConstants.white,
                              fontWeight: FontWeight.w600,
                              height: 1.35,
                            ),
                            buttonColor: ColorConstants.darkChestnut,
                            horizontalPaddingSize: 51,
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder:
                                    (BuildContext context) =>
                                        const OrderNowAlertWidget(),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
            }
          },
        ),
      ),
    ),
  );
}
