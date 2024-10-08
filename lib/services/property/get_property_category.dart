

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:real_estate_marketplace/config/api.dart';
import 'package:real_estate_marketplace/models/property/propertu_category_model.dart';


class GetPropertyCategoryService {
  Future<Either<List<PropertyCategoryModel>?, String>> getPropertyCategory() async {
    try {
      final response = await dioInstance.get('/property-categories');
      if (response.statusCode == 200) {
        Logger().d('Get properties category success');
        Logger().d(response.data['data']);
        Logger().d(response.data['data'].length);
        List<PropertyCategoryModel> categoryList  = (response.data['data'] as List)
            .map((e) => PropertyCategoryModel.fromJson(e))
            .toList();

        Logger().d("Log after trying to convert the task");
        Logger().d(categoryList.runtimeType);
        return left(categoryList as List<PropertyCategoryModel>);
      }
      throw Exception('Failed to get properties');
    } on DioException catch (e) {
      if (e.response != null) {
        // Server responded with a non-200 status code (like 401)
        Logger().d('Dio error status: ${e.response?.statusCode}');
        Logger().d('Dio error data: ${e.response?.data}');
        // Check if the error response contains a message from the backend
        return right(e.response?.data['message'] ?? 'Unknown error');
      } else {
        return right('Network error or server did not respond');
      }
    } catch (e) {
      return right(e.toString());
    }
  }
}
