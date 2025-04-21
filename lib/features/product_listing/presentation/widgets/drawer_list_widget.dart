import 'package:flutter/material.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_style_constants.dart';

class DrawerListTileWidget extends StatelessWidget {
  const DrawerListTileWidget({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => ListTile(
    title: Text(title, style: TextStyleConstants.bodyText1),
    trailing: Icon(icon),
    onTap: onTap,
  );
}
