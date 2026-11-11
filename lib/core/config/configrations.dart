import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kira/core/transitions/page_route_builder_method.dart';
import 'package:kira/features/auth/controller/cubit/auth_cubit.dart';
import 'package:kira/features/auth/presentation/views/login_view.dart';
import 'package:kira/features/auth/presentation/views/signup_step_one_view.dart';
import 'package:kira/features/auth/presentation/views/signup_step_three_view.dart';
import 'package:kira/features/auth/presentation/views/signup_step_two_view.dart';

final authCubit = AuthCubit();

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case AppRoutes.mainView:
      //   return pageRouteBuilderMethod(
      //     settings: settings,
      //     pageBuilder: (context, animation, secondaryAnimation) =>
      //         const MainView(),
      //   );
      case AppRoutes.login:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              BlocProvider.value(value: authCubit, child: const LoginView()),
        );
      case AppRoutes.signupStep1:
        return pageRouteBuilderMethod(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              BlocProvider.value(
                value: authCubit,
                child: const SignupStepOneView(),
              ),
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
  static const String mainView = '/';
  static const String login = '/login';
  static const String signupStep1 = '/signupStep1';
  static const String signupStep2 = '/signupStep2';
  static const String signupStep3 = '/signupStep3';
}
