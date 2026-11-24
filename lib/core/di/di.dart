import 'package:get_it/get_it.dart';
import 'package:kira/core/network/dio_client.dart';
import 'package:kira/features/auth/controller/cubit/auth_cubit.dart';
import 'package:kira/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:kira/features/auth/repository/auth_repository.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  getIt.registerLazySingleton<DioClient>(() => DioClient());
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImp(dio: getIt<DioClient>().dio),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImp(dataSource: getIt()),
  );

  getIt.registerFactory<AuthCubit>(() => AuthCubit(authRepository: getIt()));
}
