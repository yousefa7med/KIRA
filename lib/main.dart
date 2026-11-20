import 'package:kira/core/config/configrations.dart';
import 'package:kira/core/utilities/app_theme.dart';
import 'package:material_ui/material_ui.dart';

void main() {
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

      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRoutes.login,
    );
  }
}
