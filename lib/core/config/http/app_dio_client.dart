import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lets_shop/core/config/flavors/flavor_config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  DioClient._({
    required this.dioEdge,
  });

  /// Dio Clients
  final Dio dioEdge;

  /// Dio Client Configuration
  static const _receiveTimeout = Duration(seconds: 20);
  static const _connectionTimeout = Duration(seconds: 20);

  /// Static field with getter
  static final DioClient _dioClient = DioClient._internal();

  static DioClient get dioClient => _dioClient;

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  factory DioClient._internal() {
    // Base Options
    // Creating simple BaseOptions for our client
    final BaseOptions baseOptionsEdge = BaseOptions(
      baseUrl: FlavorConfig.instance.hostBaseUrl,
      connectTimeout: _connectionTimeout,
      receiveTimeout: _receiveTimeout,
      responseType: ResponseType.json,
      contentType: Headers.jsonContentType,
    );
    // Adding a logger for our HttpClient
    final prettyLogger = PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: false,
      error: true,
    );

    /// Create dio clients
    ///
    /// httpClientAdapter
    ///

    return DioClient._(
      dioEdge: Dio(baseOptionsEdge)
        ..interceptors.addAll(
          [
            if (kDebugMode) prettyLogger,
            //DioTokenInterceptor(),
            /*  DioCacheInterceptor(
              options: CacheOptions(
                store: HiveCacheStore(AppPathProvider.path),
                policy: CachePolicy.refreshForceCache,
                priority: CachePriority.high,
                hitCacheOnErrorExcept: [],
                maxStale: const Duration(
                  days: 1,
                ),
              ),
            ),*/
          ],
        ),
    );
  }
}
