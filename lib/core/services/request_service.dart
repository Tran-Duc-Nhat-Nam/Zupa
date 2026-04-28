import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/response/error/error_response.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/core/resource/request_token.dart';

@lazySingleton
class RequestService {
  RequestService();

  Future<dynamic> request({
    required Function(CancelToken? cancelToken) request,
    RequestToken? token,
  }) async {
    try {
      final cancelToken = CancelToken();
      token?.onCancel = () => cancelToken.cancel();
      final response = await request(cancelToken);

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
}
