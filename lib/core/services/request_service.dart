import 'package:dio/dio.dart';
import 'package:zupa/core/resource/request_response.dart';
import 'package:zupa/core/resource/request_token.dart';

mixin RequestService {
  Future<RequestResponse<T>> request<T>({
    required Future<T> Function(CancelToken cancelToken) request,
    RequestToken? token,
  }) async {
    try {
      final cancelToken = CancelToken();
      token?.onCancel = () => cancelToken.cancel();
      final response = await request(cancelToken);
      return .success(response);
    } on DioException catch (e) {
      // Access the failure object from Dio's response data
      if (e.response?.data != null) {
        try {
          final errorData = ErrorResponse.fromJson(e.response!.data);
          return .failure(errorData);
        } catch (_) {
          return const .failure(.new(code: 0, errorMessage: 'parsing_error'));
        }
      }
      return .failure(
        .new(code: 0, errorMessage: e.message ?? 'unknown_error'),
      );
    }
  }
}
