import 'package:dio/dio.dart';

final Dio dio = Dio();

final options = BaseOptions(
  baseUrl: 'https://realestateadmin.redshiftbusinessgroup.com/api',
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
  connectTimeout: Duration(seconds: 5),
  receiveTimeout: Duration(seconds: 3),
);

final dioInstance = Dio(options);
