import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gizmogrub_lints_localization/features/language_settings/presentation/language_setttings_bloc/language_settings_event.dart';
import 'package:gizmogrub_lints_localization/features/language_settings/presentation/language_setttings_bloc/language_settings_state.dart';

class LanguageSettingsBloc
    extends Bloc<LanguageSettingsEvent, LanguageSettingsState> {
  LanguageSettingsBloc() : super(LanguageSettingsLoaded(const Locale('en'))) {
    on<ChangeLanguageEvent>((
      ChangeLanguageEvent event,
      Emitter<LanguageSettingsState> emit,
    ) {
      emit(LanguageSettingsLoaded(event.locale));
    });
  }
}
