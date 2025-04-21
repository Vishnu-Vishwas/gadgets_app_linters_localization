import 'package:flutter/material.dart';
import 'package:gizmogrub_lints_localization/core/constants/color_constants.dart';

class AddSubtractItemsButtonWidget extends StatelessWidget {
  const AddSubtractItemsButtonWidget({
    required this.icon,
    required this.onPressed,
    super.key,
  });
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => IconButton(
    style: IconButton.styleFrom(
      backgroundColor: ColorConstants.red,
      padding: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      shadowColor: ColorConstants.limeGreen,
      elevation: 5,
    ),
    onPressed: onPressed,
    icon: Icon(icon, color: ColorConstants.white),
  );
}
