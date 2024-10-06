import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:real_estate_marketplace/config/api.dart';
import 'package:real_estate_marketplace/models/property/property_model.dart';
// import 'package:real_estate_marketplace/models/property/property_model.dart';

class GetPropertyService {
  Future<Either<List<PropertyModel>?, String>> getAllProperties() async {
    try {
      final response = await dioInstance.get('/properties');
      if (response.statusCode == 200) {
        Logger().d('Get properties success');
        Logger().d(response.data['data']);
        Logger().d(response.data['data'].length);
        List<PropertyModel> properties = (response.data['data'] as List)
            .map((e) => PropertyModel.fromJson(e))
            .toList();

        Logger().d("Log after trying to convert the task");
        Logger().d(properties.runtimeType);
        return left(properties as List<PropertyModel>);
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
