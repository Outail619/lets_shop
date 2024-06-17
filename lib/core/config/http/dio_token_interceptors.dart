import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lets_shop/core/config/http/app_dio_client.dart';
import 'package:lets_shop/core/utils/constants.dart';
import 'package:lets_shop/core/utils/extentions/string_extension.dart';

class DioTokenInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = Constants.localStorage.getTokens()?.accessToken;

    if (token != null &&
        !options.headers.containsKey(HttpHeaders.authorizationHeader)) {
      options.headers[HttpHeaders.authorizationHeader] = token.toBearer();
    }
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    final data = err.response?.data;
    if (err.response?.statusCode == 401) {
      final responseData = data is Map ? data : jsonDecode(data);
      if ((responseData["error"] == "Unauthorized")) {
        final refreshed = await _refreshToken();

        if (refreshed) {
          return await _retry(err.requestOptions, handler);
        } else {
          await Constants.localStorage.deleteData();

          return handler.reject(err);
        }
      }
    }
    return handler.next(err);
  }

  Future<void> _retry(
    RequestOptions requestOptions,
    ErrorInterceptorHandler handler,
  ) async {
    try {
      final token = Constants.localStorage.getTokens()?.accessToken;
      final options = Options(
        method: requestOptions.method,
        headers: {
          HttpHeaders.authorizationHeader: token?.toBearer(),
        },
        contentType: requestOptions.contentType,
        responseType: requestOptions.responseType,
      );
      // Retry the original request
      final response = await DioClient.dioClient.dioEdge.request(
        requestOptions.path,
        options: options,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
      );
      // Resolve the error with new response
      handler.resolve(response);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        final refreshed = await _refreshToken();
        if (refreshed) {
          return _retry(e.requestOptions, handler);
        }
      }
      handler.reject(e);
    }
  }

  Future<bool> _refreshToken() async {
    try {
      //Call Api that fetches the Refresh Token

      return true;
    } catch (_) {
      return false;
    }
  }
}
