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
  }
}

class _Target2SellLogPrinter extends PrettyPrinter {
  _Target2SellLogPrinter({
    bool printTime = true,
  }) : super(printTime: printTime);

  @override
  List<String> log(LogEvent event) {
    final List<String> log = super.log(event);

    log.add('Target2Sell: ${event.message}');

    return log;
  }
}
