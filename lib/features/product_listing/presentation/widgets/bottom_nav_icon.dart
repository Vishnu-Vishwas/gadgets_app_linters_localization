import 'package:flutter/material.dart';
import 'package:gizmogrub_lints_localization/core/constants/color_constants.dart';

class BottomNavIcon extends StatelessWidget {
  const BottomNavIcon({required this.iconPath, required this.onTap, super.key});
  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => IconButton(
    icon: Image.asset(
      iconPath,
      width: 24,
      height: 24,
      color: ColorConstants.white,
    ),
    onPressed: onTap,
  );
}
