sealed class Target2SellError extends Error {
  final String message;

  Target2SellError(this.message);

  @override
  String toString() => 'Target2SellError: $message';
}

class Target2SellUUIDMissingError extends Target2SellError {
  Target2SellUUIDMissingError()
      : super(
          'Can\'t proceed call, UUID is empty or null',
        );
}

class Target2SellCMPError extends Target2SellError {
  Target2SellCMPError()
      : super(
          'Can\'t proceed call, CMP must be set to true',
        );
}
