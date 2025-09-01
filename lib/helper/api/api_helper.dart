import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logarte/logarte.dart';

import '../../env/env.dart';
import '../../data/response/error/error_response.dart';
import '../../data/response/success/success_response.dart';
import '../../widgets/popup/app_dialog.dart';
import '../auth/auth_helper.dart';
import '../debugger/debugger_helper.dart';
import 'interceptors.dart';

/// A helper class for making API requests using Dio.
class ApiHelper {
  static Dio? _dio;

  /// Getter for Dio instance with predefined BaseOptions and interceptors.
  static Dio get dio => _dio ??=
      Dio(
          BaseOptions(
            baseUrl: Environment.restApiUrl,
            connectTimeout: const Duration(seconds: 30),
          ),
        )
        ..interceptors.add(AuthInterceptor())
        ..interceptors.add(LogarteDioInterceptor(DebuggerHelper.debugger));

  /// Makes a network call using the provided [apiFunction].
  ///
  /// The [onSuccess] callback is invoked if the response is a [SuccessResponse].
  /// The [onFailed] callback is invoked if the response is an [ErrorResponse].
  /// The [onError] callback is invoked if an exception is thrown.
  static Future<void> callAPI({
    required BuildContext context,
    required Function(Dio dio) apiFunction,
    Function(SuccessResponse response)? onSuccess,
    Function(ErrorResponse error)? onFailed,
    Function(Exception error)? onError,
  }) async {
    try {
      final response = await request(apiFunction);

      if (response is SuccessResponse) {
        onSuccess?.call(response);
      } else if (response is ErrorResponse) {
        if (onFailed != null) {
          onFailed(response);
        } else {
          if (response.code == 4001 || response.code == 4003) {
            if (context.mounted) {
              await AuthHelper.removeAuth();
              AppDialog.showAuthDialog(context);
            }
          }
        }
      }
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  /// Sends a request using the given [apiFunction] and returns a response.
  ///
  /// Returns a [SuccessResponse] if the request is successful.
  /// Returns an [ErrorResponse] if an error occurs.
  static Future<dynamic> request(Function(Dio dio) apiFunction) async {
    try {
      final response = await apiFunction(dio);

      if (response is Response) {
        return response.statusCode == 200
            ? SuccessResponse(
                data: response.data,
                message: response.statusMessage ?? 'Success',
              )
            : ErrorResponse(
                code: response.statusCode ?? 500,
                message: response.statusMessage ?? 'Error',
              );
      } else {
        return SuccessResponse(data: response);
      }
    } on DioException catch (e) {
      return ErrorResponse(
        code: e.response?.data['code'] ?? 500,
        message: e.response?.data['message'] ?? e.message ?? 'Error',
      );
    } on Exception catch (e) {
      return ErrorResponse(code: 0, message: e.toString());
    }
  }

  /// Sends a GET request to the given [url].
  static Future<dynamic> get(String url) async {
    return request((dio) async {
      return dio.get(url);
    });
  }

  /// Sends a POST request to the given [url] with [data].
  static Future<dynamic> post(String url, Map<String, dynamic> data) async {
    return request((dio) async {
      return dio.post(url, data: data);
    });
  }

  /// Sends a PUT request to the given [url] with [data].
  static Future<dynamic> put(String url, Map<String, dynamic> data) async {
    return request((dio) async {
      return dio.put(url, data: data);
    });
  }

  /// Sends a PATCH request to the given [url] with [data].
  static Future<dynamic> patch(String url, Map<String, dynamic> data) async {
    return request((dio) async {
      return dio.patch(url, data: data);
    });
  }

  /// Sends a DELETE request to the given [url].
  static Future<dynamic> delete(String url) async {
    return request((dio) async {
      return dio.delete(url);
    });
  }
}
