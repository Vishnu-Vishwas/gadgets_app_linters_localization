import 'package:flutter/material.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_constants.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      Scaffold.of(context).openDrawer();
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(TextConstants.profileIcon, fit: BoxFit.contain),
    ),
  );
}
