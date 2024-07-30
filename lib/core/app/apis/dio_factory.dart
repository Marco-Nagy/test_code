import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:test_code/core/Services/shared_preference/shared_pref_keys.dart';
import 'package:test_code/core/Services/shared_preference/shared_preference_helper.dart';


class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getInstance() {
    const timeOut = Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptors();
      return dio!;
    }
    return dio!;
  }

  static void addDioInterceptors() {
    dio?.interceptors.add(
      PrettyDioLogger(
        responseHeader: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ),
    );
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] =
              'Bearer ${SharedPrefHelper().getString(key: SharedPrefKeys.accessToken)}';
          return handler.next(options);
        },
        onError: (error, handler) {
          if (error.response!= null) {
            if (error.response!.statusCode == 401) {
              SharedPrefHelper().clearPreferences();
            }
          }
        },
      ),
    );
  }
}
