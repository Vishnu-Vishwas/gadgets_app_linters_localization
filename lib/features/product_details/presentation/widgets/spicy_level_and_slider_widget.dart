import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gizmogrub_lints_localization/core/constants/color_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_style_constants.dart';
import 'package:gizmogrub_lints_localization/features/product_details/presentation/widgets/spicy_level_indicator_slider_widget.dart';

class SpicyLevelAndSliderWidget extends StatelessWidget {
  const SpicyLevelAndSliderWidget({super.key});

  @override
  Widget build(BuildContext context) => Column(
    // spacing: 11,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Text(
        AppLocalizations.of(context)!.spicy,
        style: TextStyleConstants.bodyText4,
      ),
      const SizedBox(height: 11),
      const SpicyLevelIndicatorSliderWidget(),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            AppLocalizations.of(context)!.low,
            style: TextStyleConstants.bodyText6,
          ),
          Text(
            AppLocalizations.of(context)!.high,
            style: TextStyleConstants.bodyText6.copyWith(
              color: ColorConstants.red,
            ),
          ),
        ],
      ),
    ],
  );
}
