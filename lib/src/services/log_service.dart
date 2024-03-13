import 'package:logger/logger.dart';

class LogService {
  static late final Logger logger;

  static void init({
    bool displayDebugLogs = true,
  }) {
    logger = Logger(
      printer: _Target2SellLogPrinter(),
      level: displayDebugLogs ? Level.debug : Level.error,
    );
    logger.d('LogService: Initialized.');
  }
}

class _Target2SellLogPrinter extends PrettyPrinter {
  _Target2SellLogPrinter();

  @override
  List<String> log(LogEvent event) {
    final log = super.log(event);

    return log..add('Target2Sell: ${event.message}');
  }
}
