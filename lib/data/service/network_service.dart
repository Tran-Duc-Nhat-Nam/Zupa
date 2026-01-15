import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../response/error/error_response.dart';
import '../response/success/success_response.dart';

@lazySingleton
class NetworkService {
  final Dio _dio;

  NetworkService(this._dio);

  VoidCallback? onUnauthorized;

  Future<void> callAPI({
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
            onUnauthorized?.call();
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

  Future<dynamic> request(Function(Dio dio) apiFunction) async {
    try {
      final response = await apiFunction(_dio);

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

  Future<dynamic> get(String url) async {
    return request((dio) async => dio.get(url));
  }

  Future<dynamic> post(String url, Map<String, dynamic> data) async {
    return request((dio) async => dio.post(url, data: data));
  }

  Future<dynamic> put(String url, Map<String, dynamic> data) async {
    return request((dio) async => dio.put(url, data: data));
  }

  Future<dynamic> patch(String url, Map<String, dynamic> data) async {
    return request((dio) async => dio.patch(url, data: data));
  }

  Future<dynamic> delete(String url) async {
    return request((dio) async => dio.delete(url));
  }
}
