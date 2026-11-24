import 'package:dio/dio.dart';
import 'package:kira/core/network/errors/error_model.dart';
import 'package:kira/core/network/errors/failure.dart';
import 'package:kira/core/network/utils/result.dart';
import 'package:kira/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:kira/features/auth/data/models/signup_model.dart';

abstract class AuthRepository {
  Future<Result<Map<String, dynamic>>> login(String email, String password);
  Future<Result<Map<String, dynamic>>> signup(SignUpModel user);
  // Future<Result<Map<String, dynamic>>> loginWithGoogle();
  // Future<Result<Map<String, dynamic>>> registerWithGoogle();
}

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource dataSource;

  AuthRepositoryImp({required this.dataSource});
  @override
  Future<Result<Map<String, dynamic>>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await dataSource.login(email, password);
      return Success(response);
    } on DioException catch (e) {
      return Error(ErrorMapper.map(e));
    } catch (e) {
      return const Error(ApiFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Result<Map<String, dynamic>>> signup(SignUpModel user) async {
    try {
      final response = await dataSource.signup(user);
      return Success(response);
    } on DioException catch (e) {
      return Error(ErrorMapper.map(e));
    } catch (e) {
      return const Error(ApiFailure('حدث خطأ غير متوقع'));
    }
  }
}
