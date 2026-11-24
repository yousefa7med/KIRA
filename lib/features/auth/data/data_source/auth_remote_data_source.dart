import 'package:dio/dio.dart';
import 'package:kira/core/network/api_endpoints.dart';
import 'package:kira/features/auth/data/models/signup_model.dart';

abstract class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource({required this.dio});

  Future<Map<String, dynamic>> login(String email, String password);
  Future<Map<String, dynamic>> signup(SignUpModel user);
  //   Future<Map<String, dynamic>> loginWithGoogle();
  //   Future<Map<String, dynamic>> registerWithGoogle();
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  @override
  final Dio dio;

  AuthRemoteDataSourceImp({required this.dio});

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    final requestBody = {
      "emailOrPhoneNumber": email,
      "password": password,
      "rememberMe": true,
    };

    final response = await dio.post(ApiEndpoints.login, data: requestBody);
    return response.data;
  }

  // @override
  //   Future<Map<String, dynamic>> loginWithGoogle() async {}

  // @override
  //  Future<Map<String, dynamic>> registerWithGoogle()async {}

  @override
  Future<Map<String, dynamic>> signup(SignUpModel user) async {
    final response = await dio.post(ApiEndpoints.register, data: user.toJson());
    return response.data;
  }
}
