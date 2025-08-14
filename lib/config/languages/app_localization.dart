// import 'dart:convert';
// import 'package:bai_serve_rider/utils/log/app_log.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';

// // Assuming you have the ARB files in assets
// class AppLocalization {
//   AppLocalization(this.locale);
//   final Locale locale;
//   late Map<String, String> _localizedStrings;

//   static AppLocalization? of(BuildContext context) {
//     return Localizations.of<AppLocalization>(context, AppLocalization);
//   }

//   Future<bool> load() async {
//     // Load JSON file based on locale (you can store ARB files in assets)
//     final String jsonString = await rootBundle.loadString(
//       'assets/lang/${locale.languageCode}.json',
//     );
//     final Map<String, dynamic> jsonMap = json.decode(jsonString);
//     _localizedStrings = jsonMap.map((key, value) {
//       return MapEntry(key, value.toString());
//     });
//     return true;
//   }

//   String translate(String key) {
//     AppLogger.debug('$key is not found', tag: 'language');
//     return _localizedStrings[key] ?? key;
//   }
// }

// class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
//   AppLocalizationDelegate(this._locale);
//   final Locale? _locale;

//   @override
//   bool isSupported(Locale locale) => ['en', 'sw'].contains(locale.languageCode);

//   @override
//   Future<AppLocalization> load(Locale locale) async {
//     final AppLocalization localization = AppLocalization(locale);
//     await localization.load();
//     return localization;
//   }

//   @override
//   bool shouldReload(AppLocalizationDelegate old) => false;
// }
