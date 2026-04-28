import 'package:zupa/core/data/response/error/error_response.dart';
import 'package:zupa/core/resource/request_state.dart';

extension NetworkStateMapper on ErrorResponse {
  RequestState<T> toNetworkState<T>() {
    if (code == 4001) {
      return const RequestState.unauthenticated();
    }
    return RequestState.error(message);
  }
}
