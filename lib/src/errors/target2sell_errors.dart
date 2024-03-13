sealed class Target2SellError extends Error {
  Target2SellError(this._message);

  final String _message;

  @override
  String toString({String message = ''}) => 'Target2SellError: $_message';
}

class Target2SellUUIDMissingError extends Target2SellError {
  Target2SellUUIDMissingError() : super(message);

  static const String message = 'UUID is empty or null.';
}

class Target2SellCMPError extends Target2SellError {
  Target2SellCMPError() : super(message);

  static const String message = 'CMP must be set to true.';
}
