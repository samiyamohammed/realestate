import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:real_estate_marketplace/models/property/property_model.dart';
import 'package:real_estate_marketplace/services/cache/cache_service.dart';
import 'dart:developer' as dev;

class PropertyResponse {
  List<PropertyModel> properties;

  PropertyResponse({required this.properties});
}

class GetPropertyService {
  static Future<Either<String, PropertyResponse>> getPropertyList() async {
    try {
      final dio = await CacheService.configureDioWithHive();

      final response = await dio.get('/properties');

      // Logger().d(response.data);

      dev.log(
          "########  Logging the response of get property  ########");
      final List<PropertyModel> propertyList = (response.data['data'] as List)
          .map((e) => PropertyModel.fromJson(e))
          .toList();

      dev.log("########  Logging model list ########");
      Logger().d(propertyList);

      return right(PropertyResponse(properties: propertyList));
    } on DioException catch (e) {
      if (e.response != null) {
        dev.log("######## server error  ########");
        Logger().d(e.response?.data);
        return left(e.response?.data['message'] ?? 'Unknown error');
      }
      return left('Network error or server did not respond');
    } catch (e) {
      return left(e.toString());
    }
  }
}
