import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gizmogrub_lints_localization/core/constants/color_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_style_constants.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({required this.onSearch, super.key});
  final ValueChanged<String> onSearch;

  @override
  Widget build(BuildContext context) => SearchBar(
    elevation: const WidgetStatePropertyAll<double>(3),
    onChanged: onSearch,
    padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    ),
    shape: const WidgetStatePropertyAll<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ),
    backgroundColor: const WidgetStatePropertyAll<Color>(ColorConstants.white),
    leading: Image.asset(TextConstants.searchIconImage, width: 20, height: 20),
    hintText: AppLocalizations.of(context)!.search,
    hintStyle: const WidgetStatePropertyAll<TextStyle>(
      TextStyleConstants.bodyText1,
    ),
  );
}
