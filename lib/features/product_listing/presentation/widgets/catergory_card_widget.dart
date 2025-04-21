import 'package:flutter/material.dart';
import 'package:gizmogrub_lints_localization/core/constants/color_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_style_constants.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.categoryName,
    required this.isSelected,
    required this.onTap,
    super.key,
  });
  final String categoryName;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      decoration: BoxDecoration(
        color: isSelected ? ColorConstants.red : ColorConstants.lightGrey1,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        categoryName,
        style:
            isSelected
                ? TextStyleConstants.bodyText2
                : TextStyleConstants.bodyText2.copyWith(
                  color: ColorConstants.grey,
                ),
      ),
    ),
  );
}
