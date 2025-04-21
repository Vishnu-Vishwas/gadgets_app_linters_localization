import 'package:gizmogrub_lints_localization/core/constants/text_constants.dart';

class LanguageModel {
  const LanguageModel({required this.name, required this.code});
  final String name;
  final String code;

  static const List<LanguageModel> _languages = <LanguageModel>[
    LanguageModel(name: TextConstants.english, code: TextConstants.englishCode),
    LanguageModel(name: TextConstants.hindi, code: TextConstants.hindiCode),
    LanguageModel(name: TextConstants.telugu, code: TextConstants.teluguCode),
    LanguageModel(name: TextConstants.kannada, code: TextConstants.kannadaCode),
    LanguageModel(name: TextConstants.arabic, code: TextConstants.arabicCode),
  ];

  static List<LanguageModel> get languages => _languages;
}
