abstract class ApiFailure implements Exception{
  final String message;
  const ApiFailure({required this.message});

  @override
  String toString() => message;
}

class NetworkFailure extends ApiFailure {
  const NetworkFailure([String message = "No internet connection"]) : super(message: message);
}

class ServerFailure extends ApiFailure {
  const ServerFailure([String message = "Server error"]) : super(message:  message);
}

class TimeoutFailure extends ApiFailure {
  const TimeoutFailure([String message = "Request timeout"]) : super(message:message);
}

class ParsingFailure extends ApiFailure {
  const ParsingFailure([String message = "Invalid data format"]) : super(message:message);
}

class UnknownFailure extends ApiFailure {
  const UnknownFailure([String message = "Unknown error"]) : super(message:message);
}