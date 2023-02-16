import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Petition {
  static get init {
    _addInterceptor();

    return _dio;
  }

  static final _dio = Dio();

  static const _customSharedPreferences = FlutterSecureStorage();

  static _addInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
          String? token = await _customSharedPreferences.read(key: 'token');
          options.headers["Authorization"] = "Token $token";

          return handler.next(options);
        }
      )
    );
  }
}

final petition = Petition.init;