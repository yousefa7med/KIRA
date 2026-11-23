import 'package:flutter_country_selector/flutter_country_selector.dart';
import 'package:kira/core/config/configrations.dart';
import 'package:kira/core/di/di.dart';
import 'package:kira/core/utilities/app_theme.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phone_form_field/phone_form_field.dart';

void main() {
  setupDependencies();
  runApp(const Kira());
}

class Kira extends StatelessWidget {
  const Kira({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        // !temp!
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      supportedLocales: const [Locale('ar')],

      localizationsDelegates: const [
        ...GlobalMaterialLocalizations.delegates,
        ...PhoneFieldLocalization.delegates,
        CountrySelectorLocalization.delegate,
      ],

      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRoutes.authFlow,
    );
  }
}
