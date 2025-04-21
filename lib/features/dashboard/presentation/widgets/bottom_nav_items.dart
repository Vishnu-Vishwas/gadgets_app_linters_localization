import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gizmogrub_lints_localization/core/constants/color_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_constants.dart';

class BottomNavItem extends StatelessWidget {
  BottomNavItem({required this.tabsRouter, required this.index, super.key});
  final TabsRouter tabsRouter;
  final int index;

  final List<String> _icons = <String>[
    TextConstants.homeIconImage,
    TextConstants.profileIconImage,
    "",
    TextConstants.chatIconImage,
    TextConstants.wishlistIconImage,
  ];

  @override
  Widget build(BuildContext context) {
    final bool isSelected = tabsRouter.activeIndex == index;

    return GestureDetector(
      onTap: () => tabsRouter.setActiveIndex(index),
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(_icons[index], height: 24),

          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            height: 4,
            width: 4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  isSelected
                      ? ColorConstants.white
                      : ColorConstants.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
