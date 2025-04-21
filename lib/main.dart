import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_constants.dart';
import 'package:gizmogrub_lints_localization/core/di/injector.dart';
import 'package:gizmogrub_lints_localization/core/navigation/app_route.dart';
import 'package:gizmogrub_lints_localization/features/language_settings/presentation/language_setttings_bloc/language_settings_bloc.dart';
import 'package:gizmogrub_lints_localization/features/language_settings/presentation/language_setttings_bloc/language_settings_state.dart';

void main() {
  Injector.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();
  Locale _currentLocale = const Locale(TextConstants.english);

  @override
  Widget build(BuildContext context) => BlocProvider<LanguageSettingsBloc>(
    create: (BuildContext context) => injector<LanguageSettingsBloc>(),
    child: BlocBuilder<LanguageSettingsBloc, LanguageSettingsState>(
      builder: (BuildContext context, LanguageSettingsState state) {
        if (state is LanguageSettingsLoaded) {
          _currentLocale = state.currentLocale;
        }

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            AppLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],

          // auto generates the locals based on .arb file
          supportedLocales: AppLocalizations.supportedLocales,
          locale: _currentLocale,

          routerConfig: _appRouter.config(),
        );
      },
    ),
  );
}
