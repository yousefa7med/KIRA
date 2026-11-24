import 'package:dio/dio.dart';
import 'package:kira/core/network/errors/failure.dart';

class ErrorMapper {
  static Failure map(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const NetworkFailure(
          'تعذر الاتصال بالسيرفر، تحقق من اتصال الإنترنت',
        );

      case DioExceptionType.badResponse:
        return _mapStatusCode(exception.response);

      case DioExceptionType.cancel:
        return const ApiFailure('تم إلغاء الطلب');

      case DioExceptionType.badCertificate:
        return const NetworkFailure('تعذر إنشاء اتصال آمن بالسيرفر');

      default:
        return const ApiFailure('حدث خطأ غير متوقع');
    }
  }

  static Failure _mapStatusCode(Response? response) {
    final statusCode = response?.statusCode;
    final data = response?.data;

    final detail = _extractMessage(data);

    switch (statusCode) {
      case 400:
        return ApiFailure(detail ?? 'البيانات المدخلة غير صحيحة');

      case 401:
        return ApiFailure(detail ?? 'البريد أو كلمة المرور غير صحيحة');

      case 404:
        return ServerFailure(detail ?? 'البيانات المطلوبة غير موجودة');

      case 409:
        return ApiFailure(detail ?? 'البيانات مسجلة بالفعل');

      case 423:
        return ServerFailure(detail ?? 'الحساب مغلق مؤقتًا، حاول لاحقًا');

      case 429:
        return ServerFailure(detail ?? 'محاولات كثيرة، حاول مرة أخرى لاحقًا');

      case 500:
        return ServerFailure(detail ?? 'حدث خطأ في السيرفر، حاول لاحقًا');

      default:
        return ApiFailure(detail ?? 'حدث خطأ غير متوقع');
    }
  }

  static String? _extractMessage(dynamic data) {
    if (data is! Map<String, dynamic>) return null;

    // ProblemDetails detail
    final detail = data['detail'];

    if (detail is String && detail.isNotEmpty) {
      return detail;
    }

    // ProblemDetails title
    final title = data['title'];

    if (title is String && title.isNotEmpty) {
      return title;
    }

    // Custom errors array
    final errors = data['errors'];

    if (errors is List && errors.isNotEmpty) {
      final firstError = errors.first;

      if (firstError is Map<String, dynamic>) {
        final description = firstError['description'];

        if (description is String && description.isNotEmpty) {
          return description;
        }
      }
    }

    return null;
  }
}
