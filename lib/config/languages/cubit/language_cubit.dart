// language_cubit.dart
import 'dart:ui';

import 'package:bai_serve_customer/config/bloc/safe_cubit.dart';
import 'package:bai_serve_customer/config/dependency/dependency_injection.dart';
import 'package:bai_serve_customer/config/languages/l10n/app_localizations.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/storage/storage_service.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';

import 'language_state.dart';

enum Language { English, Kiswahili }

AppLocalizations get AppString => AppLocalizations.of(appRouter.navigatorKey.currentState!.context)!;

class LanguageCubit extends SafeCubit<LanguageState> {
  LanguageCubit()
    : super(
        LanguageState(
          selectedCountry: MapEntry(Language.English.name, AppImages.langEnglish),
          availableCountries: {
            Language.English.name: AppImages.langEnglish,
            Language.Kiswahili.name: AppImages.langSwahili,
          },
          locale: const Locale('en', 'US'), // Default locale (English)
        ),
      );

  final _key = 'language';

  final StorageService _service = getIt();

  Future<void> init() async {
    final key = await _service.read(_key);
    if (key == null) return;
    changeLanguage(Language.values.firstWhere((value) => value.name == key));
  }

  // Method to change the selected country (language)
  Future<void> changeLanguage(Language key) async {
    final value = state.availableCountries[key.name];
    if (value == null) return;
    _service.write(_key, key.name);
    final Locale newLocale = _getLocaleForLanguage(key);
    initializeMessages(newLocale.languageCode);
    emit(state.copyWith(selectedCountry: MapEntry(key.name, value), locale: newLocale));
  }

  Locale _getLocaleForLanguage(Language language) {
    switch (language) {
      case Language.Kiswahili:
        return const Locale('sw'); // Swahili
      case Language.English:
        return const Locale('en'); // Default to English
    }
  }

  void initializeMessages(String languageCode) {}
}
