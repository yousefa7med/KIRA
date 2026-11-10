import 'package:flutter/material.dart';
import 'package:kira/core/config/configrations.dart';
import 'package:kira/core/utilities/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const Kira());
}

class Kira extends StatelessWidget {
  const Kira({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar'),

      supportedLocales: const [Locale('ar')],

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
