import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_style_constants.dart';
import 'package:gizmogrub_lints_localization/features/product_details/presentation/widgets/add_subtract_items_button_widget.dart';

class PortionAndAddRemoveWidget extends StatefulWidget {
  const PortionAndAddRemoveWidget({super.key});

  @override
  State<PortionAndAddRemoveWidget> createState() =>
      _PortionAndAddRemoveWidgetState();
}

class _PortionAndAddRemoveWidgetState extends State<PortionAndAddRemoveWidget> {
  int _portionCount = 1;

  void _increment() {
    setState(() {
      _portionCount++;
    });
  }

  void _decrement() {
    setState(() {
      if (_portionCount > 1) {
        _portionCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        AppLocalizations.of(context)!.portion,
        style: TextStyleConstants.bodyText4,
      ),
      const SizedBox(height: 5),
      Row(
        spacing: 15,
        children: <Widget>[
          AddSubtractItemsButtonWidget(
            icon: Icons.remove,
            onPressed: _decrement,
          ),

          Text('$_portionCount', style: TextStyleConstants.bodyText3),

          AddSubtractItemsButtonWidget(icon: Icons.add, onPressed: _increment),
        ],
      ),
    ],
  );
}
