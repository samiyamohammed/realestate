import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:real_estate_marketplace/models/property_category_model.dart';
import 'package:real_estate_marketplace/services/cache/cache_service.dart';
import 'dart:developer' as dev;


class PropertyCategoryResponse {
  List<PropertyCategoryModel> categories;

  PropertyCategoryResponse({required this.categories});
}

class GetPropertyCategoryService {
  static Future<Either<String, PropertyCategoryResponse>> getPropertyCategory() async {
    try {
      final dio = await CacheService.configureDioWithHive();

      final response = await dio.get('/property-categories');

      dev.log(
          "########  Logging the response of get property category ########");
      // Logger().d(response.data);

      final List<PropertyCategoryModel> propertyCategoryList = (response.data['data'] as List)
          .map((e) => PropertyCategoryModel.fromJson(e))
          .toList();

      dev.log("########  Logging model list ########");
      Logger().d(propertyCategoryList);

      return right(PropertyCategoryResponse(categories: propertyCategoryList));
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
