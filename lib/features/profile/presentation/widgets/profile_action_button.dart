import 'package:flutter/material.dart';
import 'package:gizmogrub_lints_localization/core/constants/color_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_style_constants.dart';

class ProfileActionButton extends StatelessWidget {
  const ProfileActionButton({
    required this.label,
    required this.icon,
    required this.isFilled,
    super.key,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
  });
  final String label;
  final Widget icon;
  final bool isFilled;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 20),
    decoration: BoxDecoration(
      color: isFilled ? backgroundColor : ColorConstants.transparent,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: borderColor ?? ColorConstants.transparent,
        width: borderWidth ?? 1,
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyleConstants.bodyText1.copyWith(
              fontFamily: TextConstants.robotoFontFamily,
              color:
                  isFilled
                      ? ColorConstants.white
                      : borderColor ?? ColorConstants.black,
            ),
          ),
        ),
        const SizedBox(width: 10),
        icon,
      ],
    ),
  );
}
