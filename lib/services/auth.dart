import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:real_estate_marketplace/models/auth_response_model.dart';
import 'package:real_estate_marketplace/models/user_model.dart';
import 'package:real_estate_marketplace/utility/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:yess/services/onboarding_helper.dart';
// import 'package:yess/services/token.dart';

class Auth {
  // register function

  static Dio dio = Dio();
  final Logger logger = Logger();

  static Future<String> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await dio.post(
        'https://realestateadmin.redshiftbusinessgroup.com/api/auth/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );

      // Check if the response status code indicates success
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        Logger().i('User account created successfully.');
        print('Response data: ${response.data}');
        return 'User account created successfully.'; // Return the successful response
      }

      if (response.statusCode! >= 400 && response.statusCode! < 500) {
        Logger().f('Client error: ${response.statusCode}');
        return 'email has been used'; // Handle client-side errors
      } else {
        Logger()
            .e('Failed to create account. Status code: ${response.statusCode}');
        return 'Failed to create account.'; // Handle server-side errors
      }
    } on DioException catch (e) {
      // Handle Dio-specific errors
      if (e.response != null) {
        Logger().e('DioError: ${e.response?.statusCode}, ${e.response?.data}');
        if (e.response?.statusCode == 422) {
          return 'duplicated email';
        } else {
          return 'Failed to create account.3 ${e.response?.statusCode}';
        } // Return the response with error details
      } else {
        Logger().e('DioError: ${e.message}');
        throw Exception(
            'Failed to connect to the server.'); // Throw an exception for connection errors
      }
    } catch (e) {
      // Handle any other errors
      Logger().e('Unexpected erroreeeeeeeeeeeeeeee: $e');
      throw Exception(
          'An unexpected error occurred.'); // Throw a general exception
    }
  }

  // login function

  static Future<http.Response> login({
    required String email,
    required String password,
  }) async {
    // clearing all the cache when user logger in
    Logger().f('all data is cleared');

    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Logger().f('all data is cleared');

    return http.post(
      Uri.parse('$baseUrl/api/login'),
      // Uri.parse('http://192.168.100.40:8000/api/regisetr'),
      headers: <String, String>{'Accept': 'application/json'},
      body: <String, String>{
        'email': email,
        'password': password,
      },
    );
  }

  Future<Either<GoogleSignInAccount, String>> googleAuth() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      Logger().w('googleAuth');
      var user = await googleSignIn.signIn();
      if (user == null) {
        return right('User is null');
      } else {
        return left(user);
      }
    } catch (e) {
      print(e);
      return right(e.toString());
    }
  }

  Future<Either<String, AuthResponse>> loginWithGoogle({
    required String email,
    required String google_id,
    required String? name,
    String? avatar,
  }) async {
    try {
      Logger().w('loginWithGoogle');
      final response = await dio.post('$baseUrl/api/auth/google', data: {
        'email': email,
        'google_id': google_id,
        'name': name ?? "user",
        'avatar': avatar,
      });
      Logger().d(response.data);

      if (response.statusCode == 201) {
        // Determine if response.data is a String or already a Map
        Map<String, dynamic> json;

        if (response.data is String) {
          // If response.data is a JSON string, decode it
          json = jsonDecode(response.data);
        } else if (response.data is Map<String, dynamic>) {
          // If it's already a Map, cast it
          json = response.data;
        } else {
          throw 'Unexpected response format';
        }

        final authResponse = AuthResponse.fromJson(json);
        return right(authResponse);
      }
      throw 'Something went wrong';
    } on DioException catch (e) {
      if (e.response != null) {
        // Server responded with a non-200 status code (like 401)
        print('Dio error status: ${e.response?.statusCode}');
        print('Dio error data: ${e.response?.data}');
        // Check if the error response contains a message from the backend
        return left(e.response?.data['message'] ?? 'Unknown error');
      } else {
        // Error during the request (e.g., network issue)
        return left('Network error or server did not respond');
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  // static Future<bool> isValidToken() async {
  //   String? token = await Token().getToken();
  //   if (token == null) {
  //     return false;
  //   }

  //   final response = await http.post(
  //     Uri.parse('$base_url/api/token-validate'),
  //     headers: <String, String>{'Accept': 'application/json'},
  //     body: {
  //       "token": token,
  //     },
  //   );

  //   final jsonData = await jsonDecode(response.body);
  //   print(jsonData);
  //   if (jsonData['valid'] == true) {
  //     return true;
  //   }

  //   return false;
  // }

  // logout function

  // static Future<http.Response?> logout() async {
  //   Logger().f('all data is cleared');

  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.clear();
  //   Logger().f('all data is cleared');
  //   OnboardingHelper.markOnboardingAsShown();

  //   final validated = await isValidToken();

  //   if (validated) {
  //     String? token = await Token().getToken();
  //     final response = await http.post(
  //       Uri.parse('$base_url/api/logout'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       },
  //     );
  //     print(token);
  //     print(response);
  //   }

  //   await Token().removeToken();
  // }
}
