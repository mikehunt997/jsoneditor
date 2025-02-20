import 'package:demo/pages/json_editor_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('zh');
  bool _isDarkMode = false;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'SF Pro Display',
          scaffoldBackgroundColor: Colors.white,
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),
        darkTheme: ThemeData(
          fontFamily: 'SF Pro Display',
          scaffoldBackgroundColor: Colors.grey[900],
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey[800],
            foregroundColor: Colors.white,
          ),
          cardTheme: CardTheme(
            color: Colors.grey[800],
          ),
        ),
        themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
        locale: _locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: JsonEditorPage(
          onLocaleChange: setLocale,
          currentLocale: _locale,
          isDarkMode: _isDarkMode,
          onThemeToggle: toggleTheme,
        ),
      ),
    );
  }
}
