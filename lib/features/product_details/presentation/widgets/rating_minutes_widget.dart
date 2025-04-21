import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gizmogrub_lints_localization/core/constants/color_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_style_constants.dart';

class RatingMinutesWidget extends StatelessWidget {
  const RatingMinutesWidget({
    required this.rating,
    required this.deliveryTime,
    super.key,
  });
  final int rating;
  final String deliveryTime;

  @override
  Widget build(BuildContext context) => Row(
    children: <Widget>[
      const Icon(Icons.star, color: ColorConstants.orange, size: 16),
      Text(' $rating ', style: TextStyleConstants.bodyText5),
      Image.asset(
        TextConstants.lineImage,
        width: 8,
        color: ColorConstants.mediumGrey2,
      ),
      Text(
        AppLocalizations.of(context)!.deliveryTime,
        style: TextStyleConstants.bodyText5,
      ),
    ],
  );
}
