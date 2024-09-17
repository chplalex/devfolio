import 'dart:async';

import 'package:flutter/material.dart';
import 'package:folio/data/app_repository.dart';
import 'package:folio/app/app_enums.dart';
import 'package:folio/app/app_typedefs.dart';
import 'package:get_it/get_it.dart';

class AppLocalizations {
  final Locale locale;

  final StringMap _localizations;

  AppLocalizations(this.locale, this._localizations);

  static AppLocalizations of(BuildContext context) {
    try {
      return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
    } catch (error) {
      debugPrint('AppLocalization init error: $error');
      rethrow;
    }
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  String translate(String key, {StringMap? args}) {
    var str = _localizations[key] ?? "";
    if (args != null) {
      args.forEach((key, value) {
        //ignore:prefer_interpolation_to_compose_strings
        str = str.replaceAll(RegExp(r'\${' + key + '}'), value);
      });
    }
    return str;
  }

  static Future<AppLocalizations> createInstance(Locale locale) => GetIt.I
      .get<AppRepository>()
      .loadLocalizations(locale.languageCode)
      .then((localizations) => AppLocalizations(locale, localizations));
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => AppLanguages.values.any(
        (language) => language.languageCode == locale.languageCode,
      );

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.createInstance(locale);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
