import 'dart:developer';

import 'package:kira/core/di/di.dart';
import 'package:kira/features/auth/presentation/flow/auth_flow.dart';
import 'package:kira/features/auth/presentation/views/change_password_view.dart';
import 'package:kira/features/auth/presentation/views/otp_view.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kira/core/transitions/page_route_builder_method.dart';
import 'package:kira/features/auth/controller/cubit/auth_cubit.dart';
import 'package:kira/features/auth/presentation/views/login_view.dart';
import 'package:kira/features/auth/presentation/views/signup_step_one_view.dart';
import 'package:kira/features/auth/presentation/views/signup_step_three_view.dart';
import 'package:kira/features/auth/presentation/views/signup_step_two_view.dart';

abstract class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    log(settings.name ?? "nulls");
    switch (settings.name) {
      // case AppRoutes.mainView:
      //   return pageRouteBuilderMethod(
      //     settings: settings,
      //     pageBuilder: (context, animation, secondaryAnimation) =>
      //         const MainView(),
      //   );
      case AppRoutes.authFlow:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: AuthFlow(),
          ),
        );

      default:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Scaffold(),
        );
    }
  }

  static Route? generateAuthRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginView(),
        );
      case AppRoutes.signupStep1:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SignupStepOneView(),
        );
      case AppRoutes.signupStep2:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SignupStepTwoView(),
        );
      case AppRoutes.signupStep3:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SignupStepThreeView(),
        );
      case AppRoutes.changePassword:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ChangePasswordView(),
        );
      case AppRoutes.otp:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const OtpView(),
        );

      default:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Scaffold(),
        );
    }
  }
}

abstract class AppRoutes {
  // static const String mainView = '/';
  static const String authFlow = '/';
  static const String login = '/';
  static const String otp = '/otp';
  static const String changePassword = '/changePassword';
  static const String signupStep1 = '/signupStep1';
  static const String signupStep2 = '/signupStep2';
  static const String signupStep3 = '/signupStep3';
}
