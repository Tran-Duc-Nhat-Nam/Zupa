sealed class RequestState<T> {
  const RequestState();
}

class Initial<T> extends RequestState<T> {
  const Initial();
}

class Loading<T> extends RequestState<T> {
  const Loading();
}

class Success<T> extends RequestState<T> {
  final T data;

  const Success(this.data);
}

class Error<T> extends RequestState<T> {
  final String? message;

  const Error([this.message]);
}

class Unauthenticated<T> extends RequestState<T> {
  const Unauthenticated();
}
