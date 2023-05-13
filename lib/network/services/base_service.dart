import 'package:admin_management/common/constants/service_const.dart';
import 'package:admin_management/network/services/Dio_interceptor.dart';
import 'package:dio/dio.dart';

abstract class BaseService {
  late Dio dio;

  BaseService() {
    dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
    ));

    // Interceptors can be added here, such as logging or auth interceptors
    dio.interceptors.add(DioInterceptor());
  }
}
