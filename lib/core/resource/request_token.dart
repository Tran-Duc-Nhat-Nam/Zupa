class RequestToken {
  void Function()? onCancel;

  void cancel() => onCancel?.call();
}
