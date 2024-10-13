import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class CacheService {
  static Future<void> setupCache() async {
    await Hive.initFlutter();
    await Hive.openBox('httpCache');
  }

  static Future<Dio> configureDioWithHive() async {
    final dio = Dio(BaseOptions(
        baseUrl: "https://realestateadmin.redshiftbusinessgroup.com/api",
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {'accept': "application/json"}));

    final cacheDir = await getTemporaryDirectory();
    final cacheStore = HiveCacheStore(cacheDir.path);

    final cache = CacheOptions(
      store: cacheStore,
      maxStale: const Duration(days: 3),
      policy: CachePolicy.refresh,
      priority: CachePriority.normal,
      hitCacheOnErrorExcept: [401, 403],
    );

    dio.interceptors.add(DioCacheInterceptor(options: cache));

    return dio;
  }
}
