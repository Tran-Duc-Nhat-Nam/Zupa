import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:zupa/core/data/response/error/error_response.dart';
import 'package:zupa/core/data/response/success/success_response.dart';

@lazySingleton
class NetworkService {
  final Dio _dio;

  NetworkService(this._dio);

  Future<dynamic> request(Function(Dio dio) apiFunction) async {
    try {
      final response = await apiFunction(_dio);

      if (response is SuccessResponse) {
        return response;
      }

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
      if (e.response?.data is Map<String, dynamic>) {
        return ErrorResponse(
          code: e.response?.data?['code'] is int
              ? e.response?.data['code'] as int
              : e.response?.statusCode ?? 500,
          message: e.response?.data?['message'] is String
              ? e.response?.data['message'] as String
              : e.message ?? 'Error',
        );
      } else {
        const ErrorResponse(message: 'Error');
      }
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
