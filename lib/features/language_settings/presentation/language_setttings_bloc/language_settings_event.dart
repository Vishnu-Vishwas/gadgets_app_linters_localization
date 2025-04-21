import 'package:flutter/material.dart';

sealed class LanguageSettingsEvent {}

class ChangeLanguageEvent extends LanguageSettingsEvent {
  ChangeLanguageEvent({required this.locale});
  final Locale locale;
}
