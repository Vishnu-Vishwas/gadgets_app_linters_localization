import 'package:flutter/material.dart';
import 'package:gizmogrub_lints_localization/core/constants/color_constants.dart';

class SpicyLevelIndicatorSliderWidget extends StatefulWidget {
  const SpicyLevelIndicatorSliderWidget({super.key});

  @override
  State<SpicyLevelIndicatorSliderWidget> createState() =>
      _SpicyLevelIndicatorSliderWidgetState();
}

class _SpicyLevelIndicatorSliderWidgetState
    extends State<SpicyLevelIndicatorSliderWidget> {
  double _spicyLevel = 0.5;

  @override
  Widget build(BuildContext context) => SliderTheme(
    data: SliderTheme.of(context).copyWith(trackHeight: 3.5),
    child: Slider(
      padding: EdgeInsets.zero,
      value: _spicyLevel,
      activeColor: ColorConstants.red,
      inactiveColor: ColorConstants.lightGrey1,
      thumbColor: ColorConstants.red,
      onChanged: (double value) {
        setState(() {
          _spicyLevel = value;
        });
      },
    ),
  );
}
