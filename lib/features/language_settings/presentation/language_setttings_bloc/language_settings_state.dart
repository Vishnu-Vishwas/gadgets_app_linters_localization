import 'package:flutter/material.dart';

sealed class LanguageSettingsState {}

class LanguageSettingsInitial extends LanguageSettingsState {}

class LanguageSettingsLoading extends LanguageSettingsState {}

class LanguageSettingsLoaded extends LanguageSettingsState {
  LanguageSettingsLoaded(this.currentLocale);
  final Locale currentLocale;
}

class LanguageSettingsError extends LanguageSettingsState {
  LanguageSettingsError(this.message);
  final String message;
}
