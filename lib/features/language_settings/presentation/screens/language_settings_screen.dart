import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gizmogrub_lints_localization/core/constants/color_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/languages.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_style_constants.dart';
import 'package:gizmogrub_lints_localization/features/language_settings/presentation/language_setttings_bloc/language_settings_bloc.dart';
import 'package:gizmogrub_lints_localization/features/language_settings/presentation/language_setttings_bloc/language_settings_event.dart';
import 'package:gizmogrub_lints_localization/features/language_settings/presentation/language_setttings_bloc/language_settings_state.dart';

@RoutePage()
class LanguageSettingsScreen extends StatelessWidget {
  const LanguageSettingsScreen({super.key});

  @override
  Widget build(
    BuildContext context,
  ) => BlocBuilder<LanguageSettingsBloc, LanguageSettingsState>(
    builder: (BuildContext context, LanguageSettingsState state) {
      String currentLangCode = TextConstants.englishCode;

      if (state is LanguageSettingsLoaded) {
        currentLangCode = state.currentLocale.languageCode;
      }

      final List<LanguageModel> languages = LanguageModel.languages;

      return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.languageSettings,
            style: TextStyleConstants.bodyText3.copyWith(
              color: ColorConstants.white,
            ),
          ),
          backgroundColor: ColorConstants.red,
          foregroundColor: ColorConstants.white,
        ),
        backgroundColor: ColorConstants.white,
        body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          itemCount: languages.length,
          separatorBuilder: (_, _) => const SizedBox(height: 20),
          itemBuilder: (BuildContext context, int index) {
            final LanguageModel lang = languages[index];
            final bool isSelected = lang.code == currentLangCode;

            return GestureDetector(
              onTap: () {
                context.read<LanguageSettingsBloc>().add(
                  ChangeLanguageEvent(locale: Locale(lang.code)),
                );
              },
              child: Card(
                color: isSelected ? ColorConstants.red : ColorConstants.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: ColorConstants.red),
                ),
                elevation: isSelected ? 4 : 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        lang.name,
                        style:
                            isSelected
                                ? TextStyleConstants.bodyText1.copyWith(
                                  color: ColorConstants.white,
                                )
                                : TextStyleConstants.bodyText1.copyWith(
                                  color: ColorConstants.red,
                                ),
                      ),
                      if (isSelected)
                        const Icon(Icons.check, color: ColorConstants.white),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
