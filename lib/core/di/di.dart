import 'package:get_it/get_it.dart';
import 'package:kira/core/network/dio_client.dart';
import 'package:kira/features/auth/controller/cubit/auth_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  getIt.registerLazySingleton<DioClient>(() => DioClient());

  getIt.registerFactory<AuthCubit>(() => AuthCubit());
}
