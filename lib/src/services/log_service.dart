import 'package:logger/logger.dart';

class LogService {
  static late final Logger logger;

  static void init({
    bool displayDebugLogs = true,
  }) {
    logger = Logger(
      level: displayDebugLogs ? Level.debug : Level.error,
    );

    logger.d('LogService: Initialized.');
  }
}
