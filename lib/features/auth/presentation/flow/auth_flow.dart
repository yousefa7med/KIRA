import 'package:kira/core/config/configrations.dart';
import 'package:material_ui/material_ui.dart';

class AuthFlow extends StatelessWidget {
  AuthFlow({super.key});
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return NavigatorPopHandler(
      onPopWithResult: (_) => navigatorKey.currentState!.canPop()
          ? navigatorKey.currentState!.canPop()
          : null,
      child: Navigator(
        key: navigatorKey,
        initialRoute: AppRoutes.login,
        onGenerateRoute: AppRouter.generateAuthRoute,
      ),
    );
  }
}
