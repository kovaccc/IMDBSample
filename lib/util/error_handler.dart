import 'package:dio/dio.dart';

import '../generated/l10n.dart';

// error handler
class ErrorHandler {
  static Exception resolveNetworkError<T>(
      {required Response<T> response, ErrorResolver? customErrorResolver}) {
    final ErrorResolver errorResolver =
        customErrorResolver ?? DefaultErrorResolver();
    return errorResolver.resolve(response);
  }

  static String resolveExceptionMessage(Exception error) {
    if (error is ServerError) {
      return S.current.server_error;
    } else if (error is InvalidApiKeyError) {
      return S.current.invalid_api_key_error;
    } else if (error is PageNumberError) {
      return S.current.page_must_be_less_than;
    } else {
      return S.current.unknown_error;
    }
  }
}

// error resolvers
abstract class ErrorResolver {
  Exception resolve<T>(Response<T> response);
}

class DefaultErrorResolver implements ErrorResolver {
  @override
  Exception resolve<T>(Response<T> response) {
    final int? statusCode = response.statusCode;
    final String statusMessage = response.statusMessage ?? "";
    if (statusCode != null) {
      if (statusCode >= 500 && statusCode <= 599) {
        return ServerError(statusMessage);
      } else if (statusCode == 401) {
        return const InvalidApiKeyError();
      }
    }
    return Exception(response.statusMessage);
  }
}

class PopularMoviesErrorResolver implements ErrorResolver {
  @override
  Exception resolve<T>(Response<T> response) {
    final int? statusCode = response.statusCode;
    final String statusMessage = response.statusMessage ?? "";
    if (statusCode != null) {
      if (statusCode == 422) {
        return const PageNumberError();
      } else {
        return DefaultErrorResolver().resolve(response);
      }
    }
    return Exception(statusMessage);
  }
}

// errors
class ServerError implements Exception {
  final String message;

  const ServerError([this.message = ""]);

  @override
  String toString() => "ServerError: $message";
}

class PageNumberError implements Exception {
  final String message;

  const PageNumberError([this.message = ""]);

  @override
  String toString() => "PageNumberError: $message";
}

class InvalidApiKeyError implements Exception {
  final String message;

  const InvalidApiKeyError([this.message = ""]);

  @override
  String toString() => "InvalidApiKeyError: $message";
}

// dio errors
class CancelError implements Exception {
  final String message;

  const CancelError([this.message = ""]);

  @override
  String toString() => "CancelError: $message";
}

class ConnectTimeoutError implements Exception {
  final String message;

  const ConnectTimeoutError([this.message = ""]);

  @override
  String toString() => "ConnectTimeoutError: $message";
}

class SendTimeoutError implements Exception {
  final String message;

  const SendTimeoutError([this.message = ""]);

  @override
  String toString() => "SendTimeoutError: $message";
}

class ReceiveTimeoutError implements Exception {
  final String message;

  const ReceiveTimeoutError([this.message = ""]);

  @override
  String toString() => "ReceiveTimeoutError: $message";
}
