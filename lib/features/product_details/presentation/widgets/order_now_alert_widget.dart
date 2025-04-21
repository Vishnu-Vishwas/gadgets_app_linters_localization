import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gizmogrub_lints_localization/core/constants/color_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_style_constants.dart';
import 'package:gizmogrub_lints_localization/features/product_details/presentation/widgets/price_ordernow_widget.dart';

class OrderNowAlertWidget extends StatelessWidget {
  const OrderNowAlertWidget({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    backgroundColor: ColorConstants.white,
    icon: IconButton(
      style: IconButton.styleFrom(
        backgroundColor: ColorConstants.red,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(28),
      ),
      onPressed: () {},
      icon: Image.asset(TextConstants.checkIconImagePng),
    ),
    title: Text(
      AppLocalizations.of(context)!.success,
      style: TextStyleConstants.alertText,
    ),
    content: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: <Widget>[
          Text(
            AppLocalizations.of(context)!.paymentSuccessful,
            style: TextStyleConstants.bodyText4.copyWith(
              fontWeight: FontWeight.w400,
              height: 1.54,
              color: ColorConstants.mediumGrey,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            AppLocalizations.of(context)!.receipt,
            style: TextStyleConstants.bodyText4.copyWith(
              fontWeight: FontWeight.w400,
              height: 1.54,
              color: ColorConstants.mediumGrey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),

    actionsAlignment: MainAxisAlignment.center,
    actions: <Widget>[
      PriceOrderNowWidget(
        text: AppLocalizations.of(context)!.goBack,
        textStyle: TextStyleConstants.bodyText1.copyWith(
          fontWeight: FontWeight.w700,
          height: 1.54,
          color: ColorConstants.white,
        ),
        buttonColor: ColorConstants.red,
        horizontalPaddingSize: 76,
        onPressed: () {
          context.router.pop();
        },
      ),
    ],
  );
}
