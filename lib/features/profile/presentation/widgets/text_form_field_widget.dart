import 'package:flutter/material.dart';
import 'package:gizmogrub_lints_localization/core/constants/color_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_style_constants.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    required this.label,
    super.key,
    this.obscureText = false,
    this.keyboardType,
    this.maxLines = 1,
  });
  final String label;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int maxLines;

  final Color _borderColor = ColorConstants.lightGrey2;

  @override
  Widget build(BuildContext context) => TextFormField(
    obscureText: obscureText,
    keyboardType: keyboardType,
    maxLines: maxLines,
    style: TextStyleConstants.bodyText1.copyWith(
      color: ColorConstants.darkChestnut,
      fontFamily: TextConstants.robotoFontFamily,
      fontWeight: FontWeight.w700,
    ),

    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyleConstants.bodyText1.copyWith(
        color: ColorConstants.darkChestnut,
        fontFamily: TextConstants.robotoFontFamily,
        fontWeight: FontWeight.w700,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,

      contentPadding: const EdgeInsets.symmetric(horizontal: 39, vertical: 20),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: _borderColor, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: _borderColor, width: 2),
      ),
    ),
  );
}
