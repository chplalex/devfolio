import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:folio/app/app_enums.dart';
import 'package:folio/data/app_repository.dart';
import 'package:folio/data/table_manager.dart';
import 'package:folio/provider/app_provider.dart';
import 'package:folio/provider/drawer_provider.dart';
import 'package:folio/provider/scroll_provider.dart';
import 'package:folio/sections/main/main_section.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/app_di.dart';
import 'app/app_localizations.dart';
import 'app/core_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await setupDI();
  runApp(const MyApp());
}

Future<void> setupDI() {
  AppDI.providesCommonModule();
  AppDI.providesDataModule();
  return AppDI.setupAsync();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppProvider()),
          ChangeNotifierProvider(create: (_) => DrawerProvider()),
          ChangeNotifierProvider(create: (_) => ScrollProvider()),
          Provider(create: (_) => AppRepository(TableManager())),
        ],
        child: Consumer<AppProvider>(
          builder: (context, appProvider, _) {
            appProvider.init();
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'chplALEX | portfolio',
              theme: themeLight,
              darkTheme: themeDark,
              themeMode: appProvider.themeMode,
              locale: Locale(AppLanguages.english.languageCode),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              home: const MainPage(),
            );
          },
        ),
      );
}
