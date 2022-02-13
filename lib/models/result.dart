class Result<T> {
  final Status code;
  final String? message;
  final T? data;

  Result({
    required this.code,
    this.message,
    this.data,
  });
}

enum Status {
  success,
  timeout,
  socket,
  platform,
  firebase,
  exception,
}
