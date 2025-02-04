import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:logger/logger.dart';
import 'package:real_estate_marketplace/services/token.dart';
import 'package:real_estate_marketplace/utility/constants.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLogoutRequested>((event, emit) async {
      emit(AuthLoading());
      // String token = await Token.getToken();
      emit(AuthLoading());

      final Dio dio = Dio();
      // final Logger logger = Logger();
      // Uri.parse('$base_url/api/login'),

      String? token = await Token().getToken();

      // return http.post(
      //   Uri.parse('$base_url/api/logout'),
      //   headers: <String, String>{
      //     'Content-Type': 'application/json',
      //     'Authorization': 'Bearer $token',
      //   },

      try {
        final response = await dio.post(
          // 'https://realestateadmin.redshiftbusinessgroup.com/api/auth/register',
          '$baseUrl/api/auth/logout',
          data: {},
          options: Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ),
        );

        // Check if the response status code indicates success
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          final userData = response.data['user'];
          final token = response.data['token'];

          // final pref = await SharedPreferences.getInstance();
          // await pref.setString('token', token);

          Token.setToken(token);

          Logger().d(userData['name']);
          Logger().d(userData['email']);
          Logger().d(token);

          Logger().i('User account created successfully.');
          print('Response data: ${response.data}');
          return emit(AuthCreateAccountSuccess());
          // Return the successful response
        }
      } on DioException catch (error) {
        // Handle Dio-specific errors
        String errorMessage =
            "An unexpected error occurred. Please try again later.";

        if (error.response != null) {
          switch (error.response?.statusCode) {
            case 400:
              errorMessage =
                  "Invalid request. Please check your input and try again.";
              break;
            case 401:
              errorMessage =
                  "You are not authorized. Please log in and try again.";
              break;
            case 403:
              errorMessage =
                  "You don't have permission to perform this action.";
              break;
            case 404:
              errorMessage = "The requested resource was not found.";
              break;
            case 422:
              errorMessage = "The Email has already been taken.";

              break;
            case 429:
              errorMessage =
                  "You're making too many requests. Please try again later.";
              break;
            case 500:
              errorMessage =
                  "Something went wrong on our side. Please try again later.";
              break;
            case 502:
              errorMessage =
                  "Server is down or unreachable. Please try again later.";
              break;
            case 503:
              errorMessage =
                  "The service is temporarily unavailable. Please try again later.";
              break;
            case 504:
              errorMessage =
                  "The server is taking too long to respond. Please try again later.";
              break;
            default:
              errorMessage =
                  "An error occurred. Status code: ${error.response?.statusCode}";
          }

          Logger().f(errorMessage);
          Logger().e(
              'DioError: ${error.response?.statusCode}, ${error.response?.data}');
          return emit(AuthCreateAccountFailure(errorMessage));
        } else if (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout) {
          errorMessage = "The connection timed out. Please try again later.";
          Logger().f('${errorMessage}');
          Logger().e(
              'DioError: ${error.response?.statusCode}, ${error.response?.data}');
          return emit(AuthCreateAccountFailure(errorMessage));
        } else if (error.type == DioExceptionType.connectionError) {
          errorMessage =
              "No internet connection. Please check your connection and try again.";
          Logger().f('${errorMessage}');
          Logger().e(
              'DioError: ${error.response?.statusCode}, ${error.response?.data}');
          return emit(AuthCreateAccountFailure(errorMessage));
        }
      }
    });

    on<AuthCreateAccountRequested>((event, emit) async {
      emit(AuthLoading());

      final name = event.name;
      final email = event.email;
      final number = event.number;
      final password = event.password;
      final passwordConfirmation = event.passwordConfirmation;
      final Dio dio = Dio();
      // final Logger logger = Logger();
      // Uri.parse('$base_url/api/login'),

      try {
        final response = await dio.post(
          // 'https://realestateadmin.redshiftbusinessgroup.com/api/auth/register',
          '$baseUrl/api/auth/register',
          data: {
            'name': name,
            'email': email,
            'phone': number,
            'password': password,
            'password_confirmation': passwordConfirmation,
          },
          options: Options(
            headers: {'Accept': 'application/json'},
          ),
        );

        // Check if the response status code indicates success
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          final userData = response.data['user'];
          final token = response.data['token'];

          // final pref = await SharedPreferences.getInstance();
          // await pref.setString('token', token);

          Token.setToken(token);

          Logger().d(userData['name']);
          Logger().d(userData['email']);
          Logger().d(token);

          Logger().i('User account created successfully.');
          print('Response data: ${response.data}');
          return emit(AuthCreateAccountSuccess());
          // Return the successful response
        }
      } on DioException catch (error) {
        // Handle Dio-specific errors
        String errorMessage =
            "An unexpected error occurred. Please try again later.";

        if (error.response != null) {
          switch (error.response?.statusCode) {
            case 400:
              errorMessage =
                  "Invalid request. Please check your input and try again.";
              break;
            case 401:
              errorMessage =
                  "You are not authorized. Please log in and try again.";
              break;
            case 403:
              errorMessage =
                  "You don't have permission to perform this action.";
              break;
            case 404:
              errorMessage = "The requested resource was not found.";
              break;
            case 422:
              errorMessage = "The Email has already been taken.";

              break;
            case 429:
              errorMessage =
                  "You're making too many requests. Please try again later.";
              break;
            case 500:
              errorMessage =
                  "Something went wrong on our side. Please try again later.";
              break;
            case 502:
              errorMessage =
                  "Server is down or unreachable. Please try again later.";
              break;
            case 503:
              errorMessage =
                  "The service is temporarily unavailable. Please try again later.";
              break;
            case 504:
              errorMessage =
                  "The server is taking too long to respond. Please try again later.";
              break;
            default:
              errorMessage =
                  "An error occurred. Status code: ${error.response?.statusCode}";
          }

          Logger().f(errorMessage);
          Logger().e(
              'DioError: ${error.response?.statusCode}, ${error.response?.data}');
          return emit(AuthCreateAccountFailure(errorMessage));
        } else if (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout) {
          errorMessage = "The connection timed out. Please try again later.";
          Logger().f(errorMessage);
          Logger().e(
              'DioError: ${error.response?.statusCode}, ${error.response?.data}');
          return emit(AuthCreateAccountFailure(errorMessage));
        } else if (error.type == DioExceptionType.connectionError) {
          errorMessage =
              "No internet connection. Please check your connection and try again.";
          Logger().f(errorMessage);
          Logger().e(
              'DioError: ${error.response?.statusCode}, ${error.response?.data}');
          return emit(AuthCreateAccountFailure(errorMessage));
        }
      }
    });

//**********************************************************************************************
    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());

      final email = event.email;
      final password = event.password;

      final Dio dio = Dio();
      // final Logger logger = Logger();

      try {
        final response = await dio.post(
          '$baseUrl/api/auth/login',
          data: {
            'email': email,
            'password': password,
          },
          options: Options(
            headers: {'Accept': 'application/json'},
          ),
        );

        // Check if the response status code indicates success
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          final userData = response.data['user'];
          final token = response.data['token'];

          // final pref = await SharedPreferences.getInstance();
          // await pref.setString('token', token);

          // Token.setToken(token);

          Logger().d(userData['name']);
          Logger().d(userData['email']);
          Logger().d(token);

          Logger().i('User account created successfully.');
          print('Response data: ${response.data}');
          return emit(AuthLoginSuccess());
          // Return the successful response
        }
      } on DioException catch (error) {
        // Handle Dio-specific errors
        String errorMessage =
            "An unexpected error occurred. Please try again later.";

        if (error.response != null) {
          switch (error.response?.statusCode) {
            case 400:
              errorMessage =
                  "Invalid request. Please check your input and try again.";
              break;
            case 401:
              errorMessage =
                  "You are not authorized. Please log in and try again.";
              break;
            case 403:
              errorMessage =
                  "You don't have permission to perform this action.";
              break;
            case 404:
              errorMessage = "The requested resource was not found.";
              break;
            case 422:
              errorMessage = "Invalid credentials.";

              break;
            case 429:
              errorMessage =
                  "You're making too many requests. Please try again later.";
              break;
            case 500:
              errorMessage =
                  "Something went wrong on our side. Please try again later.";
              break;
            case 502:
              errorMessage =
                  "Server is down or unreachable. Please try again later.";
              break;
            case 503:
              errorMessage =
                  "The service is temporarily unavailable. Please try again later.";
              break;
            case 504:
              errorMessage =
                  "The server is taking too long to respond. Please try again later.";
              break;
            default:
              errorMessage =
                  "An error occurred. Status code: ${error.response?.statusCode}";
          }

          Logger().f(errorMessage);
          Logger().e(
              'DioError: ${error.response?.statusCode}, ${error.response?.data}');
          return emit(AuthLoginFailure(errorMessage));
        } else if (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout) {
          errorMessage = "The connection timed out. Please try again later.";
          Logger().f(errorMessage);
          Logger().e(
              'DioError: ${error.response?.statusCode}, ${error.response?.data}');
          return emit(AuthLoginFailure(errorMessage));
        } else if (error.type == DioExceptionType.connectionError) {
          errorMessage =
              "No internet connection. Please check your connection and try again.";
          Logger().f(errorMessage);
          Logger().e(
              'DioError: ${error.response?.statusCode}, ${error.response?.data}');
          return emit(AuthLoginFailure(errorMessage));
        }
      }
    });

    on<ForgetPasswordRequested>((event, emit) async {
      emit(AuthLoading());

      final email = event.email;

      final Dio dio = Dio();
      // final Logger logger = Logger();
      // Uri.parse('$base_url/api/login'),

      try {
        final response = await dio.post(
          // 'https://realestateadmin.redshiftbusinessgroup.com/api/auth/register',
          '$baseUrl/api/auth/forgot-password',
          data: {
            'email': email,
          },
          options: Options(
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json'
            },
          ),
        );

        // Check if the response status code indicates success
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          final userData = response.data['user'];
          // final token = response.data['token'];

          // final pref = await SharedPreferences.getInstance();
          // await pref.setString('token', token);

          // Token.setToken(token);

          Logger().d(userData);
          // Logger().d(userData['email']);
          // Logger().d(token);

          Logger().i('Email Confirmed.');
          print('Response data: ${response.data}');
          return emit(AuthEmailCheckSuccess());
          // Return the successful response
        }
      } on DioException catch (error) {
        // Handle Dio-specific errors
        String errorMessage =
            "An unexpected error occurred. Please try again later.";

        if (error.response != null) {
          switch (error.response?.statusCode) {
            case 400:
              errorMessage =
                  "Invalid request. Please check your input and try again.";
              break;
            case 401:
              errorMessage =
                  "You are not authorized. Please log in and try again.";
              break;
            case 403:
              errorMessage =
                  "You don't have permission to perform this action.";
              break;
            case 404:
              errorMessage = "The requested resource was not found.";
              break;
            case 422:
              errorMessage = "The Email has already been taken.";

              break;
            case 429:
              errorMessage =
                  "You're making too many requests. Please try again later.";
              break;
            case 500:
              errorMessage =
                  "Something went wrong on our side. Please try again later.";
              break;
            case 502:
              errorMessage =
                  "Server is down or unreachable. Please try again later.";
              break;
            case 503:
              errorMessage =
                  "The service is temporarily unavailable. Please try again later.";
              break;
            case 504:
              errorMessage =
                  "The server is taking too long to respond. Please try again later.";
              break;
            default:
              errorMessage =
                  "An error occurred. Status code: ${error.response?.statusCode}";
          }

          Logger().f(errorMessage);
          Logger().e(
              'DioError: ${error.response?.statusCode}, ${error.response?.data}');
          return emit(AuthChangePasswordFailure(errorMessage));
        } else if (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout) {
          errorMessage = "The connection timed out. Please try again later.";
          Logger().f(errorMessage);
          Logger().e(
              'DioError: ${error.response?.statusCode}, ${error.response?.data}');
          return emit(AuthEmailCheckFailure(errorMessage));
        } else if (error.type == DioExceptionType.connectionError) {
          errorMessage =
              "No internet connection. Please check your connection and try again.";
          Logger().f(errorMessage);
          Logger().e(
              'DioError: ${error.response?.statusCode}, ${error.response?.data}');
          return emit(AuthEmailCheckFailure(errorMessage));
        }
      }
    });

    on<ChangePasswordRequested>((event, emit) async {
      emit(AuthLoading());

      final password = event.password;
      final passwordConfirmation = event.passwordConfirmation;

      final Dio dio = Dio();
      // final Logger logger = Logger();
      // Uri.parse('$base_url/api/login'),

      try {
        final response = await dio.post(
          // 'https://realestateadmin.redshiftbusinessgroup.com/api/auth/register',
          '$baseUrl/api/auth/forgot-password',
          data: {
            'password': password,
            'password_confirmation': passwordConfirmation,
          },
          options: Options(
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json'
            },
          ),
        );

        // Check if the response status code indicates success
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          final userData = response.data['user'];
          // final token = response.data['token'];

          // final pref = await SharedPreferences.getInstance();
          // await pref.setString('token', token);

          // Token.setToken(token);

          Logger().d(userData);
          // Logger().d(userData['email']);
          // Logger().d(token);

          Logger().i('User account created successfully.');
          print('Response data: ${response.data}');
          return emit(AuthChangePasswordSuccess());
          // Return the successful response
        }
      } on DioException catch (error) {
        // Handle Dio-specific errors
        String errorMessage =
            "An unexpected error occurred. Please try again later.";

        if (error.response != null) {
          switch (error.response?.statusCode) {
            case 400:
              errorMessage =
                  "Invalid request. Please check your input and try again.";
              break;
            case 401:
              errorMessage =
                  "You are not authorized. Please log in and try again.";
              break;
            case 403:
              errorMessage =
                  "You don't have permission to perform this action.";
              break;
            case 404:
              errorMessage = "The requested resource was not found.";
              break;
            case 422:
              errorMessage = "The Email has already been taken.";

              break;
            case 429:
              errorMessage =
                  "You're making too many requests. Please try again later.";
              break;
            case 500:
              errorMessage =
                  "Something went wrong on our side. Please try again later.";
              break;
            case 502:
              errorMessage =
                  "Server is down or unreachable. Please try again later.";
              break;
            case 503:
              errorMessage =
                  "The service is temporarily unavailable. Please try again later.";
              break;
            case 504:
              errorMessage =
                  "The server is taking too long to respond. Please try again later.";
              break;
            default:
              errorMessage =
                  "An error occurred. Status code: ${error.response?.statusCode}";
          }

          Logger().f(errorMessage);
          Logger().e(
              'DioError: ${error.response?.statusCode}, ${error.response?.data}');
          return emit(AuthChangePasswordFailure(errorMessage));
        } else if (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout) {
          errorMessage = "The connection timed out. Please try again later.";
          Logger().f(errorMessage);
          Logger().e(
              'DioError: ${error.response?.statusCode}, ${error.response?.data}');
          return emit(AuthChangePasswordFailure(errorMessage));
        } else if (error.type == DioExceptionType.connectionError) {
          errorMessage =
              "No internet connection. Please check your connection and try again.";
          Logger().f(errorMessage);
          Logger().e(
              'DioError: ${error.response?.statusCode}, ${error.response?.data}');
          return emit(AuthChangePasswordFailure(errorMessage));
        }
      }
    });
  }
}
