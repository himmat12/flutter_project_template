class ServiceException implements Exception {
  final String? _message;
  final String? _prefix;

  ServiceException(this._message, this._prefix);

  String toString() => '$_prefix$_message';
}

class FetchDataException extends ServiceException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication: ');
}

class BadRequestException extends ServiceException {
  BadRequestException([String? message]) : super(message, 'Invalid Request: ');
}

class UnauthorizedException extends ServiceException {
  UnauthorizedException([String? message]) : super(message, 'Unauthorized: ');
}

class InvalidInputException extends ServiceException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input: ');
}

class TimeOutException extends ServiceException {
  TimeOutException([String? message]) : super(message, 'Timeout: ');
}
